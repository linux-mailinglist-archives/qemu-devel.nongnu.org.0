Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6117960ABA7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:55:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSu-0003RZ-29; Mon, 24 Oct 2022 09:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSk-0003Pi-Uj
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:55 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSj-000425-4x
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:54 -0400
Received: by mail-pg1-x52f.google.com with SMTP id h2so2557532pgp.4
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hAq7XVr/FoKNvSkjmihPbNM5RdHZ4AxVGfIszTkgdp4=;
 b=awyywU//kQkzUWfs2hvlFshcfy+d2+0LxwIY1e/vMt1AH5JbmTjyrieMWUsh3EkUTV
 qSjl85hYbQyPVOjJzMMgs/rPzsTi701J/zwMtH2PiSX9MZLfwFg4dkjFKrpAmFZadt4t
 4KRnLm2dmzHwMi3MWZL5ekBaBtvldZz2tFCjv+qGmpxKQqWMUgq/tqAsWEBvPqg5BaET
 M5+R0gOyAVLrQTIP4WFD8OADcoueMxAp0IfxWG4toEGqe0Mtjtut2hZvWP6lMGJGccNa
 WGlJvznfcyFltS/gPOn4xyEGyATKURDjCvrbevWC6vCtqIBgN5ilUChIia0RT2byYD7o
 u4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hAq7XVr/FoKNvSkjmihPbNM5RdHZ4AxVGfIszTkgdp4=;
 b=XXRqFI/tGRxTp42blqT6hVR+83gdrGj+T0dSRHgViM2LiaFr+GtD9DTUKcj1vM0UIp
 RitNepNeYsiTqCd2NmnRiqVruOMc0Coi7UgleDC6O18k3+E1NjrOgLAtWWFpTC/dJKsK
 TdF3tW+vZuAPN8LDa//BFA+MPRk9GSNyHDNaTjDL/B6BqotxMLeCa4/zOVhqcyyRmcgS
 rI8PfxlIp4EnVlZ0odwlS0FvLdcNrRZMDWVN42dNwNwx5rcVHuTziakxLUobr1w+myTK
 3de4/27wj5SKumaUmTdSn0+Zb6kFlKZR1A+fj99SDPi9m2DtQQ7BwmqqGzuH0c6wyS5L
 3tFA==
X-Gm-Message-State: ACrzQf0xe/ePadd1YGbnoOddd54gWQhZ8NLg2pWAn8JyZWJzaKRiDza7
 zCATeij8RIJ663H6du6uKXX13o5c2ylIdA==
X-Google-Smtp-Source: AMsMyM6HCYmYYM+rJvPWplWLOog9+Dh0c9nuEjY0lrAXiy4DbQp8PHXTW+pagcpgQrAkmVGpqOh72Q==
X-Received: by 2002:aa7:888a:0:b0:56b:c5d0:d17f with SMTP id
 z10-20020aa7888a000000b0056bc5d0d17fmr5935356pfe.25.1666617951381; 
 Mon, 24 Oct 2022 06:25:51 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/29] target/riscv: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:46 +1000
Message-Id: <20221024132459.3229709-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
 target/riscv/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e6d9c706bb..d14e95c9dc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -503,10 +503,14 @@ static bool riscv_cpu_has_work(CPUState *cs)
 #endif
 }
 
-void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
-                          target_ulong *data)
+static void riscv_restore_state_to_opc(CPUState *cs,
+                                       const TranslationBlock *tb,
+                                       const uint64_t *data)
 {
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
     RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
+
     if (xl == MXL_RV32) {
         env->pc = (int32_t)data[0];
     } else {
@@ -1138,6 +1142,7 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
+    .restore_state_to_opc = riscv_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = riscv_cpu_tlb_fill,
-- 
2.34.1


