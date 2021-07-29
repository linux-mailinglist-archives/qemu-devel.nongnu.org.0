Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3F3D9AA1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:54:54 +0200 (CEST)
Received: from localhost ([::1]:46208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uK5-00062k-Pc
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCU-00045J-Rb
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCT-0002Rz-25
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:02 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so6690885pjh.3
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yhAtrV/9uFYVM8O/1WDSK0KdO1d2dNUsWgKHtvQ0myo=;
 b=kchU2EirxH9i3gMVNZDdkMHDtIshxAKB37iWboO77rk0/IC7E49lUIpK/TElBNf3gS
 iFniBCS3CZ3T/BS8ytM5vMoubNM9Tap2p3AeIsXdO2HhKUEnzoBGyzF7x54jGWYQQajN
 u2nOgAUDQiilJq8+P1SuuwHhqthyZvSOCYJjGpIsXFlHyS3LCvR1ri6ogRPrWJai07ru
 9gSdkmt2NDlPRAl+7+LcWH8DtGo0j+c3sZrAoB47VObdcXJ98xcloII5uoY7roetCZKK
 w0uYraJSBV7wYp0NbJvch7pWZfkui3mP+Qbf0sJmQZYnEcp6mshyBf6CncbV4eS6wghT
 445A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhAtrV/9uFYVM8O/1WDSK0KdO1d2dNUsWgKHtvQ0myo=;
 b=Eqjz+vM13PWJEZioS6hnU2t26YqhPEpFDMHzWODHRDSSQBNr5XuALOxffpA96p7g8k
 KjhYeGuomlK8ZMmVmnudqH3sJo29T2hORFYY0ctvuwOOR3k1d8a40RFntmeoGerH/xEj
 SQNAYv/YSlW/ti3d2ZBS56D662qZQmOJXGU/XFrF+oYW0Y+bkKl2nMfTVf6tG74UOX08
 45mXFcTrpRHWq0i+5irqII9K5lxFm7F98TutSeby9loh9mbig+KdWa9cpQBZxNsvbHbP
 /bJTiBEPtOIcv9tXJaNUUD5uX49emXGkZtiOLcrFC1eNAZoews+2PxbQCgsMiVzjt3CT
 k9Yg==
X-Gm-Message-State: AOAM533Qa9OtlK+6Nj2QCJcGXlFp8o9Ys8T8VSJrHJ3B0FnILYnDcTrK
 fBoyGC0ts6pvARHZvSzrvfUdnZ9nA/kutA==
X-Google-Smtp-Source: ABdhPJwRmXQ6ZgDRg9/yQ3BmgsqBJOl9uGFydgkmzZ4ScvGoizVBRvXIW4TBk4jA/Gg7AwOq0hKFgA==
X-Received: by 2002:aa7:9af7:0:b029:32b:34a7:2e73 with SMTP id
 y23-20020aa79af70000b029032b34a72e73mr2285625pfp.62.1627519619689; 
 Wed, 28 Jul 2021 17:46:59 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:46:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 08/43] target/ppc: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:12 -1000
Message-Id: <20210729004647.282017-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-ppc@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/ppc/cpu_loop.c | 2 +-
 target/ppc/cpu_init.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index fa91ea0eed..d72d30248b 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -165,7 +165,7 @@ void cpu_loop(CPUPPCState *env)
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
             info.si_code = TARGET_BUS_ADRALN;
-            info._sifields._sigfault._addr = env->nip;
+            info._sifields._sigfault._addr = env->spr[SPR_DAR];
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case POWERPC_EXCP_PROGRAM:  /* Program exception                     */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 505a0ed6ac..84fb6bbb83 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9014,12 +9014,12 @@ static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
+  .do_unaligned_access = ppc_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
   .cpu_exec_exit = ppc_cpu_exec_exit,
-  .do_unaligned_access = ppc_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
-- 
2.25.1


