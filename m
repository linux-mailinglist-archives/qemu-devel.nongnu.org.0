Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DBF60D94A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:29:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVxy-0007ao-1p; Tue, 25 Oct 2022 22:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVxv-0007Xw-5v
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:23 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVxt-0001sF-Jw
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:22 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so1037316pjk.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WVndpCezY7JBunGT3GvHhnOUrjtLFW/jqQ+DpGvV3iA=;
 b=TXZG/tyklNPuQEzdAPzZ5rZXkRXt5x5Q/k2yRlIvJN4TaPhja3v3k6fjz28o1SANzF
 0P4mUzv+yTmGJW5hsiX54909lbz+VkZmC241acSwHirFKBG66gf0BzbM8VZnL3MdssCO
 QwK434ApoH/Zg6d9JyFy/jX2tkO3fvoipCF3Pp4qKxuKSxtpKheXyaohIhQQcnN9LhDd
 z2Xio6nWnUFF3GT6VCMNqoOmFGVodAJYPQVVwp+1g6qttXhwt1Q4d4r7EMd19Y6cgs6k
 8jG4XidJl64A4HhN2Tl23Ak4ETYDGZndQjXnWjJPw1Cd0BMPLkI+Ehs3IbaEFf/Fmq0Z
 FIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WVndpCezY7JBunGT3GvHhnOUrjtLFW/jqQ+DpGvV3iA=;
 b=RQF8W0LSTcZSF4GIIipl+yCgA6w7dt5EpqbXyrmPJy2mPR5qMO43QTNpQ6ZKSz0aKk
 jtGe4pneTAc9Emm+JSwjUsaCF5PgfvcAKEvy6coBveXX4GkoLMCN18I0F0ODYipYfV99
 P8lLPflUbkX7wxvNaxtwydqgzuulotlJwIUhT11L7tuF1F1/mU8TGv5Nc8wcJnCO0MfT
 6UMV/4GMocmVdEJx1T0LK6Ws5gyWF1ubMO9JzpAR7AJP6L5F+98GWHPeNK66d8iRxY6H
 8v2cV8eQEsMdWlCoF4v2gA91BD9Iq7TjRzKrrHeNvlSRVvVaMVD8lesRbNDDrHH+1uBt
 js3g==
X-Gm-Message-State: ACrzQf17Kk1wpOI40ifeF05tg96RyMZlinAPk/eVcuCWThtIegjSyG0U
 o/jXMqB63lXH7AJSFupSeqwnDwjE+7t9euDG
X-Google-Smtp-Source: AMsMyM7cu0XMjj4R6cWBNOA+QqpHuRb9Id5nDwGkwcCTtgdL3y0W4IvXqYSdXMsRQbYFyhnm4TkLkg==
X-Received: by 2002:a17:90a:e593:b0:212:f0e8:46ca with SMTP id
 g19-20020a17090ae59300b00212f0e846camr1526515pjz.144.1666750580082; 
 Tue, 25 Oct 2022 19:16:20 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b0018123556931sm1819732plh.204.2022.10.25.19.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:16:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 41/47] target/rx: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:10 +1000
Message-Id: <20221026021116.1988449-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu.c       | 10 ++++++++++
 target/rx/translate.c |  6 ------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 2f28099723..9003c6e9fe 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -47,6 +47,15 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.pc = tb_pc(tb);
 }
 
+static void rx_restore_state_to_opc(CPUState *cs,
+                                    const TranslationBlock *tb,
+                                    const uint64_t *data)
+{
+    RXCPU *cpu = RX_CPU(cs);
+
+    cpu->env.pc = data[0];
+}
+
 static bool rx_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request &
@@ -192,6 +201,7 @@ static const struct SysemuCPUOps rx_sysemu_ops = {
 static const struct TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
+    .restore_state_to_opc = rx_restore_state_to_opc,
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/translate.c b/target/rx/translate.c
index ea5653bc95..87a3f54adb 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2371,12 +2371,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
     translator_loop(cs, tb, max_insns, pc, host_pc, &rx_tr_ops, &dc.base);
 }
 
-void restore_state_to_opc(CPURXState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-
 #define ALLOC_REGISTER(sym, name) \
     cpu_##sym = tcg_global_mem_new_i32(cpu_env, \
                                        offsetof(CPURXState, sym), name)
-- 
2.34.1


