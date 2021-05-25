Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983D639049F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:08:39 +0200 (CEST)
Received: from localhost ([::1]:36396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYfe-0003ao-7J
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYb1-0002Ny-Vr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYaz-0004FH-8S
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:51 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso13669231wmh.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VrZok/6FlN2UGMh8wm7S4ptBdsiijy8kZCQ/uCJXQ/0=;
 b=qAdkzdX7SuTmNuKzEDOI4fbXv7XXWfWEwaRDIqLsuYiBiETgep1ujjlbktgZnjYUSx
 iX1q8nV6kwN9RFTzC2YAmp/VxrGaFWXioJN9bupm2r+E0o1wHoh7I5RaPDItWmlXI0wX
 mvD0yofLpkrsJ2tZ9oBV9XIWoJobLGKHjjOWXAh4vnKb4j33Nwn20Ypt7Q2rvYcdZE/j
 lA9OKtTpRa3hKCvaBTa42SEjBRPn1ZigXtXkfdsIPBdG9i7nLa76XF7c4G2Fcn2G24ZH
 ZfTzw0JDvL7TFGJf5nNrgzy/NFCNziMn53NwlAf/7r9KCov9OeDiEiRGtNcnfyJFUgmb
 itPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VrZok/6FlN2UGMh8wm7S4ptBdsiijy8kZCQ/uCJXQ/0=;
 b=rKWIsYNAGVG8INh70K8hKM9t8lGBKn6ddiJrozv7/VD5fn1lFi2PtNai1EFSKdDML3
 jyiqq7R5xkEk8RGEL1cS4KznlEomhjXpy3LgEjAJopZe7FYex9uNzfknyn9pvquIzZIb
 R75XtAttsU0FE9FiV1XueqQOVx11ogP5ow3XFV++CwCzXSxGPy6vBQ1bjXFN4E9Q6CRi
 2AaNNdhe2yHcTAWpEmpLySFhUEd0qV5ljfjKb/xkmc0arQUG1BEpK3hSCKiO0wh5yw/V
 7SoEXxx1NFXCtOnViV7jtykBKp1XAvZ7fwz064LwivvewVAPqZZxq2cZtNoX3QNR2NLs
 oLSQ==
X-Gm-Message-State: AOAM532fTXHuHBCjQ6QYWER7YiD7w07n3Qsla/cYZkqPPL6lgN+EK8E7
 u1cbXq54I2c1PhyktNtvCzdcqw2uWIMAI5pE
X-Google-Smtp-Source: ABdhPJze8xtuL5moieQ1Z1J9cO0cJEKP/gbBKpzXp3AzISia6wVwUa9VWEIUFaVVGFmyTZWzF73adg==
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr4355631wmj.22.1621955027891; 
 Tue, 25 May 2021 08:03:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 022/114] disas/libvixl: Protect C system header for C++ compiler
Date: Tue, 25 May 2021 16:01:52 +0100
Message-Id: <20210525150324.32370-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When selecting an ARM target on Debian unstable, we get:

  Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
  FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
  c++ -Ilibcommon.fa.p -I. -I.. [...] -o libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c ../disas/libvixl/vixl/utils.cc
  In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                   from ../disas/libvixl/vixl/utils.cc:27:
  /usr/include/string.h:36:43: error: missing binary operator before token "("
     36 | #if defined __cplusplus && (__GNUC_PREREQ (4, 4) \
        |                                           ^
  /usr/include/string.h:53:62: error: missing binary operator before token "("
     53 | #if defined __USE_MISC || defined __USE_XOPEN || __GLIBC_USE (ISOC2X)
        |                                                              ^
  /usr/include/string.h:165:21: error: missing binary operator before token "("
    165 |      || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X))
        |                     ^
  /usr/include/string.h:174:43: error: missing binary operator before token "("
    174 | #if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X)
        |                                           ^
  /usr/include/string.h:492:19: error: missing binary operator before token "("
    492 | #if __GNUC_PREREQ (3,4)
        |                   ^

Relevant information from the host:

  $ lsb_release -d
  Description:    Debian GNU/Linux 11 (bullseye)
  $ gcc --version
  gcc (Debian 10.2.1-6) 10.2.1 20210110
  $ dpkg -S /usr/include/string.h
  libc6-dev: /usr/include/string.h
  $ apt-cache show libc6-dev
  Package: libc6-dev
  Version: 2.31-11

Partially cherry-pick vixl commit 78973f258039f6e96 [*]:

  Refactor VIXL to use `extern` block when including C header
  that do not have a C++ counterpart.

which is similar to commit 875df03b221 ('osdep: protect qemu/osdep.h
with extern "C"').

[*] https://git.linaro.org/arm/vixl.git/commit/?id=78973f258039f6e96

Buglink: https://bugs.launchpad.net/qemu/+bug/1914870
Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20210516171023.510778-1-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 disas/libvixl/vixl/code-buffer.h |  2 +-
 disas/libvixl/vixl/globals.h     | 16 +++++++++-------
 disas/libvixl/vixl/invalset.h    |  2 +-
 disas/libvixl/vixl/platform.h    |  2 ++
 disas/libvixl/vixl/utils.h       |  2 +-
 disas/libvixl/vixl/utils.cc      |  2 +-
 6 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/disas/libvixl/vixl/code-buffer.h b/disas/libvixl/vixl/code-buffer.h
index f93ebb6b822..b95babbdee2 100644
--- a/disas/libvixl/vixl/code-buffer.h
+++ b/disas/libvixl/vixl/code-buffer.h
@@ -27,7 +27,7 @@
 #ifndef VIXL_CODE_BUFFER_H
 #define VIXL_CODE_BUFFER_H
 
-#include <string.h>
+#include <cstring>
 #include "vixl/globals.h"
 
 namespace vixl {
diff --git a/disas/libvixl/vixl/globals.h b/disas/libvixl/vixl/globals.h
index 7099aa599fb..3a71942f1e5 100644
--- a/disas/libvixl/vixl/globals.h
+++ b/disas/libvixl/vixl/globals.h
@@ -40,15 +40,17 @@
 #define __STDC_FORMAT_MACROS
 #endif
 
-#include <stdint.h>
+extern "C" {
 #include <inttypes.h>
-
-#include <assert.h>
-#include <stdarg.h>
-#include <stdio.h>
 #include <stdint.h>
-#include <stdlib.h>
-#include <stddef.h>
+}
+
+#include <cassert>
+#include <cstdarg>
+#include <cstddef>
+#include <cstdio>
+#include <cstdlib>
+
 #include "vixl/platform.h"
 
 
diff --git a/disas/libvixl/vixl/invalset.h b/disas/libvixl/vixl/invalset.h
index ffdc0237b47..2e0871f8c3f 100644
--- a/disas/libvixl/vixl/invalset.h
+++ b/disas/libvixl/vixl/invalset.h
@@ -27,7 +27,7 @@
 #ifndef VIXL_INVALSET_H_
 #define VIXL_INVALSET_H_
 
-#include <string.h>
+#include <cstring>
 
 #include <algorithm>
 #include <vector>
diff --git a/disas/libvixl/vixl/platform.h b/disas/libvixl/vixl/platform.h
index ab588f07f54..26a74de81bb 100644
--- a/disas/libvixl/vixl/platform.h
+++ b/disas/libvixl/vixl/platform.h
@@ -28,7 +28,9 @@
 #define PLATFORM_H
 
 // Define platform specific functionalities.
+extern "C" {
 #include <signal.h>
+}
 
 namespace vixl {
 inline void HostBreakpoint() { raise(SIGINT); }
diff --git a/disas/libvixl/vixl/utils.h b/disas/libvixl/vixl/utils.h
index 5ab134e240a..ecb0f1014ab 100644
--- a/disas/libvixl/vixl/utils.h
+++ b/disas/libvixl/vixl/utils.h
@@ -27,8 +27,8 @@
 #ifndef VIXL_UTILS_H
 #define VIXL_UTILS_H
 
-#include <string.h>
 #include <cmath>
+#include <cstring>
 #include "vixl/globals.h"
 #include "vixl/compiler-intrinsics.h"
 
diff --git a/disas/libvixl/vixl/utils.cc b/disas/libvixl/vixl/utils.cc
index 3b8bd75fba1..69304d266d7 100644
--- a/disas/libvixl/vixl/utils.cc
+++ b/disas/libvixl/vixl/utils.cc
@@ -25,7 +25,7 @@
 // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 #include "vixl/utils.h"
-#include <stdio.h>
+#include <cstdio>
 
 namespace vixl {
 
-- 
2.20.1


