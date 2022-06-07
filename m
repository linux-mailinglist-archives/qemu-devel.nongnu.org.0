Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8C253F43D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 04:59:55 +0200 (CEST)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPRi-0003cO-Mo
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 22:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG1-0006tr-TC
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:49 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFx-0000KV-VG
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:49 -0400
Received: by mail-pg1-x530.google.com with SMTP id s68so14539452pgs.10
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=289sSy4/34uhXPS50aA0Z7O/jFOKdwauFBDFQW9kqgA=;
 b=DYg/ZaQrnmiCUvWZk177IA9o8P3kahZ3zUq1QRY1Xk/pi0cDPTLqzGpHET2iTpTKoY
 MVfw/CG05eTaOvUs5gV32bvrcTY6gaepTYrQG7eNo8ByLRjS3lEqswZBcowrSGn4snss
 61yy7g3CZo6eJR1vrejD3AqudCG1WsEVSDHHLqNETUB8qZFUmy+Ir624fGNkJGdrbWQj
 bOC8+RHKS/+iwKc/t2Ms8kln5sr6PYkQCcVLh1iG9WxWvDw6S03Q/NYSIE7pbdmh/NdK
 67J1M3GRQ79oibveZ8l5IFmz+f5pXdT3ApaJ/tmz6/qSxquWTiz+gHVhA3IE8RgAoQHA
 5ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=289sSy4/34uhXPS50aA0Z7O/jFOKdwauFBDFQW9kqgA=;
 b=nzhxksUyA31JGPCP04FyHf7AabBOqhp46oyBN/cnUh/YF5tavs6nXRr+SPcZdgBEd7
 u9MkYBm9s9n2qBJSpMNrPC5bS3FKfPTArlrKmkjBHMqvBuMY/tJmTlhBzJBzmiFZYGOg
 G7lLGyy7EiUWPonJzZCJxt82kuJ66A8wUpiukzx2TtXvs1jOEn+vjTiBXwRW9K1D6a4O
 RYmAS6AG2psbuZOvS5XJLoui7rwQtlHHqBm+04Eu9yRxoMqJrfVK1o8tThTJjpKSjV3W
 I+0+p4SeRQtiEhiB0TkRL/tVYzwsIbeBX2PlWvsRSyi58sL31rUWeXjYRK11/XEj2Y0T
 1UOg==
X-Gm-Message-State: AOAM533svHkWyAawvo3RI1UHjkZK4ug3ZpUHJxCfJUJudULo1Bs4n0FN
 A6h91KVVa963nw4XICf4/CZit7BzuizFTQ==
X-Google-Smtp-Source: ABdhPJz95OEFkBOlABs4Aqa2KvfcPEMabJAIdO+PtnNcwNfAJp8rd5tb0UGP1e6TwAwaI5m0FKQXzQ==
X-Received: by 2002:a05:6a00:170c:b0:51b:f057:85c2 with SMTP id
 h12-20020a056a00170c00b0051bf05785c2mr16600952pfc.18.1654570064617; 
 Mon, 06 Jun 2022 19:47:44 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 11/25] target/arm: Introduce gen_exception_insn_el_v
Date: Mon,  6 Jun 2022 19:47:20 -0700
Message-Id: <20220607024734.541321-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Create a function below gen_exception_insn that takes
the target_el as a TCGv_i32, replacing gen_exception_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dc033600c0..9cb31663dd 100644
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
2.34.1


