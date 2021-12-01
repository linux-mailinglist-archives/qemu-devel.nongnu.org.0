Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C846583D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 22:16:24 +0100 (CET)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msWxh-0000J5-5i
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 16:16:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+91c63c4280be7436ccc6+6674+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1msWZc-0003S8-5c
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 15:51:30 -0500
Received: from casper.infradead.org ([90.155.50.34]:57788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+91c63c4280be7436ccc6+6674+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1msWZY-0000Rn-6E
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 15:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=4Wlf+rCDOKrtA5ncaXG8n3P6unqgFBcMJrGQNwuiDHI=; b=paSbXY9Rwv4SWjm/3bhyc8c/Ul
 wb4TtzUob7tz1gezHKLhGRMaOcAPIxbQdIX8ALH7Q9/mP0lnm0Wv+vLyhHraFUmLYrZIj7xhoUNsr
 C+1Udq9CApQvH+4P4tRW1VKPu9RhUio6YqOcd07gKqkFVnEk3yAtmwod/hBQj8caBwInSojTQtOYA
 ZDoOiI219aql1vw3vkI16mjg+XtDWfbPpE4Jz/JMP1Zk1/C+jIVC4ZUT4Vem3dGi0XzYDOx31C5X5
 tB53faeWr8k1ayttMCkFG1GXk1CHHcQ2RNZvnd29YYws5SykLnoWAza0VB2up7AQA7yplKwqCcJXm
 u6kx5FiA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msWZN-000wRV-UI; Wed, 01 Dec 2021 20:51:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1msWZN-000Euw-CS; Wed, 01 Dec 2021 20:51:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] intel_iommu: Support IR-only mode without DMA translation
Date: Wed,  1 Dec 2021 20:51:12 +0000
Message-Id: <20211201205113.57299-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=90.155.50.34;
 envelope-from=BATV+91c63c4280be7436ccc6+6674+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Woodhouse <dwmw@amazon.co.uk>

By setting none of the SAGAW bits we can indicate to a guest that DMA
translation isn't supported. Tested by booting Windows 10, as well as
Linux guests with the fix at https://git.kernel.org/torvalds/c/c40aaaac10

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/intel_iommu.c         | 14 ++++++++++----
 include/hw/i386/intel_iommu.h |  1 +
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 294499ee20..ffc852d110 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2202,7 +2202,7 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
     uint32_t changed = status ^ val;
 
     trace_vtd_reg_write_gcmd(status, val);
-    if (changed & VTD_GCMD_TE) {
+    if ((changed & VTD_GCMD_TE) && s->dma_translation) {
         /* Translation enable/disable */
         vtd_handle_gcmd_te(s, val & VTD_GCMD_TE);
     }
@@ -3100,6 +3100,7 @@ static Property vtd_properties[] = {
     DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALSE),
     DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
     DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
+    DEFINE_PROP_BOOL("dma-translation", IntelIOMMUState, dma_translation, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -3605,12 +3606,17 @@ static void vtd_init(IntelIOMMUState *s)
     s->next_frcd_reg = 0;
     s->cap = VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND |
              VTD_CAP_MAMV | VTD_CAP_PSI | VTD_CAP_SLLPS |
-             VTD_CAP_SAGAW_39bit | VTD_CAP_MGAW(s->aw_bits);
+             VTD_CAP_MGAW(s->aw_bits);
     if (s->dma_drain) {
         s->cap |= VTD_CAP_DRAIN;
     }
-    if (s->aw_bits == VTD_HOST_AW_48BIT) {
-        s->cap |= VTD_CAP_SAGAW_48bit;
+    if (s->dma_translation) {
+            if (s->aw_bits >= VTD_HOST_AW_39BIT) {
+                    s->cap |= VTD_CAP_SAGAW_39bit;
+            }
+            if (s->aw_bits >= VTD_HOST_AW_48BIT) {
+                    s->cap |= VTD_CAP_SAGAW_48bit;
+            }
     }
     s->ecap = VTD_ECAP_QI | VTD_ECAP_IRO;
 
diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 41783ee46d..42d6a6a636 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -266,6 +266,7 @@ struct IntelIOMMUState {
     bool buggy_eim;                 /* Force buggy EIM unless eim=off */
     uint8_t aw_bits;                /* Host/IOVA address width (in bits) */
     bool dma_drain;                 /* Whether DMA r/w draining enabled */
+    bool dma_translation;           /* Whether DMA translation supported */
 
     /*
      * Protects IOMMU states in general.  Currently it protects the
-- 
2.31.1


