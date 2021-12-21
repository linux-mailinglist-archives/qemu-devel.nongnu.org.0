Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02EA47B8C0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 03:57:51 +0100 (CET)
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzVLa-0004Nv-OI
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 21:57:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEN-0003m6-KV
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:23 -0500
Received: from [2607:f8b0:4864:20::529] (port=37648
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEL-0000DQ-UV
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:23 -0500
Received: by mail-pg1-x529.google.com with SMTP id a23so11037162pgm.4
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 18:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=isjT3VM0fssSgBZyBVG7BinpIcaowlRssp8BNfIngDU=;
 b=qEMK4bV0Ey3Oi/KzFEFwGRoC/Mg1tbvFb81ieKvcru8GgS8qARGWfLjChBna+mnzdk
 QhvK1qYQQt0Uwt/M1BJHXAoMTOzlHNAyIds+4WbQ6C0tC6QOPqFA6ihEVBJ3CXm0fj93
 FJ6Fv37Rq9nsIfYXvN6cWrJWcH9A1Q9kEDzULB0yRP5BQornIe0FvL/xNxBnWpPskgFv
 hRWtw1BFm+1sXF+5orQum6eb44NH1OBbPNEFtk0NexNinpkF/YHxFFGEofkp91YoQQoN
 uHTbaLOS7efryPOofcHkl1q2dos/KGdrAR1qMarSPR8lF06iBy5YOo29kg6DeaQM6b8+
 vv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=isjT3VM0fssSgBZyBVG7BinpIcaowlRssp8BNfIngDU=;
 b=2j7yqlgK3BL4IzSOIDeWa6fqD7vEqM4ZU4/NlbWtHf5nf6Y7WWWA8ZzxG4WtKa5uIB
 a9itzcxYW03FiRwMS2EvSlcFkBjLpuyvx80raLfg1IjzHnKtzTAstUBH3UR06SqQRsbc
 xAU9yeZWvwCSSdByZAws+W7DzFVZjzzKqWDj182eZ01atsIgLiqm/l5ZWkeMrP+quUD0
 Rb0rFv1Wp8OnMDQoBpycIdOYBmJXpv3PjHpv/yK7zWyR6QMf+z6mPbqsDA7N6rG4w8WA
 6qGw+rvamVbscxAEpfnetvn5X75rCSNn70fxSvYrQMGc2INq44Ynu3RMJZbeoLI3ajQH
 Zgtw==
X-Gm-Message-State: AOAM530TqTebOkH5L0jp+U/svwRDse+aeM3joOqdlIMwO9QzMPcOehik
 kgHsadzC3grD9YqJceLuSlFw998SoggmJw==
X-Google-Smtp-Source: ABdhPJwiTIioNUlA6yBonPBwwHWK06aSxIzFm3pJRhiOfESuYQv5+HVZrImu5UJl3lOsI9yj+ZqX7A==
X-Received: by 2002:a63:8448:: with SMTP id k69mr1044271pgd.268.1640055020610; 
 Mon, 20 Dec 2021 18:50:20 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id bg23sm694025pjb.24.2021.12.20.18.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 18:50:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] linux-user/nios2: Use set_sigmask in do_rt_sigreturn
Date: Mon, 20 Dec 2021 18:50:12 -0800
Message-Id: <20211221025012.1057923-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221025012.1057923-1-richard.henderson@linaro.org>
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Using do_sigprocmask directly was incorrect, as it will
leave the signal blocked by the outer layers of linux-user.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 2 +-
 linux-user/signal.c       | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 80e3d42fc9..517cd39270 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -205,7 +205,7 @@ long do_rt_sigreturn(CPUNios2State *env)
     }
 
     target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
-    do_sigprocmask(SIG_SETMASK, &set, NULL);
+    set_sigmask(&set);
 
     if (rt_restore_ucontext(env, &frame->uc, &rval)) {
         goto badframe;
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 6d5e5b698c..8cb33a351c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -258,7 +258,6 @@ int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset)
     return 0;
 }
 
-#if !defined(TARGET_NIOS2)
 /* Just set the guest's signal mask to the specified value; the
  * caller is assumed to have called block_signals() already.
  */
@@ -268,7 +267,6 @@ void set_sigmask(const sigset_t *set)
 
     ts->signal_mask = *set;
 }
-#endif
 
 /* sigaltstack management */
 
-- 
2.25.1


