Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B1E454AC1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:15:49 +0100 (CET)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNbA-0003Nh-Dq
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:15:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQL-0000QM-Q5
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:37 -0500
Received: from [2a00:1450:4864:20::32c] (port=46628
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQK-000344-CJ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:37 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2496089wmb.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lsz0dSeS3alNSK0Y33VjA4yL9Dqu5Jd7cft81LB0Bvs=;
 b=NY/aLkbrk5LYkJJaJOUy0lm3PB4Wg+KW8Uv5KDve0MKEH/QzBaoDbJm/z1wzR6soYW
 UycKIV4v+/tn7oknBI+UiFj4BtwkoIAu7E00FzKEj8qG2/RKkwXNsgaDmC61J2IKETK1
 pvUEbma8GCD6a+UBE8lET8QLP/0kpjjG+87UwW04BP52EQMqu937p4qXUgevREjree6F
 /NXldAdx0AsyE/FM5r+vYH4o8ffnLPVZSKdi2xL0B5ixs1GP6vO28RJMF61cMiZn/VFr
 RqFnfBx8VRdtqk4QHg8Ic58q0qjxJypa7Qwn+yhJAZ6ne4RLCa2ZKQHVmgwH3KlX8lB3
 UGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lsz0dSeS3alNSK0Y33VjA4yL9Dqu5Jd7cft81LB0Bvs=;
 b=3AkbbVpSUmY8F3sBxuzk8ZTaGkmjOvKputfH4Z+dq2QXXTRftA2qYxe+DwyM2y22Hq
 Xgvnmc2kxMdz6IxomBA4s30+SjBrCMaUysVGZkpcOy/Upc9z0OQXhSnsVhSobNYNId9W
 zw5UnCvYwXdHATckL/rljd9Av8YQlZwnLeRwcJIYw9/ESc819k4pE/L8vesOBSyAsDcF
 u6ZalCn2UGxS6hAT3S5shmJRNAyZu/+FOXU0lbLvD75gLnM/7bxUyJMFX2Xrm6QPjb4L
 Lfwo44bD+tBwEjmg8L78GmqxzQNLxkm2mogH2pRjkDMftvEAUc1bElUPucAudFirD7hV
 eLqQ==
X-Gm-Message-State: AOAM531AzaARSFu89StJeD1baFPiGWUKaTrwzF9sjQJMQQjXUzaVgTz8
 NdD5+bFcqJjUEC3iyDbARHql5LuGqwuzwPasTgU=
X-Google-Smtp-Source: ABdhPJwA07lGGwUad5UDlgVfSxs8HSw0sCCn5j3GFBADoSBMTU1T20UDdvm/XgYsRJFp3mP8TxdG8A==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr843725wmg.71.1637165074548; 
 Wed, 17 Nov 2021 08:04:34 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/17] bsd-user: Create special-errno.h
Date: Wed, 17 Nov 2021 17:04:06 +0100
Message-Id: <20211117160412.71563-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the internal errno used by qemu internally its own
header file, for use by safe-syscall.S.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/errno_defs.h    |  6 +++++-
 bsd-user/special-errno.h | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/special-errno.h

diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 583ebe8cee..73cfa24b7f 100644
--- a/bsd-user/errno_defs.h
+++ b/bsd-user/errno_defs.h
@@ -151,6 +151,10 @@
 /* Internal errors: */
 #define TARGET_EJUSTRETURN      254             /* Just return without modifing regs */
 #define TARGET_ERESTART         255             /* Restart syscall */
-#define QEMU_ERESTARTSYS        TARGET_ERESTART /* compat */
+
+#include "special-errno.h"
+
+_Static_assert(TARGET_ERESTART == QEMU_ERESTARTSYS,
+               "TARGET_ERESTART and QEMU_ERESTARTSYS expected to match");
 
 #endif /* !  _ERRNO_DEFS_H_ */
diff --git a/bsd-user/special-errno.h b/bsd-user/special-errno.h
new file mode 100644
index 0000000000..03599d9b5a
--- /dev/null
+++ b/bsd-user/special-errno.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * QEMU internal errno values for implementing user-only POSIX.
+ *
+ *  Copyright (c) 2021 Linaro, Ltd.
+ */
+
+#ifndef SPECIAL_ERRNO_H
+#define SPECIAL_ERRNO_H
+
+/*
+ * All of these are QEMU internal, not visible to the guest.
+ * They should be chosen so as to not overlap with any host
+ * or guest errno.
+ */
+
+/*
+ * This is returned when a system call should be restarted, to tell the
+ * main loop that it should wind the guest PC backwards so it will
+ * re-execute the syscall after handling any pending signals.
+ */
+#define QEMU_ERESTARTSYS  255
+
+#endif /* SPECIAL_ERRNO_H */
-- 
2.25.1


