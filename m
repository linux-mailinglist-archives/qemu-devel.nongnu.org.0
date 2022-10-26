Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009BC60D94E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:30:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuc-0005L7-Sk; Tue, 25 Oct 2022 22:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVub-0005Kz-89
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:57 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuZ-0001HO-Or
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:57 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r18so13415962pgr.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eD/aEJdWjUBUHpnzJsPaChBd1LKmz8z122Vxs/vIfNE=;
 b=yYHDaJlDVmTHUUtrIVwsU9P+VDZ5LHAjToEtnFtOjcagJ8VM8F75qwDKcHX02r4fdg
 TaeMG1ienUMItqFbkkKTq+qx5lxsO09O5n+nuETLxEghNn3Y5pUi/HHvsFRneycAUzge
 +2lEpF1sBlosmv1xQkdLTTW1VSgcKPimnLe1sCQPZSdddQRc4KafDyMni4HwbSmXeTbM
 inG66G3kDCmD16moKX4xcPCIrfEdYO4HHboVJgXSlJh7jpRG19PByiUy6y8InXDLHE0g
 kXyWXwnGOL3YPvtPnBbb9c8f/5E6paH6oVY4Vzh3UpvjnEBNof2kdSyeqaONO/7Q+Zcm
 Kibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eD/aEJdWjUBUHpnzJsPaChBd1LKmz8z122Vxs/vIfNE=;
 b=zaQgoXrYKK6NeWR/ozOZybBROwOsXUcrOYEiURW7huSKaKS1XQgozAvxtAkqyS3gyN
 vFeNtfrbjvfc1V549+LRq5PpOzbqaykhjwEALSXvThvbb2Rr5WPH4IDzMEKjj5KY4zY6
 Q6W2gC4MCjFDuhJhg/XJIxYQNZfBpm9GOC0B6rAg6QtKCYYGUnZbd9GOyVR0y1xPS1I2
 efGwcCu/wmilsKjm4wmkVuJxYFAtBSc63EXz9PH+xB0SN8g9wS5IW1Gp/uHGKuAouu8p
 fK+xcRiRi0S/Byf/hOqvuUekOUvbS0IsgA8GgJ7marpkwHGepjZuIW+t1KXF5dENvmSc
 8IpQ==
X-Gm-Message-State: ACrzQf3+32XbUFizH7VwPZmkFjcESBAR4S32+Lojh57c/xoaniZAjsI3
 IjldxNq+KF1+KFsywCjuTRRuw/n7alxXCJRV
X-Google-Smtp-Source: AMsMyM7wS3ndua0arzBZ4OzdCPkrWHCYEcDvpBOq6UQba+3W5k6M42ZbVy6SsJw95ihCG9K71H7qcQ==
X-Received: by 2002:a63:82c6:0:b0:460:a691:356 with SMTP id
 w189-20020a6382c6000000b00460a6910356mr34983460pgd.621.1666750374949; 
 Tue, 25 Oct 2022 19:12:54 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 33/47] target/loongarch: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:02 +1000
Message-Id: <20221026021116.1988449-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
 target/loongarch/cpu.c       | 11 +++++++++++
 target/loongarch/translate.c |  6 ------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 1722ed2a4d..49393d95d8 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -319,6 +319,16 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
 
     env->pc = tb_pc(tb);
 }
+
+static void loongarch_restore_state_to_opc(CPUState *cs,
+                                           const TranslationBlock *tb,
+                                           const uint64_t *data)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    env->pc = data[0];
+}
 #endif /* CONFIG_TCG */
 
 static bool loongarch_cpu_has_work(CPUState *cs)
@@ -651,6 +661,7 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
+    .restore_state_to_opc = loongarch_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = loongarch_cpu_tlb_fill,
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 95b37ea180..6091772349 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -272,9 +272,3 @@ void loongarch_translate_init(void)
     cpu_llval = tcg_global_mem_new(cpu_env,
                     offsetof(CPULoongArchState, llval), "llval");
 }
-
-void restore_state_to_opc(CPULoongArchState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-- 
2.34.1


