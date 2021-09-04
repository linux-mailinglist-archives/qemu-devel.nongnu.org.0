Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE32400DA5
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:07:37 +0200 (CEST)
Received: from localhost ([::1]:53334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfhA-0003Cl-CL
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXL-0008P1-0h
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXI-0008LH-ET
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id n5so4029627wro.12
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtJq3N+o/FB/vJogkj3xMiVffE8zdE5GfFgTZhZFv9U=;
 b=HWv43/txbtJKq05lxWF+BOLIB0+ibtEKxhnu4bvWJXVTqr/V1BvAxsjoDdHRAHrUqN
 TzkoLoazP/f4SIp0zfilcYhQ+kAVSt8phPs5pLbmyhEBaLKqbMnrtOEI/UDzBp0qVdr7
 mnAuSqRywbnLoW+8PEaI9sVe7iCZVoxnC2hfcl8iLerXJBHqvISayySSO5+NaRU6W6QE
 g1GsRDcRTfQ7bAKBN0soVnW9eUGGyXsRfmFOAVQjwvgLKWPovZsH8aeTk5yCl6ORT/vE
 fJuxw3t6xunvJqnbX2J8QkQYiW8W/1YpypclUWCGy7HyWFxa2f/t6eJQQudUvjMSY1mD
 RKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UtJq3N+o/FB/vJogkj3xMiVffE8zdE5GfFgTZhZFv9U=;
 b=sdytyfEZb4N7CBwGxrrzSiz1diO9MeedpPMKwzuiaWVO5eEzK1tm6BAMnzNZm2AjT0
 fI+YxUllUQLBKFOV20mBZ2/ybg8kcuGBOzMuMUAuvAWifN6IjjIcYCDKpYog3wSVzHVW
 q2oxeGTKtgGzMDtH98xd3JQcjeODfiBLwfz7oQ26Zi4T2Qut1eQTkyt6a8q8yCRR9bBp
 CnJl4zPz/LQ9KH0kUZcB65dLdCTKoPBDNSgXH7focVvp6SbWzyWTeRhmmAUWQ0m2099s
 r7YmVzlcGqousOnFF/OzBOB/9F8sD8SjxvefV/GOPBh94Ui1kYC9TI9bRJmJhhzKsesO
 mqKw==
X-Gm-Message-State: AOAM532r+m2qZG6SodV1MdocwBODOJYgVVjZEyIIOfBhS9MVU7ODpcO9
 qGKJtG73lrYheAqhy5zbTrxzk0gvHow=
X-Google-Smtp-Source: ABdhPJwwL9NDxUZIDEFOsizg0m9BEPjX0/BwpNCUDsynMy9WIE+WZldToWx1SMs2zm9Aw8U+71VXCA==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr5836550wru.249.1630799842956; 
 Sat, 04 Sep 2021 16:57:22 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t14sm3131396wmi.12.2021.09.04.16.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:57:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/24] target/sh4: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Sun,  5 Sep 2021 01:55:37 +0200
Message-Id: <20210904235542.1092641-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/cpu.h    | 4 ++--
 target/sh4/cpu.c    | 2 +-
 target/sh4/helper.c | 9 ++-------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 01c43440822..017a7702140 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -204,8 +204,6 @@ struct SuperHCPU {
 };
 
 
-void superh_cpu_do_interrupt(CPUState *cpu);
-bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -223,6 +221,8 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 void sh4_cpu_list(void);
 #if !defined(CONFIG_USER_ONLY)
+void superh_cpu_do_interrupt(CPUState *cpu);
+bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void cpu_sh4_invalidate_tlb(CPUSH4State *s);
 uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,
                                        hwaddr addr);
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 83269229421..2047742d03c 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -236,10 +236,10 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
     .io_recompile_replay_branch = superh_io_recompile_replay_branch,
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 2d622081e85..53cb9c3b631 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -45,11 +45,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void superh_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = -1;
-}
-
 int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
 {
     /* For user mode, only U0 area is cacheable. */
@@ -784,8 +779,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)
     return 0;
 }
 
-#endif
-
 bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
@@ -803,6 +796,8 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
-- 
2.31.1


