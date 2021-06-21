Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA33AEEEC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:32:12 +0200 (CEST)
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMqI-0001Tr-Ob
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmx-00070g-VJ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmu-0007U0-Ld
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:43 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j2so9829724wrs.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=msplhhbHPZOLTV+03Pt32lxRvFVIqgf586iZwaiu2ZI=;
 b=sDQ62AL8106sPEd1J0fS2BHMeqfdFneSI0DcSTO1hEXfEf1xAWnT7WbgzbVKXkMx1T
 COM/DjpvNv00756UuRZd39tlOny/WmylO5cQsIxHEezhQb+vkD2dRXTq7wec843ZhYFf
 Btsz57Y5piio25BEP5UAJhDn4k03g8rHonpHA2f2Zbf80Gujj1plVckWY0JED/AXr0sI
 qUcauPO2mChByMf734YJeAe7quZqeVUocLOZTJrsB2+aEN4FfiqSmqhIPmulqtv+qTUt
 rHekSLvvkLV45g6Xz0RZYp3bjZKKxvDwEYg1OZ4H7JEAeau42eKPYRs0sShLqX1C+o6B
 SYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msplhhbHPZOLTV+03Pt32lxRvFVIqgf586iZwaiu2ZI=;
 b=W3KGfJvQnl9Fdf7egwft1R4mccZWvmNqY1XdE0ZGengExm64svDPF5inmLUR/+E2q2
 FLU3SRjyM5Tdk0Q0ZfrsBi9QmEUw+b3NYjXDRZJrBwMxC1sjgN8INWRxSZ2T6TpDPBBr
 SdvTd38XpLJMA14JCPPmvmejYC4uj+Il1qj/5jHrY6u2wl/Y6RRiSPPeSnyjuQwG74iQ
 wIFsRnHHZRrbgAtqxxRSlA5csKnlu9aGn+r0oZGyIASpjzM7p8hjmeU+9a1BP+x5xtwT
 V2qGEQwetyXwQIBAoqCdenmHjWM6VUw+gFLXKiL1EGvC3dsprQaEpKtpCGr30q+ATyH0
 IceQ==
X-Gm-Message-State: AOAM530y7/XhQIenZiENI8ly84fvmTMQ9wduoP3p4ZsS8UMZF2O62AaR
 HgPcZdccH68lKGqTO5jn83AvwgUmx6na7sew
X-Google-Smtp-Source: ABdhPJwV7vot6Kje/9+HGAiSmOfWB0/0Ad0DgW3v6IKlXBJVIxn79NDyAHkVk3icd9RHMd1jqOXjMw==
X-Received: by 2002:a05:6000:cb:: with SMTP id
 q11mr29711504wrx.13.1624292919391; 
 Mon, 21 Jun 2021 09:28:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/57] target/arm: Handle FPU being disabled in FPCXT_NS
 accesses
Date: Mon, 21 Jun 2021 17:27:42 +0100
Message-Id: <20210621162833.32535-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210618141019.10671-3-peter.maydell@linaro.org
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


