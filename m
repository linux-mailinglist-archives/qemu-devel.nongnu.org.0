Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB4362189
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 15:57:05 +0200 (CEST)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXOy0-00006W-8y
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 09:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwp-0007IG-2K
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:51 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwn-0004yD-FU
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so4623268wmh.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 06:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yexOzAULOcEYO6I06ENHGVCv2bXclh59mEOkxfhqD7I=;
 b=vkN41Y2RtysMJYK7aApauhRqXxod31xb23nAQuxwgJI8gP4UAHx9VXWoQ2HxbLobpU
 QOMjvDX5CF8l9KclFz3V+q6NlaoH2Q0N0FauNQ5FUQioqmxSjhEWNY4BfTU31shbJo23
 fwgeUO9lrCFIrtUjjTnBIehnDhJVSAHp3W0JPXGXZYzrond3Qmf8oCUNmSCzdAzHcM2T
 y4BrTZekILQ9qdr7aeGh7vxr8hNhC7RP+USsH2uYsKCH7UjOGkjsDvwdl5/nGbUH+uY2
 rFyk8WG6XLp0ssXAYG2LK+yIHidButlSuNf60v6ImwFtY7MCCksR3xwY6u4t6sc5jYTa
 KfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yexOzAULOcEYO6I06ENHGVCv2bXclh59mEOkxfhqD7I=;
 b=FLyP3MSPU3kN6bLpyWejXkUOWyG4dXASb1Iqf6UUbaLsIMGUs+AFpT63nWZKzsTjW/
 03iU2bm27KKleTaFE8X1LeQckQRCeqCskw7DQxRiIDZwBUSOraq4p2E4kJLLvKZyRjpu
 yxYaAZ1aWxbhWRVLBZbxHsGYZlRF2JURX1SSEJQ1aWgL/ON9nzHbEKUCHki0VAjRI1I4
 GjB3rgZrgh8HAuX4xyr0ESSB+SI6x7GfR5iXHa45rG9Vj6lHO0nsaEyPws129RaXj6s/
 DeGHsMmOiDWywjxqfpmypFCPxGX4Jcrcswn77AJS8XhHW1V4BO7ZlTRfxQaUeoDM6jD9
 VX5w==
X-Gm-Message-State: AOAM530N09I8fbaKkqbMtEsx3yJ33XTwVr3VCchovpD9pLzvIaRTyxjv
 NW0hYCQwETcjkn1Miv9uT8hDgMjb/6Eq5VNP
X-Google-Smtp-Source: ABdhPJw/24+YqhOrWOHF6pepenLOenpQW9VKdmXyRvCfKvTL1TsE+8V8LHT6usUDgee/bE/vgNRCQg==
X-Received: by 2002:a05:600c:2159:: with SMTP id
 v25mr8428478wml.80.1618581347870; 
 Fri, 16 Apr 2021 06:55:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p14sm10686528wrn.49.2021.04.16.06.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 06:55:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0? 4/6] osdep: Make os-win32.h and os-posix.h handle
 'extern "C"' themselves
Date: Fri, 16 Apr 2021 14:55:41 +0100
Message-Id: <20210416135543.20382-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416135543.20382-1-peter.maydell@linaro.org>
References: <20210416135543.20382-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both os-win32.h and os-posix.h include system header files. Instead
of having osdep.h include them inside its 'extern "C"' block, make
these headers handle that themselves, so that we don't include the
system headers inside 'extern "C"'.

This doesn't fix any current problems, but it's conceptually the
right way to handle system headers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


