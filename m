Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF9B368932
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 01:04:45 +0200 (CEST)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZiNI-0006x5-Sj
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 19:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLE-0005C2-Om
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:36 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLC-0007pG-Kz
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:36 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so225273pjv.1
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pq63tIitSEl/3DIHxaCuKkI+VTWbKxsaVUJWQ8jB2y0=;
 b=MZVtRtGh6eepo5poAaJrndcIXlcBUIMHSdqOE55GuNbzB+IjnkXv2DN88FoFWIvFWK
 rX8heO1anc2b4+lNYp3ikXUicBbt6mPb20I3K72A4HRjnb2jdwX8dTxU5TiQAjk3n+aY
 vUB2uH1rUgGsqHK6J3owYEOrPjGG50fekU8wp52vqNbmi03qSjvtr0rO1gKGPpvpv4A+
 mP2PtOJyQqlTqR7uuXztejjNSFnzIFxMMQTN0VbS3GeR7Lz42DeYKnNSD/I7Mz3C4fAP
 X5dXDm6QxlSAGXvrXdeEAtG7PBMPAoYrzIpeBSMM2MAexjxvxD29FrzzfjxYx9NFnDE6
 MhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pq63tIitSEl/3DIHxaCuKkI+VTWbKxsaVUJWQ8jB2y0=;
 b=GrXFEjB/WqqBD+D1WqKYNRFqS1PA9ETHvVR528DM5XPdrEowF/iyiC8TKbivtoB8Tm
 bvMB49mmh+/b2d4FVRxbd86dzrXtnn4MSYsHLmV7w768UvP89fz7ZbOm3CpOCFtgWN/5
 91X1b1v+RCEWNF9nNNj9nwPqDRzywkrKUCE8UugGE5AcC/oJ78Ze8MzyOPp2J7Rvix/W
 dwE7mmRAnmdPghoRZx2Y7G8cbgJiBLFuoOxlvacNbI7bD56uzWfj//Qfnw+qObXiPkm/
 sp4lvGFBb9xlhF3CCh389zrJju4/fCRB8mOcbXRWdlgKJW5aTIqCC28zTpQYaQa58W48
 V4nw==
X-Gm-Message-State: AOAM533UHnoh5HoWATfvnssk88WPzvVd2eV/Xkk5twxpiVzPCJFc97Jz
 FNmt1JcJXe0X489llEsYs0yrKpbaYhL+BQ==
X-Google-Smtp-Source: ABdhPJxq2sCBM70ZnV0U+DvZtsUVr9Irzu7MVBse1m5B7jjnJlZIfw+8DGqaTXtqHOo2QuVR6tPyLQ==
X-Received: by 2002:a17:902:b210:b029:eb:535f:852 with SMTP id
 t16-20020a170902b210b02900eb535f0852mr845384plr.80.1619132552721; 
 Thu, 22 Apr 2021 16:02:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z12sm2930605pfn.195.2021.04.22.16.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 16:02:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] linux-user/alpha: Define TARGET_ARCH_HAS_KA_RESTORER
Date: Thu, 22 Apr 2021 16:02:25 -0700
Message-Id: <20210422230227.314751-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422230227.314751-1-richard.henderson@linaro.org>
References: <20210422230227.314751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This means that we can share the TARGET_NR_rt_sigaction code,
and the target_rt_sigaction structure is unused.  Untangling
the ifdefs so that target_sigaction can be shared will wait
until the next patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/target_signal.h |  1 +
 linux-user/syscall_defs.h        |  6 ------
 linux-user/syscall.c             | 37 ++++++--------------------------
 3 files changed, 7 insertions(+), 37 deletions(-)

diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index 0b90d3a897..250642913e 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -92,6 +92,7 @@ typedef struct target_sigaltstack {
 #define TARGET_GEN_SUBRNG7     -25
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_KA_RESTORER
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index e4aaf8412f..7a1d3b239c 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -507,12 +507,6 @@ struct target_old_sigaction {
     int32_t sa_flags;
 };
 
-struct target_rt_sigaction {
-    abi_ulong _sa_handler;
-    abi_ulong sa_flags;
-    target_sigset_t sa_mask;
-};
-
 /* This is the struct used inside the kernel.  The ka_restorer
    field comes from the 5th argument to sys_rt_sigaction.  */
 struct target_sigaction {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 89d641856c..216ee4ca47 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9064,41 +9064,17 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #endif
     case TARGET_NR_rt_sigaction:
         {
-#if defined(TARGET_ALPHA)
-            /* For Alpha and SPARC this is a 5 argument syscall, with
+            /*
+             * For Alpha and SPARC this is a 5 argument syscall, with
              * a 'restorer' parameter which must be copied into the
              * sa_restorer field of the sigaction struct.
              * For Alpha that 'restorer' is arg5; for SPARC it is arg4,
              * and arg5 is the sigsetsize.
-             * Alpha also has a separate rt_sigaction struct that it uses
-             * here; SPARC uses the usual sigaction struct.
              */
-            struct target_rt_sigaction *rt_act;
-            struct target_sigaction act, oact, *pact = 0;
-
-            if (arg4 != sizeof(target_sigset_t)) {
-                return -TARGET_EINVAL;
-            }
-            if (arg2) {
-                if (!lock_user_struct(VERIFY_READ, rt_act, arg2, 1))
-                    return -TARGET_EFAULT;
-                act._sa_handler = rt_act->_sa_handler;
-                act.sa_mask = rt_act->sa_mask;
-                act.sa_flags = rt_act->sa_flags;
-                unlock_user_struct(rt_act, arg2, 0);
-                pact = &act;
-            }
-            ret = get_errno(do_sigaction(arg1, pact, &oact, arg5));
-            if (!is_error(ret) && arg3) {
-                if (!lock_user_struct(VERIFY_WRITE, rt_act, arg3, 0))
-                    return -TARGET_EFAULT;
-                rt_act->_sa_handler = oact._sa_handler;
-                rt_act->sa_mask = oact.sa_mask;
-                rt_act->sa_flags = oact.sa_flags;
-                unlock_user_struct(rt_act, arg3, 1);
-            }
-#else
-#ifdef TARGET_SPARC
+#if defined(TARGET_ALPHA)
+            target_ulong sigsetsize = arg4;
+            target_ulong restorer = arg5;
+#elif defined(TARGET_SPARC)
             target_ulong restorer = arg4;
             target_ulong sigsetsize = arg5;
 #else
@@ -9131,7 +9107,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 unlock_user_struct(act, arg2, 0);
             if (oact)
                 unlock_user_struct(oact, arg3, 1);
-#endif
         }
         return ret;
 #ifdef TARGET_NR_sgetmask /* not on alpha */
-- 
2.25.1


