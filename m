Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5CD4A791B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:59:02 +0100 (CET)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLmP-0007Q3-0N
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:59:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFL3k-0000sB-Ha
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:12:53 -0500
Received: from [2a00:1450:4864:20::42e] (port=42632
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFL3i-00076o-4f
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:12:52 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a13so423183wrh.9
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 11:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ciwtQRYp+ZkYZFOyVCHc04Xgk2L4OSDwdO0wrIkxEI=;
 b=I7feO50uieaWShuFhY8FRcQdY8NbWpCW64t2xFEgqIhsl6kq22u21f1iaUJj+gkgAs
 vB7gnBOM2Rvr3tFpTjPaEswn/h+FVMHFRw7Mu0x5WB4IPMd2Q148VWKCAGTUV2PpLKEQ
 lf0MR1vAayhDh2lULpTIa6AfAlV+wbgNF7dwa0JJt5fxNDBaePfM8yyBOVPHfpy3wxHh
 z61taVaqivZ++RnM3/bjDFRDVKO9DHIfLV9xm7JM2fBkL1QGBY69y0rwloFxHFLjd8/b
 UJoV+hy8HHUuevpKcbOaopE21DWR2YKEQlEpMfKzD8Lk/w9MLu0oeNbxxHrQ5D/kaBhH
 085w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ciwtQRYp+ZkYZFOyVCHc04Xgk2L4OSDwdO0wrIkxEI=;
 b=40vX1eqdl1PuGMasykp36eKxiJxKaoakK2Z3NGociXolzyo+8ze2KGIbjG+SWHSs9V
 PPgvkaLlGsPCt1SQkqtY8cJMfZgfsPSsoN9Onj69nKT76O/i/HGkvJp4wMYza0Y4yfk8
 jymoa4RCIAOnpaC/mwHu5rL+z64Tis+SbM/oJqiiLgfNtFQWTMOO2RlJxh9D7nabKhGI
 cZ32jHRrVP4EkLILo0XXua6uylGp+1RPBszq2lA+/HdSB7FbY5lwEizQDijaNElMO66k
 qH+cN8Jy633lOmoGUF9S+TDdo+bSzjsPYPNwa0fhxDIkh0B+xonbcJMF/BKHotYOlpH6
 OXvw==
X-Gm-Message-State: AOAM533yvT+TgbGhi8g2QPp4KZim9a0QJ+D+/hBPsdITJIodg96FShuW
 g5tbO07Kty3uTI+Ik5a0Qvz7AQ==
X-Google-Smtp-Source: ABdhPJymLfdRrfdHNaifp11L7q37+pwJnsf3nyT/V31rFMXtmLo34MTnvEM6udaeC7q71J1CkC56Eg==
X-Received: by 2002:a5d:4643:: with SMTP id j3mr25696918wrs.356.1643829167474; 
 Wed, 02 Feb 2022 11:12:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x5sm5287399wmh.27.2022.02.02.11.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 11:12:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4E9C1FFBA;
 Wed,  2 Feb 2022 19:12:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH  2/4] tests/tcg: build sha1-vector for SVE and compare
Date: Wed,  2 Feb 2022 19:12:40 +0000
Message-Id: <20220202191242.652607-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202191242.652607-1-alex.bennee@linaro.org>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aim of this is to test code generation for vectorised operations.
Unfortunately gcc struggles to do much with the messy sha1 code (try
-fopt-info-vec-missed to see why). However it's better than nothing.

We assume the non-vectorised output is gold and baring compiler bugs
the outputs should match.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 1d967901bd..a03844ce48 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -50,6 +50,18 @@ sysregs: CFLAGS+=-march=armv8.1-a+sve
 AARCH64_TESTS += sve-ioctls
 sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
 
+# Vector SHA1
+
+sha1-vector: CFLAGS=-march=armv8.1-a+sve -O3
+sha1-vector: sha1.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-sha1-vector: sha1-vector run-sha1
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call diff-out, sha1-vector, sha1.out)
+
+TESTS += sha1-vector
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
-- 
2.30.2


