Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43A13ACD41
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 16:13:32 +0200 (CEST)
Received: from localhost ([::1]:56194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luFFP-0001ls-B7
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 10:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCX-0007OS-Iq
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luFCT-0001xY-WF
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:10:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id e22so7356119wrc.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dRfZrUkzHx2HbQeo0FP4Jf8eMM4MIpIZDbO0Ga50h6Y=;
 b=P2TzW2ZaSkaDoxIiTnH2mrWozcCUa/cHSp9hXD+uDq+E5oBJxbdpBh8LIbZhvYLem/
 EGpoOhpF4kPtsAY7QZpIZFZWe1KBrFTmAoJVEBrMNGQLzrb30oDTCftnM7XfHxH1tOKw
 FgDH2un/6B3ewOXcgJEc7aiNtb5aL3rkY1wj08dVcQO49GB6P1Hop+85J/Wv21fpNkXj
 BbinOQjvUP5oLcmYM5jNiJz3UaVFi4Aotx5TSey7e2aHihk/5Gt1oGyHQgQHHsgjE8MV
 GkQkkiczgSDW63VbAmoigUzVgw/GpIseELAtD75GcITF6dNO05IOug7DfmcBPXIsE4By
 CpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dRfZrUkzHx2HbQeo0FP4Jf8eMM4MIpIZDbO0Ga50h6Y=;
 b=lFSf22Bzb94DkjQcfQH9mQtCQSC5jS8Rx4aejbXwMZYqb4GYyHcHJULyQQWaMj1F4k
 2b2IezwAJ0WzCxxCILgIg6JEbKsIdXduOVcDlqX8Q9FzMq13amBEFOjGoHXzAmJK9jMv
 3CdAE7dnP3idvSo4Hccifp+MVMX1t98FvMCMLJIaQk6+SGTM+6PcURdZe3Ycwbqh5AKz
 Ao0JTGZj/MMCdrMLfgIUu0yExoiaT80v5N4vUfcbSZ70UWsJWxGojIIo5+NbqzYRMTV8
 uQ9bhye0SLkK9FZ8UhG2bjLU48luTiHwoe1XzC1qaPUj8rxFmoHXpp0wa3dlc4Cdu8+0
 k1Vg==
X-Gm-Message-State: AOAM531g/sBxnhmAuTub/lHIfrnmC2g5eJ1QAzYhA65ECI6IlzHl/Mj6
 XaJkO65bZUkbSQpyH0fIZg2mCYOghAqLnYlL
X-Google-Smtp-Source: ABdhPJx67+0ia9kelnVvqdhQGgcVb9o4BmLQebzCmFtO4BuhuzD0xkJRjeCtaBtUwpELVp7Is/0/XA==
X-Received: by 2002:adf:ef87:: with SMTP id d7mr12797263wro.24.1624025423083; 
 Fri, 18 Jun 2021 07:10:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j11sm7751661wmq.4.2021.06.18.07.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 07:10:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/7] target/arm: Handle FPU being disabled in FPCXT_NS accesses
Date: Fri, 18 Jun 2021 15:10:14 +0100
Message-Id: <20210618141019.10671-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141019.10671-1-peter.maydell@linaro.org>
References: <20210618141019.10671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

If the guest makes an FPCXT_NS access when the FPU is disabled,
one of two things happens:
 * if there is no active FP context, then the insn behaves the
   same way as if the FPU was enabled: writes ignored, reads
   same value as FPDSCR_NS
 * if there is an active FP context, then we take a NOCP
   exception

Add code to the sysreg read/write functions which emits
code to take the NOCP exception in the latter case.

At the moment this will never be used, because the NOCP checks in
m-nocp.decode happen first, and so the trans functions are never
called when the FPU is disabled.  The code will be needed when we
move the sysreg access insns to before the NOCP patterns in the
following commit.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The "check for exception; then call gen_preserve_fp_state()"
is a little repetitive. We'll clean this up in a bit of
refactoring at the end of the patchseries, because the nicest
way to do it involves restructuring vfp_access_check().
---
 target/arm/translate-vfp.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 5a4a13ec1e1..107d6143be8 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -821,7 +821,21 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         lab_end = gen_new_label();
         /* fpInactive case: write is a NOP, so branch to end */
         gen_branch_fpInactive(s, TCG_COND_NE, lab_end);
-        /* !fpInactive: PreserveFPState(), and reads same as FPCXT_S */
+        /*
+         * !fpInactive: if FPU disabled, take NOCP exception;
+         * otherwise PreserveFPState(), and then FPCXT_NS writes
+         * behave the same as FPCXT_S writes.
+         */
+        if (s->fp_excp_el) {
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+            /*
+             * This was only a conditional exception, so override
+             * gen_exception_insn()'s default to DISAS_NORETURN
+             */
+            s->base.is_jmp = DISAS_NEXT;
+            break;
+        }
         gen_preserve_fp_state(s);
         /* fall through */
     case ARM_VFP_FPCXT_S:
@@ -961,7 +975,21 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_br(lab_end);
 
         gen_set_label(lab_active);
-        /* !fpInactive: Reads the same as FPCXT_S, but side effects differ */
+        /*
+         * !fpInactive: if FPU disabled, take NOCP exception;
+         * otherwise PreserveFPState(), and then FPCXT_NS
+         * reads the same as FPCXT_S.
+         */
+        if (s->fp_excp_el) {
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+            /*
+             * This was only a conditional exception, so override
+             * gen_exception_insn()'s default to DISAS_NORETURN
+             */
+            s->base.is_jmp = DISAS_NEXT;
+            break;
+        }
         gen_preserve_fp_state(s);
         tmp = tcg_temp_new_i32();
         sfpa = tcg_temp_new_i32();
-- 
2.20.1


