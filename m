Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C809427423
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:23:23 +0200 (CEST)
Received: from localhost ([::1]:34212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzCz-0005k9-TN
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5N-00007L-EU
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:29 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:34718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5L-0006kD-Mo
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:29 -0400
Received: by mail-il1-x133.google.com with SMTP id g2so10428672ild.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lzsrSCdLmohaYjA922DztDXVjy0WqIWWd5Kt064dJN8=;
 b=OwjzKyqK69ktQxrE9ksfkFtKM1o6sQUm8szL+e3uhzDqi/L8Tpmi7QBe21Sd1khvPz
 8UKLnnkrV5lf72v4y2JFPFsY0oJhKCeOfC6pm1JFwhaGvCaidxZJBm1RITXr3MuRCQGU
 L+ihAQDItmwq7jCiczj/Q9dS/eUJ5/p86YM+VSh04onwRkyoMLzlP9pT8WvI13W/X9bh
 0qgoZznzeUwjlrfn/9Z+TiT1Fssf01EDsNh4HLk5djqZVByAq0SkyPkHUTRaQKP4zIfB
 N+qJs8I7HIUT/qC54W5/19jm/1v2CPVvfS9bQXdU+8o+XArSv5eH0Zjh93lWfN8z5Bu2
 6YKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lzsrSCdLmohaYjA922DztDXVjy0WqIWWd5Kt064dJN8=;
 b=MzD25YGwQiYGdHd7/M5zhdGA+0LCnksNFnWAGy16yZk0dj0DGy3wsf/p+1ju7w1bD9
 5ArrVu9bdra0RFE16sV2Q1xW6iiY0fONA21Hc8D/XMLDv3TFi8CQFdZndgypMnQ07e7I
 PEFM4RpGF2YW39mDrNsqUQ/SuYyYeV3UenqVzR2al5MjlNWUFedWIXV53aZv904QRYEz
 y9REaD9SYZtDrkFvI6U/yZNGhmLGQsx5uxVgdSgiRVAMnW2fxX4AL3Upd7Z+vH1Nkcz3
 u8fY3k27Xb8dozFB+3ZVT8T4gsfmpvgejSM313uqIPCTBM+Aw5N4HI6Wp5oTUaBO8afk
 wX/Q==
X-Gm-Message-State: AOAM531xIZURs3Xqhoj0wcnu8dz6CoVduZZNdnWUyu0/jQxjtP16ELxF
 DSWXtQ5064SdLlXJ9Vy7ylbi9B/k84/9Yw==
X-Google-Smtp-Source: ABdhPJyIV44JhG4RTYAtxV//wAg9McuGVxlREdySk8yY0uhNLUctxEIDOBdmIfb9RdPiHPMWupdl5g==
X-Received: by 2002:a05:6e02:1a27:: with SMTP id
 g7mr9831937ile.123.1633734926238; 
 Fri, 08 Oct 2021 16:15:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/15] bsd-user: move TARGET_MC_GET_CLEAR_RET to
 target_os_signal.h
Date: Fri,  8 Oct 2021 17:14:58 -0600
Message-Id: <20211008231506.17471-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move TARGET_MC_GET_CLEAR_RET to freebsd/target_os_signal.h since it's
architecture agnostic on FreeBSD.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/freebsd/target_os_signal.h  | 3 +++
 bsd-user/i386/target_arch_signal.h   | 2 --
 bsd-user/x86_64/target_arch_signal.h | 2 --
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
index 3ed454e086..1a4c5faf19 100644
--- a/bsd-user/freebsd/target_os_signal.h
+++ b/bsd-user/freebsd/target_os_signal.h
@@ -1,6 +1,9 @@
 #ifndef _TARGET_OS_SIGNAL_H_
 #define _TARGET_OS_SIGNAL_H_
 
+/* FreeBSD's sys/ucontext.h defines this */
+#define TARGET_MC_GET_CLEAR_RET 0x0001
+
 #include "target_os_siginfo.h"
 #include "target_arch_signal.h"
 
diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index 9812c6b034..a90750d602 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -27,8 +27,6 @@
 #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
-#define TARGET_MC_GET_CLEAR_RET 0x0001
-
 struct target_sigcontext {
     /* to be added */
 };
diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 4c1ff0e5ba..4bb753b08b 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -27,8 +27,6 @@
 #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
-#define TARGET_MC_GET_CLEAR_RET 0x0001
-
 struct target_sigcontext {
     /* to be added */
 };
-- 
2.32.0


