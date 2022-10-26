Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A002E60D93E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:27:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVyt-0008A0-Ri; Tue, 25 Oct 2022 22:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVy6-0007pn-Qj
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:39 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVy4-0001tF-4A
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:34 -0400
Received: by mail-pf1-x42c.google.com with SMTP id f140so13931769pfa.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zh4R/Fn+WhRA1To1jEk6vn5EnlhA+Z2cxPabIrA7c+g=;
 b=vIOkZ1Fu6dPAOuwgsAdLKSQBWTFJUlkaRwEEd5Wml3YXl44KOA0HWPaeaaa33ZUvLn
 bY7pZnOMDvo4hJvaCswpchgZGU6zrFc4Fc02N9nheASZmx2Q8Xjr2FMKpu5AuiMf+JZz
 XAVfAhC2FjZuxOC1sWWub8xW1UYydp9/6a6lGz43Q+lyHeM5lMcrrMCga0HhkNdwJqO0
 +KRVwsP4uopKi+ZuzhUPMUXA7q/7BYeam+x1oZCUj0J+Cx63c/GHzCNuwqd07D+Zneca
 /zmpy2X36qm9uolLKn2plCdJacMFm2zRrmNTvAjXs7aJAzkjCh9lk8G3MhR/b7yiqtLE
 0KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zh4R/Fn+WhRA1To1jEk6vn5EnlhA+Z2cxPabIrA7c+g=;
 b=LetTOeJuPpd6Um3Q6LwhN/Ww4rfDCI5Kf3eCekGvX6CLdMqh1KEpMHAa0rK5ypQ//G
 wZSSBu2YPsPvMYZdYUMGLWph/8P+sHyurHiHMYUx7jk9v49z20hfI2CxXy64nApVQ82G
 mzW4iNxQZcRUWQKMq75gYpdFQKrasLFxbMt3jKGSIhXgRpV6Igq/VU+7pyRXp6UZ1IRp
 OFpOnQS8DId8q6jjFcpKPfmHKb4GC2m2khKmJXqvaopWa/NVwC5XHtk0IKR39hTfPVPy
 aM7AyPiTiviSn78+Q/qAS2rzPnog5nqzgZZD/nAJJ+4vq2u5f9RxUDM+XjIcO40wL/iU
 SZCQ==
X-Gm-Message-State: ACrzQf0TPYyem7v/pzeX1yARNQ/XmS1XZuh+18nm61GYSu1QkWqOHVvv
 LmKgGRWDzx9A6YsfLJPfwIc2Ob0kfX4HA/gN
X-Google-Smtp-Source: AMsMyM7b26Q7S98/bcvYIr6JDI3SAHrUGY52QEfQl//9PfbT0+lcQhTyTJr+1zy3Hq/y3Ekterwa5w==
X-Received: by 2002:aa7:83cd:0:b0:563:5f54:d78c with SMTP id
 j13-20020aa783cd000000b005635f54d78cmr43006834pfn.66.1666750590772; 
 Tue, 25 Oct 2022 19:16:30 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b0018123556931sm1819732plh.204.2022.10.25.19.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:16:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 45/47] target/tricore: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:14 +1000
Message-Id: <20221026021116.1988449-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/cpu.c       | 11 +++++++++++
 target/tricore/translate.c |  6 ------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index ab7a1e3a6d..2c54a2825f 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -58,6 +58,16 @@ static void tricore_cpu_synchronize_from_tb(CPUState *cs,
     env->PC = tb_pc(tb);
 }
 
+static void tricore_restore_state_to_opc(CPUState *cs,
+                                         const TranslationBlock *tb,
+                                         const uint64_t *data)
+{
+    TriCoreCPU *cpu = TRICORE_CPU(cs);
+    CPUTriCoreState *env = &cpu->env;
+
+    env->PC = data[0];
+}
+
 static void tricore_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
@@ -161,6 +171,7 @@ static const struct SysemuCPUOps tricore_sysemu_ops = {
 static const struct TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
+    .restore_state_to_opc = tricore_restore_state_to_opc,
     .tlb_fill = tricore_cpu_tlb_fill,
 };
 
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index a0558ead71..c5b7bfbf20 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8886,12 +8886,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
                     &tricore_tr_ops, &ctx.base);
 }
 
-void
-restore_state_to_opc(CPUTriCoreState *env, TranslationBlock *tb,
-                     target_ulong *data)
-{
-    env->PC = data[0];
-}
 /*
  *
  * Initialization
-- 
2.34.1


