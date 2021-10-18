Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6CE432386
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:12:10 +0200 (CEST)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVFB-0001fp-95
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV91-0007jP-5Q
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:48 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:33494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8r-00082F-BE
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:46 -0400
Received: by mail-il1-x129.google.com with SMTP id s3so15537712ild.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vE4GJOojXPt/WEFBXi9UzAgsNYJONi1/f2Ovar658Qo=;
 b=kUaOQZKGPiSv88v96VVdldiHsGg68RuhuKnH/G7Qef07csOWFU24Fhl7Um2lugxwW+
 5/nsSyngG6dpf+MfXd3m/XpSyKijHJtOvkqJuTE1h0Zz6xr/p5AhnX6NGbnlaFWmjQrM
 LwjmP69W/rwlb7rj9EMx1YHpOGMnNkocEp+/+ygkW0JCTfl1gjYozuMPspIWQXyh0o/3
 kTn8FEfkVNescBdux5h5grH2ZMyT00Qocl4VDVHFjFjxTWkooZwP9unE8lSotFPfz3GE
 Qwevu3FZskSGuS6uNK47Z30AhbuLMK3KeGZG5tvvXouN5h3MQ27vAm4N+78XQn4lT3rw
 nLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vE4GJOojXPt/WEFBXi9UzAgsNYJONi1/f2Ovar658Qo=;
 b=lERRtv94CLOatkIdiCQpJSTZPTHbB3GLCBTrgMAOQWINK81oJUriCJVMUgTNnlou6H
 fbcc2yV+oxAVvxAHJNpqlWcN0DvZBjUIpup7v/EF8jooJF9dXX9+5d+cQIJa4Tj6sitl
 KJQCxuftdU71O467QvIbDWz2sVyknRyItb5Saey3JFkTChEzKQeZQI15mRAhWw8uBjs4
 g4rX2wPydLYIVcS4Vsa6BP4nYO31MO9vMHSu2zyVX38aJviHNi0vdcGxOCMuTstl60+V
 ZH2UcOhgMFa3N1qy0G/0pmnbcIXCkZxNyqdw1ioMl6QMtz9Zs8B0/LZtUJK1mJ4Xe7NV
 2qiQ==
X-Gm-Message-State: AOAM533Sk/yUzgc5YPDbWh5zm9Xh5wQ9Ao2+MegImXBalYI5EknsohYE
 PxzPcvmHqwAQwMPR37tGyLuLFxtTuMMO8A==
X-Google-Smtp-Source: ABdhPJx0fO1riXgKwsYMbIayJ0FH38whEoF7aWVAwnspdM5EKlukL5S/rHFsbEHqKyy5kiDXiT04LA==
X-Received: by 2002:a05:6e02:dc3:: with SMTP id
 l3mr9070153ilj.177.1634573130434; 
 Mon, 18 Oct 2021 09:05:30 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:30 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] bsd-user: move TARGET_MC_GET_CLEAR_RET to
 target_os_signal.h
Date: Mon, 18 Oct 2021 10:04:51 -0600
Message-Id: <20211018160458.1976-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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


