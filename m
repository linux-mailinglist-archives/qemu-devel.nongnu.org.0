Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D15E587D9F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:54:00 +0200 (CEST)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsLP-0007Iy-HM
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIsGM-0001xi-N6
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIsGJ-0004an-SO
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659448121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HY4TI+z54ldCqpxalLRjvMHpKFMUlZIHXkFlFRTkSW8=;
 b=YghGdzsluF8dvgwF9m99+mPC0UthjFTt36Ty3bMpBJ1oHPbSPV4MXbAL2XB4EngYE8Q8Un
 YNTjJLwqFirDBCxGLjRvIV8XQLh1fQzygJ6BmQM/d5YllxHmKZ1PF5KLW09iivuwmOmNzq
 D3HmVyfaJSTiU5yJwbNdzH1xEwkT/20=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-p2btsAxbOKOU2At6564xXw-1; Tue, 02 Aug 2022 09:48:38 -0400
X-MC-Unique: p2btsAxbOKOU2At6564xXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D15D61C0512A;
 Tue,  2 Aug 2022 13:48:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AFF81410F38;
 Tue,  2 Aug 2022 13:48:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: mcascell@redhat.com,
	f4bug@amsat.org
Subject: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
Date: Tue,  2 Aug 2022 15:48:34 +0200
Message-Id: <20220802134834.454749-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

The XHCI code could enter an endless loop in case the guest points
QEMU to fetch TRBs from invalid memory areas. Fix it by properly
checking the return value of dma_memory_read().

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/646
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/usb/hcd-xhci.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 296cc6c8e6..63d428a444 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -21,6 +21,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/queue.h"
 #include "migration/vmstate.h"
@@ -679,8 +680,12 @@ static TRBType xhci_ring_fetch(XHCIState *xhci, XHCIRing *ring, XHCITRB *trb,
 
     while (1) {
         TRBType type;
-        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
-                        MEMTXATTRS_UNSPECIFIED);
+        if (dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
+                            MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
+                          __func__);
+            return 0;
+        }
         trb->addr = ring->dequeue;
         trb->ccs = ring->ccs;
         le64_to_cpus(&trb->parameter);
@@ -727,8 +732,12 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
 
     while (1) {
         TRBType type;
-        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
-                        MEMTXATTRS_UNSPECIFIED);
+        if (dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
+                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
+                          __func__);
+            return -length;
+        }
         le64_to_cpus(&trb.parameter);
         le32_to_cpus(&trb.status);
         le32_to_cpus(&trb.control);
-- 
2.31.1


