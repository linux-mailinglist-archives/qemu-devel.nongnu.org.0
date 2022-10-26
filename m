Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB8D60D949
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:29:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuK-0005Hr-Lx; Tue, 25 Oct 2022 22:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuI-0005HU-Sp
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:38 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuH-0001GB-Bb
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:38 -0400
Received: by mail-pf1-x430.google.com with SMTP id 130so3550585pfu.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9G9r4XqZ5tNsPMB9JL7bV/JWLZpybHX4NvIu3/hknWg=;
 b=w+a96H81tBHhEiDAbMQTiJnk1lzxsYJ1KWfiMUKQvcaALxrineBCUjBItCqR9b/Xhh
 JbgDj3KFnZFUyiNF5RZEvMoeztDdIal9/RWsOgzUjERaBDWIARM7x3bsddnOx90UYqul
 3TElrdZk/dfGHibZX64xJw8SP/87M3EGwhHVAuPwr5IRQTZeXVi/7ffjmlrvfzOUsWQ0
 PfW+DqPiTzNtRpiwR5ueP5GGJXmHRSuAMegFEXVtLT/pu8SwxAfrQIFHZqDMifogXSvs
 JE9edR6/1a9Xlm+LT2bA4OG/jMDdIvqO3ut+GJtY6ympneIQCVbwm8cabQ6cyN0wTZeK
 /duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9G9r4XqZ5tNsPMB9JL7bV/JWLZpybHX4NvIu3/hknWg=;
 b=u8GzpuAYr3ddUIF5gR6Tx+euUtrwEAkzP8nhn/Tv4y2vhhNMw3rhJ7o3xTx+r6u3/e
 Sj7haQJKqIZFmOfNxnFx9RAuwXfqyjB8pljE320rAxPsAhyS+hb97UX80K26bh0QEUtv
 musFE1mUokpjdELSaWXnSSRIN0H9MRPzGBQ2Qaqr1F3b2eKtJ1gWJrvSW/mG8cZHYGpv
 4LvkjwtkwjKl16Yvy1+QReaKny1IqpLGtK6JzzePF/9/IERVNEITdwaaSnjRLrOsh31t
 UymeJaIUIq3e8S7e1EvOO28m9dQVGgienpRsZeEnHdZp613FHAmterH807yaqnHAXAh2
 WutA==
X-Gm-Message-State: ACrzQf34vH8KofKI9HpS2Ow1E9mQWFPNvkQVmfBcPBakvFEzmiNZVW4A
 GolHQE9hiI3hw85yfbZ9/dzfSkYFnRqmpfqz
X-Google-Smtp-Source: AMsMyM5yPEzILBAlCRYaGrdw+mEFmm2+7eXGtWhMIWuy3UNHZag2mbebz4u47+Wk3smyqqiTjZLUmA==
X-Received: by 2002:a05:6a00:1349:b0:563:654d:ce3f with SMTP id
 k9-20020a056a00134900b00563654dce3fmr41965931pfu.32.1666750356101; 
 Tue, 25 Oct 2022 19:12:36 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 26/47] target/alpha: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:10:55 +1000
Message-Id: <20221026021116.1988449-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 target/alpha/cpu.c       | 9 +++++++++
 target/alpha/translate.c | 6 ------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 979a629d59..270ae787b1 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -40,6 +40,14 @@ static vaddr alpha_cpu_get_pc(CPUState *cs)
     return cpu->env.pc;
 }
 
+static void alpha_restore_state_to_opc(CPUState *cs,
+                                       const TranslationBlock *tb,
+                                       const uint64_t *data)
+{
+    AlphaCPU *cpu = ALPHA_CPU(cs);
+
+    cpu->env.pc = data[0];
+}
 
 static bool alpha_cpu_has_work(CPUState *cs)
 {
@@ -226,6 +234,7 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
+    .restore_state_to_opc = alpha_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = alpha_cpu_record_sigsegv,
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 6766350f56..f9bcdeb717 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -3049,9 +3049,3 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
     DisasContext dc;
     translator_loop(cpu, tb, max_insns, pc, host_pc, &alpha_tr_ops, &dc.base);
 }
-
-void restore_state_to_opc(CPUAlphaState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-- 
2.34.1


