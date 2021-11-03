Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D7544432C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:14:24 +0100 (CET)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miH1z-00029y-5G
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwi-00029J-E5
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:56 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:39648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwe-0004wu-VH
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:56 -0400
Received: by mail-qk1-x730.google.com with SMTP id bk22so2365720qkb.6
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cq+EqsUr6Fk7YRDOR1iWeMyRL/11b3e2J0Pnd4eMUrQ=;
 b=z8omwNMrodohDHkiauqS99L0gCILRKBYvNtDCqiAhsW04VpfxAv/MCLZ5wp4+lVCxI
 M/SzkwQm7u4dGJlA/mxcJT8NKUkcITv/CjVVpqElsrDS1zuEfOSOpROtQ+lnaB+eGQjh
 E0LDbXYUMhx3fFblsZfdHqGpF2YZmpTSm/bgCww00xpt8ecv4dM6X/pFXyg0B++yLdxi
 4TMkkTzIogXplsPW8fsQcE+aH+VM/SkGqBG421YHpDMGUtecjrC19REVF6aMo0kImgdx
 qDF0+dnJSV1HPqhITOyhN2Jy70GTudJYJ+ICFOD0GYs1myT7OOZ74SS7CWiZ8cVKKDjP
 OhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cq+EqsUr6Fk7YRDOR1iWeMyRL/11b3e2J0Pnd4eMUrQ=;
 b=cATx1wct0vbO45KARZ7jDKKYIFbPZ+8jd8Irr2P8sfb+vlOAsZ8CXUMYRY12XEEcaW
 hfpR4lhMZMHszGqXdIYbDTLDinWEFIafrOFbskbyLbAJeCsYYmOGb2hVYXH+Tl7JnVu0
 eQ0OrzG5/dblU0mrYu4AdjdEXbSdHfYqlc2RqbxPTORfxq1qA+RgH9Rili1E82cWrJ4H
 YZIjiLMkzd1uUS+dJ9dKXgWmUiAl9Lp9Bo2Kl+jZJzoghDaUnQxsMgWoqvyor/J4+bKn
 fx3oFFEAx+M7ubjHTGkeAYctTwFlVYPY/0v0ZY5kdVyDjo6KdiSFeczo/fx/cex4JPBj
 /q5A==
X-Gm-Message-State: AOAM533O8hOvwiF1ExDXX+Khn/l8RN9FknlyErffE3SFIlvoni5krCLT
 gzth1WALtXWFkNPf+eR2G6EjTpAWKaUtBQ==
X-Google-Smtp-Source: ABdhPJymgZJPyRFXAEi5k0NbWgoDylTwNcVYi94G9cmScCUF4r2Ju94U+dJsPV3yifSUBCYeGeqBIw==
X-Received: by 2002:a37:614:: with SMTP id 20mr2213299qkg.403.1635948532025;
 Wed, 03 Nov 2021 07:08:52 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/23] linux-user/hppa: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:29 -0400
Message-Id: <20211103140847.454070-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.  Fill in the missing PC for SIGTRAP
and missing si_code for SIGBUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 375576c8f0..b09caa1111 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -110,7 +110,6 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
 void cpu_loop(CPUHPPAState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     abi_ulong ret;
     int trapnr;
 
@@ -147,26 +146,15 @@ void cpu_loop(CPUHPPAState *env)
         case EXCP_ILL:
         case EXCP_PRIV_OPR:
         case EXCP_PRIV_REG:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->iaoq_f;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
         case EXCP_OVERFLOW:
         case EXCP_COND:
         case EXCP_ASSIST:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->iaoq_f;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->iaoq_f);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
-- 
2.25.1


