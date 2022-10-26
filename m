Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE1E60D930
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:20:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuq-0005Yb-RX; Tue, 25 Oct 2022 22:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVup-0005YC-26
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVun-0001LI-Io
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:10 -0400
Received: by mail-pf1-x42d.google.com with SMTP id e4so9970732pfl.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNZP9ZbaRsIjl4oUm/zT0jhrd1DGs2Oik+dsf8zhpAU=;
 b=pvlP5gme3RKxIRmV8nak1dcYivFY90NgvVYqP8Hc+SrV1UBcSdC1SHgwRnwAeeC5sh
 yJdkmFPVbHETl+vt9mUGXJA8t8YubdogjkJK10eWdyBdmYuV0zpqmBpAUET1/LETKwzN
 XC/meCvlYSIACG1J8bsbK+llGtrT/dJA1wVUDHgTofLpvFamKkUrP9j2HFYLo3D6Oqnq
 NPu/MsC8FIdhPKVh5SqFeU2Sap1XhcsU6b27Otq1ytZTH4ypq6HpYaLwTb8x0HWqPWxU
 I82pKoZ2g1Ts5oSF5MadpsX4MaXJ5ZwXNQ3RvMoEGqqLXDZT8CFq4L3jYxu2C/e/IpVp
 6mZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNZP9ZbaRsIjl4oUm/zT0jhrd1DGs2Oik+dsf8zhpAU=;
 b=cYajfmOV1fNb+6kZMGXJCa72oum8+WFdwc3D/8tX/wItRj4lshtpsHR3nI8y7lxsyy
 kNFFrEBBWLJN3NKs5eDTfi93uxVpdVswAs+IdEvOu6bH6YxkPGdwgOGuIYZcq7SVOrR4
 2xulrC4CsW/qf9gG9pRB8dRJd8KAonhGs0FKLZbjbtJR3oPPvsnvjs/gIvb8I+NzjTOq
 CX2Jz7/MYjCSiZoy5fbl3xxODIbHXKTijDw/E/0Fsxk2FE5f8eZjmiIX9/0Z5wLDKUzV
 ZWErRevKO12UBXYGo9Jf01Mpk7oQA/5c+9tdOC6c6H2+cnfGEJg7YeTj7+xwd0ZkMQ2i
 hkHw==
X-Gm-Message-State: ACrzQf2qmy0u4VvyQzYWEArS2QFMHjxNyFanpU7gwWN92omUu0U0wu/R
 8J/j8XCw/x8m8sWXS5gi6EJMnIrCTCF/s2/v
X-Google-Smtp-Source: AMsMyM7QlJJSB3esRxbQWEFOhNc7LDKMRXqnMgO6+RFNIJkwTxnWNEoAtsEuvbvBh7ZucOsAfyjzMQ==
X-Received: by 2002:a05:6a00:1707:b0:562:e790:dfc3 with SMTP id
 h7-20020a056a00170700b00562e790dfc3mr41941861pfc.59.1666750388395; 
 Tue, 25 Oct 2022 19:13:08 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:13:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 38/47] target/openrisc: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:07 +1000
Message-Id: <20221026021116.1988449-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
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


