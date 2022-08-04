Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB74589C8D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:24:56 +0200 (CEST)
Received: from localhost ([::1]:39356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaqN-0004hB-Cz
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJaf0-0003ni-Q8
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:13:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJaex-0001Va-CK
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659618786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QJWDRhT16hPS2zRRaeITmwe5rTA4+AYTcXGuonNuvw0=;
 b=hL48yjHIllTDNJDIYXbOqnt2sLziIWL9JtDJD5TinXRPqRWtP5v0UT1Gm/gUWs/S0y94I9
 DMq8AcvP39cPmVKEJNDQvKF+F4BsUE1v7RtYNVfuKvKBnLGEyP/ZEi6bkrTvohR2ORvXs/
 eXsCI7qEKf9g2/r2PkO0UYKW9o3RWrw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-xG3fZvldPCS7MCIffiDkWw-1; Thu, 04 Aug 2022 09:13:05 -0400
X-MC-Unique: xG3fZvldPCS7MCIffiDkWw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E72E1032964;
 Thu,  4 Aug 2022 13:13:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 776D4492C3B;
 Thu,  4 Aug 2022 13:13:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: mcascell@redhat.com, f4bug@amsat.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 for-7.1] hw/usb/hcd-xhci: Fix unbounded loop in
 xhci_ring_chain_length() (CVE-2020-14394)
Date: Thu,  4 Aug 2022 15:13:00 +0200
Message-Id: <20220804131300.96368-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

The loop condition in xhci_ring_chain_length() is under control of
the guest, and additionally the code does not check for failed DMA
transfers (e.g. if reaching the end of the RAM), so the loop there
could run for a very long time or even forever. Fix it by checking
the return value of dma_memory_read() and by introducing a maximum
loop length.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/646
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Reworded subject and commit description
 - Focus on xhci_ring_chain_length() since that's the only function
   where an endless loop can currently occur. The other spots that
   ignore the return value of dma_memory_read() should be fixed as
   well later, but that's rather something for QEMU 7.2.
 - Added an real limit for the loop, so that it also ends after a
   while in case there are no DMA errors
 - Use "return -1" instead of "return -length" since the latter
   is somewhat weird (could be sometimes 0, sometimes negative)

 hw/usb/hcd-xhci.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 5a1ddf8c3e..b5669bc234 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -21,6 +21,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/queue.h"
 #include "migration/vmstate.h"
@@ -729,10 +730,14 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
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
@@ -766,7 +771,17 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
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


