Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4343CC69A
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:21:20 +0200 (CEST)
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4sgR-0001J2-KS
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seD-0006wK-C0
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:01 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seB-0001zo-A7
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:01 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d12so12638619pfj.2
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fTNV1A4k/Xn3P/CnpnqSKcH5ZtAfJBxZRFThgdFD0A8=;
 b=DzGiB+r/WNwOMJv/IuKXoyM6VMjcllUZ57GVuLBmLPmXkVNmSMWPfKJ9A9EQ/6C6hb
 2FCiBZt6pnH7iJ0h5s17+5+hYFtmpVBbq0gbqLbqZ14K8+lKEM97yKy/SsGo7GCQmR0F
 vdZ579REA1TnimAIXTtN7CEgOv3ZZ1sXctDNQxIHnPaByb20JVcro+aPgnG0I7eOJljl
 Ua7MxDRXO/kDzoZJNMHcMZYRC7ShwrEgxoLLYP/nGLLJWihUeesEtaNkx0iObCrwWKlL
 kraSpI8wM5a8dRXMG1QUdxdWgaTgGUUv4MMbdnzZ4bZVYXb5UCBW23jEhUHc/gUhxfAl
 d/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fTNV1A4k/Xn3P/CnpnqSKcH5ZtAfJBxZRFThgdFD0A8=;
 b=t2zLrgG/MFLvq6Qc0GbftnoD2L3r4sQLusS8S0npUaL8ltAXJt30Rbj1TGZHIV4d8g
 5Yv+wthtkHSq/zd9y7vHShjH2QuTZkG97oZtvNv+UusxPn/wnBzcipWTv7BU05fSLgON
 VRWnjZGWyw6X/zKOXGRaV0mIZct399u4zrYIjnkpAS2fa63qK9tD9fyWldbyVy6FsuT9
 ZOwHjmjp1QFc7uisJk0d/PawnAvkaIp9ud0a5x6eakuJqMgRfkYKrRmCH8vviyhjjCi2
 EGMluvV6ttNh06giqySuGSjiwpfQpVjJf9ROiL4cPg/Z1szKvevf+/a6T0PEPchL/9Yg
 JoGA==
X-Gm-Message-State: AOAM533IJXTAWYHxcMG2TgWbWY0S4do+WD+eG2ZuxKSzm2yJ65b7tIut
 dNz5z+fYaHPvz6ag793d5dmSuen3LbVVyg==
X-Google-Smtp-Source: ABdhPJzK2TgjjeuOAzIB0NS6ysjiDpDvVgl4R6iTGv18aetkwDKYHNnCXkf469+Sk+ga9Bx8M/rHgQ==
X-Received: by 2002:a62:1bc7:0:b029:328:cbf5:b6b0 with SMTP id
 b190-20020a621bc70000b0290328cbf5b6b0mr17254824pfb.81.1626560337219; 
 Sat, 17 Jul 2021 15:18:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/13] accel/tcg: Move cflags lookup into tb_find
Date: Sat, 17 Jul 2021 15:18:45 -0700
Message-Id: <20210717221851.2124573-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly require the guest pc for computing cflags,
so move the choice just after cpu_get_tb_cpu_state.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5bb099174f..4d043a11aa 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -502,15 +502,29 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 
 static inline TranslationBlock *tb_find(CPUState *cpu,
                                         TranslationBlock *last_tb,
-                                        int tb_exit, uint32_t cflags)
+                                        int tb_exit)
 {
     CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
-    uint32_t flags;
+    uint32_t flags, cflags;
 
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
+    /*
+     * When requested, use an exact setting for cflags for the next
+     * execution.  This is used for icount, precise smc, and stop-
+     * after-access watchpoints.  Since this request should never
+     * have CF_INVALID set, -1 is a convenient invalid value that
+     * does not require tcg headers for cpu_common_reset.
+     */
+    cflags = cpu->cflags_next_tb;
+    if (cflags == -1) {
+        cflags = curr_cflags(cpu);
+    } else {
+        cpu->cflags_next_tb = -1;
+    }
+
     tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         mmap_lock();
@@ -868,21 +882,7 @@ int cpu_exec(CPUState *cpu)
         int tb_exit = 0;
 
         while (!cpu_handle_interrupt(cpu, &last_tb)) {
-            uint32_t cflags = cpu->cflags_next_tb;
-            TranslationBlock *tb;
-
-            /* When requested, use an exact setting for cflags for the next
-               execution.  This is used for icount, precise smc, and stop-
-               after-access watchpoints.  Since this request should never
-               have CF_INVALID set, -1 is a convenient invalid value that
-               does not require tcg headers for cpu_common_reset.  */
-            if (cflags == -1) {
-                cflags = curr_cflags(cpu);
-            } else {
-                cpu->cflags_next_tb = -1;
-            }
-
-            tb = tb_find(cpu, last_tb, tb_exit, cflags);
+            TranslationBlock *tb = tb_find(cpu, last_tb, tb_exit);
             cpu_loop_exec_tb(cpu, tb, &last_tb, &tb_exit);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
-- 
2.25.1


