Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E4546A6A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:34:00 +0200 (CEST)
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhaB-000711-Dg
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAy-0007XW-6k
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAu-0007Fs-MC
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:54 -0400
Received: by mail-wr1-x432.google.com with SMTP id c21so4035353wrb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PBYKiE6bpDTEnaJSKy1zk0rkD9aLj61WBo6X+OhO46o=;
 b=UV3wRSdm8V6+tPlVAHKpu4iromjLJ3OyfkA28L6IC7xXgpI2IFzzRVW6pFhMsNTIt9
 qM2a0tLzmEKUkV85zflec7Ke3eoY9vN7iZQCl7x2CVLaah2ajnWbNCrkssYyr3QAFtZj
 a4fc7BsHrE3ddUyOEDNLbzJw4l3RDKzesr2pexZh0N+o3e4fAiC9h0JSVJ/ACdKx3xDJ
 Q5wvPt9KiaSrxuJ3Z7W36Tvct1Juh2dtgh68MapszU8CiP9ykHkNm8ezVfBTotDY1nqi
 b59lGlv3NX4nJCsV2ga8QVV6rm8CkzY1TU5hGeXPne3dM2vUiVB//3wB7TlMRJoEzeGj
 E6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBYKiE6bpDTEnaJSKy1zk0rkD9aLj61WBo6X+OhO46o=;
 b=iNGUk6y3umlxHjDwIWi+xKg9nNLJGm42SueC5Ez2HUaq0B+czkfwoUMlNRU079laCL
 uTsPn1x4zc0fH9sDtJ8vYfhI9IKKpWBWVTt8YoBaXf3bXRxVwrM+cvAIjrkAk8u9Whu0
 Phw3MeajD0ulQDCcBoCliL6SlHn02R+M0Z2vxzUHNYCp+0Frum7xiX6sfZoKSnMzmRj9
 23MR6Skzw2TbJ6nZBN8CsgwFW47Ofv7+AJeDGvrZ/MbiQb3F25/wsyS18KWjG194F/Kl
 VpOhfqUpSTmBWx824dwAwVBKZHlfPvfoEICJmzjcOfD1R+k0TjvwnQ6H54L2mXf85JeA
 JhCQ==
X-Gm-Message-State: AOAM533WgLgFGIIjwIrS4wgTqwkXYP7AAgosRT1EWLTXpb9PT3O3Jd/C
 iXnDLrTgFHEVUAjRE71KWOG0Kwvunajc5A==
X-Google-Smtp-Source: ABdhPJyXWjhYbYnzTnUAcUUaMsiOS617XXHj7sHmdz2HHgxe2shCmlhnT5SvgIotZgvwbMLM6z7uJQ==
X-Received: by 2002:adf:fb03:0:b0:20a:e253:b8c7 with SMTP id
 c3-20020adffb03000000b0020ae253b8c7mr43439336wrr.119.1654877270259; 
 Fri, 10 Jun 2022 09:07:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/28] target/arm: Introduce gen_exception_insn_el_v
Date: Fri, 10 Jun 2022 17:07:20 +0100
Message-Id: <20220610160738.2230762-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Richard Henderson <richard.henderson@linaro.org>

Create a function below gen_exception_insn that takes
the target_el as a TCGv_i32, replacing gen_exception_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dc033600c0e..9cb31663ddb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,8 +1086,8 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
-                        uint32_t syn, uint32_t target_el)
+static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
+                                    uint32_t syn, TCGv_i32 tcg_el)
 {
     if (s->aarch64) {
         gen_a64_set_pc_im(pc);
@@ -1095,10 +1095,17 @@ void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
         gen_set_condexec(s);
         gen_set_pc_im(s, pc);
     }
-    gen_exception(excp, syn, target_el);
+    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
+                                          tcg_constant_i32(syn), tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
+                        uint32_t syn, uint32_t target_el)
+{
+    gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
+}
+
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     gen_set_condexec(s);
@@ -1114,17 +1121,6 @@ void unallocated_encoding(DisasContext *s)
                        default_exception_el(s));
 }
 
-static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
-                             TCGv_i32 tcg_el)
-{
-    gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
-    gen_helper_exception_with_syndrome_el(cpu_env,
-                                          tcg_constant_i32(excp),
-                                          tcg_constant_i32(syn), tcg_el);
-    s->base.is_jmp = DISAS_NORETURN;
-}
-
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
@@ -2847,7 +2843,8 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
                 tcg_el = tcg_constant_i32(3);
             }
 
-            gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
+            gen_exception_insn_el_v(s, s->pc_curr, EXCP_UDEF,
+                                    syn_uncategorized(), tcg_el);
             tcg_temp_free_i32(tcg_el);
             return false;
         }
-- 
2.25.1


