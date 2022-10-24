Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213360A9FF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:27:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxT7-0003Rt-JN; Mon, 24 Oct 2022 09:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSd-0003NM-PV
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:47 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSb-00041C-Dp
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:46 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 20so8684908pgc.5
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+CkKupTcUlISL2yEb/3shQiouXGSNf8rqXTFn5cdoYg=;
 b=aukLhvV6t3EeSfe7kxweDUK/Zw/TxVbQJBXIsNJ1J7SJpVAP2n7VRGF2L7x7vjvxXQ
 4BUw+1oh9IickIchkEfJ4p5npdknF5XpseU5dp5OTouT+fCaqNW4ESaCsfDMjMcWcUV4
 CCtHpL0Nu6E2xq3Gcp2auYQ+TMjrWZ2SJvatoX5hVnTd4faGDd9C8pvWmvVHSeKe9D8j
 oTa04S5ZXkU0RL7QPbReQkNjGD0MxuzjSLdYSG+gV9cohEyRxw9TwoLQJ9CztXGW3ixD
 EbPjYJNITbxP8Rdk8Oe7yoCf3zszeIUidbzAK13qGaesp5CRsiyf3q6Uhy/InAufsmP1
 VEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+CkKupTcUlISL2yEb/3shQiouXGSNf8rqXTFn5cdoYg=;
 b=pa76NNtUXmiFl8l0J79I3ExYMuIp460t5ZGNbP0JVbr80revM+kf5+YpDZHnf8KxAq
 5cu+6g1Y1LxxFGmBq644XxesGpZ0rmDaiiDMBFKYNTe8elnyygo2e2DHyrRaaLTWm39t
 q1XKHgp3dc8n9Zx/CUrmmbG0mSHNyNamgPneDRxJqfvxwXk0kcjyxEBI2vGNKMHpLWuS
 l1KAg43EN/LG1eavf4Ac/RodGpSc/XLe4cvlhpanmcMLOoNA53WTzvJQut6exYrQh/6f
 i7NGBLvVPldlQFKBBJjy0jAHaG7CHaXNjMP9qIGyKayTszuE5XvoonoaC0VTb6wtKfK0
 67SA==
X-Gm-Message-State: ACrzQf0W9MvtWxngrmygIOMskngH+Z+uZHZBFFkjDTlcekPAH4aexgXB
 qXk5KAhJQFSRoX9iIV6WFm1WC7xvSm4QOg==
X-Google-Smtp-Source: AMsMyM5wFWZ7ISiWoTgmAECq+4WT8oQeYuheFX8U/ViPBl/uUH5chIMWxYEDgTjstvJXF3u7hCVVbg==
X-Received: by 2002:a63:6b49:0:b0:46a:fcba:308f with SMTP id
 g70-20020a636b49000000b0046afcba308fmr28494232pgc.8.1666617944049; 
 Mon, 24 Oct 2022 06:25:44 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/29] target/nios2: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:43 +1000
Message-Id: <20221024132459.3229709-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
 target/nios2/cpu.c       | 11 +++++++++++
 target/nios2/translate.c |  6 ------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 2b28429c08..9a5351bc81 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -42,6 +42,16 @@ static vaddr nios2_cpu_get_pc(CPUState *cs)
     return env->pc;
 }
 
+static void nios2_restore_state_to_opc(CPUState *cs,
+                                       const TranslationBlock *tb,
+                                       const uint64_t *data)
+{
+    Nios2CPU *cpu = NIOS2_CPU(cs);
+    CPUNios2State *env = &cpu->env;
+
+    env->pc = data[0];
+}
+
 static bool nios2_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
@@ -346,6 +356,7 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
+    .restore_state_to_opc = nios2_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = nios2_cpu_tlb_fill,
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 8dc0a32c6c..4db8b47744 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -1110,9 +1110,3 @@ void nios2_tcg_init(void)
     cpu_pc = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUNios2State, pc), "pc");
 }
-
-void restore_state_to_opc(CPUNios2State *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-- 
2.34.1


