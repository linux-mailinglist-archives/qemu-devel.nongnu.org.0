Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE5D595787
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 12:07:48 +0200 (CEST)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNtUB-0005A8-45
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 06:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNtLi-00059I-ND
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:59:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNtLh-0000zD-09
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660643940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9EcByTx8o21JX/WVTo586WE5QiGfvM9rQBHXjkXSUJo=;
 b=VJYhGRa+aC8C09Z0uBWXRA75op16BJBE36sLm6zvEYgia5d7BPScHTAxybIwchzmFjrabL
 4jHgbRsfLJQibucRMAiUYTc0t2Ex7UhX3XeZp3ReuovfCmJhZ3LR9m8Zw6BzAoLTPSn+Yy
 FjgDyrzkgxSdTzyX+jW31zqRMM16MY8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-fCJ6pXcxMxOfmDrlSRDKAQ-1; Tue, 16 Aug 2022 05:58:57 -0400
X-MC-Unique: fCJ6pXcxMxOfmDrlSRDKAQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4ED78037B7;
 Tue, 16 Aug 2022 09:58:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 566AD492C3B;
 Tue, 16 Aug 2022 09:58:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/2] hw/usb/hcd-xhci: Fix unbounded loop in
 xhci_ring_chain_length() (CVE-2020-14394)
Date: Tue, 16 Aug 2022 11:58:49 +0200
Message-Id: <20220816095849.211139-3-thuth@redhat.com>
In-Reply-To: <20220816095849.211139-1-thuth@redhat.com>
References: <20220816095849.211139-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

The loop condition in xhci_ring_chain_length() is under control of
the guest, and additionally the code does not check for failed DMA
transfers (e.g. if reaching the end of the RAM), so the loop there
could run for a very long time or even forever. Fix it by checking
the return value of dma_memory_read() and by introducing a maximum
loop length.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/646
Message-Id: <20220804131300.96368-1-thuth@redhat.com>
Reviewed-by: Mauro Matteo Cascella <mcascell@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/usb/hcd-xhci.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 296cc6c8e6..3c48b58dde 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -21,6 +21,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/queue.h"
 #include "migration/vmstate.h"
@@ -725,10 +726,14 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
     bool control_td_set = 0;
     uint32_t link_cnt = 0;
 
-    while (1) {
+    do {
         TRBType type;
-        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
-                        MEMTXATTRS_UNSPECIFIED);
+        if (dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
+                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
+                          __func__);
+            return -1;
+        }
         le64_to_cpus(&trb.parameter);
         le32_to_cpus(&trb.status);
         le32_to_cpus(&trb.control);
@@ -762,7 +767,17 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
         if (!control_td_set && !(trb.control & TRB_TR_CH)) {
             return length;
         }
-    }
+
+        /*
+         * According to the xHCI spec, Transfer Ring segments should have
+         * a maximum size of 64 kB (see chapter "6 Data Structures")
+         */
+    } while (length < TRB_LINK_LIMIT * 65536 / TRB_SIZE);
+
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: exceeded maximum tranfer ring size!\n",
+                          __func__);
+
+    return -1;
 }
 
 static void xhci_er_reset(XHCIState *xhci, int v)
-- 
2.31.1


