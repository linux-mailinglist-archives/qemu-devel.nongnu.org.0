Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E00256467F
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:47:11 +0200 (CEST)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7wC6-00077C-JH
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vRt-0003pj-TG
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:25 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vRs-00048q-7H
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:25 -0400
Received: by mail-pl1-x632.google.com with SMTP id l6so6034787plg.11
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jfQQ/MNFWhWhCmZ0fDK6Z3yWGSF3sEm5B4lXRoyup6I=;
 b=jhTJ6QHzlJbOgiRnm8tq9x5iOzXSRk1XpXMX5J4+n6Tq74iE22xB4QK1VSfOYetk1n
 FsfEs9wBVY29378mjIJ1fnzEmD+fqOmWq+kA4RHtjPLgif5bLO7erg6TD1ht7ui2KUz+
 taDNdo478zUGVnf4skM0EJBNsO0qVNw4Qq0tx8IdIXkKkLYDZo+8oxq5WbzJquqKQd3N
 v4U8mGOY159i6o8H3mlYk0bnIxn1nJDTDyPmyOwjnutqCPehHiFZ+3K161T6deXszk9y
 wgK/xJLn1hOPek3t1/5TTG+ooF2cDiOg7i0h2hc0e+fIpftyIbQVjTdr8gzi3xmV+Trs
 q3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jfQQ/MNFWhWhCmZ0fDK6Z3yWGSF3sEm5B4lXRoyup6I=;
 b=PPzBys1K40ZgtFcwVjk9QRyNQKiqERorgjx83iYe//9/UzfjP02nFzjww0BwKPB8pJ
 lYFqppAwuEgmH79dr9KsgMs1RX4nrhaWYYdMgySYqyjsQxNreYb3EmRSJQ57vm5Ap6bT
 CdvVQIm7RuW32g7/Yw5sQEWvQnCObIHz/hflF2A1CoUPFCZTjC9YhRARAAlgyndTVL/U
 ifdpc6MUfyfG/agJou9/+FUdH4NlMJ6ADGwiUB3FQ9hbI4akdedlQ4TZl9Fh8g1q5Lo5
 DEtUh1NN6gw52XhgNjRXxnUtPiLeD46Ogks8f62o/UbqocxMszRm0Qzsv0WJPKZsCTGi
 NRPg==
X-Gm-Message-State: AJIora/8bzIKXdHjJWFxnPI7LUd+j+O/fz6KKD0l7qQRRZloYs1qQ2VD
 gAdey2Q2qpiJgeZl4ohGvQAOsKTELe5VekK7
X-Google-Smtp-Source: AGRyM1uibHvL3HChN5uSzeIt8f4I1K+W4JCup8P7iv2d7MCf5AjUr2bqI1z0VjK1fJQCL/gDKcg02w==
X-Received: by 2002:a17:902:f149:b0:16a:389:1292 with SMTP id
 d9-20020a170902f14900b0016a03891292mr30492250plb.120.1656838762722; 
 Sun, 03 Jul 2022 01:59:22 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>
Subject: [PATCH v21 01/13] linux-user: Add LoongArch generic header files
Date: Sun,  3 Jul 2022 14:29:01 +0530
Message-Id: <20220703085913.772936-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
References: <20220703085913.772936-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

From: Song Gao <gaosong@loongson.cn>

This includes:
- sockbits.h
- target_errno_defs.h
- target_fcntl.h
- termbits.h
- target_resource.h
- target_structs.h

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: WANG Xuerui <git@xen0n.name>
Message-Id: <20220624031049.1716097-2-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/loongarch64/sockbits.h          | 11 +++++++++++
 linux-user/loongarch64/target_errno_defs.h | 12 ++++++++++++
 linux-user/loongarch64/target_fcntl.h      | 11 +++++++++++
 linux-user/loongarch64/target_prctl.h      |  1 +
 linux-user/loongarch64/target_resource.h   | 11 +++++++++++
 linux-user/loongarch64/target_structs.h    | 11 +++++++++++
 linux-user/loongarch64/termbits.h          | 11 +++++++++++
 7 files changed, 68 insertions(+)
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_prctl.h
 create mode 100644 linux-user/loongarch64/target_resource.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/termbits.h

diff --git a/linux-user/loongarch64/sockbits.h b/linux-user/loongarch64/sockbits.h
new file mode 100644
index 0000000000..1cffcae120
--- /dev/null
+++ b/linux-user/loongarch64/sockbits.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_SOCKBITS_H
+#define LOONGARCH_TARGET_SOCKBITS_H
+
+#include "../generic/sockbits.h"
+
+#endif
diff --git a/linux-user/loongarch64/target_errno_defs.h b/linux-user/loongarch64/target_errno_defs.h
new file mode 100644
index 0000000000..c198b8aca9
--- /dev/null
+++ b/linux-user/loongarch64/target_errno_defs.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_ERRNO_DEFS_H
+#define LOONGARCH_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/loongarch64/target_fcntl.h b/linux-user/loongarch64/target_fcntl.h
new file mode 100644
index 0000000000..99bf586854
--- /dev/null
+++ b/linux-user/loongarch64/target_fcntl.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_FCNTL_H
+#define LOONGARCH_TARGET_FCNTL_H
+
+#include "../generic/fcntl.h"
+
+#endif
diff --git a/linux-user/loongarch64/target_prctl.h b/linux-user/loongarch64/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/loongarch64/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/loongarch64/target_resource.h b/linux-user/loongarch64/target_resource.h
new file mode 100644
index 0000000000..0f86bf24ee
--- /dev/null
+++ b/linux-user/loongarch64/target_resource.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_RESOURCE_H
+#define LOONGARCH_TARGET_RESOURCE_H
+
+#include "../generic/target_resource.h"
+
+#endif
diff --git a/linux-user/loongarch64/target_structs.h b/linux-user/loongarch64/target_structs.h
new file mode 100644
index 0000000000..6041441e15
--- /dev/null
+++ b/linux-user/loongarch64/target_structs.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_STRUCTS_H
+#define LOONGARCH_TARGET_STRUCTS_H
+
+#include "../generic/target_structs.h"
+
+#endif
diff --git a/linux-user/loongarch64/termbits.h b/linux-user/loongarch64/termbits.h
new file mode 100644
index 0000000000..d425db8748
--- /dev/null
+++ b/linux-user/loongarch64/termbits.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_TERMBITS_H
+#define LOONGARCH_TARGET_TERMBITS_H
+
+#include "../generic/termbits.h"
+
+#endif
-- 
2.34.1


