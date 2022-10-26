Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F378B60D93B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:23:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVyd-0007r8-Ej; Tue, 25 Oct 2022 22:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVy4-0007kc-9a
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:32 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVxy-0001sm-Ot
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:31 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso2725284pjn.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tF/RwGukDicY+8ye6QbG84ecHxoGGEYhOUNZE7mAzY8=;
 b=uRCZQwE2USy78A7HnNR/actACjm7hjRzF2iRcKK/9ris7ElfDHz/5RF+sWdC5pN2k2
 Tsr26snSxC9s+yu4WvqnFoJggfRwxZTGWyf6xmN9HKBu7zmC38IpV3JxD2vXrEzi5ZoC
 Rua0U7yXbuFfjT+vsyiMl+4kVVrOL/RfTPwH/zphfOEl1bxQEf1i5Fbpw+29T6+JxRJE
 GbnF9RCytnt4VXPn14mTylTus3hT187LsWEskAgU9XwhUWaUsbdowPRFq88sbBI3jPzU
 r/Es5J7eJcdSif5EzPvbmL3ClSgfKjYSN/IOyE/R5/jTKcPm61fa0MdFNwWAu3E0AMBP
 gcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tF/RwGukDicY+8ye6QbG84ecHxoGGEYhOUNZE7mAzY8=;
 b=yvAI5AsuU0akw5Ro3mCzdyNSSICE6Jl9P1vvi71hrS0qR6dhUQuy2wko4jCMEFGMYP
 d1bt68YEIxIbLe8cQQNKFLpYALLkKFKc9kB2bn4VWq62zfXByqh2Tz2j4H+PL5wclkF8
 YDdE2aFxZEzPWDN20ehqNgfT4w0AGf7yKA8zB1eDBihTsWoXlD9YX6+GNswqAdYpEP7G
 UsmT+3hAgm8GN0g5eo8lw7fitiWcCmm0w1Xa0IIuC7TO9eI7ds4ZKdsdXgAjCdCE+oPd
 f2qodeRDVhhl/7L62IgHCQ6j3rGeZagi2HjaAx2uCxJYAcv0h5OZ3VVJjb2dZtIYgVFC
 u9Tg==
X-Gm-Message-State: ACrzQf1i6PTbmsEMTITSn+RZ5fGVgrmaAZ/uIo0g8lEt0QIdmYGCE33R
 K/4QoFwGRcerBUcJqFl9IVJRvcBKmOCBichQ
X-Google-Smtp-Source: AMsMyM52QheWcx3mRT8QsUrSnl8twwbq/VswR3pqxH4MFKisj6REBRW2poUYSEFU0q3BNrKTEPdFjg==
X-Received: by 2002:a17:903:2284:b0:185:3948:be7c with SMTP id
 b4-20020a170903228400b001853948be7cmr42440360plh.51.1666750585386; 
 Tue, 25 Oct 2022 19:16:25 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b0018123556931sm1819732plh.204.2022.10.25.19.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:16:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 43/47] target/sh4: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:12 +1000
Message-Id: <20221026021116.1988449-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 target/sh4/cpu.c       | 16 ++++++++++++++++
 target/sh4/translate.c | 10 ----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 56c50530da..453268392b 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -50,6 +50,21 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.flags = tb->flags;
 }
 
+static void superh_restore_state_to_opc(CPUState *cs,
+                                        const TranslationBlock *tb,
+                                        const uint64_t *data)
+{
+    SuperHCPU *cpu = SUPERH_CPU(cs);
+
+    cpu->env.pc = data[0];
+    cpu->env.flags = data[1];
+    /*
+     * Theoretically delayed_pc should also be restored. In practice the
+     * branch instruction is re-executed after exception, so the delayed
+     * branch target will be recomputed.
+     */
+}
+
 #ifndef CONFIG_USER_ONLY
 static bool superh_io_recompile_replay_branch(CPUState *cs,
                                               const TranslationBlock *tb)
@@ -243,6 +258,7 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
+    .restore_state_to_opc = superh_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = superh_cpu_tlb_fill,
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 26231b2a5a..7db3468b01 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -2381,13 +2381,3 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
 
     translator_loop(cs, tb, max_insns, pc, host_pc, &sh4_tr_ops, &ctx.base);
 }
-
-void restore_state_to_opc(CPUSH4State *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-    env->flags = data[1];
-    /* Theoretically delayed_pc should also be restored. In practice the
-       branch instruction is re-executed after exception, so the delayed
-       branch target will be recomputed. */
-}
-- 
2.34.1


