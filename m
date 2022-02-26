Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075F54C56F6
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:09:47 +0100 (CET)
Received: from localhost ([::1]:33906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0Zm-0002c6-4D
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:09:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XR-0008Co-Ew
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:21 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=34498
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XO-0000Pc-Vr
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:20 -0500
Received: by mail-io1-xd2a.google.com with SMTP id f14so10230044ioz.1
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/0Ungf5BAlJNkh7LvFfAMnGaakju4aH7gQ1ep4PqQIo=;
 b=1lBPQJv8RchkvNCqq0yO5lzgdyNLS8wSxVKPcLXaxial/2PijPW8TyyilTr9RWWMqq
 5oMz9/JyzJfiYQZvEEhi41wa5oqEGG8MXiHMqfV+Oc1LjAviDW9dLQUrL1nEPDW+6fc2
 nFP9+eQo0umOnBQw08MtSmAkUO1EoSZAg/RERlrpCqgeneS2PF3e8u/VazZvipS+HjTO
 YgXil8PGauodefirgld6mR+cZZbWvaHGqbU2jQItJ8K5enpZS8Wpk8oRtsSN4jyp/Vp2
 u+AbR5on2e0HApXHdIN2KOYaiEh5NWr/AfI2MayvkxNveYdM+Qd5JFvenSC2/olF5GP3
 fjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/0Ungf5BAlJNkh7LvFfAMnGaakju4aH7gQ1ep4PqQIo=;
 b=KO85S2CsQ6mp6v3Sp4l7tk6jGx7aKxquS9ktYUuC9YLXVzR4NglUvtFJEavsXqalZd
 Lj0vhMld5+YTVNZHZi7XLmgY0OwkF8y1ttJERJVZTI9706Nf7zjdMU8TtUSj5FckwL7i
 vYNrgoEFTBlnALe86Q8DX81epbAlEqS5y0Kdmqz8E0ZJabajdwRtzWe4KAoTHGZ0gLmg
 851mGh0v/7aTAHtkofAq0VvDqPBoTcGd/muaKggvWMs/4FoVVkTKGczusxEEhWQvTzNO
 5/KvyFSDqbeSdt9XJgDwavN8/y1QgS8b03U9pNMJeRD1THeOePTNV6MmYr76iJZALzX+
 CVIw==
X-Gm-Message-State: AOAM531YxcHyKnjYNjucnBAiElXmdU2o+4Yg9sPzzdUTaCnMP6J4I5SG
 Rbyh//xW+WtXbHF2Y2ziBUUqyCg0ui2lwg==
X-Google-Smtp-Source: ABdhPJxJYHtuZgyQi89Je4N1mQP3PNVj1Ip3mfpAx2gbPHK40exiKBHYthG9DQUnW/VE0lgbTlIzTw==
X-Received: by 2002:a05:6602:2b8b:b0:608:c584:a1b0 with SMTP id
 r11-20020a0566022b8b00b00608c584a1b0mr9334450iov.159.1645895237674; 
 Sat, 26 Feb 2022 09:07:17 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:17 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/16] bsd-user/arm/target_arch_cpu.h: Only support FreeBSD
 sys calls
Date: Sat, 26 Feb 2022 10:07:33 -0700
Message-Id: <20220226170744.76615-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we don't build on OpenBSD, only do FreeBSD system calls here. In
the future, we'll need to move this to some place like
bsd-user/freebsd/arm/mumble.h, but until then just leave this
inline. This reflects changes to the upstream.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 139 ++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 73 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index b087db48fa4..afb7814a8d1 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -40,7 +40,6 @@ static inline void target_cpu_init(CPUARMState *env,
 static inline void target_cpu_loop(CPUARMState *env)
 {
     int trapnr, si_signo, si_code;
-    unsigned int n;
     CPUState *cs = env_cpu(env);
 
     for (;;) {
@@ -66,82 +65,76 @@ static inline void target_cpu_loop(CPUARMState *env)
             break;
         case EXCP_SWI:
             {
-                n = env->regs[7];
-                if (bsd_type == target_freebsd) {
-                    int ret;
-                    abi_ulong params = get_sp_from_cpustate(env);
-                    int32_t syscall_nr = n;
-                    int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
+                int ret;
+                abi_ulong params = get_sp_from_cpustate(env);
+                int32_t syscall_nr = env->regs[7];
+                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
 
-                    /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
-                    if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
-                        syscall_nr = env->regs[0];
-                        arg1 = env->regs[1];
-                        arg2 = env->regs[2];
-                        arg3 = env->regs[3];
-                        get_user_s32(arg4, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg5, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg6, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg7, params);
-                        arg8 = 0;
-                    } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
-                        syscall_nr = env->regs[0];
-                        arg1 = env->regs[2];
-                        arg2 = env->regs[3];
-                        get_user_s32(arg3, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg4, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg5, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg6, params);
-                        arg7 = 0;
-                        arg8 = 0;
-                    } else {
-                        arg1 = env->regs[0];
-                        arg2 = env->regs[1];
-                        arg3 = env->regs[2];
-                        arg4 = env->regs[3];
-                        get_user_s32(arg5, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg6, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg7, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg8, params);
-                    }
-                    ret = do_freebsd_syscall(env, syscall_nr, arg1, arg2, arg3,
-                            arg4, arg5, arg6, arg7, arg8);
+                /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
+                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
+                    syscall_nr = env->regs[0];
+                    arg1 = env->regs[1];
+                    arg2 = env->regs[2];
+                    arg3 = env->regs[3];
+                    get_user_s32(arg4, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg5, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg6, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg7, params);
+                    arg8 = 0;
+                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
+                    syscall_nr = env->regs[0];
+                    arg1 = env->regs[2];
+                    arg2 = env->regs[3];
+                    get_user_s32(arg3, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg4, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg5, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg6, params);
+                    arg7 = 0;
+                    arg8 = 0;
+                } else {
+                    arg1 = env->regs[0];
+                    arg2 = env->regs[1];
+                    arg3 = env->regs[2];
+                    arg4 = env->regs[3];
+                    get_user_s32(arg5, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg6, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg7, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg8, params);
+                }
+                ret = do_freebsd_syscall(env, syscall_nr, arg1, arg2, arg3,
+                                         arg4, arg5, arg6, arg7, arg8);
+                /*
+                 * Compare to arm/arm/vm_machdep.c
+                 * cpu_set_syscall_retval()
+                 */
+                if (-TARGET_EJUSTRETURN == ret) {
                     /*
-                     * Compare to arm/arm/vm_machdep.c
-                     * cpu_set_syscall_retval()
+                     * Returning from a successful sigreturn syscall.
+                     * Avoid clobbering register state.
                      */
-                    if (-TARGET_EJUSTRETURN == ret) {
-                        /*
-                         * Returning from a successful sigreturn syscall.
-                         * Avoid clobbering register state.
-                         */
-                        break;
-                    }
-                    if (-TARGET_ERESTART == ret) {
-                        env->regs[15] -= env->thumb ? 2 : 4;
-                        break;
-                    }
-                    if ((unsigned int)ret >= (unsigned int)(-515)) {
-                        ret = -ret;
-                        cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
-                        env->regs[0] = ret;
-                    } else {
-                        cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
-                        env->regs[0] = ret; /* XXX need to handle lseek()? */
-                        /* env->regs[1] = 0; */
-                    }
+                    break;
+                }
+                if (-TARGET_ERESTART == ret) {
+                    env->regs[15] -= env->thumb ? 2 : 4;
+                    break;
+                }
+                if ((unsigned int)ret >= (unsigned int)(-515)) {
+                    ret = -ret;
+                    cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
+                    env->regs[0] = ret;
                 } else {
-                    fprintf(stderr, "qemu: bsd_type (= %d) syscall "
-                            "not supported\n", bsd_type);
+                    cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
+                    env->regs[0] = ret; /* XXX need to handle lseek()? */
+                    /* env->regs[1] = 0; */
                 }
             }
             break;
-- 
2.33.1


