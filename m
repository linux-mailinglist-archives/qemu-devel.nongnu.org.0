Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9214947B4BC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:08:08 +0100 (CET)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPt9-000336-Nd
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqi-000084-4n
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:36 -0500
Received: from [2607:f8b0:4864:20::530] (port=42896
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqe-0005sj-Ky
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:34 -0500
Received: by mail-pg1-x530.google.com with SMTP id g2so7853168pgo.9
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nlfMa3uLcCkh+T3g7LsRxXaJmvJxKY8lfYOrMw7+gaI=;
 b=CVNxuUUQ8ySBdygCRof3fYHri1OVqTLp04xF1FhKmNN6tIAOanbKE7WelEJlIWyLWB
 oKiA0NRdbU6fh7VJjASUAElUR64/fdXQsWgnJhz8DnYr9N1RviW6ZSKRZlTz+3o4w5e1
 Rtgc5EYRY+nVoHYdNaa8EMlEfxazBpnJ7EOwaKMGRa+535+4COw9E4uYwYGC8uV++TBH
 3XclSAAqoeVS2JEGSZqhd3qy/wiOUNOBlaPA34aki+uMV0lefv78BrSRLMJfneSXT7yE
 7+Dri9+jWj5RuBX3toi8quA6bkc+/LkNF+09B8RsSNFFbLA5gAtpiVNY1I2mj6DedxwY
 7p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nlfMa3uLcCkh+T3g7LsRxXaJmvJxKY8lfYOrMw7+gaI=;
 b=GY0A3WIQ9J+vQRpJ+3RwFA7KGCseLxUyO4PQAt0PHxSIjR7JwYtItUAHjeL9GnOl7a
 kWgljJoHkOQQA0t1KiGUoOgd9N4PW65aTu5lMtP+iOHkzLpdmjXW8fzUsHvgH0CVm6Oo
 vRQVEfkn3vTmGH9Q9JlPNIGg4IBVIofh4kPFlnx2OAvnMrtx1Gp1w2UASqIc/vugyrun
 7oDHT7l+Xe+AJCcFLxq+j6J7x5PA286jeK5/6us2nxhHCDjRXPHJd1yPgn5Xlx2Pls81
 tawJe8v+RMNot1jaiwA+IDEOzagHW6+XJoXmTSaCHEc30RRP3EbUTVyMJZxdJvr7cbTg
 xAvA==
X-Gm-Message-State: AOAM531zyYPjeUmPvho9dD3Hn/hjecEIcBOIkk8eRuYxY2krY9Duv/rw
 jolWHM60gMcxa7sb8YrthziutY6qrs3YQQ==
X-Google-Smtp-Source: ABdhPJw/Kgw7AaycQQLz5soiGuhz9l/XW8xkM9OvXsawJG/utc0e2EdpHML9XvqHUwTO56+Xhbauog==
X-Received: by 2002:aa7:9e9e:0:b0:4bb:39a:b85c with SMTP id
 p30-20020aa79e9e000000b004bb039ab85cmr2332652pfq.68.1640034331182; 
 Mon, 20 Dec 2021 13:05:31 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/24] linux-user/alpha: Set TRAP_UNK for bugchk and
 unknown gentrap
Date: Mon, 20 Dec 2021 13:05:05 -0800
Message-Id: <20211220210529.150423-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

These si_codes were changed in 535906c684fca, for linux 4.17.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h   | 1 +
 linux-user/alpha/cpu_loop.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 0b13975937..bc18a4f248 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -715,6 +715,7 @@ typedef struct target_siginfo {
 #define TARGET_TRAP_TRACE	(2)	/* process trace trap */
 #define TARGET_TRAP_BRANCH      (3)     /* process taken branch trap */
 #define TARGET_TRAP_HWBKPT      (4)     /* hardware breakpoint/watchpoint */
+#define TARGET_TRAP_UNK         (5)     /* undiagnosed trap */
 
 struct target_rlimit {
         abi_ulong   rlim_cur;
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 4029849d5c..b039369198 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -86,7 +86,7 @@ void cpu_loop(CPUAlphaState *env)
                 /* BUGCHK */
                 info.si_signo = TARGET_SIGTRAP;
                 info.si_errno = 0;
-                info.si_code = 0;
+                info.si_code = TARGET_TRAP_UNK;
                 info._sifields._sigfault._addr = env->pc;
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
                 break;
@@ -155,7 +155,7 @@ void cpu_loop(CPUAlphaState *env)
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-                    info.si_code = 0;
+                    info.si_code = TARGET_TRAP_UNK;
                     break;
                 }
                 info.si_errno = 0;
-- 
2.25.1


