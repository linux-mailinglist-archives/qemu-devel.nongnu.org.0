Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD274A5B4A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:36:21 +0100 (CET)
Received: from localhost ([::1]:34798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErSO-0001TS-6E
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:36:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7n-0004vt-Nq
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:03 -0500
Received: from [2607:f8b0:4864:20::132] (port=46838
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003Wu-64
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:03 -0500
Received: by mail-il1-x132.google.com with SMTP id e8so13933477ilm.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nc0IiVmtMU6CkZSHSIc0Rennc5vkDh9M9cpSmLz0+iA=;
 b=hNDvjT4gF3dc0aIN0ndnGbDiCJffPgbxmHZaRa7Ft8yEtsF5aTS04sM3fALUTvq5yK
 MoOoXSXAl7WniUA11PbjT5iQai7TlTD1hpkMhOPykJ0J1exSb/WwuRXr4Mh3Q34YHjNa
 pOOd+nDnjgzFmQshlnIhP8SxXSnPu6hCkmnKiLL3soRaEEj+p2opinNJSctKycODzv1e
 QCWzBf143Okq247DAerC9EX5+4j9u28Avq8QLAO0J84sYwOfLZu0YrEzMPQbP/JFaoZU
 ko1s/6D78mbWaxBCOde/UHgcx8k5XTTPQFe/suyq1HahoDVRrwL9Q7YPEoN4sxUr5qNy
 0NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nc0IiVmtMU6CkZSHSIc0Rennc5vkDh9M9cpSmLz0+iA=;
 b=EWt7FdT9qMrtYv4HR17nmdWs9Eo8Dke/Djywo9/xGh9ARbzrCm1oU88u/8yLwfTkx0
 5tgDRWGsZYWwjCaAcPyZsh7ikCuWd9quKs61Kdur423spRsM7Ib0tEOh2+e0VMTjflzZ
 guu2XNF4O3YWLpuGfTlmxFJS7/4ZLv8c2x+QwuAHV+Di90zVXcww7Fcl4GYlB+C2F9mk
 1HyZWN31M0HTLgYlPJBquaVkuEjlYOdsLW6y0zZ/w1BtYSlero0MSD2wjGkI7PJ7dLa6
 CbZD6aYTbffs0qYbvRa9PEaw371CzAcHLaLfLxOT1GWWUXcLDdDHtQiDy8ripNvSL58x
 P4VQ==
X-Gm-Message-State: AOAM530UiycDPQk0w2DqKI4m5+Ny6muJ7OoOg90/EKmNmDKlyIuY7ucn
 FBvm6lkyCmk9rhCW3uZW0S8rbU1v+Baq5Q==
X-Google-Smtp-Source: ABdhPJxxUsGhj7JN6fLTJFYXkaLJampETLlFmPK1Wl1yCkNSV3V59zKEwXhtFEnTUbt7cLiPz6OLiA==
X-Received: by 2002:a05:6e02:17c6:: with SMTP id
 z6mr2224260ilu.229.1643714090672; 
 Tue, 01 Feb 2022 03:14:50 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:50 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/22] bsd-user/x86_64/target_arch_cpu.h: int $80 never was a
 BSD system call on amd64
Date: Tue,  1 Feb 2022 04:14:35 -0700
Message-Id: <20220201111455.52511-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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

Although initial versions of NetBSD did use int $80, it was replaced by
syscall before any releases. OpenBSD and FreeBSD always did syscall.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


