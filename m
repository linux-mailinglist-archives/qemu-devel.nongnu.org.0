Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AA14DBEE1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 07:03:14 +0100 (CET)
Received: from localhost ([::1]:42826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUjE9-00025o-8V
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 02:03:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiOO-0005xf-9N
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:44 -0400
Received: from [2607:f8b0:4864:20::52d] (port=39444
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiOL-0002gX-Dm
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:43 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q19so1813039pgm.6
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IvBEhqppOoPljEvawEk60xBsH14k/3nhv0YU5DA6zfM=;
 b=VIXuo5Vn2DynCae9PPVpCUYAuRklbhoyvqcsAIeDc8A5uybJC+CslX01qBvSjCnYQ0
 o0Yn3GAievKV+CrzRqSbV5LPOoHoF178Njqrb58KBGe2N6eXvKjNSHaFNR43GBQ5WmHk
 e81wD1cOMjn4o9Hsw3fH2yN2EYnDsTynQHYts1xepZgU8yVJrPCsetR10qopl4dCDxrj
 m7AiywsHu2ttd8dH3HSScUOY9fBacrmqZP3TMXhjx7a0jsTbsxDCjdOk17FYFvaYmMKB
 5Lif+H4C9s4KTGcBx/gWdn/vmp5N9t8LwJPQ8yW+RZp/JZmRM7jVk5q0mTO3eiHHChpE
 knTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IvBEhqppOoPljEvawEk60xBsH14k/3nhv0YU5DA6zfM=;
 b=RLaHVAW9B59S7jLkVFT6vcQDw1J3FwIrC6A1VwARBmUnmVkkwvFxrQTdOkMjA3rmNg
 yYbqUanmO9kMxHUJ38c+DnncoQzkefZabbfncnOIWd3pfr7ePtBKpRmzd//wpvfWF2Nx
 R826M1kxwS3df4iKkwGl3wLFo5LzgxpbsZq+5DuEv/uuOZFNRzgDhm0lYm7b+dvYFh1j
 sptp/V3DTQulrfQmuweU6X7C9wcxzCwU7fDZ13t5wz7vawEakcu+BclCvOrm4xg+6qJz
 NuuDYEZpvaT8SLzNvXmzJz9rK+3KRbtgNXBmeNn/pg5uOwQsjRT1Y2E51ZvbivWfWwj/
 5DCg==
X-Gm-Message-State: AOAM531hdBak7YxgkNnI4vvR7cSwm7O8in+PzqyDGFDzI+tii9331Jhr
 pOZ+Ud+TYlxFmMZhwFgsQQvkXty3PwEGRw==
X-Google-Smtp-Source: ABdhPJyGDn2jTTnn3qs2eghAZtJ4rPlxhsTiiw0oUcBltvYlnFV05NnnG2fY5Jg9PiY8JbfLxgkk8Q==
X-Received: by 2002:a05:6a00:16c7:b0:4f7:e497:69b8 with SMTP id
 l7-20020a056a0016c700b004f7e49769b8mr3311703pfc.6.1647493769380; 
 Wed, 16 Mar 2022 22:09:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm4217493pga.34.2022.03.16.22.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:09:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 51/51] tests/tcg/nios2: Add test-shadow-1
Date: Wed, 16 Mar 2022 22:05:38 -0700
Message-Id: <20220317050538.924111-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a regression test for tcg indirect global lowering.

This appeared with nios2, with cps != 0, so that we use
indirection into the shadow register set.  An indirect
call verifies alignment of rA.  The use of rA was live
across the brcond leading to a tcg_debug_assert failure.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/nios2/Makefile.softmmu-target |  1 +
 tests/tcg/nios2/test-shadow-1.S         | 37 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 tests/tcg/nios2/test-shadow-1.S

diff --git a/tests/tcg/nios2/Makefile.softmmu-target b/tests/tcg/nios2/Makefile.softmmu-target
index 20d8d143c6..48863549c9 100644
--- a/tests/tcg/nios2/Makefile.softmmu-target
+++ b/tests/tcg/nios2/Makefile.softmmu-target
@@ -30,3 +30,4 @@ QEMU_OPTS = -M 10m50-ghrd,vic=on -semihosting >$@.out -kernel
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=0
 TESTS += $(MULTIARCH_TESTS)
+TESTS += test-shadow-1
diff --git a/tests/tcg/nios2/test-shadow-1.S b/tests/tcg/nios2/test-shadow-1.S
new file mode 100644
index 0000000000..33076ddf59
--- /dev/null
+++ b/tests/tcg/nios2/test-shadow-1.S
@@ -0,0 +1,37 @@
+/*
+ * Regresion test for TCG indirect global lowering.
+ */
+
+#include "semicall.h"
+
+	.text
+	.set noat
+	.align	2
+	.globl	main
+	.type	main, @function
+
+main:
+	/* Initialize r0 in shadow register set 1. */
+	movhi	at, 1			/* PRS=1, CRS=0, RSIE=0, PIE=0 */
+	wrctl	status, at
+	wrprs	zero, zero
+
+	/* Change current register set to 1. */
+	movi	at, 1 << 10		/* PRS=0, CRS=1, RSIE=0, PIE=0 */
+	wrctl	estatus, at
+	movia	ea, 1f
+	eret
+
+	/* Load address for callr, then end TB. */
+1:	movia	at, 3f
+	br	2f
+
+	/* Test case! TCG abort on indirect lowering across brcond. */
+2:	callr	at
+
+	/* exit(0) */
+3:	movi	r4, HOSTED_EXIT
+	movi	r5, 0
+	semihosting_call
+
+	.size	main, . - main
-- 
2.25.1


