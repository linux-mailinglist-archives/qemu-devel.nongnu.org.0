Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90366055D6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 05:14:24 +0200 (CEST)
Received: from localhost ([::1]:60480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olM0l-0002cn-9h
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:14:23 -0400
Received: from [::1] (port=51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olM0W-0001yc-Ef
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLts-0002v1-Fm
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:17 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLtq-0001mO-RJ
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:16 -0400
Received: by mail-pf1-x42d.google.com with SMTP id m6so19087517pfb.0
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 20:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8swKSgWeilWZrM/mNtFL8crpzMp47VFbNvAGDxXmm3Y=;
 b=d4umjF4TJTeW9c8Lx+zwMgq38yaK0bBRGjjVIpQQUCBpLRaRO6PLJGWN9IemoAVWs7
 irv/SL6Ft5MAnt9epwMuCLhkFiJ/PEAuD8FzWkILJM5A/ccPSa39CaFvv63Ghs/rPD6c
 zKPcs3vOWgM9NgfGlhI5MzoxlYA8Bqi4WCRkg7tJWPFscc/gY0qIw1y9neT3/XOrymW2
 DJarUHgLMJPAv0k9PlWEiUPq1WPr7t7KyEvVf+0mCD2yTNWY77vfiSm7X9en9F2rrlFX
 RorpGbgsM01cCFE4uLoak/by4ckPEqBY2R8ztfiL4yeoKVX9O6I0AeocQJNqVOZRkgZj
 H1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8swKSgWeilWZrM/mNtFL8crpzMp47VFbNvAGDxXmm3Y=;
 b=0+VK/WSgGwodm0TV7E7NEY5MnIMat82e/mbpZsqY0atv7XJ9icuFmQOq2LROG2uMrP
 S2BXMFD8e1g96OjzC5MvAx7DG+0sa2tbfSkDAPsfQ4+VO/v3JhWep937+hlXYvtGzX5c
 4DZJ3GrK4+52r645gYAfPZCcFJc5LBE2DkYKVRFgBvTYlSG+r0Q4iX2DdFooAfwnuHde
 0vOwtzAvf/HJkLCX3XIC2lkx55BSs6umHsLo6fggkXeO+eTuqkiMVrROGFyB+0/cvTKv
 Odq8P215xg0laQoMiRgZxvXEf1eQMP7XCcqbT9wOdTCfe0xpAGXe/uZOuTODjSgzAICc
 jaDA==
X-Gm-Message-State: ACrzQf1lI1X4WD1X/IJiBMa2gbSJdMh04zsnIuBMa1AeViJRPztaaa8w
 4f7B4HAP2DXFm5oPKdMWRtm81GqfC/+4m9OU
X-Google-Smtp-Source: AMsMyM6o1r3sLTG0Geo77KOmPTwp2iFs5H5Am03HC0+vEoi6HBvqkxBRIoqylw5Y9HqNbNeIO/1cTw==
X-Received: by 2002:a63:1b15:0:b0:462:f17e:7051 with SMTP id
 b21-20020a631b15000000b00462f17e7051mr9991325pgb.619.1666235232375; 
 Wed, 19 Oct 2022 20:07:12 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 1/9] target/arm: Introduce curr_insn_len
Date: Thu, 20 Oct 2022 13:06:33 +1000
Message-Id: <20221020030641.2066807-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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


