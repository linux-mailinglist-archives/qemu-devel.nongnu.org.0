Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2448AF22
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:07:29 +0100 (CET)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ho8-0003Ho-PI
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:07:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gmp-0005Bo-LV
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gmm-0005qr-0w
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rwk6ID2rBlH3ZRqQ0F7DWrovnndqwFTyaieTJosDyIw=;
 b=SRw+1sW7Dz8Xzgf52zzM0fnIBOfKQ4TAGUGZ3CTtOzkrGGjRiQ5tgHsJOJsdKtKivwspLw
 9jciA0Pwuo6sLf42VPR1N0m92VwSKprpy1RkJ1FnSrd1vF7dtOjkFNbHPqWvOZ3vsHB1xN
 bNuPlYUZ66vJ/GYGX8pGXdDBmEQombg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-cKPud18sM3yaZ0SZI-QO0w-1; Tue, 11 Jan 2022 08:01:26 -0500
X-MC-Unique: cKPud18sM3yaZ0SZI-QO0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC10E1023F54;
 Tue, 11 Jan 2022 13:01:24 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB9961059179;
 Tue, 11 Jan 2022 13:01:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/23] migration: Make ram_save_target_page() a pointer
Date: Tue, 11 Jan 2022 14:00:19 +0100
Message-Id: <20220111130024.5392-19-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

We are going to create a new function for multifd latest in the series.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index e9dcd3ca4e..3536778e19 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -294,6 +294,9 @@ struct RAMSrcPageRequest {
     QSIMPLEQ_ENTRY(RAMSrcPageRequest) next_req;
 };
 
+typedef struct RAMState RAMState;
+typedef struct PageSearchStatus PageSearchStatus;
+
 /* State of RAM for migration */
 struct RAMState {
     /* QEMUFile used for this migration */
@@ -348,8 +351,8 @@ struct RAMState {
     /* Queue of outstanding page requests from the destination */
     QemuMutex src_page_req_mutex;
     QSIMPLEQ_HEAD(, RAMSrcPageRequest) src_page_requests;
+    int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
 };
-typedef struct RAMState RAMState;
 
 static RAMState *ram_state;
 
@@ -2117,14 +2120,14 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
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
@@ -2200,7 +2203,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
     do {
         /* Check the pages is dirty and if it is send it */
         if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
-            tmppages = ram_save_target_page(rs, pss);
+            tmppages = rs->ram_save_target_page(rs, pss);
             if (tmppages < 0) {
                 return tmppages;
             }
@@ -3008,6 +3011,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
+    (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
     multifd_send_sync_main(f);
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
-- 
2.34.1


