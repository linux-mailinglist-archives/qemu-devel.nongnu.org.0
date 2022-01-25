Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90849A21C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:47:12 +0100 (CET)
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAvP-0008Ud-GN
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAeu-00024O-IY
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:08 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=41736
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAes-0001YA-Ct
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:08 -0500
Received: by mail-io1-xd2f.google.com with SMTP id q204so7308613iod.8
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+79e/lT5oImcwf0ZHJypaQ4U50180OWSu5YZS9+fYVQ=;
 b=EjRj29hi4V6Mtk1iYrs1FP8XN91HaR9TA8ijpGknfsT48FG+yi+b+ZjWUarxv1ApyR
 RUuKJFU1Gx6ynm6VkRW0YtfqKEgmP5uhlwxGf2kIjhEQMDLP35Dx5RvK25I2wgxKCrcr
 nU3kZZpTZV7Xw/ffByVh0CzNdtXsSp1Oxj9IXpJ3fbxNoxzsYsqFFY9IPeVjY7mp6FAA
 WQDiLk+p2QHjbsleCnTOF/NGveLVTAYtGds8qdVf7UJF6GRCzcy1/tJvc/X4KmKsSLkk
 vbNFysDJEpdC1VjM4dQmW4fNs2klZG4m00JzTFDK71UYR0KfNFqyaCiHe+zvZOL+8JpD
 PZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+79e/lT5oImcwf0ZHJypaQ4U50180OWSu5YZS9+fYVQ=;
 b=dzbyPwiYwdYWyV3j1XGU3xNKX0zF+2O/7EFbBts6pt/XTD2tw+uPLNngJd6lF+oE9B
 1DZJu48yYWzSWLDx0k+lNM9tWaZj5tPO290HjxH8c6EyBxSIJUp+gxPj//DsENhO7AQg
 V3mwKNhzLd8MP9jpyYR658Q2OzxM+d9IeEMc29WaPaeT1Z+jk/ipirWVqmr/pw6bbC+M
 Pe2dJbajiARuQytBRHKd2T08Z6zbNGdGwo6gD9Uh3G8VW0T1lrrd+T+b+yq11yczPpAv
 Rd1/jddOgoPq2uDD5U9Fct42XXtbWvWJ5kEKb6vqK9AJA8yTDNeKRRtkK6bcZX/JufC6
 rBLw==
X-Gm-Message-State: AOAM5306c8lkylAYiGFG8FVFjuncXKZgCWyo+/Aemw/SsA4bdBC/TBIN
 A1bZIs+JY+dLG+BJXXBrmck88BxDINm/gg==
X-Google-Smtp-Source: ABdhPJwF5JyHU4gbtik6yKU0uYm0Ww2LOQHErXHcfRBjoAtlfwJSqg4LCul4fL3gKRyxongcfCEU5A==
X-Received: by 2002:a05:6638:3009:: with SMTP id
 r9mr7997480jak.261.1643074205196; 
 Mon, 24 Jan 2022 17:30:05 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:04 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/40] bsd-user/arm/arget_arch_cpu.h: Move EXCP_DEBUG and
 EXCP_BKPT together
Date: Mon, 24 Jan 2022 18:29:19 -0700
Message-Id: <20220125012947.14974-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement EXCP_DEBUG and EXCP_BKPT the same, as is done in
linux-user. The prior adjustment of register 15 isn't needed, so remove
that. Remove a redunant comment (that code in FreeBSD never handled
break points). It's unclear why BKPT was an alias for system calls,
but FreeBSD doesn't do that today.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index c526fc73502..05b19ce6119 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -21,6 +21,7 @@
 #define _TARGET_ARCH_CPU_H_
 
 #include "target_arch.h"
+#include "signal-common.h"
 
 #define TARGET_DEFAULT_CPU_MODEL "any"
 
@@ -64,19 +65,7 @@ static inline void target_cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_SWI:
-        case EXCP_BKPT:
             {
-                /*
-                 * system call
-                 * See arm/arm/trap.c cpu_fetch_syscall_args()
-                 */
-                if (trapnr == EXCP_BKPT) {
-                    if (env->thumb) {
-                        env->regs[15] += 2;
-                    } else {
-                        env->regs[15] += 4;
-                    }
-                }
                 n = env->regs[7];
                 if (bsd_type == target_freebsd) {
                     int ret;
@@ -171,14 +160,8 @@ static inline void target_cpu_loop(CPUARMState *env)
             queue_signal(env, info.si_signo, &info);
             break;
         case EXCP_DEBUG:
-            {
-
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_BRKPT;
-                info.si_addr = env->exception.vaddress;
-                queue_signal(env, info.si_signo, &info);
-            }
+        case EXCP_BKPT:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[15]);
             break;
         case EXCP_YIELD:
             /* nothing to do here for user-mode, just resume guest code */
-- 
2.33.1


