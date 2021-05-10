Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E70378C5E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:41:42 +0200 (CEST)
Received: from localhost ([::1]:33424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5ED-0003Ht-8y
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z9-0006Bh-Iz
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z6-0003GG-NP
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id n205so9093380wmf.1
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PTv2d7AJ+CSiaH9XIWvIX/fDTG8P2ni/pY19lKB3JJ8=;
 b=M9LTFNjvNVAnihtQWe2WFDBdFpSA6ReEyLMRIEyW5Ip51H4BMAELTrWO4zeYclwI2+
 nVcjWmIUYGmhG0ui7sFt842sEHz9NI24SEaS4mcthb3rxwljbZEo11eaBgfOooAdHL8r
 Kbu16aiMTBVgaNm/jdlo8wf0oE8axUEG3Nvh4wl0wcQ4g/wMY5pFDGrlAY11LsXPA0pN
 +m6fGQT7Kz5snSqM8LrjgidP+M8zD9gDkewrwisoBAPZxSYVQt6nViy+ZtWYtREPjLCW
 C77aUVLFFSVh9dgNcJsjEP2KrkUmKrPjt/Aicw5od3N07miw5sOCvzuwX0u1lVTo9ev5
 4OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTv2d7AJ+CSiaH9XIWvIX/fDTG8P2ni/pY19lKB3JJ8=;
 b=UtSNZCfAITTNLSPms94C6VXhFvlCDFheRI4NQ7ihKwa7DiIAB2JRru3H+LKbtVTvp3
 V/U05uFKJBmLdf1exYH1UFhqU+yp9eQHPSCqxh5eOn5IQgPo22Qp+bITcbHHLk0XTE36
 TcaBldMxt/6xgBTIry0znpALLkVjkhj8iWZ89B2arvT0M6efukz8gHKDOTgcM8AxSp88
 Bzw0WAdpa8sFaZdwHI/9+6vGPTez34KliLttNfQ5Mat/k4N3cMsamyNMQFEjsgajR9uM
 AsuyL4qflSUwc3Ix7j41XNWnIw7YFklWvWtVWiy0JfoVoUa4EFVxZMaAkZ+/qlDZN/Sk
 1PaQ==
X-Gm-Message-State: AOAM533v6aP9FuFyz02f1qAbfcSvehusF5kcHB7FH5qxwS2hVGQfUC4h
 rRDzU7u6kKRkY5IM6cwf5ELQQ4XKYjnxWA==
X-Google-Smtp-Source: ABdhPJyvkOSXVhiiKDfU1ag019LEZeiUoL8BYaQotUGAqdC63PGQdUdmfy/k0b83M58rbLRYTF0+GA==
X-Received: by 2002:a05:600c:2296:: with SMTP id
 22mr38042134wmf.165.1620649563127; 
 Mon, 10 May 2021 05:26:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.26.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/26] osdep: Make os-win32.h and os-posix.h handle 'extern
 "C"' themselves
Date: Mon, 10 May 2021 13:25:41 +0100
Message-Id: <20210510122548.28638-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Both os-win32.h and os-posix.h include system header files. Instead
of having osdep.h include them inside its 'extern "C"' block, make
these headers handle that themselves, so that we don't include the
system headers inside 'extern "C"'.

This doesn't fix any current problems, but it's conceptually the
right way to handle system headers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h      | 8 ++++----
 include/sysemu/os-posix.h | 8 ++++++++
 include/sysemu/os-win32.h | 8 ++++++++
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index cb2a07e472e..4c6f2390be4 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -131,10 +131,6 @@ QEMU_EXTERN_C int daemon(int, int);
  */
 #include "glib-compat.h"
 
-#ifdef __cplusplus
-extern "C" {
-#endif
-
 #ifdef _WIN32
 #include "sysemu/os-win32.h"
 #endif
@@ -143,6 +139,10 @@ extern "C" {
 #include "sysemu/os-posix.h"
 #endif
 
+#ifdef __cplusplus
+extern "C" {
+#endif
+
 #include "qemu/typedefs.h"
 
 /*
diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 629c8c648b7..2edf33658a4 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -38,6 +38,10 @@
 #include <sys/sysmacros.h>
 #endif
 
+#ifdef __cplusplus
+extern "C" {
+#endif
+
 void os_set_line_buffering(void);
 void os_set_proc_name(const char *s);
 void os_setup_signal_handling(void);
@@ -92,4 +96,8 @@ static inline void qemu_funlockfile(FILE *f)
     funlockfile(f);
 }
 
+#ifdef __cplusplus
+}
+#endif
+
 #endif
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 5346d51e890..43f569b5c21 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -30,6 +30,10 @@
 #include <windows.h>
 #include <ws2tcpip.h>
 
+#ifdef __cplusplus
+extern "C" {
+#endif
+
 #if defined(_WIN64)
 /* On w64, setjmp is implemented by _setjmp which needs a second parameter.
  * If this parameter is NULL, longjump does no stack unwinding.
@@ -194,4 +198,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t len, int flags);
 ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
                            struct sockaddr *addr, socklen_t *addrlen);
 
+#ifdef __cplusplus
+}
+#endif
+
 #endif
-- 
2.20.1


