Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A30443C19
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:07:49 +0100 (CET)
Received: from localhost ([::1]:44348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7Yy-0001u3-EG
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VL-0005FX-SA
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:05 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:42688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VI-0000vi-5Y
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:03 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id b17so1481708qvl.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FTtJgfAjhjyjpChmV21pyJSxrF1nuLy+//JpsWJ6z/k=;
 b=g1E1hcAcf148YccyIG7stM2rzbaOfCDKL4sQGbSu7j5SU5Wyd+GlFbTwOoUvstVwh7
 vv0O1mD8GjGrMzoFa+cazf0fvTomf+2EcDlckiBzj/aPBwkd0r9SFVyK0m8aLUTvsFhw
 SQt2jfiYxF/Rv1MCW3x9qiwVWGZAiOld7TeoREk5wOVbF27quqjs7KtywCX0NOX4mUd2
 dh0o/aHzJFlOKbiaeC0EZ0SbEntVAJARcrcgdAA+cT3EcKKSq0ooKW+DGZ9GKBDOY8RB
 t6q5o7onewcLADNzbWzbn8DJKAr80wS11oDSaCiBBR+i66TYNf4l/z0Xoq2NTtf+OXk7
 C+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FTtJgfAjhjyjpChmV21pyJSxrF1nuLy+//JpsWJ6z/k=;
 b=MOH0wVW8kA2qTUMUBoRZdXLRlChMkJgHI4YNpG1WUvPAAtY1T3IE6b6rjdod90ggtr
 I9SJx/9suIQuy5q24bywSGpA1GXo9hzlGj/KCikQmBF2wlnriYcfzjXtAaouUD38FDLI
 HFRfmTxh90hQpY5Netp1TdPiNlBVqqe1TNet3cOTys45tHkIEPD0+RD4Vg9eMh15OR8j
 DBjGjeoRi+ECR+UYJ/ojrmMBOxye44ugceDB6Shr1IW4rFakStiZfDxM7g/R+tia6WFO
 j8bCVBsO73tUiqOfIHKx+3f4B1UI0L3tYB80JRJUTQnuT0NGxQahvL5Fce6SWWsazRJl
 YPjg==
X-Gm-Message-State: AOAM532wwMJblZ1m5FvRL/PwtNSKMT5G4PzpzWJ/+dRij9dajDRdKU43
 ZqcptXmQvXvl/kLCHsZQL25es+FNI6lqCw==
X-Google-Smtp-Source: ABdhPJxR/z6fsILl13zkDQ0Cpdnc73WPxC4Sz86oi1au4g2bQN8cyBn9lbGV4b9JdXxKkhKNcPUPgA==
X-Received: by 2002:a0c:ec12:: with SMTP id y18mr18128801qvo.24.1635912239149; 
 Tue, 02 Nov 2021 21:03:59 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/10] target/arm: Assert thumb pc is aligned
Date: Wed,  3 Nov 2021 00:03:50 -0400
Message-Id: <20211103040352.373688-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Misaligned thumb PC is architecturally impossible.
Assert is better than proceeding, in case we've missed
something somewhere.

Expand a comment about aligning the pc in gdbstub.
Fail an incoming migrate if a thumb pc is misaligned.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub.c   |  9 +++++++--
 target/arm/machine.c   | 10 ++++++++++
 target/arm/translate.c |  3 +++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index e0dcb33e32..90bf803be2 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -77,8 +77,13 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     tmp = ldl_p(mem_buf);
 
-    /* Mask out low bit of PC to workaround gdb bugs.  This will probably
-       cause problems if we ever implement the Jazelle DBX extensions.  */
+    /*
+     * Mask out low bits of PC to workaround gdb bugs.
+     * This avoids an assert in thumb_tr_translate_insn, because it is
+     * architecturally impossible to misalign the pc.
+     * This will probably cause problems if we ever implement the
+     * Jazelle DBX extensions.
+     */
     if (n == 15) {
         tmp &= ~1;
     }
diff --git a/target/arm/machine.c b/target/arm/machine.c
index c74d8c3f4b..135d2420b5 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -794,6 +794,16 @@ static int cpu_post_load(void *opaque, int version_id)
             return -1;
         }
     }
+
+    /*
+     * Misaligned thumb pc is architecturally impossible.
+     * We have an assert in thumb_tr_translate_insn to verify this.
+     * Fail an incoming migrate to avoid this assert.
+     */
+    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
+        return -1;
+    }
+
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 828fb328ee..9ac4292cfb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9657,6 +9657,9 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     uint32_t insn;
     bool is_16bit;
 
+    /* Misaligned thumb PC is architecturally impossible. */
+    assert((dc->base.pc_next & 1) == 0);
+
     if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
         dc->base.pc_next = pc + 2;
         return;
-- 
2.25.1


