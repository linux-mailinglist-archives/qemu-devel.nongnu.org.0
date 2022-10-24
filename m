Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289F860AA13
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:29:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSQ-0003GV-IS; Mon, 24 Oct 2022 09:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSI-0003EG-T8
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:27 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSG-0003xA-Ru
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id g16so3510413pfr.12
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=15gYJVhpNSUrbXoz3qxirZ/UPL1cauzIrIQSIYzfKtc=;
 b=d3SB16FxxolFvfaccy+Oqjd9GfyWTvDMInuIxczNNCpADOkda3o0/PaLzCw12jHi7j
 aIOJhvzO4fIMNf9p6Mi7ESDqOT5nQKN2/NaPLxkJdzozaDBhNa1fhjNvnZ4iQOozVJ/r
 LVfL2e1TVZIxIl5w9D7D6qT4D5guODx4rkHqpnaeHKnKT1UV7s3+rYVNgm+jfPLxdBIC
 fUYvvFJU6T+Do5B0IazqYL+yZGmEZZzYrGfjqhX+x+Ip2c89DlIGXZIqaOhomW8gJLXy
 aM/IkcC3YYn+w30vGnazo/7DkauskvOXSrUBC6sLrgaQHYngkgPq8O9Ba6uoed96ruSw
 xr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=15gYJVhpNSUrbXoz3qxirZ/UPL1cauzIrIQSIYzfKtc=;
 b=meeCl1E5r//xJWG9lm+G2XgVeX/47T415JSAOFGWwFVL6H1qM7oMEfRMibtyg6wErm
 Tywfm02LXL49319FZYoynpB55KW2isfSR6yiB+a2QFYk5VRvo6FKPvrdahgd9WpqkeZ9
 6toEqxmA18jLG3d7EQy+fRzkjcFOxwiYpnL2yrr9OBS8iyC1ck+tHa6U8cL9tN0C43mH
 wF4Q4Rif3DEABwiYj+FJs7OK11B//NX50KH0NAcPZ3QSD4Z3jzccyCCSwrmb3dkhqgpq
 qL3vRKou4csENiKMYezdyzeoNPs9Kjf9Yua9uNs9mCWTwHhEje2uxD8S/TsW0jKzPsMf
 /OLg==
X-Gm-Message-State: ACrzQf2xx3VA/UTqYX8NomNSK9fx5BOb/0kN+S+IgeUgY/HKCJV9P66x
 N9lmBXm1e7FORd/0n3IWlLa6WKGkhhb4QQ==
X-Google-Smtp-Source: AMsMyM4wSd5pvn08dan4yPA3jR9SafmNr1VcRyjljctRfwTY6Ndwlz/dXSqGqjsjyg1FWP7b7RwOUA==
X-Received: by 2002:a05:6a00:408c:b0:565:fc2c:8c71 with SMTP id
 bw12-20020a056a00408c00b00565fc2c8c71mr33992517pfb.82.1666617922451; 
 Mon, 24 Oct 2022 06:25:22 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/29] target/avr: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:34 +1000
Message-Id: <20221024132459.3229709-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
 target/avr/cpu.c       | 11 +++++++++++
 target/avr/translate.c |  6 ------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 0d2861179d..c7295b488d 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -57,6 +57,16 @@ static void avr_cpu_synchronize_from_tb(CPUState *cs,
     env->pc_w = tb_pc(tb) / 2; /* internally PC points to words */
 }
 
+static void avr_restore_state_to_opc(CPUState *cs,
+                                     const TranslationBlock *tb,
+                                     const uint64_t *data)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+
+    env->pc_w = data[0];
+}
+
 static void avr_cpu_reset(DeviceState *ds)
 {
     CPUState *cs = CPU(ds);
@@ -202,6 +212,7 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
 static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
+    .restore_state_to_opc = avr_restore_state_to_opc,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
     .do_interrupt = avr_cpu_do_interrupt,
diff --git a/target/avr/translate.c b/target/avr/translate.c
index e65b6008c0..2bed56f135 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -3055,9 +3055,3 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
     DisasContext dc = { };
     translator_loop(cs, tb, max_insns, pc, host_pc, &avr_tr_ops, &dc.base);
 }
-
-void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
-                            target_ulong *data)
-{
-    env->pc_w = data[0];
-}
-- 
2.34.1


