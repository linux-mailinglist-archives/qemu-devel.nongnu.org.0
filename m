Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FDC6A8F8A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:00:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcu-0007cA-RD; Thu, 02 Mar 2023 21:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcs-0007ax-J4
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:30 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcq-0001ta-Po
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:30 -0500
Received: by mail-pl1-x630.google.com with SMTP id n6so1349585plf.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRaITTDPU/D6klVb43sMtjcQy7hN+w0/N4+Vvipb27U=;
 b=gp+rIZITTpoVxoZKl80/YVSUEdXSkc1kvrWIKz/5Jj9skHq5OWGrmscm6uuN8bP0bl
 8QGo/BGPaPzvMeWWgzCz5HqzFPnMb9n9duFJ8uG/9LughwRXvI+lP5G7XMNAbTORHTnG
 MgH1W2fsbzZiPhmWvvYHgXp7jKC6U6kxfjB51N4Zh/iKuTd9aftisZOgZWdGfc6SqYbo
 mBSb0AX90zOLUAFyDKlHuNuFeF8HLy3/Gf5zLxY9PhbtIAX3dxUwQQ4mxKRKwWyTFjkn
 LtDP0OKRnSHhx8gph17UTIgE6YnEo2JKnil5Vn7jsJNO665/LaLfNIrI+6doporIpCUz
 M+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KRaITTDPU/D6klVb43sMtjcQy7hN+w0/N4+Vvipb27U=;
 b=2i1tWpDBdObyEtPi1mQtPRBWtFEy+ICeieYnvAh0/DMFU+X3MGG1wfPQHzZ7UsFFk2
 UEj+kxtTzKrl5tSEccrkT32Ml5iuXLmYY82Ra1mdKuWHgA3zi+6JYEWPpj/101RhJXNU
 D1IB+exLLJQ0MBU2MqLkg/cVb86IgGx8/SNv29LBGnyHcUTQLjefzA8CcyfeF2J8rNsF
 KHJOFL75TXv+YDea0DHcjWkuKp90ADIPOwIo8mzK4gx/dN1zYtm75zxeCny+/QBqStPG
 h25Fr81VW28RRQ7knO6yzU/iuYjBsVHsebEQyKpK1raBqNbDbd/BLguV42ZW3ixEkzKC
 s5Wg==
X-Gm-Message-State: AO0yUKWkILSFz8+JVpgLFAC419HuMBQvL6JfnFBOPu+QTUNPUrrbn5hI
 xOGlzSvUS5mJJ+XL2kq9IFnxaH6P3S7A4vzuzOw=
X-Google-Smtp-Source: AK7set/hB9m08UNthc7Ug26KRkEJKbIOErC8PshPAwWzLYOT8LqwBllzuPrsKL18Dg6PXoGZJvTG8w==
X-Received: by 2002:a17:902:db01:b0:19b:c37:25e7 with SMTP id
 m1-20020a170902db0100b0019b0c3725e7mr431698plx.66.1677812307293; 
 Thu, 02 Mar 2023 18:58:27 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 24/29] include: split target_long definition from cpu-defs
Date: Thu,  2 Mar 2023 18:58:00 -0800
Message-Id: <20230303025805.625589-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

While we will continue to include this via cpu-defs it is useful to be
able to define this separately for 32 and 64 bit versions of an
otherwise target independent compilation unit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-25-alex.bennee@linaro.org>
---
 MAINTAINERS                |  1 +
 include/exec/cpu-defs.h    | 19 +----------------
 include/exec/target_long.h | 42 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 18 deletions(-)
 create mode 100644 include/exec/target_long.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d0113b8f9..3ef68cd0cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -137,6 +137,7 @@ F: docs/devel/tcg*
 F: include/exec/cpu*.h
 F: include/exec/exec-all.h
 F: include/exec/tb-flush.h
+F: include/exec/target_long.h
 F: include/exec/helper*.h
 F: include/sysemu/cpus.h
 F: include/sysemu/tcg.h
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index be920d4208..cd8aa177cc 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -55,24 +55,7 @@
 # endif
 #endif
 
-#define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
-
-/* target_ulong is the type of a virtual address */
-#if TARGET_LONG_SIZE == 4
-typedef int32_t target_long;
-typedef uint32_t target_ulong;
-#define TARGET_FMT_lx "%08x"
-#define TARGET_FMT_ld "%d"
-#define TARGET_FMT_lu "%u"
-#elif TARGET_LONG_SIZE == 8
-typedef int64_t target_long;
-typedef uint64_t target_ulong;
-#define TARGET_FMT_lx "%016" PRIx64
-#define TARGET_FMT_ld "%" PRId64
-#define TARGET_FMT_lu "%" PRIu64
-#else
-#error TARGET_LONG_SIZE undefined
-#endif
+#include "exec/target_long.h"
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 
diff --git a/include/exec/target_long.h b/include/exec/target_long.h
new file mode 100644
index 0000000000..93c9472971
--- /dev/null
+++ b/include/exec/target_long.h
@@ -0,0 +1,42 @@
+/*
+ * Target Long Definitions
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _TARGET_LONG_H_
+#define _TARGET_LONG_H_
+
+/*
+ * Usually this should only be included via cpu-defs.h however for
+ * certain cases where we want to build only two versions of a binary
+ * object we can include directly. However the build-system must
+ * ensure TARGET_LONG_BITS is defined directly.
+ */
+#ifndef TARGET_LONG_BITS
+#error TARGET_LONG_BITS not defined
+#endif
+
+#define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
+
+/* target_ulong is the type of a virtual address */
+#if TARGET_LONG_SIZE == 4
+typedef int32_t target_long;
+typedef uint32_t target_ulong;
+#define TARGET_FMT_lx "%08x"
+#define TARGET_FMT_ld "%d"
+#define TARGET_FMT_lu "%u"
+#elif TARGET_LONG_SIZE == 8
+typedef int64_t target_long;
+typedef uint64_t target_ulong;
+#define TARGET_FMT_lx "%016" PRIx64
+#define TARGET_FMT_ld "%" PRId64
+#define TARGET_FMT_lu "%" PRIu64
+#else
+#error TARGET_LONG_SIZE undefined
+#endif
+
+#endif /* _TARGET_LONG_H_ */
-- 
2.34.1


