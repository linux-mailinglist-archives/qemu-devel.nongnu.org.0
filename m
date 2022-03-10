Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A97E4D4CCB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:37:11 +0100 (CET)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSKqj-0005rw-S9
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSKom-0003QL-8O
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSKoi-0004DA-Ni
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646926503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h06i63HZFhSUU2LHoPyhnxTJ86TvpzmPtf/TEmc+3ao=;
 b=TGx3CQTduXgXdPSUx5q89fhImwXs3T4MUOTAIeSvNtfSwmnaOImiF9rm5GLdlmBfNtvV66
 SaRKVfO5UvCUFUqyc7t3TmyCE2otxR5QYPLMfixxVp46IWBhpwULM/ZejvKl+rRthwk067
 LOb1UJ60BzemOFJGoSZshTfxb3/2uvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-se6XiORVObuyZospK_h6xA-1; Thu, 10 Mar 2022 10:35:02 -0500
X-MC-Unique: se6XiORVObuyZospK_h6xA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9AA1091DA0;
 Thu, 10 Mar 2022 15:35:00 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B1328379E;
 Thu, 10 Mar 2022 15:34:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/8] migration: Export ram_transferred_ram()
Date: Thu, 10 Mar 2022 16:34:47 +0100
Message-Id: <20220310153454.3929-2-quintela@redhat.com>
In-Reply-To: <20220310153454.3929-1-quintela@redhat.com>
References: <20220310153454.3929-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h | 2 ++
 migration/ram.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.h b/migration/ram.h
index 2c6dc3675d..2e27c49f90 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -64,6 +64,8 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis);
 
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
+void ram_transferred_add(uint64_t bytes);
+
 int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
 bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
 void ramblock_recv_bitmap_set(RAMBlock *rb, void *host_addr);
diff --git a/migration/ram.c b/migration/ram.c
index 170e522a1f..947ed44c89 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -394,7 +394,7 @@ uint64_t ram_bytes_remaining(void)
 
 MigrationStats ram_counters;
 
-static void ram_transferred_add(uint64_t bytes)
+void ram_transferred_add(uint64_t bytes)
 {
     if (runstate_is_running()) {
         ram_counters.precopy_bytes += bytes;
-- 
2.34.1


