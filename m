Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D2493689
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:49:11 +0100 (CET)
Received: from localhost ([::1]:59822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6eP-0003IF-Lx
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:49:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62h-00071p-K8
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62e-0000ve-RD
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjqZSUin4KGk042s0HnlvgC6wrmCkM8/MM5iweJa6Cc=;
 b=E7FqOMyD7EyZUfkYdKBEHhQlNAOMSnU+lMymnL+Do0T5asoCY8b3qraJfhMeQSXXSyI/V1
 Xt4bGOPMTl1B7hy6+4clu2HE0pGO50bzc463tcjKAuKxDXYW51Tg/3sqeEBeGyAEQFPQDS
 W6/pt0ddCLTN88TlNKPV0MVodR2voMM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-7o66h_i1NKyRGreovZcf_w-1; Wed, 19 Jan 2022 03:09:59 -0500
X-MC-Unique: 7o66h_i1NKyRGreovZcf_w-1
Received: by mail-wm1-f69.google.com with SMTP id
 f187-20020a1c38c4000000b0034d5c66d8f5so1424803wma.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MjqZSUin4KGk042s0HnlvgC6wrmCkM8/MM5iweJa6Cc=;
 b=uVOxmkkCegoep/RGJfjajPU+S2YuyD7wIQ1I3kXIP2Jbnfa0g2kHMUAnqpzOqZeil0
 jqG5vTogHEwUIbi/KueyO2Tl5CwrVmrNVwtFi1XH2c/ZR6NvZWdM2l8+Sy0tbcXREcpR
 PTsTWImkumfxd5vdEUVCRynem4awlck60d9FLYvOjSxUoSxObc1cGno37mcMEVUv9UAn
 EvgIvnPDQkWIIy7Q6pifkLWTx3BzK2tbJTxUv8YCzOeBa6A63v07zjUZkihqeeOnbqJo
 ZdR2ZsVj8WjdS09kz5p0ghK7mdFqcL1RicISRDz4VlPc8Mmq5zURVDja/6TEANon5Ke+
 d0rg==
X-Gm-Message-State: AOAM533Zxh1CEdjRyPwUPHAaJ9ZCHHokMsPt2A9CNA6PRFHeWJdRWEEs
 JrxLH/A4sMn7auZRr3Mv+sV1dPi27VytavSkhEacI918pQpWoq5SRloI3+FrGZgwky26XumcZqV
 KLrJ9zuf9MnYnRrofdEyYCpOETe/oSOw3PpMCMYaS5NFCoUwaupX6ZtG0kPLM5VE0
X-Received: by 2002:a5d:64c1:: with SMTP id f1mr15358217wri.633.1642579797489; 
 Wed, 19 Jan 2022 00:09:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+aZ0BIt09rnM/y9DndauFJob9gDwVcWyarrfIAAc0ofP98joFoAWbZaYkHz1MtlwX635+ow==
X-Received: by 2002:a5d:64c1:: with SMTP id f1mr15358195wri.633.1642579797214; 
 Wed, 19 Jan 2022 00:09:57 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.09.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:09:56 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 04/15] migration: Add postcopy_has_request()
Date: Wed, 19 Jan 2022 16:09:18 +0800
Message-Id: <20220119080929.39485-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a helper to detect whether postcopy has pending request.

Since at it, cleanup the code a bit, e.g. in unqueue_page() we shouldn't need
to check it again on queue empty because we're the only one (besides cleanup
code, which should never run during this process) that will take a request off
the list, so the request list can only grow but not shrink under the hood.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 45 ++++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 94b0ad4234..dc6ba041fa 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -354,6 +354,12 @@ static RAMState *ram_state;
 
 static NotifierWithReturnList precopy_notifier_list;
 
+/* Whether postcopy has queued requests? */
+static bool postcopy_has_request(RAMState *rs)
+{
+    return !QSIMPLEQ_EMPTY_ATOMIC(&rs->src_page_requests);
+}
+
 void precopy_infrastructure_init(void)
 {
     notifier_with_return_list_init(&precopy_notifier_list);
@@ -1533,28 +1539,33 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
  */
 static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
 {
+    struct RAMSrcPageRequest *entry;
     RAMBlock *block = NULL;
 
-    if (QSIMPLEQ_EMPTY_ATOMIC(&rs->src_page_requests)) {
+    if (!postcopy_has_request(rs)) {
         return NULL;
     }
 
     QEMU_LOCK_GUARD(&rs->src_page_req_mutex);
-    if (!QSIMPLEQ_EMPTY(&rs->src_page_requests)) {
-        struct RAMSrcPageRequest *entry =
-                                QSIMPLEQ_FIRST(&rs->src_page_requests);
-        block = entry->rb;
-        *offset = entry->offset;
-
-        if (entry->len > TARGET_PAGE_SIZE) {
-            entry->len -= TARGET_PAGE_SIZE;
-            entry->offset += TARGET_PAGE_SIZE;
-        } else {
-            memory_region_unref(block->mr);
-            QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
-            g_free(entry);
-            migration_consume_urgent_request();
-        }
+
+    /*
+     * This should _never_ change even after we take the lock, because no one
+     * should be taking anything off the request list other than us.
+     */
+    assert(postcopy_has_request(rs));
+
+    entry = QSIMPLEQ_FIRST(&rs->src_page_requests);
+    block = entry->rb;
+    *offset = entry->offset;
+
+    if (entry->len > TARGET_PAGE_SIZE) {
+        entry->len -= TARGET_PAGE_SIZE;
+        entry->offset += TARGET_PAGE_SIZE;
+    } else {
+        memory_region_unref(block->mr);
+        QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
+        g_free(entry);
+        migration_consume_urgent_request();
     }
 
     return block;
@@ -2996,7 +3007,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
         t0 = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
         i = 0;
         while ((ret = qemu_file_rate_limit(f)) == 0 ||
-                !QSIMPLEQ_EMPTY(&rs->src_page_requests)) {
+               postcopy_has_request(rs)) {
             int pages;
 
             if (qemu_file_get_error(f)) {
-- 
2.32.0


