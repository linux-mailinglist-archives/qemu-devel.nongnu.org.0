Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3D44395F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:13:52 +0100 (CET)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2yV-0005zf-QP
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2es-0006r1-UW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:34 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:34559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2eq-0002nj-IQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:34 -0400
Received: by mail-io1-xd32.google.com with SMTP id b203so609368iof.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WEtSw0e1OoCnEPOeKTHBUWYo/YNsC3SH2hpvIjNKUwM=;
 b=c9K9kR0DBh00Ziq7FGrFBpcwY4hv83ucZrutu7YbnC/iFbixEX9uOGwYuaZ/1hQGCG
 dTKWaFMavW9uAw2PXYCVM6sV2Tp6VrfQ3PSp2+neWoyFDBfVHr2mYhyZBZBfAhYdEmao
 kiP7HcpV5IEyv76EWD8PZ3blccX9+INx7RTUy01HNldU8BkEnldx63vox6WDMyZrYEJb
 0UK5/Rv4kmw9G5QEqKc9ycprjB4LY5Dq2g3XWdV5xu13FjdDzawHWWLouWgen/m8yFV9
 /+zom4YKaUqgJWzJCtyQEJBvDbBB+dtYorKBDsipU85QkdRBk0NQKpjfYkmRECJdc0tB
 d4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WEtSw0e1OoCnEPOeKTHBUWYo/YNsC3SH2hpvIjNKUwM=;
 b=vVTt/WWnP97kqoOu/yLECCUbszMbPtshdPhQ4O4U6L2M+E/ob4IaVlTZHmc2fmdSuw
 wW3twl5FBFzZ0S2nf80gaDfmKPBzU1LlDEA/QGdsC7Tm7kPl9y8ORYyCzPlecZRGpCjt
 fTn0ixg7ZdFAPzI4TryGr1ADSw23oweSacuYmaw8TfadDQO+yury5Qc43JECAPjQQjL1
 R/WlPGTSw8W6uBDoAMQgua/7oUVhwAFEooxZnf5PHZtFe2WDzstOKBNmJ7VgUlhb3Nxz
 tvBHWECC6HIxYMxnUxGzfMkdNwZs4D/aAwyAeJcmRkuvWMIH0x5Dq9hE4EHiF3bBUzt8
 hGhg==
X-Gm-Message-State: AOAM532Ink0x3nL73o7Cf4e4cEry6E1Dhc3eIaxPWLuYi5bz20EQA8t8
 VYEfJ0fG9VcokTBEV3fu6V2gzOv7FVJXcw==
X-Google-Smtp-Source: ABdhPJzPnqI8fKdPHcfw2ARAeaCa1UQn4em2lkSDpL1W3TuDXTGFL/J4QfuE1xjVYkuWeSKEBgdo6Q==
X-Received: by 2002:a6b:b5c2:: with SMTP id
 e185mr28878975iof.127.1635893609244; 
 Tue, 02 Nov 2021 15:53:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/30] bsd-user/arm/target_arch_cpu.h: Implement system
 call dispatch
Date: Tue,  2 Nov 2021 16:52:28 -0600
Message-Id: <20211102225248.52999-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the system call dispatch. This implements all three kinds of
system call: direct and the two indirect variants. It handles all the
special cases for thumb as well.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 94 ++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index cdb9440a65..e784c103a0 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -40,6 +40,7 @@ static inline void target_cpu_loop(CPUARMState *env)
 {
     int trapnr;
     target_siginfo_t info;
+    unsigned int n;
     CPUState *cs = env_cpu(env);
 
     for (;;) {
@@ -87,6 +88,99 @@ static inline void target_cpu_loop(CPUARMState *env)
                 }
             }
             break;
+        case EXCP_SWI:
+        case EXCP_BKPT:
+            {
+                /*
+                 * system call
+                 * See arm/arm/trap.c cpu_fetch_syscall_args()
+                 */
+                if (trapnr == EXCP_BKPT) {
+                    if (env->thumb) {
+                        env->regs[15] += 2;
+                    } else {
+                        env->regs[15] += 4;
+                    }
+                }
+                n = env->regs[7];
+                if (bsd_type == target_freebsd) {
+                    int ret;
+                    abi_ulong params = get_sp_from_cpustate(env);
+                    int32_t syscall_nr = n;
+                    int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
+
+                    /* See arm/arm/trap.c cpu_fetch_syscall_args() */
+                    if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
+                        syscall_nr = env->regs[0];
+                        arg1 = env->regs[1];
+                        arg2 = env->regs[2];
+                        arg3 = env->regs[3];
+                        get_user_s32(arg4, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg5, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg6, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg7, params);
+                        arg8 = 0;
+                    } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
+                        syscall_nr = env->regs[0];
+                        arg1 = env->regs[2];
+                        arg2 = env->regs[3];
+                        get_user_s32(arg3, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg4, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg5, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg6, params);
+                        arg7 = 0;
+                        arg8 = 0;
+                    } else {
+                        arg1 = env->regs[0];
+                        arg2 = env->regs[1];
+                        arg3 = env->regs[2];
+                        arg4 = env->regs[3];
+                        get_user_s32(arg5, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg6, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg7, params);
+                        params += sizeof(int32_t);
+                        get_user_s32(arg8, params);
+                    }
+                    ret = do_freebsd_syscall(env, syscall_nr, arg1, arg2, arg3,
+                            arg4, arg5, arg6, arg7, arg8);
+                    /*
+                     * Compare to arm/arm/vm_machdep.c
+                     * cpu_set_syscall_retval()
+                     */
+                    if (-TARGET_EJUSTRETURN == ret) {
+                        /*
+                         * Returning from a successful sigreturn syscall.
+                         * Avoid clobbering register state.
+                         */
+                        break;
+                    }
+                    if (-TARGET_ERESTART == ret) {
+                        env->regs[15] -= env->thumb ? 2 : 4;
+                        break;
+                    }
+                    if ((unsigned int)ret >= (unsigned int)(-515)) {
+                        ret = -ret;
+                        cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
+                        env->regs[0] = ret;
+                    } else {
+                        cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
+                        env->regs[0] = ret; /* XXX need to handle lseek()? */
+                        /* env->regs[1] = 0; */
+                    }
+                } else {
+                    fprintf(stderr, "qemu: bsd_type (= %d) syscall "
+                            "not supported\n", bsd_type);
+                }
+            }
+            break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
-- 
2.33.0


