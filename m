Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E1445527
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:18:15 +0100 (CET)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midZG-0005F9-I9
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNk-0006k9-8w
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:20 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:34371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNh-0000z3-6e
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:19 -0400
Received: by mail-io1-xd2d.google.com with SMTP id 2so3673931iou.1
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98BqBI8TmV8YvyFkZ3y+XgKQlmpyG8KzRCO1YXNy77I=;
 b=WOhdyhMPDFSG6PtfWxQ6FFJnmW2vV9sjSYfd9kPCabDrNYPNEDEoF+zBXVWd0q+L9a
 CDotICchVeI1S/Pj9Cnbjf2etzo5I3I/kJG0DOf+OB1/cOjsd9HQS5Se/VSLx/459XJy
 F7L0L1vCiHf2ji9qIEbxsE6oy4nBtR9cxSAJ8L1dVBdR3La1/ND6gvsv2sQpo/45+i7F
 LsCg80ZQdtVtvJSLQ02Sy1sI1Q7ZipERwb6tiRf+ZzM4FxJ5RdRhWNpi9kXis6Kox1sF
 P4wwMR2kwdaEYU+JBff2+kVCwK81v1KkmYfFCuxDEya3avAR7phzwevEHbBdWi62qCn/
 uFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98BqBI8TmV8YvyFkZ3y+XgKQlmpyG8KzRCO1YXNy77I=;
 b=vRAGY6viZO9ojt8d8OtgNzfE0vKs2blIBYTRwqlVwKe7I9trVkewpNeoMRnxaFhs5L
 23b79en8wkayyj7OArAw9dGGnFrWxd2uyKvCSlDHKgvog+Up0d+9uWjXbC5T+F4bN4JN
 ao7hWaCNhgjo+UckzoE+06BgVJPYZ2Q5GW31KXpJRBOUXt3Z+wQrGH92EOmD51Um2oCt
 SK8aSNbYUMAqobhnRWy+O68nVzSqUVIYPUlzaXk3K8ibXkAS0QE2h8PuoxJ+DBH+Pzs6
 rlEp9uzEpDkqKlxSrSKd+NGXAWewNm39VjN1gsUEUH9PWZYr/71rK8DOwH2u4wBwFisE
 wMCw==
X-Gm-Message-State: AOAM530czlXSr7TNdFx+RB2M6Z+7GY2LFLTD4ZbSgR/YjYtKoNPVPb27
 QjGLnlYrZMWkFQyaPN0JQ8pZSI5T0nGemQ==
X-Google-Smtp-Source: ABdhPJwcvsbHbZQyE4mDJNtTDBGtbbQGRIvMBJZ3bA4kMB/p3M3jN7fz8h+ubbQay5N6u/EBCaC+9A==
X-Received: by 2002:a05:6638:22d6:: with SMTP id
 j22mr4012437jat.97.1636034775806; 
 Thu, 04 Nov 2021 07:06:15 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:15 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/29] bsd-user/arm/target_arch_cpu.h: Implement system
 call dispatch
Date: Thu,  4 Nov 2021 08:05:16 -0600
Message-Id: <20211104140536.42573-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
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
index 905a5ffaff..c675419c30 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -40,6 +40,7 @@ static inline void target_cpu_loop(CPUARMState *env)
 {
     int trapnr;
     target_siginfo_t info;
+    unsigned int n;
     CPUState *cs = env_cpu(env);
 
     for (;;) {
@@ -62,6 +63,99 @@ static inline void target_cpu_loop(CPUARMState *env)
                 /* TODO: What about instruction emulation? */
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


