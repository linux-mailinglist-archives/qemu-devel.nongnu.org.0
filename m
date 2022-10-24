Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C42C60ABFA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:00:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTC-0003WZ-3s; Mon, 24 Oct 2022 09:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSj-0003PZ-AW
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:55 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSd-00041P-TH
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id m2so4136827pjr.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t9KcFtAB+U6fMt8nUgtzl/UbXoLeJjXXCvK7XIkKin8=;
 b=F4byWkIAQ6NAlCy8JpbmKsYxwq/RQ8SOmJ0aoevOaVK2VGIqp+ox/gUexWrybInDIV
 qxoHg1ru1ookZNlFEuD7AmHtRQXpKt4litmPa/HxTQC9EiFwl/fGKA9PES1WLeVEODco
 KEKVH0cQ4InhnRjnk7Tv/c3kMYCz5a+NBsBaMOGpCzScCn43pt21o/66T7V63BvjkQTr
 eFeUerloY0Rerw8fQVz7AlbdSrothLpb0thKGniBRopNOcEdfrkR1t6XbYhUQaizFlWF
 CaqxVfmf1TDfU+DGis6Q/Z1nNKu1vmt921spx+P3YOIEVI5Vag41I4UEAayroE89fgEd
 D3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t9KcFtAB+U6fMt8nUgtzl/UbXoLeJjXXCvK7XIkKin8=;
 b=n59EPVIgLDdL1eeYJ0ekn6x2m4wcc2+Adu5mdQMDqZ2fVLkQICfeuzpeFkSONNTDDO
 3QAo4L/+KjJc+huPbM93XEWaBbAQGMYQUtfXvgRfTFOMcJVZuz9lxbj+b0FUafMlRcy+
 4kTMZq9v+YT/RexAmBKlmEqILGuE7asxoM362TlpogM+zN0xfnGhZXEKcMC+Pk6WDYvv
 nZdN71J245m2BwGv/P2fzYV/mwzbGCaQvDEzNyZeWgd21HvhoqRCQFnGP4WxV+uFQ2/p
 mewfFoPrW37WCJKhP/pQywYFEI1ru1y/IwOHhRWwktE38HRFeOB2fOL5dlUpOqEP6MKW
 GYew==
X-Gm-Message-State: ACrzQf14YxvN0uG0NShF/YP7f/AS3d3hIlmO2Rr8T5PCrGRLJkyZ2qvP
 k4AnRCmjywk+NQdGbIkniuNfq5sw67w/qg==
X-Google-Smtp-Source: AMsMyM7ff8PP02xvY20RmoySCLjofRr+gKsHvAU7geBKn661s+Kys49hlgdpeHi9ST6On1uXNB8pBw==
X-Received: by 2002:a17:902:cac3:b0:186:6ce4:f94a with SMTP id
 y3-20020a170902cac300b001866ce4f94amr20707871pld.145.1666617946279; 
 Mon, 24 Oct 2022 06:25:46 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/29] target/openrisc: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:44 +1000
Message-Id: <20221024132459.3229709-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/cpu.c       | 13 +++++++++++++
 target/openrisc/translate.c | 10 ----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index f6fd437785..de0176cd20 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -46,6 +46,18 @@ static void openrisc_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.pc = tb_pc(tb);
 }
 
+static void openrisc_restore_state_to_opc(CPUState *cs,
+                                          const TranslationBlock *tb,
+                                          const uint64_t *data)
+{
+    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
+
+    cpu->env.pc = data[0];
+    cpu->env.dflag = data[1] & 1;
+    if (data[1] & 2) {
+        cpu->env.ppc = cpu->env.pc - 4;
+    }
+}
 
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
@@ -203,6 +215,7 @@ static const struct SysemuCPUOps openrisc_sysemu_ops = {
 static const struct TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
     .synchronize_from_tb = openrisc_cpu_synchronize_from_tb,
+    .restore_state_to_opc = openrisc_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = openrisc_cpu_tlb_fill,
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 8154f9d744..2f3d7c5fd1 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1726,13 +1726,3 @@ void openrisc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                      (i % 4) == 3 ? '\n' : ' ');
     }
 }
-
-void restore_state_to_opc(CPUOpenRISCState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-    env->dflag = data[1] & 1;
-    if (data[1] & 2) {
-        env->ppc = env->pc - 4;
-    }
-}
-- 
2.34.1


