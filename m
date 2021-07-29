Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DAA3D9ACA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:07:00 +0200 (CEST)
Received: from localhost ([::1]:50794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uVn-0002yi-BX
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCd-0004MY-0K
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:14 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCb-0002Yt-Ee
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:10 -0400
Received: by mail-pl1-x632.google.com with SMTP id d1so4895591pll.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHmKZKS/PD+hGB7cYM6W4W8xxYA2vZLEFGvPJ5PPjvE=;
 b=jbZVn8EA17Q2ayyKnDbonfgigAvteIuVOxmta109Gya4giUClOoov9OAdIVPf2Qgl2
 J+6b84X1FlLHi9hV/0lDe8vsuVnCL9REQM9GTD2rmzYCxKyMd4oJbz4ohso9kmp42jDW
 YWWr9oiES0Hj2oxh38a7TeA+1q33NvRa5QzNh1I4+p7NYuvTjy68MsRTxc8qmCRzS813
 3fafmnNBimS+0Fd5gxYCrgmPSVe4zWUC9Na22GVnkvVIlq5MNbniyc/N+L3k5NqcPEeS
 cHG1esLPDx6z6blAonBSCxSH/8iGq/rJdvNszQwO6X/B5L9mA8ealv+5Hwud0Qjfyo9w
 /ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHmKZKS/PD+hGB7cYM6W4W8xxYA2vZLEFGvPJ5PPjvE=;
 b=trwCe7oMwav3inWsKl7AduC/h8lt20cSovqxPXVx40AqOn47MMaN6tj4e0X1FxbaxA
 yYA6mZJQ9VPLZVln0+NeJ56GkPN0wG1gsfXgOD3ASsJvP2RZnV1pCdXcMrorCE+6qYzm
 D/iYlUdJrN/27YnFJp4QY4ocPaA65rJJeUrq9h6YCrp65oX4Fny+gFMkoBJh9Jn8E6L/
 sKEZcqGx7alzA+wYCPHcUPGK7whZYrTaEWMD85oj85q7O3A67FXdLIhEZx5ZTl/+pR4q
 KYInFyuGjD6ZflPFZj0Z10a0hc96/fnnrWR4PDjrx3rW4LKW/BQSG9FBJbVAs+P75Cp2
 LI5g==
X-Gm-Message-State: AOAM533VEsjiKyGL2m58sP1FWLRtdHNENfk311bbnhp4xIV9DgAF1UZm
 s/Q2IZdRe2+5XKLgZb/i2A82ESMKZ3eb9w==
X-Google-Smtp-Source: ABdhPJzdeOoV9HJm29ARzy7TXhrO1nTa1k0e+WFmSWfwDzdzgthg7XymNfSStd4ZNswOWs+kArDMnw==
X-Received: by 2002:a17:90a:604b:: with SMTP id
 h11mr2424192pjm.220.1627519628255; 
 Wed, 28 Jul 2021 17:47:08 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 15/43] target/sparc: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:19 -1000
Message-Id: <20210729004647.282017-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 11 +++++++++++
 target/sparc/cpu.c          |  2 +-
 target/sparc/ldst_helper.c  |  2 --
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 02532f198d..612e77807e 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -272,6 +272,17 @@ void cpu_loop (CPUSPARCState *env)
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             }
             break;
+        case TT_UNALIGNED:
+            info.si_signo = TARGET_SIGBUS;
+            info.si_errno = 0;
+            info.si_code = TARGET_BUS_ADRALN;
+#ifdef TARGET_SPARC64
+            info._sifields._sigfault._addr = env->dmmu.sfar;
+#else
+            info._sifields._sigfault._addr = env->mmuregs[4];
+#endif
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
         case EXCP_DEBUG:
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index da6b30ec74..d33d41e837 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -865,11 +865,11 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .tlb_fill = sparc_cpu_tlb_fill,
+    .do_unaligned_access = sparc_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
-    .do_unaligned_access = sparc_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 7367b48c8b..69b812e68c 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1954,7 +1954,6 @@ void sparc_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 }
 #endif
 
-#if !defined(CONFIG_USER_ONLY)
 void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                  MMUAccessType access_type,
                                                  int mmu_idx,
@@ -1973,4 +1972,3 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 
     cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
 }
-#endif
-- 
2.25.1


