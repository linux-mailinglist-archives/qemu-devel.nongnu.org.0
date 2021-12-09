Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D6F46F6D4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 23:29:02 +0100 (CET)
Received: from localhost ([::1]:33084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvRuO-0001Ab-Qb
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 17:29:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1edeb5486ad47d612180+6682+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1mvRb0-0003od-QE
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 17:08:58 -0500
Received: from casper.infradead.org ([90.155.50.34]:58042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1edeb5486ad47d612180+6682+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1mvRax-0002aa-BL
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 17:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6T8H5SlZi4uUdKoCbrgDO6stZljqx7xoEBEiCfG7UWI=; b=CciiV4aJXjCUHa+0cePD85FEhI
 U9bgUiT8WbOi8acWFbkot4IWwgXOTXp3+SjFSvg9D+ZdgnIy3HBAddxtVtPGNUpOZO3FZRxbDOR1o
 YTlXxE6zqjNdpNyVNX9ZgNjArRlcEAxgaPQh0q3Nb5B31sOR3uLZRlTR4XfOHeIqDUP24mHMQoj/o
 6F9VfvYmtqXoA7MBGrObhccuveuFog8Sv+LDkwmbOXxdeGOBu4FdYx67culwfyxRSUI4FpUBRwl7z
 MnWs7DETKjqWg98b+qIjX500QvWMOyXIU1M0JZj6A3XXXF7Q9AqSAbo+j3hZCFCOxeJqgIm5/UK4m
 Ep+ls07Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvRai-009loX-S9; Thu, 09 Dec 2021 22:08:41 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mvRaj-0003t0-31; Thu, 09 Dec 2021 22:08:41 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] intel_iommu: Only allow interrupt remapping to be
 enabled if it's supported
Date: Thu,  9 Dec 2021 22:08:39 +0000
Message-Id: <20211209220840.14889-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211209220840.14889-1-dwmw2@infradead.org>
References: <20211209220840.14889-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=90.155.50.34;
 envelope-from=BATV+1edeb5486ad47d612180+6682+infradead.org+dwmw2@casper.srs.infradead.org;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Woodhouse <dwmw@amazon.co.uk>

We should probably check if we were meant to be exposing IR, before
letting the guest turn the IRE bit on.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 9a3cb2b789..bd288d45bb 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2197,6 +2197,7 @@ static void vtd_handle_gcmd_ire(IntelIOMMUState *s, bool en)
 /* Handle write to Global Command Register */
 static void vtd_handle_gcmd_write(IntelIOMMUState *s)
 {
+    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
     uint32_t status = vtd_get_long_raw(s, DMAR_GSTS_REG);
     uint32_t val = vtd_get_long_raw(s, DMAR_GCMD_REG);
     uint32_t changed = status ^ val;
@@ -2218,7 +2219,8 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
         /* Set/update the interrupt remapping root-table pointer */
         vtd_handle_gcmd_sirtp(s);
     }
-    if (changed & VTD_GCMD_IRE) {
+    if ((changed & VTD_GCMD_IRE) &&
+        x86_iommu_ir_supported(x86_iommu)) {
         /* Interrupt remap enable/disable */
         vtd_handle_gcmd_ire(s, val & VTD_GCMD_IRE);
     }
-- 
2.31.1


