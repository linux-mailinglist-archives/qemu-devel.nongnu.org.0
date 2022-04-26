Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA22510901
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:31:50 +0200 (CEST)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQub-0005uK-OB
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPqD-0002JD-6N
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:13 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPqB-0005aP-JL
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:12 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b15so18720100pfm.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcLPTrmVAgcHh5+H71eXJcJTiRdrPyiIekcsE1dJrc8=;
 b=NkDEQcnxrmJljVO1IlTpBPl7bu/pDDMXEdlIWE8eBOUzseZ+y3Mr0xb7gAgArBwMSm
 1Q2PQXApYWZczc6xU5CGFlTMLkvs+OBGVN0bXhovDhL+y+bZyQt2qdjw0HCIyqO6wJag
 p5dUuMOYkxQkGuvSl/eLJZ8VABbc1Du4XZi/G/Yl67sUXFDlvx6ha0VfvR7Bms+48wz4
 N6ty35yWSDJvQSdFnG+3mN5N5OaMlg7ziQVa47c+l1E5etgoe9RTu0zuZhhYTfDQ0lz5
 TYtwTMa6ighWJZKga3Y1iI2PelVWANQQCdx7WKULiJpApztm9nSn8c/CqPFbF8+mxDbG
 h98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tcLPTrmVAgcHh5+H71eXJcJTiRdrPyiIekcsE1dJrc8=;
 b=QiZSXVu/+pZsEVqjh3DBtKnBsEh8UeLgrK8ffMceprb16SMKHFqtdxTF9xgS5EVbSt
 PpyHyRHTDTN11lpELemlsM34sOquE8B+CGA54I/gakuZIIVGmOZlGjTP25hKisMUC3sy
 il2GF5GtWvYPSyLjeOeMbQ4XH/HtqHRZ8Zd9EDGdLCshVPchEdVS7M4mRCQEqwMccoFw
 781zmM4+l1dK3dH3MT8kTqZWoT5ClIZ6lz76wzTgasx6bBiKv95NqdAbHrpqRQE5mROu
 FheBjjC4kFlw249zyxAAxS7peAXvaw3lyKPRS5k8yj0aBBswAnhb+2nY+o1Mr5yC8pAF
 WROg==
X-Gm-Message-State: AOAM5312nUJyeSh1RfazwVbh0xOuGtqeA4IWBJeATndM6Prdn4fgvmoh
 eZ0hOUu2EZG8q0NWtmDoSJilXWYwG+0PXg==
X-Google-Smtp-Source: ABdhPJziiwPULRXdAmwaOU9EqPsdbtpbuKmJ0AjR+1xUOll8mghwLzyUMGLqi5zOel/Nj+79QRM5pg==
X-Received: by 2002:a63:6a85:0:b0:398:9e2b:afd6 with SMTP id
 f127-20020a636a85000000b003989e2bafd6mr20925433pgc.582.1650997390392; 
 Tue, 26 Apr 2022 11:23:10 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:23:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 68/68] tests/tcg/nios2: Add test-shadow-1
Date: Tue, 26 Apr 2022 11:19:07 -0700
Message-Id: <20220426181907.103691-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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


