Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EBF36AB00
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:13:02 +0200 (CEST)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1largD-0004Zs-99
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNo-00086I-UA
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNe-0007bs-G0
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:00 -0400
Received: by mail-pj1-x102d.google.com with SMTP id md17so724976pjb.0
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oLZDiZ0zf6r7oWF0NJt4N2+o2lynddysuK7PTnY81v0=;
 b=o4805519ByPZU79JPt2HYI8qxs+VWFyf5UZVbgpbWWYxOthRiHABYB2C5k2FPd3evU
 U0FPrriV+fk/rT4AeDWX0KoN68i6974loQwjLvyFtamjSkgWTtSLWYgemZ3TPDxyDC/Z
 75nsKEf62H8XNr5+LFxKuCjhZHvUQG2czbCZIz2q/PA/cYAOPjCTVdi3dkYnMsXQZwR7
 NUdQGWgaHfsD6mXYtYW2rLPHq4ith0qYYqzlyij8XozVijFPRJrisdOC1H1KZwindhtH
 yg3Gg6dEL/V/sd8iQXqoAbsZvuE3EWMx37WkL8o87zXpjev59uRZ8OYqblTMsSJl4Gpe
 /viQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oLZDiZ0zf6r7oWF0NJt4N2+o2lynddysuK7PTnY81v0=;
 b=fSINyT6DaB+Oa4WzKS71wJivMYxJXWSUafreBkXQWw/mbDvdAJ8gnShGZcy3DXlR52
 GUZz4Ny0jO1FZo0A2ELaaReU1FPzPgjS5S7pOY/VBHmGNlCWJyxNQ5gsmwL+HItcNyfw
 CQ5+HVThwbPTOqUMrjz7lOSETsSaFyShRfnHQ2altgG1ZuNoz+mTRJd1bBQgYK2db2dY
 xgFL1MFdEElme1Z7BekdA+QJFMLvKQY4iRG+hJfgsJGL8y/IoEanmwrtaMSresGLsY5m
 pDz+vgNnuHEFHXXz8KOxPN4VoK/kB+yi0Wdhq6HNL4vdxuhM56ESDm5XCElwBc0EC387
 U9Og==
X-Gm-Message-State: AOAM5313IPsrO1yhZ5C5KW52BNdDf7Q8tA9ECDGLmHkbPBgEGMm6OrkC
 eNRH7pMA2i6fe/Wm3bEgmN8hI16rnj0FyA==
X-Google-Smtp-Source: ABdhPJzFISCV8b57wMX4jOltbCObIcP0b7HgKxwbOTUjy+uonOTPLG+RsJZ1LNQLLb8Li3/2VOA6UA==
X-Received: by 2002:a17:902:cec1:b029:eb:66ee:6da0 with SMTP id
 d1-20020a170902cec1b02900eb66ee6da0mr16649361plg.84.1619405629187; 
 Sun, 25 Apr 2021 19:53:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/25] linux-user/sparc: Clean up setup_frame
Date: Sun, 25 Apr 2021 19:53:29 -0700
Message-Id: <20210426025334.1168495-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up a goto label with a single use.  Remove #if 0.
Remove useless parentheses.  Fold constants into __put_user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/signal.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 4a0578ebf3..f0f614a3af 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -192,14 +192,13 @@ void setup_frame(int sig, struct target_sigaction *ka,
     size_t sf_size = sizeof(*sf) + sizeof(struct target_siginfo_fpu);
     int i;
 
-    /* 1. Make sure everything is clean */
-
     sf_addr = get_sigframe(ka, env, sf_size);
     trace_user_setup_frame(env, sf_addr);
 
     sf = lock_user(VERIFY_WRITE, sf_addr, sf_size, 0);
     if (!sf) {
-        goto sigsegv;
+        force_sigsegv(sig);
+        return;
     }
 
     /* 2. Save the current process state */
@@ -228,33 +227,21 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     /* 4. signal handler */
     env->pc = ka->_sa_handler;
-    env->npc = (env->pc + 4);
+    env->npc = env->pc + 4;
+
     /* 5. return to kernel instructions */
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        uint32_t val32;
-
         env->regwptr[WREG_O7] = sf_addr +
                 offsetof(struct target_signal_frame, insns) - 2 * 4;
 
         /* mov __NR_sigreturn, %g1 */
-        val32 = 0x821020d8;
-        __put_user(val32, &sf->insns[0]);
-
+        __put_user(0x821020d8u, &sf->insns[0]);
         /* t 0x10 */
-        val32 = 0x91d02010;
-        __put_user(val32, &sf->insns[1]);
+        __put_user(0x91d02010u, &sf->insns[1]);
     }
     unlock_user(sf, sf_addr, sf_size);
-    return;
-#if 0
-sigill_and_return:
-    force_sig(TARGET_SIGILL);
-#endif
-sigsegv:
-    unlock_user(sf, sf_addr, sizeof(struct target_signal_frame));
-    force_sigsegv(sig);
 }
 
 void setup_rt_frame(int sig, struct target_sigaction *ka,
-- 
2.25.1


