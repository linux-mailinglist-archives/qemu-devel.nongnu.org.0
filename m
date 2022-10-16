Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EDB6003DF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 00:20:09 +0200 (CEST)
Received: from localhost ([::1]:36082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okBzL-0002Wr-FR
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 18:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpp-00029v-JC
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:17 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBpn-0007fy-SP
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:10:17 -0400
Received: by mail-pj1-x1036.google.com with SMTP id cl1so9336213pjb.1
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 15:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8swKSgWeilWZrM/mNtFL8crpzMp47VFbNvAGDxXmm3Y=;
 b=yTMJjJe/EYbKfXpEjN9c6TI4KtLneOU3RUB9wxSByq1YMJxM3qoLvQm4TnVPtlxyIr
 q3KxjuJ0M6KWopgeRgEKkteFx0d7V7NApfX+XnfPOH2L54tUqd8zdNy5hyHTfuzQm2Fb
 fyYIFSGhA+J0+toeLQQD8chk8uiFm92wRV3/ue323VfSJzE5bdd2pylALWLfanw8oBnD
 +AIH42koVMgObKOylHXANHpiktNu88FwYE7FVmvI6rlVCShlA22B0puzdX5OAqdP45oj
 9UV6e6OGI8Q2vT/ggtyASoszM4NMqfXbHFwIHzX2DwB5Ftbo8UJ4gtipU6DctOKPX4YL
 FafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8swKSgWeilWZrM/mNtFL8crpzMp47VFbNvAGDxXmm3Y=;
 b=sasO4Ooy27F6J56Qu9pqp/1OvI257JJel2UeA0x3a3wPdireKLciTPbVgo8zQ9cMax
 G6Pc8VGu5o7N+y+TSPGlT0MXpbuTKQeUYGPMzzM50vZbMb6Q1MnJEbbTVP5SkhGeeatd
 oIPROOOy3KtyJyvfoCu5GaNrNeproZVojI6Edypl9XL3v2dM7Tpgfp8Ysg+uYYQBt3+s
 bYCql5TUkv/VAqbaTOcEgPRxkh41mJZ0A73taTQwmHnGSiR0qAevr2rCtFzn1zoZJvht
 x+x/gFwiMgPX3wGpcyIwp3ejHJAOSyOlYhrAFXTM7EsG1/16LYfK5umspOpwYeoqOHZy
 4WQg==
X-Gm-Message-State: ACrzQf2CXhUqOa4j0U6lxeUjRO7TMfVmGiWIPQYO4oDZlYbrVMqWzU29
 /5nELwfXSMsa/p9WFWofeU5IS7mvTt+cdobk
X-Google-Smtp-Source: AMsMyM5XCIzSv234FaT+YG2lOxRTiqPLPd1IrIUE7sJwhYJd+q22qk2R/zCZOSYGV2lvBL/5e5NSkw==
X-Received: by 2002:a17:90b:2705:b0:20a:b4fa:f624 with SMTP id
 px5-20020a17090b270500b0020ab4faf624mr10077840pjb.124.1665958214378; 
 Sun, 16 Oct 2022 15:10:14 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 1/9] target/arm: Introduce curr_insn_len
Date: Mon, 17 Oct 2022 08:09:24 +1000
Message-Id: <20221016220932.274260-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016220932.274260-1-richard.henderson@linaro.org>
References: <20221016220932.274260-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

A simple helper to retrieve the length of the current insn.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 5 +++++
 target/arm/translate-vfp.c | 2 +-
 target/arm/translate.c     | 5 ++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index af5d4a7086..90bf7c57fc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -226,6 +226,11 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
     s->insn_start = NULL;
 }
 
+static inline int curr_insn_len(DisasContext *s)
+{
+    return s->base.pc_next - s->pc_curr;
+}
+
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 /* CPU state was modified dynamically; exit to main loop for interrupts. */
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index bd5ae27d09..94cc1e4b77 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -242,7 +242,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
     if (s->sme_trap_nonstreaming) {
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
-                                       s->base.pc_next - s->pc_curr == 2));
+                                       curr_insn_len(s) == 2));
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2f72afe019..5752b7af5c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6650,7 +6650,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9812,8 +9812,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-            gen_helper_wfi(cpu_env,
-                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            gen_helper_wfi(cpu_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
-- 
2.34.1


