Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C185E92A8
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:19:23 +0200 (CEST)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPfP-0002sw-1F
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPFI-0003J5-TL
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:28 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:43556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPFH-0000PC-G8
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:24 -0400
Received: by mail-qv1-xf35.google.com with SMTP id s13so2772816qvq.10
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Qu/eHdUzCrm8sOsOyH36Ac0H9NLVfy2uiRVSlOgtXZQ=;
 b=YvqSvLdlCrafz3z4dcAdqPICcwIhe28uTPd00A8FumCnzAGSErcNkCDW0iHa3EOO1K
 QIIcTar0OHSCHHmkZzbSZtI8glPZ/TY93T+bqkKuMwM+eLUtdiubnIEA+8NKEmdJxCiK
 uGVcWlbWppB2wyTKZ1uHK5S1pVbCSnDLCfaLyMDzga1q9/3Nff1olTfEviv2ESJsfRec
 +jcVPqDIqAT7JBDZVTWY6EmKiOBkkW7lVBp2wg9B1aLYf8jgUA+jyCZPCT+GvHAKX2aP
 vztPdncuGzjfTtESy1Y3N1hKKNPVM38+H41bkTVcn0jZfxdqXwOAsH9fZZ/BI1tHeOsi
 v+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Qu/eHdUzCrm8sOsOyH36Ac0H9NLVfy2uiRVSlOgtXZQ=;
 b=cn5Mw0rccxU7KdiT5qwgGitRoXVY8gCYMeT+B6fbtTMkuzTx95aR8M48luQlz6MaaE
 7FTkq0c2Fu4lUBZoEy1AgZJZZhBaAspgRax1o9w44doZfVlwBMcA6Tq23Oi1bA/67rU7
 cd9ECUTGms+su9pXdx/dCDq+7uksh7iCkahQzHmnoUFiQKAyz3v8JNWME2iQ20isPfMa
 vdaJ7cNA7ZA/YFhUYODTNF07CaS/8m+CydJis9/4XE/g/RlX3+g6+f37rn7T2DO6wLbG
 0h9F0djW5Q2o4eqebCe7pxZKzRH5ASp7SlgG+D84tAMe1jNRoYg+prEWvGRNGmcbvbCk
 IL/A==
X-Gm-Message-State: ACrzQf1B50eVxcZMogSLP9zIbr0+xfoaphXgFOJschDMjDruKEGKpbsP
 HgIz/uHVkm3uaACIq9B5nvb+olPVArHu6A==
X-Google-Smtp-Source: AMsMyM6C51VJez5E0pmS0VXfp53d9xfX1GaEfS5puzRfgLxVek2tr3x25UcujMPnpKj5azu31/uPqg==
X-Received: by 2002:a05:6214:29c2:b0:4ad:6f9b:9a0b with SMTP id
 gh2-20020a05621429c200b004ad6f9b9a0bmr13743062qvb.31.1664103142426; 
 Sun, 25 Sep 2022 03:52:22 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:52:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 17/17] accel/tcg: Split log_cpu_exec into inline and slow
 path
Date: Sun, 25 Sep 2022 10:51:24 +0000
Message-Id: <20220925105124.82033-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7fe42269ea..318dbc1a2c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -292,12 +292,11 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     return tb;
 }
 
-static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
-                                const TranslationBlock *tb)
+static void log_cpu_exec_slow(CPUState *cpu, const TranslationBlock *tb)
 {
-    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))
-        && qemu_log_in_addr_range(pc)) {
+    target_ulong pc = tb_pc_log(tb);
 
+    if (qemu_log_in_addr_range(pc)) {
         qemu_log_mask(CPU_LOG_EXEC,
                       "Trace %d: %p [" TARGET_FMT_lx
                       "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
@@ -324,6 +323,13 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
+static inline void log_cpu_exec(CPUState *cpu, const TranslationBlock *tb)
+{
+    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))) {
+        log_cpu_exec_slow(cpu, tb);
+    }
+}
+
 static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
                                   uint32_t *cflags)
 {
@@ -421,7 +427,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
         return tcg_code_gen_epilogue;
     }
 
-    log_cpu_exec(pc, cpu, tb);
+    log_cpu_exec(cpu, tb);
 
     return tb->tc.ptr;
 }
@@ -444,7 +450,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     TranslationBlock *last_tb;
     const void *tb_ptr = itb->tc.ptr;
 
-    log_cpu_exec(tb_pc_log(itb), cpu, itb);
+    log_cpu_exec(cpu, itb);
 
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
-- 
2.34.1


