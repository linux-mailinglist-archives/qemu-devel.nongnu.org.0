Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3AB362188
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 15:57:04 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXOxz-000050-Ai
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 09:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwn-0007HQ-T1
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXOwl-0004wx-Sc
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:55:49 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m9so14042263wrx.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 06:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IGbPHmqiZp18VB3m9ykl3gVfTn6MP1LZc1HijN6f0ds=;
 b=SJlBywbInh+hlGAN51pDlfyDbBm2kDQz2TdrqtVPihJwwY81i3ddxlS5B+sDvuHTxU
 lv8mROPoB1WNT7R/g8q3pqO0P99pBe1eDO93aGoc/dGAEQOl0hbkjb2nMsg7wG9Fy10b
 zKjKaXIJmz0dzoD0Aegnb1nj59Prjg/qeVHml69HlIDrEW3xg+s6YoklkRFCMFtu0xUU
 SQGR0cTv6j0WKBD37CUmWZVTTkDvEaXkZ9ZHdQGfOFcdgvJF/gjfpSkQOkHqDw/7k1Ul
 1NPtXw5kPpYFgItqPR5A/tmkILkExiy6TpxiYzaWr9GbLneF14Yyz5FvSh6lY3ulScBY
 nIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IGbPHmqiZp18VB3m9ykl3gVfTn6MP1LZc1HijN6f0ds=;
 b=HYplLX75xc0jjR5yKACYt11xgzGSJp1e0Gjgg+xezl5cxwKQ7M1hqJwc3pDPSjphYb
 RiyV+cYThVmMsmRJPvLL3fNkZEjMk863lX1+P4ASEopPxlXGepahP4BXttiXgyVSH9sP
 xFrVkfmq73juSBos/xeo1vvw38AiVxzGKS0JlZceYjmct1uL6gR7xUXmQk336AXjhrzZ
 5P4UCofaDijy5xOKozqtth0rRcDK4NMcWiIPNg0jsw/ViWnZMceq4BJONrt+WEEE5nc5
 hqK1QzcgxEMKcwB56in5zntoYEdZml3JST/UPszonaVvHEbKgnkhj3xwQViUK82MxEWj
 +mFQ==
X-Gm-Message-State: AOAM530/q5lpNtoDigymHR46XC8YtmII/arPab5KUKmUJMPFd5rd11K+
 RAdf5eyoNRw8KWyGhOloJvaP6TBkCVC3r0tU
X-Google-Smtp-Source: ABdhPJyAZzNONn84ndLPk5K65Fk1UOr3ic9c8tyLq2yyUL2CXwZXM34EsbbIeSYaWH5w2rZk5+5zow==
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr9276086wru.57.1618581346504;
 Fri, 16 Apr 2021 06:55:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p14sm10686528wrn.49.2021.04.16.06.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 06:55:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0? 2/6] osdep: protect qemu/osdep.h with extern "C"
Date: Fri, 16 Apr 2021 14:55:39 +0100
Message-Id: <20210416135543.20382-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416135543.20382-1-peter.maydell@linaro.org>
References: <20210416135543.20382-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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


