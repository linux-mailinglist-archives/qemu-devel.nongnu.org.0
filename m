Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DB16AE7E1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:04:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZajs-00068t-HX; Tue, 07 Mar 2023 12:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZajW-0005yE-Nq
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:04:16 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZajU-0003q7-G8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:04:14 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso10866750wmi.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678208650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xBM/DjzpI+y3ZjCT4Wal/gzOcTCGOW/UQZGqC6Mn2C8=;
 b=rRvwqqWf2haTfVB4M3EkK71yJUDBo8ztmXWSIkBnTUnpIJ3JDsp9V7bRaMSmaLnH7d
 vU0H0Hk538txuFjTe7lfebeqzSmSFTBXS2a6IfgHBsNuwMAzwkfHzPr7PDSyoZXYPVZM
 1D+HuejSWogVw8RSdMve1J73jIBp2D7cFUlSzXjij0/PIez6BtaBlfHHK8akMGK3Gcoj
 9j5BMVdF7zVfaqMAZFL3nC+YnWWMnSZBkMdTjLS3odLvxjD49XmX4sijD8K8NCWXm1Hf
 3HHcyduJD9wJOXWg0uCCmMmxIsOWlU6unWJ5PIl+N48l4CMfISyOQOWtBvLYCxMmgtX2
 35LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xBM/DjzpI+y3ZjCT4Wal/gzOcTCGOW/UQZGqC6Mn2C8=;
 b=TTS+OeftiU8ZYCORxUqHR2b/B9UMaFAStJRBWjSdTUK2RFE20w3iOFMpGwrIoNxp9Q
 yHEB34/SwtBCRQ1HTtnD154fnEybI+Q2QpGNILQk67b2K6uQbGkafYDRBA1l1rCMVqiZ
 Oe/JvXw8GrHGN9AwgYcK8OLcvKGTJkqQlZbKkekJO+vsF95E7rGn+iPLU+7JUJNCJkov
 t+4JOHtxiCtwk9ANwI24BN1D3/W+lHI+Q0Qli6EDjYIlv+nahtbVl7Sh95ZXxknFUqHn
 086xB3A3A+DkCjoUZ6NQtWuqzLdmK9bTBimimIhEbavSWAMjiXh0Wbs6lnsyhbxwXxTj
 qJCw==
X-Gm-Message-State: AO0yUKUOV9eboMUBboiLILLd7G4vEVViKy6x9zGeol/XQpSbC2sGy75z
 oaWt6lLH3pKmFXm9GYSIPkonbA==
X-Google-Smtp-Source: AK7set9xmB1TGZyXtimTPRcW2uFrvwOs2DLvN78wWCl+rUUS0V6SLBijD6G46sgb5MN/+oaCIX0QVw==
X-Received: by 2002:a05:600c:4750:b0:3eb:395b:8b62 with SMTP id
 w16-20020a05600c475000b003eb395b8b62mr13830762wmo.39.1678208649811; 
 Tue, 07 Mar 2023 09:04:09 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a7bc415000000b003e206cc7237sm17342505wmi.24.2023.03.07.09.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:04:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C2781FFB7;
 Tue,  7 Mar 2023 17:04:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH] stubs: split semihosting_get_target from system only stubs
Date: Tue,  7 Mar 2023 17:04:04 +0000
Message-Id: <20230307170405.796822-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DIET_1=0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As we are about to have a common syscalls.c for gdbstub we need to
stub out one semihosting helper function for all targets.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 stubs/semihost-all.c | 17 +++++++++++++++++
 stubs/semihost.c     |  5 -----
 stubs/meson.build    |  1 +
 3 files changed, 18 insertions(+), 5 deletions(-)
 create mode 100644 stubs/semihost-all.c

diff --git a/stubs/semihost-all.c b/stubs/semihost-all.c
new file mode 100644
index 0000000000..a2a1fc9c6f
--- /dev/null
+++ b/stubs/semihost-all.c
@@ -0,0 +1,17 @@
+/*
+ * Semihosting Stubs for all targets
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * Stubs for all targets that don't actually do semihosting.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "semihosting/semihost.h"
+
+SemihostingTarget semihosting_get_target(void)
+{
+    return SEMIHOSTING_TARGET_AUTO;
+}
diff --git a/stubs/semihost.c b/stubs/semihost.c
index d65c9fd5dc..aad7a70353 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -28,11 +28,6 @@ bool semihosting_enabled(bool is_user)
     return false;
 }
 
-SemihostingTarget semihosting_get_target(void)
-{
-    return SEMIHOSTING_TARGET_AUTO;
-}
-
 /*
  * All the rest are empty subs. We could g_assert_not_reached() but
  * that adds extra weight to the final binary. Waste not want not.
diff --git a/stubs/meson.build b/stubs/meson.build
index 7657467a5d..b2b5956d97 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -61,4 +61,5 @@ if have_system
 else
   stub_ss.add(files('qdev.c'))
 endif
+stub_ss.add(files('semihost-all.c'))
 stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
-- 
2.39.2


