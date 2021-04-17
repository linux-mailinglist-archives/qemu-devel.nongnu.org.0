Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FF6363208
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 21:46:16 +0200 (CEST)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXqtT-0004e9-8B
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 15:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpY-0007sr-I8
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpW-0008Aw-L0
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:12 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso4735067wmq.4
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 12:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKvxSrsMQFA/bLEF4nXFniV33pIz3YuViqa+nryAra0=;
 b=ag6lQkLDrerb/Hc3CIUZwWZpIb8alVnstbCWlbxoM5vtcCA2lw5dD3QinOVEFB/sXz
 3yLkJwmDN+t5giq6i1JnYt73uu3LYI+FHZLKxyGhkhJTZjnZk2bOB+UzdKn6dRV4XW/K
 HvTTQ/b+bdNeGs1qa9808t03Sv1bWss5HCYkn8YfTPZiduyId2Y5l92ElUm19dgIw+h7
 Nj/o3AAdrk04fUQQjLBgdxll6kTazugBBmX/6jb4GWZT+opzSwbAL5u5EyuRtB01aJyS
 ifKinGu0KbUPOd3to7xIoaHDxjCK3ZCuaHXXtS2EjWEEpI25yn027VZp2WWlML+d0WOL
 H2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKvxSrsMQFA/bLEF4nXFniV33pIz3YuViqa+nryAra0=;
 b=Fh+Xv7eCaiuW5xLeQEezN05+3xPL6juEonyXo5D3bU9f5Qfz61pXoAkdPEHk6wQeNk
 Z+zaVjNE2c4ZW2VZUhHyG5ItF3ICr7Ts4roaBdMO0A/8zMnTvwLSIU6nHg0xBdMGKMR5
 Xo9GWoUmAu/SZ+CWPBT6aefBBermCAA5dm2ACFfXfW32qGJeH53tE2yp1OcIRdpk92cQ
 vxD1jwz8BcY8DkwXi+RqbwjpUfSwAPtsaMqKwp3+jkz/l+v+AHBY2OWwLqcxkvJw7gsW
 sD0RvCp4V1ix+6dg8Wh/0Cy1dPzOM2OTCK/Ga7AMUIHX06Q4GYc2GTEx1QKb4LuwmV6Y
 0iVw==
X-Gm-Message-State: AOAM531qRnC2FD4B0LcMzs16qsUUJyWRQXrZmSdRLQd3tEGwAXcWCYQs
 IIEc95JEdLD47zeL93v7mjT7hEnbXTJoKlOS
X-Google-Smtp-Source: ABdhPJx+l4om8v1aprnNmcPThZmxibLcNjpa6y/IcdaX1/bMOKNUkIcKvQaGcyygS4VmEt1HioQNiQ==
X-Received: by 2002:a05:600c:4ecc:: with SMTP id
 g12mr13474777wmq.117.1618688529359; 
 Sat, 17 Apr 2021 12:42:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c12sm17304374wro.6.2021.04.17.12.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 12:42:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] osdep: protect qemu/osdep.h with extern "C"
Date: Sat, 17 Apr 2021 20:42:00 +0100
Message-Id: <20210417194205.17057-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
References: <20210417194205.17057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

System headers may include templates if compiled with a C++ compiler,
which cause the compiler to complain if qemu/osdep.h is included
within a C++ source file's 'extern "C"' block.  Add
an 'extern "C"' block directly to qemu/osdep.h, so that
system headers can be kept out of it.

There is a stray declaration early in qemu/osdep.h, which needs
to be special cased.  Add a definition in qemu/compiler.h to
make it look nice.

config-host.h, CONFIG_TARGET, exec/poison.h and qemu/compiler.h
are included outside the 'extern "C"' block; that is not
an issue because they consist entirely of preprocessor directives.

This allows us to move the include of osdep.h in our two C++
source files outside the extern "C" block they were previously
using for it, which in turn means that they compile successfully
against newer versions of glib which insist that glib.h is
*not* inside an extern "C" block.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416135543.20382-3-peter.maydell@linaro.org
[PMM: Moved disas/arm-a64.cc osdep.h include out of its extern "C" block;
 explained in commit message why we're doing this]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/compiler.h |  6 ++++++
 include/qemu/osdep.h    | 10 +++++++++-
 disas/arm-a64.cc        |  2 +-
 disas/nanomips.cpp      |  2 +-
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index cf28bb2bcd7..091c45248b0 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -11,6 +11,12 @@
 #define QEMU_STATIC_ANALYSIS 1
 #endif
 
+#ifdef __cplusplus
+#define QEMU_EXTERN_C extern "C"
+#else
+#define QEMU_EXTERN_C extern
+#endif
+
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ab84ecc7c1c..6d8562eaf40 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -57,7 +57,7 @@
 #define daemon qemu_fake_daemon_function
 #include <stdlib.h>
 #undef daemon
-extern int daemon(int, int);
+QEMU_EXTERN_C int daemon(int, int);
 #endif
 
 #ifdef _WIN32
@@ -118,6 +118,10 @@ extern int daemon(int, int);
  */
 #include "glib-compat.h"
 
+#ifdef __cplusplus
+extern "C" {
+#endif
+
 #ifdef _WIN32
 #include "sysemu/os-win32.h"
 #endif
@@ -728,4 +732,8 @@ static inline int platform_does_not_support_system(const char *command)
 }
 #endif /* !HAVE_SYSTEM_FUNCTION */
 
+#ifdef __cplusplus
+}
+#endif
+
 #endif
diff --git a/disas/arm-a64.cc b/disas/arm-a64.cc
index 9fa779e175e..27613d4b256 100644
--- a/disas/arm-a64.cc
+++ b/disas/arm-a64.cc
@@ -17,8 +17,8 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-extern "C" {
 #include "qemu/osdep.h"
+extern "C" {
 #include "disas/dis-asm.h"
 }
 
diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 2b096552719..8ddef897f0d 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -27,8 +27,8 @@
  *      Reference Manual", Revision 01.01, April 27, 2018
  */
 
-extern "C" {
 #include "qemu/osdep.h"
+extern "C" {
 #include "disas/dis-asm.h"
 }
 
-- 
2.20.1


