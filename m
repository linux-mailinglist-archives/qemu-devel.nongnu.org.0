Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649AD47B4DF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:13:08 +0100 (CET)
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPxz-0006MI-Gq
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:13:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPr2-0000ou-Co
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:57 -0500
Received: from [2607:f8b0:4864:20::636] (port=36641
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqz-0005wa-3h
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:56 -0500
Received: by mail-pl1-x636.google.com with SMTP id p14so2584047plf.3
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=laLwdCpLZDBORzW+YMoP8+ykSJDKmPsijwGqiemMxIQ=;
 b=Hrg73iNvS6slcYASqJUNMC//++kw2RCZTWcCeGRHMQ2Nl8tZr2k+E7B9NnGcpDSXyI
 loR8iDMHppOvzjuXyp07JCmgvgfYOEU4magTb1se3XIRu6k/b52SNAhoIxm2PhdBCATj
 oF/LKdEDqKO2WUL97Ji1m9h1fE/Ju+5QuOotNmazF9c6SfTytJMprl6uqE8AXPGJqnN/
 TPM9in5D8G4L34fTlLGnupb1DUITYTYKiOhFHiMsdNmSCp80K93zw9hG3JhN4dAtsXIz
 7ARLwuPFh0+bkRpkmLV2cROJDa2VJTJY4vPqXjYc4j2WNmQYUi7drjX86LKRZWCeps1/
 PDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=laLwdCpLZDBORzW+YMoP8+ykSJDKmPsijwGqiemMxIQ=;
 b=auSIFq87pzmjbMsB6XOnvtBcwHczZ1h8DEujTRnx1hoNf1JErIBtpTEgUWRApA5egV
 JMuNSBUH9YowsBfvUsiGv/9tTtK0RXwfNGCAKy3FJ5p7zdIH86oDHqOQHFd3EDDycYQ9
 VEDImB/XbjTF9uuF258Z0y2DQROv8ZSiIRVXnjm7u81lAeb+c/dz2jK3RcQoL4ub9gIA
 OwdxxY5hWrX4F7qh4P7qiRklB41RC9RcpNW5WZDcunwev2g1s78Jr+6ou+CbYemolCmn
 0bxAGk6JJs5pHotdOSMi9yaQVxlPyAmudPTpe2Xh0U8HTlahelG6EXnL9C1DWM5qEg4g
 muFQ==
X-Gm-Message-State: AOAM530NPDq04q3a06ZUVl2hWsk0cyrFHqskaRkTMSXohXW7rXJiXlLm
 YIgtsrV1a19ftstwKIbghvdtrouc/jR/Ug==
X-Google-Smtp-Source: ABdhPJwqmn5AQ3UrxXYKINU5TKbdNSCxkuqsWzzyhD+4TUhcpt720pE8pP8J28jUH17wUbMVKToXIA==
X-Received: by 2002:a17:90a:8049:: with SMTP id e9mr7713pjw.23.1640034348086; 
 Mon, 20 Dec 2021 13:05:48 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/24] linux-user/s390x: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:25 -0800
Message-Id: <20211220210529.150423-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/cpu_loop.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index d089c8417e..0965d3abca 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -58,7 +58,6 @@ void cpu_loop(CPUS390XState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, n, sig;
-    target_siginfo_t info;
     target_ulong addr;
     abi_long ret;
 
@@ -158,11 +157,7 @@ void cpu_loop(CPUS390XState *env)
              */
             env->psw.addr += env->int_pgm_ilen;
         do_signal:
-            info.si_signo = sig;
-            info.si_errno = 0;
-            info.si_code = n;
-            info._sifields._sigfault._addr = addr;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(sig, n, addr);
             break;
 
         case EXCP_ATOMIC:
-- 
2.25.1


