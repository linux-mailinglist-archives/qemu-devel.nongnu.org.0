Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B516348AF48
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:15:49 +0100 (CET)
Received: from localhost ([::1]:52512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HwC-0008EX-KL
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:15:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gmr-0005DB-7M
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gmm-0005rT-30
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqdm1TWMNDuNxgBb6uNqq8LN97ZE57id58Hw8VBp/Fw=;
 b=aPGqTzLw11iLAsi818+GbUZYyo0uBXRzasv6jRY0auDQHSieYDytS3VPmNwODO2RuNkTgY
 otLz2Yo+dnMJjfr7p/0nFPqKJRFozMOugse3W7QcNvB0oHI/0lREtEsQhnhPYF+xe9kpvw
 U7dITne5uKdenrMhgBXclLJIg+SP8Zc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-lyRivk2wPU26feURXQPuTw-1; Tue, 11 Jan 2022 08:01:37 -0500
X-MC-Unique: lyRivk2wPU26feURXQPuTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E85283DBE2;
 Tue, 11 Jan 2022 13:01:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 707B31059179;
 Tue, 11 Jan 2022 13:01:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/23] migration: Export ram_release_page()
Date: Tue, 11 Jan 2022 14:00:24 +0100
Message-Id: <20220111130024.5392-24-quintela@redhat.com>
In-Reply-To: <20220111130024.5392-1-quintela@redhat.com>
References: <20220111130024.5392-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h | 2 ++
 migration/ram.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.h b/migration/ram.h
index c515396a9a..6dca396a6b 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -66,6 +66,8 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis);
 
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
+void ram_release_page(const char *rbname, uint64_t offset);
+
 int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
 bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
 void ramblock_recv_bitmap_set(RAMBlock *rb, void *host_addr);
diff --git a/migration/ram.c b/migration/ram.c
index bdc7cec4cd..5404431c71 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1161,7 +1161,7 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
     }
 }
 
-static void ram_release_page(const char *rbname, uint64_t offset)
+void ram_release_page(const char *rbname, uint64_t offset)
 {
     if (!migrate_release_ram() || !migration_in_postcopy()) {
         return;
-- 
2.34.1


