Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598D064EA3B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:23:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68nB-000247-5v; Fri, 16 Dec 2022 06:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n8-00022e-AK
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n6-00067r-1K
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:13 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so3888783wmb.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7dX4oW2bf7HAdMmJshzEuL5X8vSI7l3I3jBaCAsCrI=;
 b=NvjmaokLKYzq3cR4NhKE1XQGU1VPnimJzc3atR9iUrVWhZ9eS8NJRzK17mCOhlPgy6
 TscSF/mNWdM7KF6jPnClFspFv1Rax8epYlghzNqTFqg3uNdaN3QgAloeGdvRy71GuNUv
 m/GOY7fVN0+CaWpjs6otwTL98pwtJxi5FxxNFXUpkcqZUm/S6dgK3i62y0hUxMiG7769
 iGJB3NG3ivHfGfyS3IwRkYEYSxsqhskngXun50Bh7rPmRAwdZtal0Sh7OV4jSEVNzuqW
 PjWrrPvpi2D9wCepEIL3EVQ8VHkc4EPNzUN9aBrn/hA0rnW3Tf5NKdC9I2cK31jBrirj
 jTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7dX4oW2bf7HAdMmJshzEuL5X8vSI7l3I3jBaCAsCrI=;
 b=ifsHIEoWi4hkzOuX/kXqCkr9aKXY71FKInHfn4WbnBOF3/w9ZZcbS4HAN/fxhP8AxH
 4l6LH70j77FPvEDbLd5kgS8eOeS605VXee5UFi6sU2EjaIqp2BTzdIR15Lu69BhsFV8e
 PmzaIWVd7M8DJ58XdmBhuS89j9us9X8wMTYgpY1CToviE6unP6dnNf7LWcpNA8q/64Fh
 twXeSG0kjWuYLSqOpNP/qEa2yNHKdYQVTnJlfLhf/NGs5PW7cQtLujIu/LfGTUeFv5HP
 NRFsfe7qdtha7MDgnpnPuh4d5lOxsiaaOuwTZ1ksva69vhJjAOPSKLt/l4KUBiTHGhLM
 5jjQ==
X-Gm-Message-State: ANoB5pmJicLiwyI2/oHF39E3s+WNYKhKevEgOj0Tm0jy68cLBATyot6U
 g4SuJGWdcoQ7bMS4sc2y+xhG+rZ0k5+Xp2ip
X-Google-Smtp-Source: AA0mqf4HIPgMKauT7D3a4g7/Gi4SujLEfQeXhEPZNKXrvL0kEVuRE4k4ymU3hFHo3ainWg3wsn33eQ==
X-Received: by 2002:a05:600c:4f51:b0:3cf:d18e:528b with SMTP id
 m17-20020a05600c4f5100b003cfd18e528bmr25603833wmq.39.1671189730544; 
 Fri, 16 Dec 2022 03:22:10 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c0b4b00b003c5571c27a1sm2590112wmr.32.2022.12.16.03.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:22:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B216B1FFBF;
 Fri, 16 Dec 2022 11:22:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH  v1 07/10] includes: add new gdbstub include directory
Date: Fri, 16 Dec 2022 11:22:03 +0000
Message-Id: <20221216112206.3171578-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216112206.3171578-1-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
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

To avoid having a messy set of include files containing system and
user APIs lets prepare for a cleaner layout.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/gdbstub/common.h | 14 ++++++++++++++
 include/gdbstub/user.h   | 14 ++++++++++++++
 MAINTAINERS              |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 include/gdbstub/common.h
 create mode 100644 include/gdbstub/user.h

diff --git a/include/gdbstub/common.h b/include/gdbstub/common.h
new file mode 100644
index 0000000000..f928dbc487
--- /dev/null
+++ b/include/gdbstub/common.h
@@ -0,0 +1,14 @@
+/*
+ * gdbstub common APIs
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef GDBSTUB_COMMON_H
+#define GDBSTUB_COMMON_H
+
+
+
+#endif /* GDBSTUB_COMMON_H */
diff --git a/include/gdbstub/user.h b/include/gdbstub/user.h
new file mode 100644
index 0000000000..53baba65ff
--- /dev/null
+++ b/include/gdbstub/user.h
@@ -0,0 +1,14 @@
+/*
+ * gdbstub user-mode only APIs
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: LGPL-2.0+
+ */
+
+#ifndef GDBSTUB_USER_H
+#define GDBSTUB_USER_H
+
+
+
+#endif /* GDBSTUB_USER_H */
diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..c84d9299c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2698,6 +2698,7 @@ R: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
 F: gdbstub/*
 F: include/exec/gdbstub.h
+F: include/gdbstub/*
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
 F: scripts/feature_to_c.sh
-- 
2.34.1


