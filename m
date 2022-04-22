Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F550BF19
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:58:03 +0200 (CEST)
Received: from localhost ([::1]:51086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxXe-0005X7-Si
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwbK-0000vM-T3
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:47 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:36518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwbI-00085g-HH
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:46 -0400
Received: by mail-io1-xd29.google.com with SMTP id y85so9242465iof.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcLPTrmVAgcHh5+H71eXJcJTiRdrPyiIekcsE1dJrc8=;
 b=ub8RorTtgqKtjwnO4T2Sn8vSSxJAL9SaJsPTSjaKwK878M10qPQ87jTt7A+h/df4h9
 BGM90tUh5aNBboMFhu53h4o9b8u+1QGYgbCHEYwskEhCQpHfbPyvYiioDzA8tc8vXkUv
 x4Qp1V27aearC6+QNmmC6Yqn2ZjA6Ix4cTDNkcegpsAOblv0T2afcnRBy/LKBrFxZU2g
 WERT/LYMXdD0MMXfZgKLCziXf19lMmwMtQzYVqIO5uzi5zslkU594kZ7gFgbQqed0TvR
 M9YQ33dwAeBzw1ZxhdN4hz+cVy9d2LDF/lgjqD8fu5DsnZx+K15+eP3/tvenmyULcZxm
 T+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tcLPTrmVAgcHh5+H71eXJcJTiRdrPyiIekcsE1dJrc8=;
 b=obwU+9rYV4LKE5eUfOOB+jxBlBrpiaNs+eEHLuKYJcFAlc4umj2KSlC4en2mhQnsmz
 TEmq+5F4kj/15+FFyjt2WbUOAKEM4jjQQ85PCtgkNTAypYLQ34QXGtNb9Ve4TwgaUC02
 erS6DZOJLxUZDyzhk4LRJWW18/KvVOE68KR6TUhl9I8fAjtZlMLJrzTN2ZMKurZ0fOHd
 OP0ZCqiV4q27jxLU3QhPDHRcuiDPNjGSGymAXgR6drdcFZOL/SR+rz5twbsH176mt/9i
 xR/u+C0PxjASdixbbcEhaD/+snedpDBX209PL0ar/Z37dYD5Yrfn0A2g14WvUviFmMel
 QcmA==
X-Gm-Message-State: AOAM5331fPTklrY9cwBYk0pBMDeCBLdmGbVN6xLghSOrm7NjJzuTCmw6
 1RsIvcRVvZnP6A8hbB6xOee5CJOK/DqIAvxg
X-Google-Smtp-Source: ABdhPJxAR6MGb0AcnFbN7Y+mymDtzQm17nypMkpZ/y6OsOZpleRUYBN2lrfwVVlT4ko2NjkEQtUbAQ==
X-Received: by 2002:a05:6638:35ac:b0:328:973b:8842 with SMTP id
 v44-20020a05663835ac00b00328973b8842mr2770638jal.160.1650646663569; 
 Fri, 22 Apr 2022 09:57:43 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 68/68] tests/tcg/nios2: Add test-shadow-1
Date: Fri, 22 Apr 2022 09:52:38 -0700
Message-Id: <20220422165238.1971496-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd29.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-65-richard.henderson@linaro.org>
---
 tests/tcg/nios2/Makefile.softmmu-target |  1 +
 tests/tcg/nios2/test-shadow-1.S         | 40 +++++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 tests/tcg/nios2/test-shadow-1.S

diff --git a/tests/tcg/nios2/Makefile.softmmu-target b/tests/tcg/nios2/Makefile.softmmu-target
index cea27472a6..c3d0594a39 100644
--- a/tests/tcg/nios2/Makefile.softmmu-target
+++ b/tests/tcg/nios2/Makefile.softmmu-target
@@ -30,3 +30,4 @@ QEMU_OPTS = -M 10m50-ghrd,vic=on -semihosting >$@.out -kernel
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=0
 TESTS += $(MULTIARCH_TESTS)
+TESTS += test-shadow-1
diff --git a/tests/tcg/nios2/test-shadow-1.S b/tests/tcg/nios2/test-shadow-1.S
new file mode 100644
index 0000000000..79ef69db12
--- /dev/null
+++ b/tests/tcg/nios2/test-shadow-1.S
@@ -0,0 +1,40 @@
+/*
+ * Regression test for TCG indirect global lowering.
+ *
+ * Copyright Linaro Ltd 2022
+ * SPDX-License-Identifier: GPL-2.0-or-later
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
2.34.1


