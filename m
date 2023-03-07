Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10BE6AF7A8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:31:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesD-0004jq-Jm; Tue, 07 Mar 2023 16:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesB-0004hi-7n
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:27 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes8-0000vg-9B
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso33708wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=10urY+DE/GoqkWZwAJl3fNjwNytocxqDh4m1t+x1+lQ=;
 b=mrMmT/0dV3Br+w/6jXbEeaw98I5qOhvJKOKoRqzWaLu4B2QybMIu7WGbrlESfPbBPp
 j04Dq8jtwg/bFJHX5jRsqj1nnD8xC8lXAf32IczobO0CRHB1naP/FV+B1rsSGjaF10Aa
 bes8NvNftnd4zXV5XqAaZSzYB6gKj1GEfpIkrbj8ui1tLoh3lMP/DXvVs1SjuUlDAeXX
 xxSZO7XHc6J9FkaerDKcjY0fY6P7dQUeOwWpsk4K1ITOF8iJde0cHqAD0UkLShn5e0LG
 PXrpi3i2Sdu2+cp5QAe34b/D/e283beZLtWq+pvB+pO1Yt4ACNpDk+G5cFBRtXmkSJyw
 vRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=10urY+DE/GoqkWZwAJl3fNjwNytocxqDh4m1t+x1+lQ=;
 b=o4WkGBGoqp3A2LuN0Wh3u+747/fij+1gvYPP/5cZjja8D7x2l9oqAfOEH2lZftzWl2
 nNfmklv6n5hxU4KJeTRYV7gaXEDjYEAxAes2sb1VTVL5TOU5r4D8sqPKwWNaOE7kKZbU
 Ojg2p05nsqu4IJzdxcuVDkvG1qEdqF8T5PgF07mWMKw5Szgyu8MGrxZaGXHe2VrvGcCz
 OBdH8VIMheQVud/A/OELZ+L3RP3bF3IVm2nq7aWBg8DH1fCrYmF5zg+00Fp3F9uAK5/e
 X6QKk2W71mK653PzN1hU4LJp1yaMjUt1J9bmme/DCC1IeL6oDZyCyCt2vSNtIni/+A50
 2jyg==
X-Gm-Message-State: AO0yUKWY5nQEk95bZ80iMnK9IKJXxyFSX/8kmq7tja+gWuyQnXrGJ8uI
 E5ixbuqixjDSCiCAf6aLfTIeag==
X-Google-Smtp-Source: AK7set8YWjUxtTSpJvimN8y0geggs0kSVt1XCQTEfYFC+QRS/HYL9NoCR+Xdyt1n/0mMqdPMhrZ5rA==
X-Received: by 2002:a05:600c:c11:b0:3df:d431:cf64 with SMTP id
 fm17-20020a05600c0c1100b003dfd431cf64mr14246262wmb.39.1678224562946; 
 Tue, 07 Mar 2023 13:29:22 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003e9ded91c27sm19683660wmo.4.2023.03.07.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB0221FFCC;
 Tue,  7 Mar 2023 21:21:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 24/30] include: split target_long definition from cpu-defs
Date: Tue,  7 Mar 2023 21:21:33 +0000
Message-Id: <20230307212139.883112-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

While we will continue to include this via cpu-defs it is useful to be
able to define this separately for 32 and 64 bit versions of an
otherwise target independent compilation unit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-25-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-25-richard.henderson@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 04857c71fa..f403619a84 100644
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
2.39.2


