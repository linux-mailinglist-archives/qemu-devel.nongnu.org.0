Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23964A5B60
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:45:46 +0100 (CET)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErbV-0005FE-PL
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:45:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7p-00052i-LY
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:05 -0500
Received: from [2607:f8b0:4864:20::12b] (port=46832
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003X4-Av
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:05 -0500
Received: by mail-il1-x12b.google.com with SMTP id e8so13933546ilm.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7HVIeHMlsKUNdUJ9jwdOaK4GYXpGEwWjSdWL1V6hnI=;
 b=8DZ+yuRLkG/0qFa95ZC+FwWk/HCn5+J98AroEsBzeHscKq+JntGpj3Rqx/8M00j1lg
 4iWoukz+a30cxeLWoXeWnSMVwkMp7Fp1fIQ9fahuHX10EBXE3I3lqE2QukDM6qbSVSya
 VTBm0WBhceMewHaZ42SKiMLVJAzfr02d/u9QGCb0GwvGbKfLfXAACUn3BEFOFhnWaEdv
 oTNO9j4Ag2J9QwCMUpQrIZh55YuMD/hClFZTgT2XwtQaoBnx7nWwgbedZzjNT+cMyYvq
 8dCmvATo/yZfAhAFvWnHHF7ml55ihX+nSHmx1KfwjltWqM2AXdNCvxiAZL9oX59e9TId
 5C6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7HVIeHMlsKUNdUJ9jwdOaK4GYXpGEwWjSdWL1V6hnI=;
 b=4qPj/IshacxgP3Nw6GhvbviHXEOi3ccl2ieRTxxehmwYn9t6Z71LCiP8b6J6kW92YX
 XjZoGxdIsbbaWC3vyvGoxSI7uDRn6v5VoZ8gN+CwTGS/5VLoHzx1Url4KD2Geg2KPoFN
 I4/F9OhLU1xX11JcBAeG2cXd6zIjj16mN95E9lJETp7KzG8rY47mufdVqJWIYh6Uh27t
 NCvuMTbW8BNQsHDZux/k7DubsG4LGZ+gyCIBAOO4SYJ8kQa/Y7v2D3b8VYCunTACO+dj
 yX6qY8IlRynOrCTTrBhJnlsYQ6bbNBiSP5vZm8EvQX8QjPY4yrD72qXAOA76Mpnbooj7
 vLvw==
X-Gm-Message-State: AOAM531zMLGRLXJVnfTRnNR3LKFnwLnjxAfrFI1A04GT60qpFpGrJbJn
 0pwUStUDr00jRd4dqBIchybMcOtNiYY8zQ==
X-Google-Smtp-Source: ABdhPJzvJj9/8C8oyN9mc+Dvz/IMZec7oHLlmCrr+0xdlSboJxxbgTlDhq5TT4dRnAz7wiSDIfZIqw==
X-Received: by 2002:a92:b70c:: with SMTP id k12mr5919338ili.210.1643714092635; 
 Tue, 01 Feb 2022 03:14:52 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:52 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/22] bsd-user/i386/target_arch_cpu.h: Remove openbsd syscall
Date: Tue,  1 Feb 2022 04:14:37 -0700
Message-Id: <20220201111455.52511-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This doesn't build on openbsd at the moment, and this could
should arguably be in bsd-user/*bsd/i386 somewhere. Until
we refactor to support OpenBSD/NetBSD again, drop it here.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch_cpu.h | 84 +++++++++++++++------------------
 1 file changed, 37 insertions(+), 47 deletions(-)

diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index 3cbf69d8af2..9da22202d48 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -116,55 +116,45 @@ static inline void target_cpu_loop(CPUX86State *env)
         process_queued_cpu_work(cs);
 
         switch (trapnr) {
-        case 0x80:
+        case 0x80: {
             /* syscall from int $0x80 */
-            if (bsd_type == target_freebsd) {
-                abi_ulong params = (abi_ulong) env->regs[R_ESP] +
-                    sizeof(int32_t);
-                int32_t syscall_nr = env->regs[R_EAX];
-                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
-
-                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
-                    get_user_s32(syscall_nr, params);
-                    params += sizeof(int32_t);
-                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
-                    get_user_s32(syscall_nr, params);
-                    params += sizeof(int64_t);
-                }
-                get_user_s32(arg1, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg2, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg3, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg4, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg5, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg6, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg7, params);
+            abi_ulong params = (abi_ulong) env->regs[R_ESP] +
+                sizeof(int32_t);
+            int32_t syscall_nr = env->regs[R_EAX];
+            int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
+
+            if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
+                get_user_s32(syscall_nr, params);
                 params += sizeof(int32_t);
-                get_user_s32(arg8, params);
-                env->regs[R_EAX] = do_freebsd_syscall(env,
-                                                      syscall_nr,
-                                                      arg1,
-                                                      arg2,
-                                                      arg3,
-                                                      arg4,
-                                                      arg5,
-                                                      arg6,
-                                                      arg7,
-                                                      arg8);
-            } else { /* if (bsd_type == target_openbsd) */
-                env->regs[R_EAX] = do_openbsd_syscall(env,
-                                                      env->regs[R_EAX],
-                                                      env->regs[R_EBX],
-                                                      env->regs[R_ECX],
-                                                      env->regs[R_EDX],
-                                                      env->regs[R_ESI],
-                                                      env->regs[R_EDI],
-                                                      env->regs[R_EBP]);
+            } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
+                get_user_s32(syscall_nr, params);
+                params += sizeof(int64_t);
+            }
+            get_user_s32(arg1, params);
+            params += sizeof(int32_t);
+            get_user_s32(arg2, params);
+            params += sizeof(int32_t);
+            get_user_s32(arg3, params);
+            params += sizeof(int32_t);
+            get_user_s32(arg4, params);
+            params += sizeof(int32_t);
+            get_user_s32(arg5, params);
+            params += sizeof(int32_t);
+            get_user_s32(arg6, params);
+            params += sizeof(int32_t);
+            get_user_s32(arg7, params);
+            params += sizeof(int32_t);
+            get_user_s32(arg8, params);
+            env->regs[R_EAX] = do_freebsd_syscall(env,
+                                                  syscall_nr,
+                                                  arg1,
+                                                  arg2,
+                                                  arg3,
+                                                  arg4,
+                                                  arg5,
+                                                  arg6,
+                                                  arg7,
+                                                  arg8);
             }
             if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
                 env->regs[R_EAX] = -env->regs[R_EAX];
-- 
2.33.1


