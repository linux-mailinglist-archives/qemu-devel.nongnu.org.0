Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE2D47B551
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:44:50 +0100 (CET)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQSf-0003Dp-Ni
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:44:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQPf-0000Bt-HC
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:41:43 -0500
Received: from [2607:f8b0:4864:20::1035] (port=41877
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQPd-0002wm-HW
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:41:43 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so1237769pjp.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gmIBORhArPNArisk4J+dnmMHDstihd5iWVdGFgq2QSE=;
 b=fx1kRiI3FHvj7B+rsltpnYheGN5zPWYOhR3y++ETniBTOv7/H8WnnWsIQRngJBMzo6
 D2FfGyBYkRGwHpPL85Ps2nsNVh2Tq1D2ZT2FNfjZ/aQJQxwu+rn6sn/cw7DUhmY9bTzv
 g0Ie31aBDoYNLtmv6WatByHNSl5QuO152F+oGk5dLB9rxGBMR8Tm0qgjBnIFUhMcX2zz
 7F9HTj3aC24/OWrf/x7zLLWsSFvyCFBXZCBQkygIyq3Ea9wi04l17HZ0gz4ptlw79EIG
 FGd1A5n31WzJ7zznAxmBoGdNQqXIYmTazspqUlqxJNsAdYg7+2DxRDpqW5pt1Guf+ToK
 fRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gmIBORhArPNArisk4J+dnmMHDstihd5iWVdGFgq2QSE=;
 b=xDKSsnE1xDRSfj39ivWP70qCTPVU5kQDPJa3Ns8dp5/8reg7AqMYLzChVZbTYkVDS1
 PvurjjFhmQ7ZJNMlo1H6tX64kExE4wD8o1112W2rFF8fNJy7KYfK/TzCerAm2n35Kg9x
 gS7btyRofr+8ke6hU7j594LROYZwp/EkIZB/UNzFpqQiPsXJ94MwKeT8jQQtcPQynzW9
 QFKA+c6/buz7hMok+oWNlggiJsLr/xu0Q6BlkiMP4Qz4Olw4m1w6ULaq+A3hs0IjDVGy
 PJLYC477BcT1RNb9zENHd5c+JWUdDnZdBdHA8nKbTESZbMA8E0k62te1wRSOypDJPvNr
 KBmg==
X-Gm-Message-State: AOAM532kb95/Kp3qc4G5Yvs7CeMCxM5XsTYSVwCb71XaAgET30TYPftB
 8sIpZYw/TMl2WkawYzbAWRnYAr/45h6Y0Q==
X-Google-Smtp-Source: ABdhPJyXKXGKtAeFevDS9gxhKtgs4lmGh94/vsu22OXIA0SmQGvZI/TOzqN0T1W8uqh01rJRvU0aXQ==
X-Received: by 2002:a17:90b:20ca:: with SMTP id
 ju10mr38412pjb.171.1640036500164; 
 Mon, 20 Dec 2021 13:41:40 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id u10sm12508748pfm.58.2021.12.20.13.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:41:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] linux-user: Disable more prctl subcodes
Date: Mon, 20 Dec 2021 13:41:31 -0800
Message-Id: <20211220214135.189157-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220214135.189157-1-richard.henderson@linaro.org>
References: <20211220214135.189157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a list of subcodes that we want to pass on, a list of
subcodes that should not be passed on because they would affect
the running qemu itself, and a list that probably could be
implemented but require extra work. Do not pass on unknown subcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 56 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b93b8a4f5e..ef7a955dbb 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6336,6 +6336,13 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 # define PR_MTE_TAG_SHIFT       3
 # define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
 #endif
+#ifndef PR_SET_IO_FLUSHER
+# define PR_SET_IO_FLUSHER 57
+# define PR_GET_IO_FLUSHER 58
+#endif
+#ifndef PR_SET_SYSCALL_USER_DISPATCH
+# define PR_SET_SYSCALL_USER_DISPATCH 59
+#endif
 
 #include "target_prctl.h"
 
@@ -6432,13 +6439,54 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             return -TARGET_EINVAL;
         }
         return do_prctl_get_tagged_addr_ctrl(env);
+
+    case PR_GET_DUMPABLE:
+    case PR_SET_DUMPABLE:
+    case PR_GET_KEEPCAPS:
+    case PR_SET_KEEPCAPS:
+    case PR_GET_TIMING:
+    case PR_SET_TIMING:
+    case PR_GET_TIMERSLACK:
+    case PR_SET_TIMERSLACK:
+    case PR_MCE_KILL:
+    case PR_MCE_KILL_GET:
+    case PR_GET_NO_NEW_PRIVS:
+    case PR_SET_NO_NEW_PRIVS:
+    case PR_GET_IO_FLUSHER:
+    case PR_SET_IO_FLUSHER:
+        /* Some prctl options have no pointer arguments and we can pass on. */
+        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
+
+    case PR_GET_CHILD_SUBREAPER:
+    case PR_SET_CHILD_SUBREAPER:
+    case PR_GET_SPECULATION_CTRL:
+    case PR_SET_SPECULATION_CTRL:
+    case PR_GET_TID_ADDRESS:
+        /* TODO */
+        return -TARGET_EINVAL;
+
+    case PR_GET_FPEXC:
+    case PR_SET_FPEXC:
+        /* Was used for SPE on PowerPC. */
+        return -TARGET_EINVAL;
+
+    case PR_GET_ENDIAN:
+    case PR_SET_ENDIAN:
+    case PR_GET_FPEMU:
+    case PR_SET_FPEMU:
+    case PR_SET_MM:
     case PR_GET_SECCOMP:
     case PR_SET_SECCOMP:
-        /* Disable seccomp to prevent the target disabling syscalls we need. */
-        return -TARGET_EINVAL;
+    case PR_SET_SYSCALL_USER_DISPATCH:
+    case PR_GET_THP_DISABLE:
+    case PR_SET_THP_DISABLE:
+    case PR_GET_TSC:
+    case PR_SET_TSC:
+    case PR_GET_UNALIGN:
+    case PR_SET_UNALIGN:
     default:
-        /* Most prctl options have no pointer arguments */
-        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
+        /* Disable to prevent the target disabling stuff we need. */
+        return -TARGET_EINVAL;
     }
 }
 
-- 
2.25.1


