Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB45E3B93F3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:30:01 +0200 (CEST)
Received: from localhost ([::1]:46942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyydc-0004gV-Og
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZk-0004fC-JS
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:00 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZX-0008GB-Oi
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:00 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e33so6434632pgm.3
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZ18+TbN3l0IvM4lcz8To1nUnlGMGwhY3IWR1y85/oQ=;
 b=rm1rgNTjRpqMa7rc2vr+W+erhXheLaeVTlGq/9dc2gvf8wTjBi39J2gS119tSgkCTs
 2vPHtTSJvs3MWW97rmMDlGgcnioRYhqqf9qhlxSmaJJS0wrUf3zBI3jH4G+6+H7mxvU6
 65Usd1I4j2U9RYnMZbv0pGPcfZzzH6zi7KlRx9OwgqDqvmr92kERKyfhdI+sIPW0w8nM
 Labo90gEiFR9ViGzZanCqPbbHaDw6cSz5qFYwSxPghCkQQmy4xQ3FZW+n36ReeiYLIen
 7W/Xq65jCL2stXaPM8jXdCV9xsqvPqFTFIgLrSHNxFSzI0XYWq0+x3qb/q7s+tANVQXi
 GN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZ18+TbN3l0IvM4lcz8To1nUnlGMGwhY3IWR1y85/oQ=;
 b=T3h/agTyTKtWn6ZpQ0rE4DQ5S6phm/Qor0trSAR5/1s8WJelRRae3axmZmexFeVFrI
 j7n2qB6frjNsnZ2HjAnA6P5az+i5LqZypi17G8HhaQRo22nOCqNMqISTx6KljbVhCmf9
 FUfVMFTpY+tYHREBQvAiJqVS0yGQd/XUwLQFW1ZDuwfch1so0bR2umAxf9WDbAv6Mskp
 BCJOS9Y6xTLVAut/Lvv81heunPmHQ2tYO0Sw1JZ8kCWVDSmz4Yjuv7BZfzQ0qOlnEVnL
 qveYaSS2OBQwVCRUJ6xAfw8RGsezSNhVAW7d6f++O9rumrz7eVVLebofE53oa1DybMgy
 08Mw==
X-Gm-Message-State: AOAM533Nisl+ri98SqOyloAYZO9z0vhyBU2Iz3VHgvZam/s9EzLkQ6zQ
 mmjBFN3Mri5s0vtiQnLF6JG1ywZoc8S+sw==
X-Google-Smtp-Source: ABdhPJxBQCai5L0dwZb2YtQDhEzKNEkCAeLa9crIPwVwFxPFZUExYxuAYon3vHDda2KbpLEp7BLd4Q==
X-Received: by 2002:a62:87ca:0:b029:303:1dd3:572 with SMTP id
 i193-20020a6287ca0000b02903031dd30572mr509872pfe.33.1625153146373; 
 Thu, 01 Jul 2021 08:25:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/17] accel/tcg: Move cflags lookup into tb_find
Date: Thu,  1 Jul 2021 08:25:33 -0700
Message-Id: <20210701152537.3330420-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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


