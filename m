Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF7941084D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:10:08 +0200 (CEST)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfix-0006Bf-34
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLp-0005O5-63
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:16 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLb-0006wq-5V
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:12 -0400
Received: by mail-pl1-x632.google.com with SMTP id bg1so8343715plb.13
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hpn06mvL6ETEhh8XWYQF5SUad5wpeFGzI3BM48espBU=;
 b=Ln0D7kH7ZPEIRygcBy0ufx233wWlLEFZYKaNcSGT21GIaUc8JLD7D3FR8tj+jkmVoF
 qReb+fWeDR4jpnGRbRZ1IsWLnPyJxGgNUj5EVBO1HTmeph0IER+VzG1OnOE5SaH8aqPc
 S4vJbYU1tgYFQ8ummN6ZchCxYrEq8iPVMqt2NhLVAPmxs71gEKtLHaQce8TtQFgpt0QJ
 xeepViE2yL6aB/wM4079mM2tRft2Ie/IZSTSIPUFU74aZq6mhbLHatbqYyYmjR51n90a
 Ni5OJzSRw0WGQ2XM2UMqfU2tkXAGie/RMdE7QC7Y38Mi0Bn43a/I8ip6JscbB7niYcNL
 +qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hpn06mvL6ETEhh8XWYQF5SUad5wpeFGzI3BM48espBU=;
 b=kVVXcjJ3P1nggdmynwRuCt3SwDO4rVQGpbeFdngsoS3BQMcECqnCu/X2rn76/7oFFu
 ZmsdIHzoMLQemGWn5Ll0vI150R+QKfwZ6q4l9+tqTXdbhWUuKuJ8/2EvKDVAWtXTTj3g
 HBDMezfN4eSgTyUBk9pcX6sfYrlKBH7HJvOVHsAqhupubTWE4VHwtS0/RLkWnbBSUPDa
 kEuA0riW6tp3j1Z/OxJsZgBGiofhWSDN4NwbBkfZgJ3RXyyvse53jY17aTh2KLWiNlx6
 E3sTfcezCk1C+j3aBkHhFdH4sPujS8ayETgT2yw5UGnG8/evxwwHcYH0n0V8MVVVOgVV
 Lrng==
X-Gm-Message-State: AOAM531sCcmvGEYFbB52X9NSxtjkkQa+wPrXO1W0jtXxIP47UPpu/Yy3
 k/3K2tkNahX84XPfGE4oQ1XYcxws1WwFiw==
X-Google-Smtp-Source: ABdhPJy1fru7mLaONy7PH+8hudMe5lnzw2GPx58ptynIkKt93MKSN8earpS4bgPAYWs2NCYsDmNZKw==
X-Received: by 2002:a17:902:9a04:b0:13a:1ae3:add2 with SMTP id
 v4-20020a1709029a0400b0013a1ae3add2mr15222515plp.28.1631990754444; 
 Sat, 18 Sep 2021 11:45:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/41] target/nios2: Make nios2_cpu_tlb_fill sysemu only
Date: Sat, 18 Sep 2021 11:45:17 -0700
Message-Id: <20210918184527.408540-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fallback code in raise_sigsegv is sufficient for nios2.
Remove the code from cpu_loop that handled the unnamed 0xaa exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 10 ----------
 target/nios2/cpu.c          |  2 +-
 target/nios2/helper.c       |  8 --------
 3 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index fd3f853ac2..c06fb6fabd 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -106,16 +106,6 @@ void cpu_loop(CPUNios2State *env)
             info.si_code = TARGET_TRAP_BRKPT;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
-        case 0xaa:
-            {
-                info.si_signo = TARGET_SIGSEGV;
-                info.si_errno = 0;
-                /* TODO: check env->error_code */
-                info.si_code = TARGET_SEGV_MAPERR;
-                info._sifields._sigfault._addr = env->regs[R_PC];
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
-            break;
         default:
             EXCP_DUMP(env, "\nqemu: unhandled CPU exception %#x - aborting\n",
                      trapnr);
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 9938d7c291..b9f79b1bb2 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -222,10 +222,10 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
-    .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
     .has_work = nios2_cpu_has_work,
+    .tlb_fill = nios2_cpu_tlb_fill,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 53be8398e9..8b9b55ec67 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -38,14 +38,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     env->regs[R_EA] = env->regs[R_PC] + 4;
 }
 
-bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr)
-{
-    cs->exception_index = 0xaa;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
 #else /* !CONFIG_USER_ONLY */
 
 void nios2_cpu_do_interrupt(CPUState *cs)
-- 
2.25.1


