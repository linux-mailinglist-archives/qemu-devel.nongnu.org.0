Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE3565102
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:37:11 +0200 (CEST)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IVy-0002ee-5S
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IT3-0008Gz-4S
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:09 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IT1-0004vt-Dg
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:08 -0400
Received: by mail-pl1-x62f.google.com with SMTP id l12so2730960plk.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jfQQ/MNFWhWhCmZ0fDK6Z3yWGSF3sEm5B4lXRoyup6I=;
 b=GPt4rEg+016A0HCaWClohznDEoeMsgn82kpFDB4R4VqTIq1r/XlH1Gyo3nDpOBo6Dh
 eXsvUon5zGXYJZ6KtKMQc4FKUpWDgLV7QkdBwe5ybd2fJ3CPNRtaTMLRjo8M838NRqdv
 mBB6NVsbiGAi7G1UkVJnninHDpp8I9fhCM4swMnEbeqNKjVuTl/6I9L/CcaF97xZvxRl
 vXqFcrkWPBQULOHEKNgulHvm859vuix1UITs7OVOxwVx/wsiyCBJtNFNPdJW9fje+4ol
 Q8G2kdTknb2fbVTgFAM94iNiGBDLVv1MVMdQEqbCetKPH1N0m4O2LVFBKod8uXZlzGQQ
 oqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jfQQ/MNFWhWhCmZ0fDK6Z3yWGSF3sEm5B4lXRoyup6I=;
 b=5gxqucRcnxX/SMLorY8HfJsPVFMN/7+famjA7V481eEn/FDdkUJtSxX3xLVS8+/pL8
 P5oMhEYmpAPwKyPCj32Lpw6Nx/0+HUX79QqUtWXNbK6I375saBqMoHNUQB1aULZRBAoH
 jAXRpZynE6p+eq680Z87U5ksRpdu9tEN+eHM6pscipbRezu/oPNeie+B2asmAhHdcEPp
 exIf8AnKi2qgkSCPcXuyFb4gEQ66bPdeoKjnYy1oncnkvggsSIUbXLUVViG+AQOr3QKg
 iHfWn6Ihcwcxu1pKGNop9BYgYJU+4h655Y0/Cp1Rc7oQmX5CW/sl6HyX52EexY0u4s9K
 0sdA==
X-Gm-Message-State: AJIora+WBeEbmhq0NVd/Ejr1+qnKGF/Chfog2Jdt7SocBi3mN5Zd/SUC
 gsdgWH62ab1o/FRHNv6FSWAKGi0Vmx2XgqgC
X-Google-Smtp-Source: AGRyM1uVYdysb8FtvQkJRaGTmcQLTrqhkehXS+rbsaVjmJwDOWx/2LzPc2m9fk+NtNdndYrFmcJb9g==
X-Received: by 2002:a17:90a:cf90:b0:1ef:87d5:4798 with SMTP id
 i16-20020a17090acf9000b001ef87d54798mr5180961pju.140.1656927245985; 
 Mon, 04 Jul 2022 02:34:05 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>
Subject: [PULL 01/23] linux-user: Add LoongArch generic header files
Date: Mon,  4 Jul 2022 15:03:35 +0530
Message-Id: <20220704093357.983255-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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


