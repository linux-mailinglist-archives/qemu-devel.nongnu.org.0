Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA4D43276A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:18:23 +0200 (CEST)
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY9O-00088D-J9
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtc-0008Ow-BB
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:05 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:37746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtZ-0001uY-El
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:04 -0400
Received: by mail-il1-x12e.google.com with SMTP id x1so15977364ilv.4
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vE4GJOojXPt/WEFBXi9UzAgsNYJONi1/f2Ovar658Qo=;
 b=DT8hHgyxNuwjenwdKHh3q/panOSZ14kmyR9K3yF8rFjTDVdYAp2ZEczA1TuZkHnJC2
 704Y1nEt5d9O3hrNsdK9Ff5HEDIPjfCY1e6QVyxjePphdJPJHExYY6GXQzInm9M6FwTA
 NsEpNyKnCnRv8CE740JJx4M1AYET8b4CQ0JeDraL7+WpPKYH26FPKG5ebfdouNUAtVO8
 ODosmZeS/7b3urs+L5AsPsW6MFusFf8fNG7oTVAPRUtVAkxDvl0N5vkuCYJB7mIiqbx6
 nzuasSqUt5o76ElKM3dvJKx68XQP2RNg7FsmPRhXZtkuW8SED+QIYKcnocucNerqcOzt
 eZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vE4GJOojXPt/WEFBXi9UzAgsNYJONi1/f2Ovar658Qo=;
 b=re3aHOly7QGVprEVcPytsBcVQ35SCO42gA2ATvRiApd9il1PTRxSYEVhHIDdcmVMcf
 fXEKe0XdUurbfqFH+8Q+lnzpDCQmAqiyFtO1k5Ca2OvVbD1abVw4hMw8SmgiUr1fuJ4H
 Shglc1wZehdNa1u6g0BysMqZgGwHe5udOvknWkqikJ8gHinc5VPknckwgOoO+ybwlNyr
 7BnYAqpJPeB1LJn+OYnMALTCVBaPehMRyZTBbHoSAK2rhVGPuEAW6ke7/hJrm61+M/7s
 Qk0uMIVz2TpSCeM3mdNa5aLGpNnERxNyE3KuqZClQ05QMfXJIGiyGVwVWN9/Y/1jCZUs
 cKRg==
X-Gm-Message-State: AOAM531KP4WmpbqpyLMeK0pjL52Fjb85gkJAvvtwa8/eQ7suva9jK9sa
 xy38SpZbSQTL/WFC1XvIwE17nBBLSPc8fQ==
X-Google-Smtp-Source: ABdhPJzvTcQ7fCI4I/zE4ccr7x355Gfu77j7LLN63lC833ZutG0bFHNd73h6zqdT2+Du2ClvAV1ckQ==
X-Received: by 2002:a05:6e02:1808:: with SMTP id
 a8mr15967139ilv.247.1634583718445; 
 Mon, 18 Oct 2021 12:01:58 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:56 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/23] bsd-user: move TARGET_MC_GET_CLEAR_RET to
 target_os_signal.h
Date: Mon, 18 Oct 2021 13:01:08 -0600
Message-Id: <20211018190115.5365-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move TARGET_MC_GET_CLEAR_RET to freebsd/target_os_signal.h since it's
architecture agnostic on FreeBSD.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
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


