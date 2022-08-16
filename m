Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3649359643B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 23:10:10 +0200 (CEST)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3pB-0003db-4w
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 17:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3HE-0005Fc-Ar
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:04 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:40585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3H6-0004d2-PF
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:02 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 z22-20020a056830129600b0063711f456ceso8177580otp.7
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=IWlaZaIHC2PGKwPraJEjxrFHVPFHU1XNUZVWkV1OIpk=;
 b=BKlIQ+5YT+38KuvNo6tgQEW+/xf8+sZekutZ85uXzRqkoemR5TYJz47uA7nIeZyCqe
 t6mV0Vm8zjf2B4c1EhANRMgBML0stYENP9WAqW2AIURuB0fdbirDOc9x0FQIAKHU7Y9p
 1rd+oZ0wS4E3KDLJoNlAavp3MIIbvNSaN12gInYCDo8rOhvG3pIt85kh+4BTUojKiPez
 dImJLFLbE0GOhoraQBknw3ayJerBpTm2pZrwsQP7BARvYIb20vD+MstQf8Ie7GDXdmHh
 r5+e0S4bGM/BZZDvvLyHkWCqIG5bLF0bj88UYBDzY+Mkb1z66KiOv4Iwxn01Xmkc9E/j
 6TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=IWlaZaIHC2PGKwPraJEjxrFHVPFHU1XNUZVWkV1OIpk=;
 b=dpu097ycY2+D5tfcJpy0dm0YcQ7SKC8gXjBR3x5o+L5qpeR4o7n4tPsED620bFbO+h
 EXj+ank08sbrV9k73VREIrBbm+kRwubLihXY2FSRgtGsdWhV99Fj+hLCPvcLVg6enNOH
 Gev32IXXlf/345J/QCeFvf0PdaA+b01Bb9vAvDWBjya+aEgmDWXMcygYf1tUEdsG/k2f
 AAfvLzeYDc8A6hoExY0Hs39WMFijXCUa8ov+KgPvh9dywqoGePcSgPG7CuJy0aTcvt8k
 IoYYBMwztE/mUk04rgjUWzSsAC+za4spfDDmsQt1bRGGzGIu+ymhl2IJHmA7w+PX/rud
 D+aQ==
X-Gm-Message-State: ACgBeo26vAYewhnRUrmSmaAm+vkZj/lsZVYM7iJGbN0uBCc89OSm/PaF
 ZeAy4l8/YiYSDwb9f1AeXMwP7NX0Owr3rA==
X-Google-Smtp-Source: AA6agR5aW1q5SS3I9prsunymWig6bYB8K4V+f2+SVHAg83nskmez5tQIhEX28HqhI2D9QnZf4jc3WQ==
X-Received: by 2002:a05:6830:18d8:b0:638:969c:1eef with SMTP id
 v24-20020a05683018d800b00638969c1eefmr5486363ote.49.1660682095703; 
 Tue, 16 Aug 2022 13:34:55 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 24/33] accel/tcg: Split log_cpu_exec into inline and slow
 path
Date: Tue, 16 Aug 2022 15:33:51 -0500
Message-Id: <20220816203400.161187-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f7c82a8f2c..d758396bcd 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -283,12 +283,11 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     return tb;
 }
 
-static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
-                                const TranslationBlock *tb)
+static void log_cpu_exec1(CPUState *cpu, const TranslationBlock *tb)
 {
-    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))
-        && qemu_log_in_addr_range(pc)) {
+    target_ulong pc = tb_pc_log(tb);
 
+    if (qemu_log_in_addr_range(pc)) {
         qemu_log_mask(CPU_LOG_EXEC,
                       "Trace %d: %p [" TARGET_FMT_lx
                       "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
@@ -315,6 +314,13 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
+static inline void log_cpu_exec(CPUState *cpu, const TranslationBlock *tb)
+{
+    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))) {
+        log_cpu_exec1(cpu, tb);
+    }
+}
+
 static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
                                   uint32_t *cflags)
 {
@@ -412,7 +418,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
         return tcg_code_gen_epilogue;
     }
 
-    log_cpu_exec(pc, cpu, tb);
+    log_cpu_exec(cpu, tb);
 
     return tb->tc.ptr;
 }
@@ -435,7 +441,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     TranslationBlock *last_tb;
     const void *tb_ptr = itb->tc.ptr;
 
-    log_cpu_exec(tb_pc_log(itb), cpu, itb);
+    log_cpu_exec(cpu, itb);
 
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
-- 
2.34.1


