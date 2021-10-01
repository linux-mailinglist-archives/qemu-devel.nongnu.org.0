Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC4741F166
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:42:52 +0200 (CEST)
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKgV-0002EN-CH
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKY3-0006jb-11
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:07 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:41817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXv-0007lY-Ng
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:06 -0400
Received: by mail-qt1-x834.google.com with SMTP id t2so9291266qtx.8
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gXXC2XsHwTZReF8hOMB+sB2b5Bdxnek1fsOyxb7DiMI=;
 b=IDiXIR43FotQVnwcSqS87BOBZGCrbx9CkNdw9LmgnMXfbptOwA5D477gSaARsPrHxU
 +/h/1HR6S7P6d3T0F70+0/Zg3XB6GyMAg3iIgMusaRSrjs0RoHNOrXSGTR8SBqBlnv/I
 M+2Jz8DycyY0O6nTowEoNTQclxd/eJjuq6rOgjzkTontiP9a6lKnZpekX/CSjeMFwsmK
 Cib2briqVnPuLAAqDcYrJPzAAPrdDHT0T6moG9b3MwPyf1lTPeJEZOwjkZ3hHIyFByAo
 zdbe2GFhu/IQ1VNn0e80riXZJmWZjtvs6yhbX6W5sAfrW/9eJcEamWXAOv2aQF0IRehZ
 /lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXXC2XsHwTZReF8hOMB+sB2b5Bdxnek1fsOyxb7DiMI=;
 b=zeS6gezIb6ggJ1dPzKsIxdIf85QXy2rcnVHxVat8w3SfJq7y5OTjkLmpKarjFg0erG
 h5gOKqRq9M341jz0m8IN/QOpNeNbhXxg6w5M0iZGgP+ArZvzYrXKMvPANCnT0wkMbaEM
 4RaNli6pRWIPHXaZK8zceuFgNgE4NtiMrabW711oJKz9SkS1QBODoe7ANnEdQpu8R8ho
 PM7uowGcR2bhbH3Ie//oe1ksJE8Kx3FKFrri5eCXhJ2u6npYLkIOTutxktPOhWNivcj8
 HSXwQSm0Zv6X0xLi25jqM/esiUxkD0hiJ2MZnC6rW+LlQVZOlSafdrF1gex1Gf0Fgeod
 wrGg==
X-Gm-Message-State: AOAM531z5yU37MFdJ9xOT9MsqNR1QV1+cOswYpBhAliOrWv3ey/NCEsK
 7RN6JfrelFmS2xT1hcrtL2gVjuX52ZRIbw==
X-Google-Smtp-Source: ABdhPJzfGCTgGduUDcOwFaEsad8ef2PvIrp3JbTHmN5sA6KotPvror0l+19+vtNLXUBu7OVFjwYoZg==
X-Received: by 2002:ac8:4d8b:: with SMTP id a11mr13338151qtw.51.1633102438762; 
 Fri, 01 Oct 2021 08:33:58 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] linux-user/nios2: Use set_sigmask in do_rt_sigreturn
Date: Fri,  1 Oct 2021 11:33:46 -0400
Message-Id: <20211001153347.1736014-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using do_sigprocmask directly was incorrect, as it will
leave the signal blocked by the outer layers of linux-user.

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
index 2038216455..5ec63cd092 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -252,7 +252,6 @@ int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset)
     return 0;
 }
 
-#if !defined(TARGET_NIOS2)
 /* Just set the guest's signal mask to the specified value; the
  * caller is assumed to have called block_signals() already.
  */
@@ -262,7 +261,6 @@ void set_sigmask(const sigset_t *set)
 
     ts->signal_mask = *set;
 }
-#endif
 
 /* sigaltstack management */
 
-- 
2.25.1


