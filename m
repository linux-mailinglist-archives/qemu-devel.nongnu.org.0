Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41698433D34
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:18:16 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcskh-0007dl-5K
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEy-0000Gd-Ti
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:29 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:35796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEn-0000KT-7d
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:28 -0400
Received: by mail-il1-x12f.google.com with SMTP id k3so19076053ilu.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IScE42aA+GFKPVOkNbH9sy2nqrcY7YRbDTMhFSChey8=;
 b=fBGV78pDknO4yiWXg6Zv9Num3ein9d0TcHbphsgTfGZbrwefrTKNYpku8E6PEmTyef
 OxjxC1BT4mhkUfEABCuyH+p8bdydFNGQhMXysmx8umvQNnMX30Dn1OwUsYF2Fx09wWkJ
 94OElq2ZjTn3S53IjhBuvF0OkkP6WShJBwyrnS2hcY79jEu4ziLseFsMDK2F1A3ltcJu
 lSOucP+cCk9NMbF50kgYOnyXwKXzg5GyfdE6oV66PFyORS7i9JsK+dp3YFH8G3WE025g
 dWVAzGqIvCpuuVQCdb0wLc2KM3PX2emli9U8QIPZFJqNRmX5y0S4Wj4z7IttG/xQKD9P
 UMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IScE42aA+GFKPVOkNbH9sy2nqrcY7YRbDTMhFSChey8=;
 b=UtsujnHRs0CPhGGPccpozDUTgfaBkpcYN1xUtnYVomfZa0RubGWpft6v0Z3a0/tvsu
 seNe6wuwpGqk6J+dOVufLRNpkFuCPLQiZzloqMYi+72aQsImKx9+XRqWIzO4BmQpKLs+
 BBAc6sQr1weRrrlunlknl3rbzGXYC+nwQbWFs1BmLWT6DfVDb5HBZe0Hp8FQsb7HbrKB
 8YmwyUG8+DICcV+f4znTrUJAbyIGSwQQ9LcEp6+QIdc2nDEk9rCdzc1PAAewC/pv5X7L
 dDnbzkJ0UhOH/pvj1w/bxJ0xGPVebNYtrutCc7+iIH8tHxphq/RSXsjreeYuEOvGtnoX
 y2jw==
X-Gm-Message-State: AOAM532+i4xI7rptKvrzUDlGI/+IOcYIUwwjAPzB0SCzcXHJht5WZO0p
 Cw3bsaONL4eBIPawhXBO7vU/1TnsasA2jw==
X-Google-Smtp-Source: ABdhPJxb3njG2zG/ZpfT0rvTOlT9doODyDdRFM1jVrExAa3fI85tFXov1IDLYYcmoumNFlv8zKnLCw==
X-Received: by 2002:a05:6e02:20eb:: with SMTP id
 q11mr8708024ilv.70.1634661915865; 
 Tue, 19 Oct 2021 09:45:15 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:15 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/24] bsd-user/arm/target_arch_cpu.h: Implement system call
 dispatch
Date: Tue, 19 Oct 2021 10:44:32 -0600
Message-Id: <20211019164447.16359-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the system call dispatch. This implements all three kinds of
system call: direct and the two indirect variants. It handles all the
special cases for thumb as well.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 95 ++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 62d6ee89b6..bc2eb05cfe 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -39,6 +39,7 @@ static inline void target_cpu_loop(CPUARMState *env)
 {
     int trapnr;
     target_siginfo_t info;
+    unsigned int n;
     CPUState *cs = env_cpu(env);
 
     for (;;) {
@@ -57,6 +58,100 @@ static inline void target_cpu_loop(CPUARMState *env)
                 queue_signal(env, info.si_signo, &info);
             }
             break;
+        case EXCP_SWI:
+        case EXCP_BKPT:
+            {
+                env->eabi = 1; /* FreeBSD is eabi only now */
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
2.32.0


