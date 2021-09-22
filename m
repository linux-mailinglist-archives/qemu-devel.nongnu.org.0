Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1741419A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:21:11 +0200 (CEST)
Received: from localhost ([::1]:47210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvd0-0000sp-Ko
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWr-0001KA-3W
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:49 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:39539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWp-0007VF-Ka
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:48 -0400
Received: by mail-io1-xd2c.google.com with SMTP id m11so1954056ioo.6
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFgEL8mrMZNllBbU4xUNPil8wKGkgxSBpv3vMZ0WcBY=;
 b=qsvlOohAma5CQHTYyDXVsOgCdI9whLaVpSM1jR7UUDybhr3P3QT0xhqsRp7SrbCCI3
 7z22urn+bo7rP0N88hFFLEraMJlqqBdw5vlMS7BUeM8EbeCVxoldOjOxmnZQg4qZhnL+
 aq32Ah2nwVmBlkfL+fGfpK7eA09uMkmZZI2khQt+1mfAXlESYiHhSAglxAkN13daYyQW
 dHXtWHZVqhquiSPpQ4RAAZWb+ZgLqnSC59RYjTpQ9xBO9d26YYdStsr9282l4BN5YZeU
 x5iZOd2x3rSvaJQbjZCxw5FkQsF1xRnAm8GxT+C4q6TwRuOGGOjFuui/L6NkO5Yt61v4
 v9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFgEL8mrMZNllBbU4xUNPil8wKGkgxSBpv3vMZ0WcBY=;
 b=E0DN4OoD3WX6qiyW07CWlqJxT/ZhEH7pKOmHZYvMVzINfS3WJEAn9DvEdXfepoIJuU
 e+oSXiZKD7oChdQ1TfSsEQdePM8wXToBFAZlcwDKifuHN5Nlfj2xLDFOqlUWkbMm6Xbz
 kppdA+K8J6UuAdscH6k/3xzwQ47XfjOLtvvS0wR2U6uAXLIg0lqMiPe/q5JEXraPEDhx
 5H4K484fdIGAh8BIFzVffnWqOW/Fr2LCJcp1UGceIn+Yb4EIAgPgBP5wBOhKZn3ITaEm
 AUSSRkbnoF2rnPOX6+NeMgk93XTenWH5JH24/4OykAUId8gGbVNq6zO48AdZ58y0Hk08
 1PWw==
X-Gm-Message-State: AOAM5326VfHdsl6cZ062i7NEYVaWPX1uQWITMEeA+xtpTS+BECbC4CJ7
 uHXJlY7H6/3ZBNW7oO6OGA+hlB7ZA2R1/+Bx9vU=
X-Google-Smtp-Source: ABdhPJwsnQUEdMLsWtsekigal3pUSpyhdRRVNHIYXnV1D+dBQJ1W7ZViixhdLIZHXTNH9/IIOoYixQ==
X-Received: by 2002:a5d:894c:: with SMTP id b12mr3009638iot.83.1632291286398; 
 Tue, 21 Sep 2021 23:14:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:45 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/14] bsd-user: move TARGET_MC_GET_CLEAR_RET to
 target_os_signal.h
Date: Wed, 22 Sep 2021 00:14:30 -0600
Message-Id: <20210922061438.27645-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move TARGET_MC_GET_CLEAR_RET to freebsd/target_os_signal.h since it's
FreeBSD-wide.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/target_os_signal.h  | 3 +++
 bsd-user/i386/target_arch_signal.h   | 2 --
 bsd-user/x86_64/target_arch_signal.h | 2 --
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
index 3ed454e086..9fcdfce003 100644
--- a/bsd-user/freebsd/target_os_signal.h
+++ b/bsd-user/freebsd/target_os_signal.h
@@ -1,6 +1,9 @@
 #ifndef _TARGET_OS_SIGNAL_H_
 #define _TARGET_OS_SIGNAL_H_
 
+/* FreeBSD's sys/ucontex.h defines this */
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


