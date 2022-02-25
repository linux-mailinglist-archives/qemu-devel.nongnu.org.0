Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D024C4CD1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:44:15 +0100 (CET)
Received: from localhost ([::1]:47890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeda-0002N9-Ap
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:44:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeH1-00048f-44
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:55 -0500
Received: from [2a00:1450:4864:20::631] (port=44777
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGo-0002Ot-NH
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:54 -0500
Received: by mail-ej1-x631.google.com with SMTP id p14so12122680ejf.11
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RH/EQPouYDfawCxme5y1a0aybgkGhiPJQumRKhl1sDc=;
 b=RgmrFtsNjlZnnNbsMz01CcHo9UzVo9UIupk3b3Ci/v095ajCccKzAJ+0LP1wWCNUkE
 K+KLbKc8ymH4/2hFiT4UsvD8VteHABA5Xroa6l6WVK3/fB1ABdCVvcaYiDNrdksWGAAd
 OXON7/ljzbJ1K106FSCHxcZmVmizDDW3fcOumw9Mkm3/Zd2HAMaL5tOGJTjUgnENwBQS
 SjF/iLOXbWKJIrIaEwiPGhvbHoJGBbCjOH7/BN6L8JXqgnsofmujVYecfZb8xp5dSXK0
 bQvq3CumqRjm8Dy5TJCVSRM4fDnr+YxpNB6FVNU2H5T2aDNDWjSdurYPSMxULja0NjyI
 jfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RH/EQPouYDfawCxme5y1a0aybgkGhiPJQumRKhl1sDc=;
 b=U3xbv93bF6DOPAANXzAJaLMMwwvLSkSgM8YgVoBWB5TvzxamACmyVtc67cUJ+924kO
 Gus+vXw/La9GvsaWSd8u9d8AyEdo7UZpuIvrV9NyYMBFzvTrZQ0BtyV/lLjBwzRH9ClG
 91rwqgxeNf0bJLkuB1eYsnpIiyuq/8fnaWgXc2z+QHoKQVHIxELRRmaAqUpXRawzH2hw
 7OH2MEbsCjSK1aI8X/3vIri6wQuCPsoqIkzl1Fe/y5lwv19y/cVGDnUpeK3SenlEBRsE
 F67wmkuSLgXdolaSctkd/TGRDqrtnTsnu8c0+YbpSs07yjw5yL7VghzvUScSrXRPnrrc
 QqZg==
X-Gm-Message-State: AOAM530Q/g3TZdigH4MsppHeujAeLq0fMy/9FUQB0iulU4Zi7GqBpfrM
 IxRZbhjyKJ8jSQj+O+BOzDBfSw==
X-Google-Smtp-Source: ABdhPJxugY40w7saZDeQMeKapHwXLU4+A5RZr0Bv2a1Y14PUV6fel42hP3kOQYvmf0i1eKeubZIMTA==
X-Received: by 2002:a17:906:4a09:b0:6d0:7f19:d738 with SMTP id
 w9-20020a1709064a0900b006d07f19d738mr6824090eju.76.1645809641386; 
 Fri, 25 Feb 2022 09:20:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 d25-20020aa7d699000000b004128cfcc228sm1655504edr.5.2022.02.25.09.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12DFA1FFC3;
 Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 11/18] tests/tcg: build sha1-vector with O3 and compare
Date: Fri, 25 Feb 2022 17:20:14 +0000
Message-Id: <20220225172021.3493923-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aim of this is to test code generation for vectorised operations.
Unfortunately gcc struggles to do much with the messy sha1 code (try
-fopt-info-vec-missed to see why). However it's better than nothing.

We assume the non-vectorised output is gold and baring compiler bugs
the outputs should match.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220202191242.652607-3-alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220211160309.335014-10-alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 10 ++++++++++
 tests/tcg/arm/Makefile.target     |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 1d967901bd..df3f8e9438 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -50,6 +50,16 @@ sysregs: CFLAGS+=-march=armv8.1-a+sve
 AARCH64_TESTS += sve-ioctls
 sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
 
+# Vector SHA1
+sha1-vector: CFLAGS=-O3
+sha1-vector: sha1.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+run-sha1-vector: sha1-vector run-sha1
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call diff-out, sha1-vector, sha1.out)
+
+TESTS += sha1-vector
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index f509d823d4..2dc94931c3 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -70,6 +70,15 @@ endif
 
 ARM_TESTS += commpage
 
+# Vector SHA1
+sha1-vector: CFLAGS=-O3
+sha1-vector: sha1.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+run-sha1-vector: sha1-vector run-sha1
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call diff-out, sha1-vector, sha1.out)
+
+ARM_TESTS += sha1-vector
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
-- 
2.30.2


