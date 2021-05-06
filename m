Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AAD3758CF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:55:46 +0200 (CEST)
Received: from localhost ([::1]:54428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehHt-0007gD-6j
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1leh5p-0000Fh-BB
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:43:18 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:40657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1leh5k-0003OP-FC
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:43:17 -0400
Received: by mail-il1-x12c.google.com with SMTP id h6so5301338ila.7
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vmGnoVtvhUY8+FWZJw7ZMPKsAqhhWwTIRrwIiRdahQ8=;
 b=LZaxRsUSgdItrgOrlPTchZ0dRqJCCI1RASLkBgGvSOr0bxY6O84udiVxL/SeZkKYDb
 ygrz84EAxA2emUkHrnwmLKvnYchQ2hhTL2d6CbnF2cMipNVOJUNgNHZtYmngNybO3GXw
 PRF5OMF1o6wM784/rri8xJ/H9mZUMlIC4q9bDVLUUogVDwPQi+j00AFJHXkOmRRhZKKz
 D9z0O2W1vkjTFAHY6R0KXTFzMIhAXL/bF/f4HjuCBtxKimg+NF+UgVfSdkoDDUNAcxNu
 O2fj7FdL0quBTZzN18vwZEgVvzGmkcPPneJxyg+via02XxJNl+Rh0FzogwpjIYOjFxiI
 NUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vmGnoVtvhUY8+FWZJw7ZMPKsAqhhWwTIRrwIiRdahQ8=;
 b=q2G34lIJQnjRkbcYuA5hvQv41prDIbnGo/aJVwGG0Z3u+tFQDCy3oBfqB4Fhc2rkQy
 IVpd3g69xqTE2lh08T9aCEUokIEqxvW3JUlojNR5+r3CzRLhQUSc7whhM2u9ivsTVdwN
 rKlvB+wbmcj8uteoOieZJd3ftsOrOzGhwf0Lia3XlklCaFIyYVVEjLtUQZzBJSLgPjEN
 rMyblcWzJIQX3rhV5+lbkFy5fhsJQalSqk2z7Pts77N3ULIqvNyJBJmLCQtaJJOeYL0B
 y1y9kc3dVTaPpvSsVE/RCHDLlnF2SU36vQlpDIZP0elhEoOcnvrzKuMbehMsE9od7W08
 zoIw==
X-Gm-Message-State: AOAM532MhB+uuoJMKPNoLWZ/EHlaZOzI/LCqleMHyFHcv4skrZxm4CA0
 20Vyl/zPnzbj0nAZE79ed9ofsCXbRRf8vA==
X-Google-Smtp-Source: ABdhPJwC1t3680dunKvH9ZK3DVJVxqmV6pouU3BbvG3PikT/gBGIfZGwbV1V3clsVvqy7Q72Wcyayw==
X-Received: by 2002:a92:c5a5:: with SMTP id r5mr5365656ilt.122.1620319390138; 
 Thu, 06 May 2021 09:43:10 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm1654045ile.18.2021.05.06.09.43.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 May 2021 09:43:09 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Use correct trap number for page faults on *BSD systems
Date: Thu,  6 May 2021 10:42:50 -0600
Message-Id: <20210506164250.72433-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Johnston <markj@FreeBSD.org>, Juergen Lock <nox@FreeBSD.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The trap number for a page fault on BSD systems is T_PAGEFLT not 0xe. 0xe is
used by Linux and represents the intel hardware trap vector. The BSD kernels,
however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14, etc fault
handlers. This is true for i386 and x86_64, though the name of the trap hanlder
can very on the flavor of BSD. As far as I can tell, Linux doesn't provide a
avoid uglier #ifdefs.

Signed-off-by: Mark Johnston <markj@FreeBSD.org>
Signed-off-by: Juergen Lock <nox@FreeBSD.org>
[ Rework to avoid ifdefs and expand it to i386 ]
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 accel/tcg/user-exec.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 0d8cc27b21..959fec1257 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -260,6 +260,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 #define TRAP_sig(context)    ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
 #define ERROR_sig(context)   ((context)->uc_mcontext.__gregs[_REG_ERR])
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #elif defined(__FreeBSD__) || defined(__DragonFly__)
 #include <ucontext.h>
 
@@ -267,16 +268,19 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 #define TRAP_sig(context)    ((context)->uc_mcontext.mc_trapno)
 #define ERROR_sig(context)   ((context)->uc_mcontext.mc_err)
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #elif defined(__OpenBSD__)
 #define EIP_sig(context)     ((context)->sc_eip)
 #define TRAP_sig(context)    ((context)->sc_trapno)
 #define ERROR_sig(context)   ((context)->sc_err)
 #define MASK_sig(context)    ((context)->sc_mask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #else
 #define EIP_sig(context)     ((context)->uc_mcontext.gregs[REG_EIP])
 #define TRAP_sig(context)    ((context)->uc_mcontext.gregs[REG_TRAPNO])
 #define ERROR_sig(context)   ((context)->uc_mcontext.gregs[REG_ERR])
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      0xe
 #endif
 
 int cpu_signal_handler(int host_signum, void *pinfo,
@@ -302,7 +306,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     pc = EIP_sig(uc);
     trapno = TRAP_sig(uc);
     return handle_cpu_signal(pc, info,
-                             trapno == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+                             trapno == PAGE_FAULT_TRAP ?
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
@@ -313,11 +318,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 #define TRAP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
 #define ERROR_sig(context)    ((context)->uc_mcontext.__gregs[_REG_ERR])
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #elif defined(__OpenBSD__)
 #define PC_sig(context)       ((context)->sc_rip)
 #define TRAP_sig(context)     ((context)->sc_trapno)
 #define ERROR_sig(context)    ((context)->sc_err)
 #define MASK_sig(context)     ((context)->sc_mask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #elif defined(__FreeBSD__) || defined(__DragonFly__)
 #include <ucontext.h>
 
@@ -325,11 +332,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 #define TRAP_sig(context)     ((context)->uc_mcontext.mc_trapno)
 #define ERROR_sig(context)    ((context)->uc_mcontext.mc_err)
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #else
 #define PC_sig(context)       ((context)->uc_mcontext.gregs[REG_RIP])
 #define TRAP_sig(context)     ((context)->uc_mcontext.gregs[REG_TRAPNO])
 #define ERROR_sig(context)    ((context)->uc_mcontext.gregs[REG_ERR])
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       0xe
 #endif
 
 int cpu_signal_handler(int host_signum, void *pinfo,
@@ -347,7 +356,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
     pc = PC_sig(uc);
     return handle_cpu_signal(pc, info,
-                             TRAP_sig(uc) == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
-- 
2.22.1


