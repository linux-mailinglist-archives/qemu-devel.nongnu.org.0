Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC84D4C5713
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:18:23 +0100 (CET)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0i6-0002F3-Rf
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:18:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XP-0008BF-Tn
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:19 -0500
Received: from [2607:f8b0:4864:20::131] (port=37503
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XO-0000PK-3c
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:19 -0500
Received: by mail-il1-x131.google.com with SMTP id c14so6831789ilm.4
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DXLZp7GVZK+yie4WHT/uqpry+qSSGTFKOqK8kpW5rAI=;
 b=QQi0y6X9WzIWKZn+UBjtuVim268fNiGRoSe10n4ypGkyZQCDCjl++KEUCSkRHjiTNy
 Qhxa5q1LOWLnKLjxYSlRyvqyeyHxJtc7KsN6PgoEHMaBB+nD8nHTVnJXohi6k2HDObsd
 zoum8Wz+Nrrf/NEvzujX/I50PbNuG19gsUd2Xf5DVadN/zGAmOPqeBSBySkN6yyouP/Z
 ekoUWF/XPBLakQfXvYNJtkl8WG5fC9D0ZTNtAsqgpjey3XHnkQ8TBeeFIK3dTmdY7FMa
 Zwbya9JURdQI/gF+2t7xan1prGWKTGNc4Fa1uQioUKHAcYoOy2nUv2/DlIS8HLnvAErc
 n1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DXLZp7GVZK+yie4WHT/uqpry+qSSGTFKOqK8kpW5rAI=;
 b=LSqEEtuK0Rz8Tc+PzKPujF4LL8AOaRajCriKsaBdqy6ryZ8qXxwZDF35d3uElIA84F
 +VzZcEaX8UrlWC2zsrvJUBsWhrw+fNu0WwuwrnxNiNW0VCNsCFuF5jZzoJxgXkXhQ3Vk
 ydqOxKcmMB4VRzibMzsrP6/hHUcKRZfsSB43j5L/P7RSDWNflG3jVrCF8N7rdhgVsoIR
 Rai6MTSGFD3JiIfVvBPLv6TTi+Ss/CidStImZ7/nRSSV5gwGThMduZfcdcGo+Xr95CXu
 2N8NaQUiSn0Vw0SWbXed/5/xTfOs6oXoqMXmykfjYoh4PqZq0LiRXBevkUlEgZ+6HKav
 C1Pw==
X-Gm-Message-State: AOAM530No0NLDAJGGloLzFMsocKoI0gnkNYaPpZ3t3dRssKQlyHhbrF3
 g58E6cGJmte53RbcXObK7+6TdN7SUu6SxQ==
X-Google-Smtp-Source: ABdhPJznuMlaIg+9R2wgMu8itBznw0LEyKt5I39HpIseipDk6v/WtPkmPWYkIgxX4bDDgLhe2yPA8Q==
X-Received: by 2002:a05:6e02:15c8:b0:2bd:fdca:18a8 with SMTP id
 q8-20020a056e0215c800b002bdfdca18a8mr10984801ilu.320.1645895236863; 
 Sat, 26 Feb 2022 09:07:16 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:16 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/16] bsd-user/i386/target_arch_cpu.h: Remove openbsd
 syscall
Date: Sat, 26 Feb 2022 10:07:32 -0700
Message-Id: <20220226170744.76615-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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

This doesn't build on openbsd at the moment, and this could
should arguably be in bsd-user/*bsd/i386 somewhere. Until
we refactor to support OpenBSD/NetBSD again, drop it here.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


