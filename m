Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650106298F6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouuoR-00040h-IX; Tue, 15 Nov 2022 07:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuoI-0003vP-Cr
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:13:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuoG-0004aI-GS
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668514379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0IBxvLU7+jncQadOjfpnjeGfzdDMllRMxZWahXf5/o=;
 b=gvoG6UWxc4yaDukqTB5nt80FTkTU5yUVvWD7nDcXgolW+QIOwOz/yIg9TTqfdxAyxpxzec
 SP+mob27kERLulRWJZXzy84dXG/2Awf/CX4sWcRypFFlxpbpiDRKPo6igHMe6CqmEjX1LE
 taN172e2MAdj69fG9zX5yTvGIn/MwT0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-PftkqgDBOfKsMqfMsCnQxg-1; Tue, 15 Nov 2022 07:12:56 -0500
X-MC-Unique: PftkqgDBOfKsMqfMsCnQxg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A2EA101A528;
 Tue, 15 Nov 2022 12:12:56 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 385CA492B05;
 Tue, 15 Nov 2022 12:12:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 06/30] migration: Export ram_transferred_ram()
Date: Tue, 15 Nov 2022 13:12:02 +0100
Message-Id: <20221115121226.26609-7-quintela@redhat.com>
In-Reply-To: <20221115121226.26609-1-quintela@redhat.com>
References: <20221115121226.26609-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
---
 migration/ram.h | 2 ++
 migration/ram.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.h b/migration/ram.h
index c7af65ac74..e844966f69 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -65,6 +65,8 @@ int ram_load_postcopy(QEMUFile *f, int channel);
 
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
+void ram_transferred_add(uint64_t bytes);
+
 int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
 bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
 void ramblock_recv_bitmap_set(RAMBlock *rb, void *host_addr);
diff --git a/migration/ram.c b/migration/ram.c
index dc1de9ddbc..00a06b2c16 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -422,7 +422,7 @@ uint64_t ram_bytes_remaining(void)
 
 MigrationStats ram_counters;
 
-static void ram_transferred_add(uint64_t bytes)
+void ram_transferred_add(uint64_t bytes)
 {
     if (runstate_is_running()) {
         ram_counters.precopy_bytes += bytes;
-- 
2.38.1


