Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B29C3D17EA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:26:52 +0200 (CEST)
Received: from localhost ([::1]:35414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Inr-0000Wp-7y
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOP-00031c-V2
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:38 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOL-0005wr-J7
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so1947481pjo.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DXOXSEfLZBNIVX60+JbD+azd+XSC/P1pd7+HVk2RYSk=;
 b=JZlvrbtv17tMQNoo6DyuqjZlN5d6ilPvNVtxWVrsFoJkauAbBY+b8CCSvAYBlZ7DqR
 yWBojgR+fbX/953xDHhxXNF1NK17teA1B3CpT4IOWdIH0iYkbCfYVazso+78JxT9niJd
 jio/QHe3mCOODYXGXvmw8hy5eDoNbtGi4MTseCP/FpcTbZ35uPQywiBnf20HhxP9bHY6
 geHfqxY0TDVDVLSoI2Gyw2rbmdAsfmzfXUlesbfEmeMrLpTrgpqwnbjOPLG8SpJlh84A
 Qo/OUdNKd+UVuArNzeqqO6QBDjNJokmq0/1hk84bCjT8U02Kqewg4Zqbk6JjzCLKxAwf
 Rfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DXOXSEfLZBNIVX60+JbD+azd+XSC/P1pd7+HVk2RYSk=;
 b=TZJRTcC2dSSF0VHRMqJlSaR+PJMahr4SwdXKlz80Ltz2du0NIFxSB1sVkJa9V4bnql
 NrqvEH3HeplEWR1u/OewGrD/biwQH930Cd0biY+w1vdVXQnHGBqe5J/8Ti0Yi8kSCZWj
 QcXcYy8WDEq1Fb4OPwS0ZPBJSzrysJzVtms6VcC6WIKgbzg8U1RHgV0lXgEYTpBFXuI5
 RrSxbpl4Iib8TiDDyUYtKB+075oI+69ULAgmZzvB0bJDPZrTLqlo44asEySRa7ABotU/
 Eh7f2XbYEyfNkzBKPhQfN666Xarzar1SS53bJedS3clbhlQ2tDbBh558SxZPwvg5oAp7
 Ea7A==
X-Gm-Message-State: AOAM530A5Tlh6M3JzUt7NJAC7/lbNqF87OC5IyK+/fsSecnlrusIPk7m
 wR1DRDmk/cP9C/PQHZ46M5n3t9C/ckLihA==
X-Google-Smtp-Source: ABdhPJxk84Y8Av7q/iJQHY1EN12ogYpBEYAs6ZrnIVJGrgbllK8aodHc2ETR3h2XkWbRWVy9xdYsNw==
X-Received: by 2002:a17:903:4101:b029:12b:8d5a:f883 with SMTP id
 r1-20020a1709034101b029012b8d5af883mr12847936pld.39.1626897628280; 
 Wed, 21 Jul 2021 13:00:28 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/27] accel/tcg: Merge tb_find into its only caller
Date: Wed, 21 Jul 2021 09:59:50 -1000
Message-Id: <20210721195954.879535-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to want two things:
(1) check for breakpoints will want to break out of the loop here,
(2) cflags can only be calculated with pc in hand.

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 83 ++++++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 42 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5bb099174f..cde7069eb7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -500,41 +500,6 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
     return;
 }
 
-static inline TranslationBlock *tb_find(CPUState *cpu,
-                                        TranslationBlock *last_tb,
-                                        int tb_exit, uint32_t cflags)
-{
-    CPUArchState *env = (CPUArchState *)cpu->env_ptr;
-    TranslationBlock *tb;
-    target_ulong cs_base, pc;
-    uint32_t flags;
-
-    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
-
-    tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
-    if (tb == NULL) {
-        mmap_lock();
-        tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
-        mmap_unlock();
-        /* We add the TB in the virtual pc hash table for the fast lookup */
-        qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
-    }
-#ifndef CONFIG_USER_ONLY
-    /* We don't take care of direct jumps when address mapping changes in
-     * system emulation. So it's not safe to make a direct jump to a TB
-     * spanning two pages because the mapping for the second page can change.
-     */
-    if (tb->page_addr[1] != -1) {
-        last_tb = NULL;
-    }
-#endif
-    /* See if we can patch the calling TB. */
-    if (last_tb) {
-        tb_add_jump(last_tb, tb_exit, tb);
-    }
-    return tb;
-}
-
 static inline bool cpu_handle_halt(CPUState *cpu)
 {
     if (cpu->halted) {
@@ -868,22 +833,56 @@ int cpu_exec(CPUState *cpu)
         int tb_exit = 0;
 
         while (!cpu_handle_interrupt(cpu, &last_tb)) {
-            uint32_t cflags = cpu->cflags_next_tb;
             TranslationBlock *tb;
+            target_ulong cs_base, pc;
+            uint32_t flags, cflags;
 
-            /* When requested, use an exact setting for cflags for the next
-               execution.  This is used for icount, precise smc, and stop-
-               after-access watchpoints.  Since this request should never
-               have CF_INVALID set, -1 is a convenient invalid value that
-               does not require tcg headers for cpu_common_reset.  */
+            /*
+             * When requested, use an exact setting for cflags for the next
+             * execution.  This is used for icount, precise smc, and stop-
+             * after-access watchpoints.  Since this request should never
+             * have CF_INVALID set, -1 is a convenient invalid value that
+             * does not require tcg headers for cpu_common_reset.
+             */
+            cflags = cpu->cflags_next_tb;
             if (cflags == -1) {
                 cflags = curr_cflags(cpu);
             } else {
                 cpu->cflags_next_tb = -1;
             }
 
-            tb = tb_find(cpu, last_tb, tb_exit, cflags);
+            cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
+
+            tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
+            if (tb == NULL) {
+                mmap_lock();
+                tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
+                mmap_unlock();
+                /*
+                 * We add the TB in the virtual pc hash table
+                 * for the fast lookup
+                 */
+                qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
+            }
+
+#ifndef CONFIG_USER_ONLY
+            /*
+             * We don't take care of direct jumps when address mapping
+             * changes in system emulation.  So it's not safe to make a
+             * direct jump to a TB spanning two pages because the mapping
+             * for the second page can change.
+             */
+            if (tb->page_addr[1] != -1) {
+                last_tb = NULL;
+            }
+#endif
+            /* See if we can patch the calling TB. */
+            if (last_tb) {
+                tb_add_jump(last_tb, tb_exit, tb);
+            }
+
             cpu_loop_exec_tb(cpu, tb, &last_tb, &tb_exit);
+
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(&sc, cpu);
-- 
2.25.1


