Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503106AF79B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:30:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesC-0004i4-2r; Tue, 07 Mar 2023 16:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes9-0004gb-RT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:25 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes7-0000vN-Jt
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:25 -0500
Received: by mail-wr1-x429.google.com with SMTP id l25so13544905wrb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/dgrZxBZjvVgu+WR5QPTfRJwGQ+2dnFZRaQ/MxvpN2k=;
 b=eB1i/a1UAen8O9mSdtdLh+0HbmW29FBbTzyAq61/zaikdXbwVSFGNFYLNBxSMZ1AZo
 zy1ix83Kyx3SvOF2kmJ5gLScfgv0+KlWsUL6UhOtiZHb9VZwzjcecc28cg5sXzAexnSq
 F9aWcHekUX/zT6nlLCea9Ax4S9f7Lx2yao67mTYL9drTIfJay6lz/kKd06fJhCtXHJsV
 kmhoq8opDjecJtOC22naOyZDXsapMNUet+U6MM4pa3UvgiY3RePIAadMQN/E4wV7brpU
 skzSQflU9bBR42j4/rvB/G3KBzfVhXcpzOxSj2gMOw2G1shsGR3VpnyfgBZUs/hLXHIJ
 iuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/dgrZxBZjvVgu+WR5QPTfRJwGQ+2dnFZRaQ/MxvpN2k=;
 b=iS9x6lNh51CM3+oPTpKJalFsjlmARreQ+8QTi0xoyd/yVpEzi8xX/nkRKOUoYMCZ4D
 k7qTH2N3UgiErgmKzIOI0uF9qq1rIIav1FTJrkqCqHl+pGgjGeb1XoA5UUhHMOaHt6SB
 sDlFxD6KJ8ixPFECJ1DMaB8JT6IQzkBEYygnHBKsKzNY4FgdtjkLqPtFeJwkykDsuaYu
 PdOFUgp0ungWo6ZybtFIzC3FO9QrBgS+tYFksn04rMRHByO2VrcFKJaV/I5QdU3oVua7
 ZoblqddtpUBpLb8kNR2HOJI7x2Pw5kpL3s03mDH7Jv2wRH7pN67M18HRvcUoiwAz7hQ9
 6PHQ==
X-Gm-Message-State: AO0yUKWG44udzQVqsm2X3yFtpYKhf5kPV9rkBATIK3zXxpQv54W89NLS
 K6Q0upVk9nod+IGsS8vPJc8cwQ==
X-Google-Smtp-Source: AK7set8PZ8x6VSuDBzym0IoaHoJ1WENgtRsOQjTrWfAEjpNFocNz29AmnJRSvSwRUhJejzN7eT8vTg==
X-Received: by 2002:a5d:46c8:0:b0:2ca:101e:1056 with SMTP id
 g8-20020a5d46c8000000b002ca101e1056mr10691383wrs.1.1678224561934; 
 Tue, 07 Mar 2023 13:29:21 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a5d67d0000000b002c758fe9689sm13432474wrw.52.2023.03.07.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 41F961FFC0;
 Tue,  7 Mar 2023 21:21:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 28/30] stubs: split semihosting_get_target from system only
 stubs
Date: Tue,  7 Mar 2023 21:21:37 +0000
Message-Id: <20230307212139.883112-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230307170405.796822-1-alex.bennee@linaro.org>

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


