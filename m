Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE544D4CF8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:43:06 +0100 (CET)
Received: from localhost ([::1]:59480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSKwT-0000KZ-FT
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:43:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSKot-0003dF-VY
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSKoo-0004GV-Kg
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646926509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41cdaUzXmvCThTuBCek1iGSroxx8oZt27BqgVNh16uQ=;
 b=I8u4Y/2iR2ukwmp9bKeAKchB60OwK1Eo4gNNdpgnIg4wn4kjXHGAJJn6EE0JcUoSNVz1Xo
 do1HktNQqV+ZHkG+WcDZnyMxIna+X0oK+6xoLTUkASB2BtW7Ur/mmykhlU2P3FLNk1+bS0
 /ZR9LEbYYu2O4kVtCiUl6SK/IaOxCqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-KaeqjlKqP5uFLwmpnk21mg-1; Thu, 10 Mar 2022 10:35:06 -0500
X-MC-Unique: KaeqjlKqP5uFLwmpnk21mg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 725D88031E1;
 Thu, 10 Mar 2022 15:35:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8312C7DE43;
 Thu, 10 Mar 2022 15:35:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/8] migration: Make ram_save_target_page() a pointer
Date: Thu, 10 Mar 2022 16:34:49 +0100
Message-Id: <20220310153454.3929-4-quintela@redhat.com>
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

We are going to create a new function for multifd latest in the series.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 947ed44c89..1006d8d585 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -295,6 +295,9 @@ struct RAMSrcPageRequest {
     QSIMPLEQ_ENTRY(RAMSrcPageRequest) next_req;
 };
 
+typedef struct RAMState RAMState;
+typedef struct PageSearchStatus PageSearchStatus;
+
 /* State of RAM for migration */
 struct RAMState {
     /* QEMUFile used for this migration */
@@ -349,8 +352,8 @@ struct RAMState {
     /* Queue of outstanding page requests from the destination */
     QemuMutex src_page_req_mutex;
     QSIMPLEQ_HEAD(, RAMSrcPageRequest) src_page_requests;
+    int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
 };
-typedef struct RAMState RAMState;
 
 static RAMState *ram_state;
 
@@ -2126,14 +2129,14 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
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
@@ -2208,7 +2211,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     do {
         /* Check the pages is dirty and if it is send it */
         if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
-            tmppages = ram_save_target_page(rs, pss);
+            tmppages = rs->ram_save_target_page(rs, pss);
             if (tmppages < 0) {
                 return tmppages;
             }
@@ -2937,6 +2940,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
+    (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
     multifd_send_sync_main(f);
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
-- 
2.34.1


