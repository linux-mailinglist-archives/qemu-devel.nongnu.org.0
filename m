Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB926B3C61
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:36:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa2A-0007af-4S; Fri, 10 Mar 2023 05:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa27-0007WW-Rj
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:31 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa24-0004GU-7R
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so3108881wmq.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+4gkXbSF06VxG3xn+IuzpbgKEpx6d65esqQNCW4H4o=;
 b=KNX7Mbeod25KJlILc0yivp6x9yO3jcfp8u47ur9lSqzOCGV+f0K+DEDBov2wR9CaPR
 5MUOSfqii4u/YMC+7RSx6Lmjsue5J6lVhhESqMZPsYI/SbZzh/hwLTW6TZJxyXz+vK5n
 N46e0exftLXbOwOfAOsRHA/qYz8Xh2yqfFevOPxXMIUpLRYbLpASCvt5Ut9ykSMziXGJ
 U7sHYmtgZMFiJwUnZkCfxUU7YQ6lbzN0bOJtE8TA/2kvN6F4C1nWQH3QxIgdjoeahiu+
 AOZLWcnc2OaNW/31WjKku2IiDsUF6sUemjUsA6d7qPcw/7wRjnScx5b182YfvuhJN7T5
 qnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y+4gkXbSF06VxG3xn+IuzpbgKEpx6d65esqQNCW4H4o=;
 b=q3V7ARnQdNtUnMJZH/TzNlKMAI2MKmKiR0TRxFD8DaAIOsbwvXKTXZhLJ3VwcvDLou
 CCFNDKYdI1S6koWQZl3ppX2g36GR3jh9mvIklwIMr84SdjetJvm0dPu17ZcwCWLbKP7U
 K/AvAJxFYAD28rVYWyHUxDw4DyQoIUseJywsBC3kF3CQBiwI0oNwDb73Sb4ko+iVju6r
 oZuGpVdlzQc7stiQbFF8uRJSb2iGMOJi3RckrBhF0I7aRRRZGxsuFHCZRlxT93kHF8qa
 MGNkIDwN7ykKGHYYEYgGzC/tTteiKa5enFJz1W/hpgJfnj6GQR/2gC8iU2MEL8ZRHgnU
 2CwA==
X-Gm-Message-State: AO0yUKV4QE4GPKZAW5dj5eMCWPQAFHHlZ1xem8t5zViRYmbZQH0eLihf
 2qFVyjAUN/s6egHMDRCCJx0R3IYO9H7A4/RQgPI=
X-Google-Smtp-Source: AK7set+XL5Uj80PJycK8yYdRcp9qO95Ufs+aC7zHrKzfqdswtn6CtizzeTjF6PMWvqZKBfIx9YG26w==
X-Received: by 2002:a05:600c:3ac8:b0:3eb:3f2d:f237 with SMTP id
 d8-20020a05600c3ac800b003eb3f2df237mr2211404wms.6.1678444286698; 
 Fri, 10 Mar 2023 02:31:26 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a05600c221a00b003e6efc0f91csm1686773wml.42.2023.03.10.02.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6BA6D1FFB8;
 Fri, 10 Mar 2023 10:31:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Date: Fri, 10 Mar 2023 10:31:21 +0000
Message-Id: <20230310103123.2118519-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

You need a very new gdb to be able to run with pauth support otherwise
your likely to hit asserts and aborts. Disable pauth for now until we
can properly probe support in gdb.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 9e91a20b0d..8ffde3b0ed 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -84,6 +84,8 @@ TESTS += sha512-vector
 ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
+run-gdbstub-%: QEMU_OPTS=-cpu max,pauth=off
+
 run-gdbstub-sysregs: sysregs
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
-- 
2.39.2


