Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ADD3A4B69
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:49:34 +0200 (CEST)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqu5-0000Gw-QX
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmc-0002Ia-S3
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:50 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqma-0002Y1-KP
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:50 -0400
Received: by mail-pg1-x52b.google.com with SMTP id n12so3640985pgs.13
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUhltgRrfndDs4n5FmV9GeamF0gX7OjPbnRpqT98ftE=;
 b=D1NX6Grw0beaZFJpdfrOKyDsHdk4mVHnaPwx0LZkMJnjeWHEJfxF0uZNGVh4vgM9jy
 FJmI0tP5RigKDPtaIWHyxLEBDLNtvzBZ/2xWkrQ5vL3mKgp/Daw22sQtpMAL1igo8/re
 YJ9ZJtNRHjkkcte3jLrDOz8kZeFqITZTccfWaD8X5TEKXyDr/hfZNiRJvD6lb9jCgsui
 aWY7bPrNxrgFDCW2FpMVotZFpggAS+Iysdm1ToUy0UnAxLUHXjUZSdhEOd5RcGQa7n3P
 CKMJEGivD4FljUslLaO/wXOacOsUrYndflKJf1OOGwqwi1DwMiNIoXdsFE3N2/AJkGmW
 bJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUhltgRrfndDs4n5FmV9GeamF0gX7OjPbnRpqT98ftE=;
 b=VzcmYatdJenT3f7TmvnyeOvDheHdgTUe/ovGBzIu43UNk0aN54NLB/MoR94BEF8QME
 aviFjgXOnrD1PNyx10igpLyTpI/VZH7yxFYIxDVZCkIBWGV9bv/yXmiWDVDln2+HaRxt
 VMSOi7coMhNAKjqLcXTHzxVCjgrPyuCIuMtHPo2WVWNB1qGwhg83SQV21uFDKv27kU6h
 qF1iFr9RVnEHphqoT7IcjEv2axmKaWOs22kAhf12v4dMVlRdkaUP1dHOGGVbibTLcgkm
 x029z1yDJLU+co3XEg3DCjCfI/WYDcUUlNv68r12s0B1S2ZQB+ZoBR2qCnS4REDfoIbC
 s38Q==
X-Gm-Message-State: AOAM530M1g61cUK3i17XfNIM/u6Joq7GR5T1QK/4UdzyMs0SQCOZSyYK
 OXmMND2ep9DHxzj/BA+7U7+VcKGZ253I5g==
X-Google-Smtp-Source: ABdhPJx9EjZmXdhj80/rH0F4l+VM7JUgebgLfVOvrIuIp6g7ylN0NeYHjgMfRh9P42XChFJWepsmLA==
X-Received: by 2002:aa7:8119:0:b029:2b5:7e51:274b with SMTP id
 b25-20020aa781190000b02902b57e51274bmr10676298pfi.32.1623454907159; 
 Fri, 11 Jun 2021 16:41:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/34] tcg: Re-order tcg_region_init vs tcg_prologue_init
Date: Fri, 11 Jun 2021 16:41:13 -0700
Message-Id: <20210611234144.653682-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of delaying tcg_region_init until after tcg_prologue_init
is complete, do tcg_region_init first and let tcg_prologue_init
shrink the first region by the size of the generated prologue.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-all.c       | 11 ---------
 accel/tcg/translate-all.c |  3 +++
 bsd-user/main.c           |  1 -
 linux-user/main.c         |  1 -
 tcg/tcg.c                 | 52 ++++++++++++++-------------------------
 5 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index e378c2db73..f132033999 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -111,17 +111,6 @@ static int tcg_init(MachineState *ms)
 
     tcg_exec_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
     mttcg_enabled = s->mttcg_enabled;
-
-    /*
-     * Initialize TCG regions only for softmmu.
-     *
-     * This needs to be done later for user mode, because the prologue
-     * generation needs to be delayed so that GUEST_BASE is already set.
-     */
-#ifndef CONFIG_USER_ONLY
-    tcg_region_init();
-#endif /* !CONFIG_USER_ONLY */
-
     return 0;
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 1eefe6ea8d..04764626bc 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1339,6 +1339,9 @@ void tcg_exec_init(unsigned long tb_size, int splitwx)
                                splitwx, &error_fatal);
     assert(ok);
 
+    /* TODO: allocating regions is hand-in-glove with code_gen_buffer. */
+    tcg_region_init();
+
 #if defined(CONFIG_SOFTMMU)
     /* There's no guest base to take into account, so go ahead and
        initialize the prologue now.  */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 9d370bc8f6..270cf2ca70 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -879,7 +879,6 @@ int main(int argc, char **argv)
      * the real value of GUEST_BASE into account.
      */
     tcg_prologue_init(tcg_ctx);
-    tcg_region_init();
 
     /* build Task State */
     memset(ts, 0, sizeof(TaskState));
diff --git a/linux-user/main.c b/linux-user/main.c
index 4dfc47ad3b..2fb3a366a6 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -868,7 +868,6 @@ int main(int argc, char **argv, char **envp)
        generating the prologue until now so that the prologue can take
        the real value of GUEST_BASE into account.  */
     tcg_prologue_init(tcg_ctx);
-    tcg_region_init();
 
     target_cpu_copy_regs(env, regs);
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0dc271aac9..1e683b80e4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1206,32 +1206,18 @@ TranslationBlock *tcg_tb_alloc(TCGContext *s)
 
 void tcg_prologue_init(TCGContext *s)
 {
-    size_t prologue_size, total_size;
-    void *buf0, *buf1;
+    size_t prologue_size;
 
     /* Put the prologue at the beginning of code_gen_buffer.  */
-    buf0 = s->code_gen_buffer;
-    total_size = s->code_gen_buffer_size;
-    s->code_ptr = buf0;
-    s->code_buf = buf0;
+    tcg_region_assign(s, 0);
+    s->code_ptr = s->code_gen_ptr;
+    s->code_buf = s->code_gen_ptr;
     s->data_gen_ptr = NULL;
 
-    /*
-     * The region trees are not yet configured, but tcg_splitwx_to_rx
-     * needs the bounds for an assert.
-     */
-    region.start = buf0;
-    region.end = buf0 + total_size;
-
 #ifndef CONFIG_TCG_INTERPRETER
-    tcg_qemu_tb_exec = (tcg_prologue_fn *)tcg_splitwx_to_rx(buf0);
+    tcg_qemu_tb_exec = (tcg_prologue_fn *)tcg_splitwx_to_rx(s->code_ptr);
 #endif
 
-    /* Compute a high-water mark, at which we voluntarily flush the buffer
-       and start over.  The size here is arbitrary, significantly larger
-       than we expect the code generation for any one opcode to require.  */
-    s->code_gen_highwater = s->code_gen_buffer + (total_size - TCG_HIGHWATER);
-
 #ifdef TCG_TARGET_NEED_POOL_LABELS
     s->pool_labels = NULL;
 #endif
@@ -1248,32 +1234,32 @@ void tcg_prologue_init(TCGContext *s)
     }
 #endif
 
-    buf1 = s->code_ptr;
+    prologue_size = tcg_current_code_size(s);
+
 #ifndef CONFIG_TCG_INTERPRETER
-    flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(buf0), (uintptr_t)buf0,
-                        tcg_ptr_byte_diff(buf1, buf0));
+    flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(s->code_buf),
+                        (uintptr_t)s->code_buf, prologue_size);
 #endif
 
-    /* Deduct the prologue from the buffer.  */
-    prologue_size = tcg_current_code_size(s);
-    s->code_gen_ptr = buf1;
-    s->code_gen_buffer = buf1;
-    s->code_buf = buf1;
-    total_size -= prologue_size;
-    s->code_gen_buffer_size = total_size;
+    /* Deduct the prologue from the first region.  */
+    region.start = s->code_ptr;
 
-    tcg_register_jit(tcg_splitwx_to_rx(s->code_gen_buffer), total_size);
+    /* Recompute boundaries of the first region. */
+    tcg_region_assign(s, 0);
+
+    tcg_register_jit(tcg_splitwx_to_rx(region.start),
+                     region.end - region.start);
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
         FILE *logfile = qemu_log_lock();
         qemu_log("PROLOGUE: [size=%zu]\n", prologue_size);
         if (s->data_gen_ptr) {
-            size_t code_size = s->data_gen_ptr - buf0;
+            size_t code_size = s->data_gen_ptr - s->code_gen_ptr;
             size_t data_size = prologue_size - code_size;
             size_t i;
 
-            log_disas(buf0, code_size);
+            log_disas(s->code_gen_ptr, code_size);
 
             for (i = 0; i < data_size; i += sizeof(tcg_target_ulong)) {
                 if (sizeof(tcg_target_ulong) == 8) {
@@ -1287,7 +1273,7 @@ void tcg_prologue_init(TCGContext *s)
                 }
             }
         } else {
-            log_disas(buf0, prologue_size);
+            log_disas(s->code_gen_ptr, prologue_size);
         }
         qemu_log("\n");
         qemu_log_flush();
-- 
2.25.1


