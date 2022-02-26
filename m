Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE04C56F7
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:12:51 +0100 (CET)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0ck-00080V-I4
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:12:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XO-0008Ad-Ix
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:18 -0500
Received: from [2607:f8b0:4864:20::d34] (port=44714
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XM-0000P2-E0
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:18 -0500
Received: by mail-io1-xd34.google.com with SMTP id h16so10147384iol.11
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ogh2FUndj4MIrU/iCsiac6cM3XenhFOByuX1UWjQajU=;
 b=QdAV35k3dEpHwl0UbI/EdisXfG4BGKbms09x2arWdhe0+MXc6aEU9ov/FjI8y2u6mO
 AFr55MPWKPp68gVz23cd/W/Y6tXhGjva9MnIuzb+IBEAFMeeLZb35bXI0bB+wUY5EGGw
 vrVJAOUI229My6K9JqbCHkFtfuV2SXkonb6gXbOgiaTizYNm56wY061BerzM94cbV9Lt
 wFVA0fhKXgv6bejaplvvDvCVNr2hn4yqOYzF7sSmbLt7zXf0RbkvR9XMnok4saOgPZAS
 4A/TgB0jxEeebEMM6Mj0WkyaNgQhvPuT86/XQlY/BnFAqcfRuzDwtKEMgMcvJqWMGZEM
 JS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ogh2FUndj4MIrU/iCsiac6cM3XenhFOByuX1UWjQajU=;
 b=ODEc4Sup+MuU8ql67+evmtqLGfPv+JBy3s+rs2AGlES0IWNAD0XS1raY0NTJLZQ9ij
 90siBencw5lN0t8IRrtFovzrzXw4osuIYF8qq7BBOUUyBQpNgg8DjR887WgemTt6M4bv
 swkA2qpXjn5juIPxydkX9bAkt66CbVkwcA9lAbuqvesRdYdraziBC5x+QUVqeQDAk1sl
 1g2omPI46QeJq+SJ4clqbej52TUDQUxKoml0mUn+FDQ4GxoDTzHWvmJqjdWhGvgq5n/0
 RCKTdNmW6vfSHfItlf6FdXx8nKHXvtvFqWI7cfwlNE7uWT6OjVveIsea4yA6Qegw5VFb
 LzpQ==
X-Gm-Message-State: AOAM531PWNHfqPD6Hx1RJhj0p2eFwXOjrH3bQ2kQO2SKNK+LHA+XfkUd
 CPxh9wHzvePtWrW885F/623MArKqaH7rfQ==
X-Google-Smtp-Source: ABdhPJzRrP8IVn0Jb6vKp1n/a6QYHDpoBiTMN/dCBJXJmoEwEPtdaLqZ9T58o+HVLeV40c+4uaqeIA==
X-Received: by 2002:a5e:930c:0:b0:641:7453:fdb with SMTP id
 k12-20020a5e930c000000b0064174530fdbmr9356540iom.184.1645895234993; 
 Sat, 26 Feb 2022 09:07:14 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:14 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/16] bsd-user/x86_64/target_arch_cpu.h: int $80 never was
 a BSD system call on amd64
Date: Sat, 26 Feb 2022 10:07:30 -0700
Message-Id: <20220226170744.76615-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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

Although initial versions of NetBSD did use int $80, it was replaced by
syscall before any releases. OpenBSD and FreeBSD always did syscall.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_cpu.h | 58 -------------------------------
 1 file changed, 58 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 0a9c0f08946..9dc52d5afc4 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -124,64 +124,6 @@ static inline void target_cpu_loop(CPUX86State *env)
         process_queued_cpu_work(cs);
 
         switch (trapnr) {
-        case 0x80:
-            /* syscall from int $0x80 */
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
-                params += sizeof(int32_t);
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
-            }
-            if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
-                env->regs[R_EAX] = -env->regs[R_EAX];
-                env->eflags |= CC_C;
-            } else {
-                env->eflags &= ~CC_C;
-            }
-            break;
-
         case EXCP_SYSCALL:
             /* syscall from syscall instruction */
             if (bsd_type == target_freebsd) {
-- 
2.33.1


