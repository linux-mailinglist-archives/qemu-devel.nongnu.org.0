Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666760AF3E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:39:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTH-0003cp-So; Mon, 24 Oct 2022 09:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxT1-0003S9-RA
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:13 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSx-00048y-Lw
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:10 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y13so4398473pfp.7
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y2RA5owL+HBevavrSq2dUhrDaSLUH9n3FIrHtT1lBI0=;
 b=vfAaecPcAnoxMHKL5SKOEsoFuUwYQBo0dx5OrBp8mtvtM5EXWUETUIHrtYTuzbEePp
 CWnf2cS9ss82tgFctmDAVReddZjRTQt0zzapkin7uzXDjlJ57f15qjYWQte7jukoIHd6
 oV7UdZVgfx5bjrW2Duu5XY9griuJMIVqsV4c91l0/bYx4iz34J0u8yRzAKCiehuaPXv9
 IJv/26UdGGHTMKVVWyLWXdqv5ISmHZy1enWERe+CN/3vZHJciWbUnKjnSuVYkZm+q+UB
 EwO5SvjPsce5KYoV1cL+wlINUtGfPON7m88Tx57MGnAC867nCp/k3xsF28f21InyXMgQ
 Jt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y2RA5owL+HBevavrSq2dUhrDaSLUH9n3FIrHtT1lBI0=;
 b=pIWgkM8UZ1/rffoRQ/ztIUwFtVpS/NDa+SOFISs/gLKdiElqycBeVcD362tqyPuqaJ
 xSm3Gob16po+emAREvj7u9A3xkY21L60aFVssDC7zQOK/2yoNXVefTVIvvJwBqHGIzt9
 dDmDBL1M70kGA9eMq87hcgJl0IzW8tRsisG/VPld4eXlvmUBWfHC3cRSMQQYQGj2Z1DM
 9QhTUcop2quqye7SUVcTfhgbSJfycDl2NBvsHEgFr/gelYSnz9yjKmfW2vyASz5r0Mb/
 F+fwxvhwr06SOoGddJkLyPVt35SfCaCGBGPIPprbAXffPJUkCwr3qna9BdN4H/djVv/X
 lSBA==
X-Gm-Message-State: ACrzQf0FpezjTwFrGI80uR0ra2FAH2GNVcEU9A+6uA2gT6CuAoAeDrD4
 nFITGCgpBaFNvZDVd07il63duwOAixeJaQ==
X-Google-Smtp-Source: AMsMyM4JUWCT3zIOMUPiPodv5l/Rj/JGlglYYrNdRFt22cc1vtdThaMkcHUL5lNQKrMzTylBnyH1UA==
X-Received: by 2002:a65:5605:0:b0:46f:1e8d:ece9 with SMTP id
 l5-20020a655605000000b0046f1e8dece9mr1580371pgs.249.1666617964895; 
 Mon, 24 Oct 2022 06:26:04 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.26.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:26:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/29] target/xtensa: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:52 +1000
Message-Id: <20221024132459.3229709-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/xtensa/cpu.c       | 10 ++++++++++
 target/xtensa/translate.c |  6 ------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index cbbe0e84a2..09923301c4 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -51,6 +51,15 @@ static vaddr xtensa_cpu_get_pc(CPUState *cs)
     return cpu->env.pc;
 }
 
+static void xtensa_restore_state_to_opc(CPUState *cs,
+                                        const TranslationBlock *tb,
+                                        const uint64_t *data)
+{
+    XtensaCPU *cpu = XTENSA_CPU(cs);
+
+    cpu->env.pc = data[0];
+}
+
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
 #ifndef CONFIG_USER_ONLY
@@ -215,6 +224,7 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
     .debug_excp_handler = xtensa_breakpoint_handler,
+    .restore_state_to_opc = xtensa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = xtensa_cpu_tlb_fill,
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index bdd4690a5c..77bcd71030 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1355,12 +1355,6 @@ void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-void restore_state_to_opc(CPUXtensaState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-
 static void translate_abs(DisasContext *dc, const OpcodeArg arg[],
                           const uint32_t par[])
 {
-- 
2.34.1


