Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A67E591069
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:55:55 +0200 (CEST)
Received: from localhost ([::1]:39966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTGc-0002h3-BT
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6f-0000NG-FF
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:40 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6d-0002PX-Tx
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:37 -0400
Received: by mail-wm1-x329.google.com with SMTP id k17so477010wmr.2
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 04:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=KmqiERqNZgSUdjGvKdTtZjsQUeVX3Ph3gCx7pWaoXiU=;
 b=eJHVakWrsLu0wgL7jJ+3Ypp1nmzBHk59XxPfw8lYftYxER1OVTUBIB6+GforoppGPp
 gk91f9Zp8mQqU5k3R7q1tVXxdKyNjmLIus/Oxz/FjEd0AInfK6ccQyooJht1gGZJ8+tj
 7ngfCJnV05iuHItuF2ULLoU2efyrrvwZTdzopKtauEOhtEZG1ZuW4vz6wP1Be05DHC/x
 0MM7HdcX70YGPfv7y5YbgaXrRFlwuH0ti26a5VKgXr2G5C5FOcH7S/uWDxjbuIIqxyPe
 +hoc7JXuRBOreT4aMoFn6xVl7bRa8EpO0WF6DYbhHlGMKAz4inHHie4KqK+3nvyeBUBt
 lbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=KmqiERqNZgSUdjGvKdTtZjsQUeVX3Ph3gCx7pWaoXiU=;
 b=pbI1CWmsYyDMjwg9jSjVlPFNYvoTsCvx8YL0+myoLXgH/KfbAQo+0Wm2uyRDctY6I8
 GN3mqp3VzqVDDRLftA62kofhksZgLE8SZKbOMLETN450Wal8WE6Ja9i4p4pKnVXLTI2W
 /E1jNnL5Jc79gT+Gzr3YKQSCEA9evmJZq7zC7WiXB9cCaxI84elLMG3ImH/lybaoZsVT
 DE/xBvrD0i2A+m8h0aBehzbRfVETZr0rcQW38IiNxhjhHz5wFxRV6ezwS3WOmrSe8zlc
 /9GMst/zLfPmf9yJAYO0b5AudP7FD1mRXd/EaQBXuuIgjwPY5/eU0Vq9jFulrFNnaWyH
 aHOw==
X-Gm-Message-State: ACgBeo0Eln5CPrsZgw6TEeHzaqf4PzLWGXw9YebSELg0UYhqrW4A23xx
 P48bgmw9nM+RU5l17YM6sBrKL3CkXSZsQg==
X-Google-Smtp-Source: AA6agR4VOr5RClCeDRt3tmieLH+IRTlZFuOySvUFd86BO0uMKSQ0W7eJYYMPINp5Iskhi0VRAbriGQ==
X-Received: by 2002:a05:600c:4196:b0:3a5:3da4:ef78 with SMTP id
 p22-20020a05600c419600b003a53da4ef78mr2402340wmh.156.1660304734472; 
 Fri, 12 Aug 2022 04:45:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c3b8800b003a5418245b9sm11257797wms.19.2022.08.12.04.45.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 04:45:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] cutils: Add missing dyld(3) include on macOS
Date: Fri, 12 Aug 2022 12:45:27 +0100
Message-Id: <20220812114527.1336370-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812114527.1336370-1-peter.maydell@linaro.org>
References: <20220812114527.1336370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Commit 06680b15b4 moved qemu_*_exec_dir() to cutils but forgot
to move the macOS dyld(3) include, resulting in the following
error (when building with Homebrew GCC on macOS Monterey 12.4):

  [313/1197] Compiling C object libqemuutil.a.p/util_cutils.c.o
  FAILED: libqemuutil.a.p/util_cutils.c.o
  ../../util/cutils.c:1039:13: error: implicit declaration of function '_NSGetExecutablePath' [-Werror=implicit-function-declaration]
   1039 |         if (_NSGetExecutablePath(fpath, &len) == 0) {
        |             ^~~~~~~~~~~~~~~~~~~~
  ../../util/cutils.c:1039:13: error: nested extern declaration of '_NSGetExecutablePath' [-Werror=nested-externs]

Fix by moving the include line to cutils.

Fixes: 06680b15b4 ("include: move qemu_*_exec_dir() to cutils")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220809222046.30812-1-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 util/cutils.c      | 4 ++++
 util/oslib-posix.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index cb43dda213c..def9c746ced 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -39,6 +39,10 @@
 #include <kernel/image.h>
 #endif
 
+#ifdef __APPLE__
+#include <mach-o/dyld.h>
+#endif
+
 #ifdef G_OS_WIN32
 #include <pathcch.h>
 #include <wchar.h>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index bffec18869e..d55af69c112 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -58,10 +58,6 @@
 #include <lwp.h>
 #endif
 
-#ifdef __APPLE__
-#include <mach-o/dyld.h>
-#endif
-
 #include "qemu/mmap-alloc.h"
 
 #ifdef CONFIG_DEBUG_STACK_USAGE
-- 
2.25.1


