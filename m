Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D215475766
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:09:50 +0100 (CET)
Received: from localhost ([::1]:38902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSAP-0007fy-3d
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:09:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRia-0006qH-49
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:04 -0500
Received: from [2a00:1450:4864:20::432] (port=35578
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiW-0008QY-O2
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:03 -0500
Received: by mail-wr1-x432.google.com with SMTP id k9so19580630wrd.2
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ORTqNRlgAL3aGjFO6YwXxyL4b2oYDvxssC50fjyS/k8=;
 b=Fj4ccnjqvtbetscnSG4Lxg9eq9WRenZgEMNfIGl07BfVjTKfLCsXWi1r4Y/0gMIU/M
 rJ5Yfcsad58X62jwt6YhdyjPRcgznkmUB4IBhucem7um26CbXE60MlJyCfmizN830UQU
 a7DFokzwrPELlgJl6PV0/a9qG16gdj7QKsDJfgiSgXYa2gPUkl7wFbTfjoIA/vDQer8o
 LtdOSdyGqFcJx/29Wl272Nwu5APj/Mhe9bLlSJia8YWHwSiWk7PPL5H4NbUinsgTswYn
 yArOopUmCGQ4Olsq/gjZ9Wix+KuyomVIHcgaBj9LmjiqwKd/GEUcoGnuSeWS18w7k648
 V0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORTqNRlgAL3aGjFO6YwXxyL4b2oYDvxssC50fjyS/k8=;
 b=gPkPIqsT5RZxizOqwFHOOejjHoj/R0gHl5cglaBXFI/egNXT83mdZydXKbsOIW2vH3
 cPufks/HOpYOUsjH+k3SlsTpbO3B3Evh4FShzMLg5eNM0Wb1LiHHgsiaaFsgw2JraBLo
 lMxKnVNU5R076W3RrwolJl/KUgdtIRSOf2sOMe4qAjHZmNtsS2UOK6aPOyIS9oJNuMB/
 34sybiY1wt9xxyJWQw/ZJduQrsTNZxoN2eydaRpy68KFvIS3Nweh98dm1tI51xoCxsh4
 ah0oR8FIWu+++iu1iWRzrJxFgbVT3ayM44/hApjfVJW+upG1P1nHlxgG+RQZSXLwbWyh
 yyHA==
X-Gm-Message-State: AOAM5339GYS+ftnx7ITqL1kV3L5Uz0FD+Uwibwgm/yrzdY8KuuCHQJkG
 IM8XEXUNAtRiMuvsga/SCKjzHusF1nXbRA==
X-Google-Smtp-Source: ABdhPJxcfLfB9DbaqsgHPD2mIq3qhhgpTNL0TQ4m10J0hdsGWs2Qpn8z9TmeYcSTuproEghZ1CKcOg==
X-Received: by 2002:a5d:6b8b:: with SMTP id n11mr1050570wrx.123.1639564857644; 
 Wed, 15 Dec 2021 02:40:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/33] target/arm: Split arm_pre_translate_insn
Date: Wed, 15 Dec 2021 10:40:28 +0000
Message-Id: <20211215104049.2030475-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Create arm_check_ss_active and arm_check_kernelpage.

Reverse the order of the tests.  While it doesn't matter in practice,
because only user-only has a kernel page and user-only never sets
ss_active, ss_active has priority over execution exceptions and it
is best to keep them in the proper order.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1c2a7274dfc..0103c75a274 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9502,7 +9502,7 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     dc->insn_start = tcg_last_op();
 }
 
-static bool arm_pre_translate_insn(DisasContext *dc)
+static bool arm_check_kernelpage(DisasContext *dc)
 {
 #ifdef CONFIG_USER_ONLY
     /* Intercept jump to the magic kernel page.  */
@@ -9514,7 +9514,11 @@ static bool arm_pre_translate_insn(DisasContext *dc)
         return true;
     }
 #endif
+    return false;
+}
 
+static bool arm_check_ss_active(DisasContext *dc)
+{
     if (dc->ss_active && !dc->pstate_ss) {
         /* Singlestep state is Active-pending.
          * If we're in this state at the start of a TB then either
@@ -9551,7 +9555,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t pc = dc->base.pc_next;
     unsigned int insn;
 
-    if (arm_pre_translate_insn(dc)) {
+    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next = pc + 4;
         return;
     }
@@ -9622,7 +9626,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
-    if (arm_pre_translate_insn(dc)) {
+    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next = pc + 2;
         return;
     }
-- 
2.25.1


