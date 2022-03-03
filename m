Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A544CC5ED
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:21:32 +0100 (CET)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPr11-000780-Js
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:21:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvo-0001qk-DK
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:08 -0500
Received: from [2607:f8b0:4864:20::533] (port=39737
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvk-0007SM-0E
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:07 -0500
Received: by mail-pg1-x533.google.com with SMTP id 195so5461867pgc.6
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eYMPBK8uImUtEf60mqBA0vpSt2l5oNERr0mQgdkY/9s=;
 b=kqh4zXoSucppFDZzorR9VmtyuwDk+wZFTR46pccKn45uGw9xbCvRD7lktc5gtRNEwx
 w3moOjeWVxlx1l1g41iP1cC1QyCulXhXfK4Y07D7J3/CbZWadAWARHNAFr+Q1yuYkXXV
 HOmFxtrv178UrXvrG5O4M621iAm8tqYy9Onau5lTJIYSY8f3TWVmTYuhuoBpvJDiKZ7D
 1fvfcxbNO4qwvgZCBBiPxc6C9DFhgPs30QxuRL1Z44O/7cySVstCwQrx5RHrzkGnYW2g
 mEl9AxVgKDovxDfwn5N111IFhZtdNsUHe6ZB9YuDixlGfEIeRYdl/emxVNETbISjJ0eT
 RksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYMPBK8uImUtEf60mqBA0vpSt2l5oNERr0mQgdkY/9s=;
 b=jjPQIjV0ysssuZBPuSyOoI4L5Mxu1G2KsYUUrs7IVe0c0eGZYLjWkO6RDwtcWhQMrj
 W0d7dz8fJYbnT0ToS0CBfBkd3P3lLEF6oOTzt3YNo/43ilzn+k4vuvRLDLJXBybdeAQy
 UJGX03lVdnqoY59oiiiIuVXDzS4Rv2lcagEsOHPseyOdDQfuvnEaNF6m032tPT7KhS0P
 iBTb5RPNcQny1pmH3yfigq7NNCcoYksOyo90bdEbsBqjFtH/mSU2UjqPipNHLQGwEp3b
 mWuhvasVTQtoyoCl4ikD/CI/swhqmNJnjKICZqJMgetDfm9SHy55MpH0gOXWI/xuswq0
 Rlug==
X-Gm-Message-State: AOAM532Fzd9tuO+ki8x4jU3T8+T9+J6YwmZHNxcnrGE+updpUlEOCOLG
 aAPKoEj8d/CEORxs3aHXnLo3f6WXyRWa/g==
X-Google-Smtp-Source: ABdhPJyymSb0EzkuwTvuX4+V1MolgevWKTMYohohrHXP6mVtPoB2CZ5GwsppHzQNMxi8OOg3lTq/bA==
X-Received: by 2002:a05:6a00:1a07:b0:4f3:eba5:42ae with SMTP id
 g7-20020a056a001a0700b004f3eba542aemr28207748pfv.53.1646334955438; 
 Thu, 03 Mar 2022 11:15:55 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm3318043pfh.46.2022.03.03.11.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:15:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/9] tcg: Add TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 09:15:43 -1000
Message-Id: <20220303191551.466631-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303191551.466631-1-richard.henderson@linaro.org>
References: <20220303191551.466631-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define as 0 for all tcg hosts.  Put this in a separate header,
because we'll want this in places that do not ordinarily have
access to all of tcg/tcg.h.

Reviewed-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-sa32.h     | 1 +
 tcg/arm/tcg-target-sa32.h         | 1 +
 tcg/i386/tcg-target-sa32.h        | 1 +
 tcg/loongarch64/tcg-target-sa32.h | 1 +
 tcg/mips/tcg-target-sa32.h        | 1 +
 tcg/ppc/tcg-target-sa32.h         | 1 +
 tcg/riscv/tcg-target-sa32.h       | 1 +
 tcg/s390x/tcg-target-sa32.h       | 1 +
 tcg/sparc/tcg-target-sa32.h       | 1 +
 tcg/tci/tcg-target-sa32.h         | 1 +
 tcg/tcg.c                         | 4 ++++
 11 files changed, 14 insertions(+)
 create mode 100644 tcg/aarch64/tcg-target-sa32.h
 create mode 100644 tcg/arm/tcg-target-sa32.h
 create mode 100644 tcg/i386/tcg-target-sa32.h
 create mode 100644 tcg/loongarch64/tcg-target-sa32.h
 create mode 100644 tcg/mips/tcg-target-sa32.h
 create mode 100644 tcg/ppc/tcg-target-sa32.h
 create mode 100644 tcg/riscv/tcg-target-sa32.h
 create mode 100644 tcg/s390x/tcg-target-sa32.h
 create mode 100644 tcg/sparc/tcg-target-sa32.h
 create mode 100644 tcg/tci/tcg-target-sa32.h

diff --git a/tcg/aarch64/tcg-target-sa32.h b/tcg/aarch64/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/aarch64/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/arm/tcg-target-sa32.h b/tcg/arm/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/arm/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/i386/tcg-target-sa32.h b/tcg/i386/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/i386/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/loongarch64/tcg-target-sa32.h b/tcg/loongarch64/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/loongarch64/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/mips/tcg-target-sa32.h b/tcg/mips/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/mips/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/ppc/tcg-target-sa32.h b/tcg/ppc/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/ppc/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/riscv/tcg-target-sa32.h b/tcg/riscv/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/riscv/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/s390x/tcg-target-sa32.h b/tcg/s390x/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/s390x/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/sparc/tcg-target-sa32.h b/tcg/sparc/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/sparc/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/tci/tcg-target-sa32.h b/tcg/tci/tcg-target-sa32.h
new file mode 100644
index 0000000000..cb185b1526
--- /dev/null
+++ b/tcg/tci/tcg-target-sa32.h
@@ -0,0 +1 @@
+#define TCG_TARGET_SIGNED_ADDR32 0
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 33a97eabdb..8c131293fe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -61,6 +61,10 @@
 #include "exec/log.h"
 #include "tcg/tcg-ldst.h"
 #include "tcg-internal.h"
+#include "tcg-target-sa32.h"
+
+/* Sanity check for TCG_TARGET_SIGNED_ADDR32. */
+QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS == 32 && TCG_TARGET_SIGNED_ADDR32);
 
 #ifdef CONFIG_TCG_INTERPRETER
 #include <ffi.h>
-- 
2.25.1


