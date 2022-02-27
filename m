Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734754C58EB
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 03:07:58 +0100 (CET)
Received: from localhost ([::1]:42124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO8yb-0005HE-8S
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 21:07:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8v7-0002P8-BB
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:21 -0500
Received: from [2607:f8b0:4864:20::1036] (port=50922
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8v5-0007RY-4g
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:21 -0500
Received: by mail-pj1-x1036.google.com with SMTP id m22so8129359pja.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5J4j2QUD5vt82obSNxfgtqdYll6F0AeIdakFGRVRgeI=;
 b=IBgKIgH7FRw0YXjaXiW00J3/8dJharfpsVmXXb+D1lhSGC6PTd4SHw1A2cmb3AjQMV
 kGtNtKyT72O4bPKG4p8m0p4TZMlloCHVLrlc4MorVaZiherDvI1K+32Thbd++CqhaPL4
 c+CIDqGUVGU3g25T11HPSsLad8THNz5+H40k0CakbSbrWRTceLcqVknf3ZRnZYUkD9dv
 PISLN8PTJuUihQj+Jn6qLtY87oO2l6EEFw0zPh0QAzcU5E2klMfHT5cxwVn3aWNj8+AZ
 Om4nhelptdhUl8It1jfurotO/GTSzG6En5l/WB20OG4vOKNBsUqxzzAOezx8va24vnuE
 HCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5J4j2QUD5vt82obSNxfgtqdYll6F0AeIdakFGRVRgeI=;
 b=U+yaxasPLUnUz7Vpdm1w77MvXdru+0UEV5WNCPtnDLLHcr+t9coMmJ/b4HQCNJrgOz
 piZd/x+GF+gbi6PwN8gocxLmJLOn0ZszS2ME4psJQ+bP1xY2IJARszpWwl+dsCxPfeFz
 Yx8cpA2KwDUafTwL4Tc4bXsG/EellTS/+3QM8fZked3mTkE0/85YoqlnwkCvBWS7Sg+g
 TZmsTXW4nxiNsa5koCN0/zzWzx5ySMZFMUpruglDI4fFQBpUVsUiT7D8qR+LYbZ/oMMI
 U+MsJfJiwEMpGHbj/AnPrOYgkPYaoD9q4G+P3v4uY3w6qLMA/LspL07teBEJZIiFlhVo
 XmdQ==
X-Gm-Message-State: AOAM532uzcCbi4+fZHKi3dAAeOJT+u8HcKqjXk86E1o6iaBqNlqGHnZ+
 3op5XEUDAwmWAF01uG/F2GmPSgcOEWOxwAZ8
X-Google-Smtp-Source: ABdhPJzIetzFXGjUaHeL1naKXOfqEehH3N5G5l3nqiPrayvZBNRy1riBl8Iq3RXRvbl0vKb438D7Dg==
X-Received: by 2002:a17:902:e805:b0:14f:d33b:b769 with SMTP id
 u5-20020a170902e80500b0014fd33bb769mr14439394plg.24.1645927457458; 
 Sat, 26 Feb 2022 18:04:17 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm8304021pfj.43.2022.02.26.18.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 18:04:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] tcg: Add TCG_TARGET_SIGNED_ADDR32
Date: Sat, 26 Feb 2022 16:04:05 -1000
Message-Id: <20220227020413.11741-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227020413.11741-1-richard.henderson@linaro.org>
References: <20220227020413.11741-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index 528277d1d3..b3e32bc215 100644
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


