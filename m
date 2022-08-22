Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3FB59CC47
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:36:54 +0200 (CEST)
Received: from localhost ([::1]:60438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGyT-00019l-Qb
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlv-0005gI-IR
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:56 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlr-0005cj-6w
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:55 -0400
Received: by mail-pg1-x534.google.com with SMTP id l64so10781541pge.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
 b=tJAnrn5ZTXiXYB6yNHP6dyvDQbWcpH/vsECz03Ss4f1tFx86dkn5QD/DN7KcpVj86d
 HeBdAyFLwOPSAOyhA85stDhPVeJap5MLE4ZrurightZSCTCOZwNbuJAyLsDZugqGvs9S
 JSnTUWLoHDhvChgWMnhqYQxTcVIRQNMEOEkVcGS/KsIeWIIUIhMFxE8EiGfx/ANUlyFH
 QkJVirSAznGHzD2u5fxPSvVChHXjgWyQ+MKrHCDN/esfMN2UqHjhtMA99hhf1F2hXEhv
 zA1uBhzUoupSLC3NPj5SQDd0cEunnz92lI6X0lGEwrjzigBMrLpnryuIwI5theMOtkSI
 /eLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
 b=2jEdf+SBVhziz60kb0s/sq1ceJLgvBUp6qdaESxPB7FTafY6xbVJclsq3D8P52Mhd/
 xXWfapoksqdCYaf6uhGHe8g9WbkvbN+ElIVh76X7zkhHsg9HFlsoUiT5Yl/N550HoDau
 6sxRRvYhx4VoHTjuuHciFAx68I5+rqT8/LOi7EknkaVFfIkx8H0TTRNHdIcY2a5fo+V6
 yHls295aflMW10WWGStMPJS7/lr2rkwh8t42sjM3hINQCBsmfM+CRlCvOpBd0fXLDGg8
 mXkLHUm5MWsgTC36edMgnXHv2oxilQHxLEnD4oXFOfffIYA0tLv4zHdVLTlbLJUkMMaA
 yeuQ==
X-Gm-Message-State: ACgBeo1BNe2K69vQaDENSaDqtq315ktY/oSFLaAU+53UcRdOWa9fktNK
 84FKFNnGBvsoq2oetI01T/Na54SZoHR33A==
X-Google-Smtp-Source: AA6agR6aZ0HEn36Ws0ZRVRdPOUBSW9vmROYj4cOnhzyruPIhT+keZrR8p/TY41nTG/MDhIHlPMdO8Q==
X-Received: by 2002:a63:f4d:0:b0:41c:5b90:f643 with SMTP id
 13-20020a630f4d000000b0041c5b90f643mr19164370pgp.537.1661210629852; 
 Mon, 22 Aug 2022 16:23:49 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 09/17] target/arm: Introduce curr_insn_len
Date: Mon, 22 Aug 2022 16:23:30 -0700
Message-Id: <20220822232338.1727934-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 9474e4b44b..638a051281 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6660,7 +6660,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9825,8 +9825,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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


