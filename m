Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C9E3AD312
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:46:33 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKRk-0000Xh-JG
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBr-0001gS-9r
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBl-0001UP-2w
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:06 -0400
Received: by mail-pg1-x533.google.com with SMTP id t9so8580996pgn.4
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQk6J+grHW9DaaqkgSJkr7zW933EyDuzJBNH6gtlGcs=;
 b=suSbYMs7yIp+guc3RNSDsMT3zXQeM5yYei1ZLqLw8UlSgGOvym49StfFS12quacRut
 53edUfRYfgc2wGVUVnMx/rMefXGHtS/tbF07ugPWG/REw/CzwCvpIxK0wZqZWQ7zDVoW
 qvGurPO+mfoBvqVe3KXjUyrA38s15fOrBLd51DkdkRHJbA1kS9TNtWCFex13wcl+mc+S
 BXe0YjDZuK2vf0+/giapqtgHuKDRUgbzCdOJio54UWHWADR0nmLuunHIXMfoaF3Tp/aM
 xs/37Zc+qG0MlvDRyEzkr/09iZVLdP9v16nLvOK1MTCw8Yir9cNrlRpoetFrQbQLwkeZ
 c3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQk6J+grHW9DaaqkgSJkr7zW933EyDuzJBNH6gtlGcs=;
 b=Oxxw2pkut+rmbHinXyWnWuinSDNjHbkKdp3axcb5do/Ru5KNZ26hDfa8bodkgWNXSU
 ZO6csdCQ4mB9eOQD5WjFZ4mYqXV6eACd9d3/H8rDtgNt10y+95bfnlzX/rcpuK9Xusv6
 9CvMlvMvyltkvHLIiMhOwiaDeKznBQ0Ay6RCosJ5CxgIYVz2CnOiWa6lIRrBVvdCjo7u
 JWP/bXFuwjjLiPGq08gp2oTs3y2gAL1ecEraFn2aQaZXVKZ9KABV14ASp+R1cogAOt6m
 nfFYYwOLg1q5I75ThiA1FbIYaLLZi8RgqGhn74v6sGuog9dDR3fPkP7dLu9Lf1b/7otN
 j93A==
X-Gm-Message-State: AOAM530y00x+RjYLc4zFe0LVsXIPaYOInE+DudzGc0sO5TxZHYATezRb
 HyfraTWW8GXPoLYUsKx6bE9YcBIeL0ljdg==
X-Google-Smtp-Source: ABdhPJzmwcBLjatH3ChxNGxRs9unke3l1itxrtgFG43DoMAv3s1j7tq5PVpvgK8ehmqpwLhHpvIqUw==
X-Received: by 2002:a63:6642:: with SMTP id a63mr11399854pgc.241.1624044599822; 
 Fri, 18 Jun 2021 12:29:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/23] linux-user/mips: Tidy install_sigtramp
Date: Fri, 18 Jun 2021 12:29:41 -0700
Message-Id: <20210618192951.125651-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The return value is constant 0, and unused as well -- change to void.
Drop inline marker.  Change tramp type to uint32_t* for clarity.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/signal.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index e6be807a81..7cad7526ea 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -86,10 +86,8 @@ struct target_rt_sigframe {
 };
 
 /* Install trampoline to jump back from signal handler */
-static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
+static void install_sigtramp(uint32_t *tramp, unsigned int syscall)
 {
-    int err = 0;
-
     /*
      * Set up the return code ...
      *
@@ -99,7 +97,6 @@ static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
 
     __put_user(0x24020000 + syscall, tramp + 0);
     __put_user(0x0000000c          , tramp + 1);
-    return err;
 }
 
 static inline void setup_sigcontext(CPUMIPSState *regs,
-- 
2.25.1


