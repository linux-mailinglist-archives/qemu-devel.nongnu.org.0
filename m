Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F946583F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 22:16:39 +0100 (CET)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msWxw-0000kA-V7
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 16:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+91c63c4280be7436ccc6+6674+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1msWZa-0003Rd-AQ
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 15:51:27 -0500
Received: from casper.infradead.org ([90.155.50.34]:57786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+91c63c4280be7436ccc6+6674+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1msWZY-0000Rm-6C
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 15:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=aVzaDM2UnW4cE1jWgxkpgoXKV4dI8NPpp1xVgqgehY8=; b=F3iPys7L38phlNITEcTZVAcb6A
 RYmyP5mSjMgCXAKmRB0zUoT2G2i/M9FndjAvt7haLfS7dPbRtNWC/xciklcBU2oD7OM+oNR5l0xVQ
 HuKJoFLyAxoqLul2axFSlQmCDW3PILchHwVIL3LFA0WRepjegcoxhZWUJZ+taNoe5tEpWj+cY1QRa
 hUyXPtOgUUv92ZBndhaVycG3WQOlfNUueAFUVH3NKkkCmLQndX5TAwQufXqk/OXppwnIWOwoJho9n
 Tg1FuxGdq+FKOy/fOW3QX010yUefNEaAzvn6ydjm5BoomD43n0FlqDHIF8p4I+r6Qte7uA/iWuIs7
 4H4YygWQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msWZN-000wRW-UH; Wed, 01 Dec 2021 20:51:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1msWZN-000Euz-EH; Wed, 01 Dec 2021 20:51:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] intel_iommu: Only allow interrupt remapping to be enabled
 if it's supported
Date: Wed,  1 Dec 2021 20:51:13 +0000
Message-Id: <20211201205113.57299-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201205113.57299-1-dwmw2@infradead.org>
References: <20211201205113.57299-1-dwmw2@infradead.org>
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

We should probably check if we were meant to be exposing IR, before
letting the guest turn the IRE bit on.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/intel_iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index ffc852d110..297e1972f8 100644
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


