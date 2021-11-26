Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2745F253
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:43:32 +0100 (CET)
Received: from localhost ([::1]:47122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqeJv-0007ES-Dt
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:43:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeFu-0002Mw-NE
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:39:22 -0500
Received: from [2a00:1450:4864:20::434] (port=36708
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mqeFs-00045d-0D
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:39:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id s13so19902177wrb.3
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZqPIGu4Qy6PwTbAwCyp2FzT39HNpyMiA1WgHKTzzzs0=;
 b=iH02sJq7u9wZ2jWHkzf3Ivtu/sPN34t1bFsIOmg7P7DbQgk+VPoVnjglkOscvOp7xf
 qMWD2fEyr5bV86KASqqG7D40LFo5RjhcMP1UXvoxfSQ2csyqa5Wqb4xY3SKK/YZHUhE8
 1K39BK3YgtQIfGLN0AM6CaRWv4biOCLma5G93pHofMLVtAtSSNK5IdYxSJMRjwBv5eSd
 wulm4NisjJY6k8v4XLAXkwPftcaITla5soIRg0VeFqJVN0F1BqFBjceWhFFOrBBjolsL
 CvKQ/GxZHowJ0MbKDA+DO4dhha8FG9BsWuv2w3POwCACc4BqJlUHXZpDoyl6eFcYVbac
 X/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZqPIGu4Qy6PwTbAwCyp2FzT39HNpyMiA1WgHKTzzzs0=;
 b=GwAJ2OxIBpZEWhWp8fVFThfbmWO9BgUNqnzNlGupiILyh3KuYyNT0V55IReuWkK2xi
 Me5b+ypYaQBvSjRpknTIeXgABFuWmdoNzboQ2380fBM6k0SSgBxYXujp2Im/BbRc7bYG
 Lnc3h/iq1UGDj8KPEyHVBo0MZORpZgeN63Ct15CrT9ZEABO4QwMRE0/oH0PARJc0AIUF
 t2lq+9dxALXj3udHKCB19gbfF5/5CoRTKMRZC9ujflAnSRXYWgIrXw+XTIG9NNjd4cWU
 F/v8Dk815O8qy/0gVUtwv6HYyLOuCun+GNoDr7BMEHa5zlP2anxkzNTvd+Cgfdgyb6eh
 j3nA==
X-Gm-Message-State: AOAM533dWOZKatW0pInboWeWSKtrrRqLM9+aVX0dr4HKvG/efpcEuADV
 adKZHmnlFNqQ/Vbf9Pb71vcqSA==
X-Google-Smtp-Source: ABdhPJy25DKRcaKVJkpDo7IM5SRjcLw5J+PmpLgDdtqB+VldmJeiXDQFouHqByduZpdTuDUcuFBeVQ==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr15483833wri.355.1637944758440; 
 Fri, 26 Nov 2021 08:39:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id b14sm7837698wrd.24.2021.11.26.08.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:39:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2? 2/2] hw/intc/arm_gicv3: fix handling of LPIs in list
 registers
Date: Fri, 26 Nov 2021 16:39:15 +0000
Message-Id: <20211126163915.1048353-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126163915.1048353-1-peter.maydell@linaro.org>
References: <20211126163915.1048353-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is valid for an OS to put virtual interrupt ID values into the
list registers ICH_LR<n> which are greater than 1023.  This
corresponds to (for example) KVM using the in-kernel emulated ITS to
give a (nested) guest an ITS.  LPIs are delivered by the L1 kernel to
the L2 guest via the list registers in the same way as non-LPI
interrupts.

QEMU's code for handling writes to ICV_IARn (which happen when the L2
guest acknowledges an interrupt) and to ICV_EOIRn (which happen at
the end of the interrupt) did not consider LPIs, so it would
incorrectly treat interrupt IDs above 1023 as invalid.  Fix this by
using the correct condition, which is gicv3_intid_is_special().

Note that the condition in icv_dir_write() is correct -- LPIs
are not valid there and so we want to ignore both "special" ID
values and LPIs.

(In the pseudocode this logic is in:
 - VirtualReadIAR0(), VirtualReadIAR1(), which call IsSpecial()
 - VirtualWriteEOIR0(), VirtualWriteEOIR1(), which call
     VirtualIdentifierValid(data, TRUE) meaning "LPIs OK"
 - VirtualWriteDIR(), which calls VirtualIdentifierValid(data, FALSE)
     meaning "LPIs not OK")

This bug doesn't seem to have any visible effect on Linux L2 guests
most of the time, because the two bugs cancel each other out: we
neither mark the interrupt active nor deactivate it.  However it does
mean that the L2 vCPU priority while the LPI handler is running will
not be correct, so the interrupt handler could be unexpectedly
interrupted by a different interrupt.

(NB: this has nothing to do with using QEMU's emulated ITS.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not sure whether to put this into 6.2 -- I haven't ever seen
any actual misbehaviour, I found the bug by code inspection;
and we've behaved this way since the GICv3 support for
virtualization was first implemented, so it's not a regression.
---
 hw/intc/arm_gicv3_cpuif.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 7fbc36ff41b..7fba9314508 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -653,7 +653,7 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
         if (thisgrp == grp && icv_hppi_can_preempt(cs, lr)) {
             intid = ich_lr_vintid(lr);
-            if (intid < INTID_SECURE) {
+            if (!gicv3_intid_is_special(intid)) {
                 icv_activate_irq(cs, idx, grp);
             } else {
                 /* Interrupt goes from Pending to Invalid */
@@ -1265,8 +1265,7 @@ static void icv_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_icv_eoir_write(ri->crm == 8 ? 0 : 1,
                                gicv3_redist_affid(cs), value);
 
-    if (irq >= GICV3_MAXIRQ) {
-        /* Also catches special interrupt numbers and LPIs */
+    if (gicv3_intid_is_special(irq)) {
         return;
     }
 
-- 
2.25.1


