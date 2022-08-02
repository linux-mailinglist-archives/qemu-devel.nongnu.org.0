Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F3E58774C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 08:54:51 +0200 (CEST)
Received: from localhost ([::1]:52174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIlnm-0008BD-UZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 02:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIlYu-0003cI-HZ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oIlYs-0006A4-AF
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 02:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659422365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NiIKDNZlhx1U8gPHZmVZKg7N8xckxwlRQ/PsR1YBQck=;
 b=SpF6z91+Wz8FEIiBXU1p+/0qErv22Lzk+z8uOymAu9mQTVibCouf/MVy81ltktRF+0K6Ao
 pHmgf9rnfWgRo43C8TaOfoyIQdLKo76eaZIDJiXJtFm0SFVXt/VX3Lp/zUlZQLQ5zbg+tb
 QhTBNaDs4B2sBsVum85Yj3AlavufXeI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-MiSY0jvaOYeyRJTGsTPJNg-1; Tue, 02 Aug 2022 02:39:21 -0400
X-MC-Unique: MiSY0jvaOYeyRJTGsTPJNg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3EB7101A58D;
 Tue,  2 Aug 2022 06:39:20 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31277492CA2;
 Tue,  2 Aug 2022 06:39:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v7 05/12] migration: Make ram_save_target_page() a pointer
Date: Tue,  2 Aug 2022 08:39:00 +0200
Message-Id: <20220802063907.18882-6-quintela@redhat.com>
In-Reply-To: <20220802063907.18882-1-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to create a new function for multifd latest in the series.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 85d89d61ac..499d9b2a90 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -310,6 +310,9 @@ typedef struct {
     bool preempted;
 } PostcopyPreemptState;
 
+typedef struct RAMState RAMState;
+typedef struct PageSearchStatus PageSearchStatus;
+
 /* State of RAM for migration */
 struct RAMState {
     /* QEMUFile used for this migration */
@@ -372,8 +375,9 @@ struct RAMState {
      * is enabled.
      */
     unsigned int postcopy_channel;
+
+    int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
 };
-typedef struct RAMState RAMState;
 
 static RAMState *ram_state;
 
@@ -2255,14 +2259,14 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
 }
 
 /**
- * ram_save_target_page: save one target page
+ * ram_save_target_page_legacy: save one target page
  *
  * Returns the number of pages written
  *
  * @rs: current RAM state
  * @pss: data about the page we want to send
  */
-static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
+static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
 {
     RAMBlock *block = pss->block;
     ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
@@ -2469,7 +2473,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
 
         /* Check the pages is dirty and if it is send it */
         if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
-            tmppages = ram_save_target_page(rs, pss);
+            tmppages = rs->ram_save_target_page(rs, pss);
             if (tmppages < 0) {
                 return tmppages;
             }
@@ -3223,6 +3227,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
+    (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
     ret =  multifd_send_sync_main(f);
     if (ret < 0) {
         return ret;
-- 
2.37.1


