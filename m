Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFD538F64
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 12:59:32 +0200 (CEST)
Received: from localhost ([::1]:40768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvzb1-0007Tp-3j
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 06:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvzLj-0003Dp-5E
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:43:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvzLg-0004eV-66
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653993819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pe3jHr3FUhCx5bKb1p681cF2NkGCgqVuIWV/2hR/CGI=;
 b=JjKts+II91XwhurNrwLkgVQGv4oZ8YO77u3UtVUOqZbjpj7x2NO8XSvJwU178qIiTfj5y0
 KXrgY7aamWyTNNTTkilTreqCR9wE0S4wT6VMZ2bpjNnKgk+ix01+/w8Eq/ACzUWO47alha
 Ox2+5KTS+gazrA7MsTIUTqn0lA5QLEw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-LgyiDXyLNNq_d7eZPGclrg-1; Tue, 31 May 2022 06:43:36 -0400
X-MC-Unique: LgyiDXyLNNq_d7eZPGclrg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D96AD2809CAA;
 Tue, 31 May 2022 10:43:35 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D03A10725;
 Tue, 31 May 2022 10:43:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v7 06/13] migration: Make ram_save_target_page() a pointer
Date: Tue, 31 May 2022 12:43:11 +0200
Message-Id: <20220531104318.7494-7-quintela@redhat.com>
In-Reply-To: <20220531104318.7494-1-quintela@redhat.com>
References: <20220531104318.7494-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
---
 migration/ram.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 30b0680942..71506b1b20 100644
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
 
@@ -2132,14 +2135,14 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
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
@@ -2214,7 +2217,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     do {
         /* Check the pages is dirty and if it is send it */
         if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
-            tmppages = ram_save_target_page(rs, pss);
+            tmppages = rs->ram_save_target_page(rs, pss);
             if (tmppages < 0) {
                 return tmppages;
             }
@@ -2944,6 +2947,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
+    (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
     ret =  multifd_send_sync_main(f);
     if (ret < 0) {
         return ret;
-- 
2.35.3


