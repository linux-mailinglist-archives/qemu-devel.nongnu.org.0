Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D024C776C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:18:27 +0100 (CET)
Received: from localhost ([::1]:36082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkbK-0002ta-4N
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:18:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUu-00083S-JS
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:48 -0500
Received: from [2607:f8b0:4864:20::12f] (port=36634
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUs-0006Xs-UY
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:48 -0500
Received: by mail-il1-x12f.google.com with SMTP id e11so10669076ils.3
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DXLZp7GVZK+yie4WHT/uqpry+qSSGTFKOqK8kpW5rAI=;
 b=Rf5qF6jR1iNQSvif4/hq9sAgwPMpZvWyrR20NB4NW25GBQttnLkCF2iRADn/eumG+3
 /wIl77PV5wALPKU5dslr6Mc1JcumZ3l7UMvAIDuGdUWpmwEDWVuwIv6ViDJuGKoUTNFt
 aLCMixjmIh3kIwiYTUh95yieUhVBqUMPEBkiBwkNlGSebzdx3h9q7czwW/YJaLAgAvH0
 YHT1Qxf0gsd9IP3z8hMwn2WqmAiO1GrQeCTTOXzaJBcMWHh3yfLN/kI2M7FV4mmU7eGj
 HQ+SFUwu47oa2FttscUThlQoaNm+yyNZATxgTzt662prJVqN4UrOpxIZ3GYWSiyjxUN9
 9/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DXLZp7GVZK+yie4WHT/uqpry+qSSGTFKOqK8kpW5rAI=;
 b=WalFNVMcsvEa1IFHkozkFlaJIjGO8ydpssjdbnPs9+xfMY3BK3GcBk2BjaeDXDRo7V
 /40QjWhzzBkxvF/tQUwfAHw60dzx098h7KmgupE1DjQOEngicAToOVHZBAUK9KEpe4Db
 BPdLEpY4IzPvJX1Fd/KCnO8hIZ8qmNFk0X4agVcNyGd/LM3yqVl9ENTSHLKV2QIJEQsH
 fzXkdUrP5lMpqpjCgMgOIUDZoGlQPb/xJXT6eY7lbpWl0X/bjmtgWlU5uzTZpMR5K1OT
 A90JH0A0vSmGokdlKz8RYePRBNt4A/LvcDZ2xWQQjQHpI6KB4u6mXoSG12BQ/PDOMGqt
 MHlg==
X-Gm-Message-State: AOAM533yz6GkSYAK1yG4w/P3vaS4DufnJHvyBR0nkrNMdwJEqlYRwy61
 J5QcQkcUHzAU+Jtq1CkZ4jSiGo2NR6npDg==
X-Google-Smtp-Source: ABdhPJx+tLADwaCPgsGdm8ly3poOY48Y3r70GPvRNOp4xXzqCv6lfkBX34nP/1hUXFNi3wTNA4tRpQ==
X-Received: by 2002:a92:4b0c:0:b0:2c2:b31f:f7ac with SMTP id
 m12-20020a924b0c000000b002c2b31ff7acmr13996669ilg.300.1646071905553; 
 Mon, 28 Feb 2022 10:11:45 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:45 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/16] bsd-user/i386/target_arch_cpu.h: Remove openbsd syscall
Date: Mon, 28 Feb 2022 11:12:02 -0700
Message-Id: <20220228181214.2602-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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


