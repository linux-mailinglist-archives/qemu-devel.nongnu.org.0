Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEC1487EBD
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 23:02:58 +0100 (CET)
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xK5-00087b-Fm
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 17:02:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wrA-0005LG-5C
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:33:04 -0500
Received: from [2607:f8b0:4864:20::62b] (port=37854
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wr7-0007rd-Cp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:33:03 -0500
Received: by mail-pl1-x62b.google.com with SMTP id q14so5839850plx.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u9uVWp3qS2YTdbd/RG5Q0Twd/YIPbK2X8Gp271zvnmY=;
 b=PmbTB+wVuUgYU6SdWHtSPpyZ4I9BcNAulhGPvTopOKe3eBpfnuIIx0ogGxsjJaIISg
 LJVM9dYnRQG+6WveDD9Jbex5WPUWSWuR4SRD9/CkobJVQ+xUjIHINfq10vAs0/YljB6F
 FvHJeQ/pmzKe8WZvCQ+pgxf1Xv6QBG+nKT72/Hwakp7HGlQABH2xeMniUCfN61ZJCrdY
 oEa+8FuNNgHMYx80XhSQz7dfv5XYXcG2ZY9DHSZ0huwSwbK9GJhmW16EMz5hsZD+Q9bR
 uqO114O3n3+Io7guG+s0Jdn98ZzhUddMYTGiP6i0V6seRr7GjQTE5d2kdMyXKgHcjndy
 j+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u9uVWp3qS2YTdbd/RG5Q0Twd/YIPbK2X8Gp271zvnmY=;
 b=s7wNBaIB73xaV3ynCUFucAf17tFnsE/0BAQsn65Q3TOdJD+kJL8nX+N2ua7kj9/AfY
 L8c1wkdsZXtwUQT7UyTKv979TeeqgLOrY1ZXNLWb9RIKsTpmSmDBQddH1lJwbSQv153a
 DNrjxVu000/ZN5rf1tmNcbHKmStZls3DC+jUFNddhFgkHX15WZuwHNB+W8eyB6QmWGLi
 rpXenZEq6yXY7StoaenlvdmgBZQ92ZUwUxTp3l2afTa5hF0qgves+LvMZtDu9F7zbtNV
 4wRP16KFkVNFzFQvLtpk6juD+uDWe9G/tJXkhP5Kc+YvDvVZ88iilTT/qWzKklHyBQqC
 AB9g==
X-Gm-Message-State: AOAM530dBb1iN1cv5j46uwzTH130NjIbQxO9zzujXvuzVfOHRMufLCnJ
 l/mv5Y/UCB7uaxuoQXN2JM1Cj0OqRZRjgQ==
X-Google-Smtp-Source: ABdhPJxrGudbd32tgYyPuuJ1znZvfachsC7I+T79a//lmrWp3GsaStwRxMmEWKBSCfh5LNr+6Xv1qA==
X-Received: by 2002:a17:90a:9f08:: with SMTP id
 n8mr14029244pjp.106.1641591178587; 
 Fri, 07 Jan 2022 13:32:58 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/24] linux-user/sparc: Use force_sig_fault
Date: Fri,  7 Jan 2022 13:32:42 -0800
Message-Id: <20220107213243.212806-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 8765ab6020..baf3d9ae01 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -155,7 +155,6 @@ void cpu_loop (CPUSPARCState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_long ret;
-    target_siginfo_t info;
 
     while (1) {
         cpu_exec_start(cs);
@@ -241,19 +240,10 @@ void cpu_loop (CPUSPARCState *env)
             /* just indicate that signals should be handled asap */
             break;
         case TT_ILL_INSN:
-            {
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPC;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.25.1


