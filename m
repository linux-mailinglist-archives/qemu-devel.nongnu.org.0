Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F043DEB83
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 13:04:19 +0200 (CEST)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAsDa-0007qn-E4
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 07:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAsC8-0005kx-ES
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:02:48 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAsC6-0003k6-Sk
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:02:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso1457715wms.1
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FcmgASapL/jbxLLz2AgS1gw0FxDPEQ4usRRpydHEWTk=;
 b=iiVWvc6+L5+EUOonWuRJgC8i6DMfgFN8I4VZO7EmLAeGqa/kHgjUitfg6SMezE20h+
 o7Z8LzAkDyJESxLZIeekv76nplSVN0wlVswg1bx0Nfau9VdVEnxyCHrDd9wrPFww5qTC
 spZhWpp3yQeOcT6WSIxbCdcAt2piFcUZB9JEKn4qC7N+VNWLgCn3VniLDRurm9aZEGF/
 2YqiHrlvJTMkXvriRfjL3cYAnE6dCwQWkRxyAEjWjwGvK6YbIgBHh7uipMAmkQDfXgdQ
 E2cU/RWHvsPDeeMyO5A2Pwp3gfvWpqCLjJ5BnE5c96W5A3Wxe18OrDnno083J8h0OWP3
 QOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FcmgASapL/jbxLLz2AgS1gw0FxDPEQ4usRRpydHEWTk=;
 b=eyYQwiKWvjWWCyOfz1eVj7PxMHHtVTHkuEitlC2lCnOhhWJ+ztnMzRQ/cehlATIiMy
 ee5NkA+xC5Tucm8nT8+8WQnIFC71ZEGFGC4QJs5CIXL75CCxiHl7scyHTbTOcLrMmld5
 N1Rmbyb/cP8ggFq3zjwIxowpM4V07EDzBPwXm9Wz4R5HjLha99M3HmQCxAZPNrVwQrl1
 rLC+z0kU2Ad0Av+B++UzEAgnZRW8quvHd36vC0SRnlyxyNd21bsP6oTd09J9eDjyXbXO
 NqR/pW/VxJ5W2u+D6htqTWD8qf/DgxBdiipLr9mGVJ85Rzbuy0FXAacOzoU9hGyPWvh1
 JZMQ==
X-Gm-Message-State: AOAM532nvJY69CZk+SqmmOdwFWmloqXtbO3l9nTLPcBP248Q36u/GKZT
 YSlR0ZuT0p1SYL+ArsPRFRUPjw==
X-Google-Smtp-Source: ABdhPJw1g6ZRNoLm9nFhMzMTKoozKNvC3o1OtMWXFFG5dJXZYuRmnB7eCe/bQGesa5x4BaFGTakXcQ==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr3720093wmk.97.1627988565546; 
 Tue, 03 Aug 2021 04:02:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p4sm13633059wre.83.2021.08.03.04.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 04:02:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 17C401FF9A;
 Tue,  3 Aug 2021 12:02:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] tests/tcg: commit Makefile atrocities in the name of
 portability
Date: Tue,  3 Aug 2021 12:02:37 +0100
Message-Id: <20210803110237.1051032-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803110237.1051032-1-alex.bennee@linaro.org>
References: <20210803110237.1051032-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 imp@bsdimp.com, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not all of the multiarch tests are pure POSIX so elide over those
tests on a non-Linux system. This allows for at least some of the
tests to be nominally usable by *BSD user builds.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>
---
 tests/tcg/multiarch/Makefile.target | 6 +++++-
 tests/tcg/x86_64/Makefile.target    | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 85a6fb7a2e..38ee0f1dec 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -10,7 +10,11 @@ MULTIARCH_SRC=$(SRC_PATH)/tests/tcg/multiarch
 # Set search path for all sources
 VPATH 		+= $(MULTIARCH_SRC)
 MULTIARCH_SRCS   =$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
-MULTIARCH_TESTS  =$(filter-out float_helpers, $(MULTIARCH_SRCS:.c=))
+MULTIARCH_SKIP=float_helpers
+ifeq ($(CONFIG_LINUX),)
+MULTIARCH_SKIP+=linux-test
+endif
+MULTIARCH_TESTS  =$(filter-out $(MULTIARCH_SKIP),$(MULTIARCH_SRCS:.c=))
 
 #
 # The following are any additional rules needed to build things
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 2151ea6302..d7a7385583 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -8,8 +8,12 @@
 
 include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 
+ifneq ($(CONFIG_LINUX),)
 X86_64_TESTS += vsyscall
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
+else
+TESTS=$(MULTIARCH_TESTS)
+endif
 QEMU_OPTS += -cpu max
 
 test-x86_64: LDFLAGS+=-lm -lc
-- 
2.30.2


