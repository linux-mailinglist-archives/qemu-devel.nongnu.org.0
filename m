Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D876B3C5D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:36:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa2H-0007gy-Kk; Fri, 10 Mar 2023 05:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa29-0007ZO-3Z
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:33 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa25-0004HX-IO
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:32 -0500
Received: by mail-wm1-x329.google.com with SMTP id j3so3060280wms.2
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OrymPH9qdF1LbwV8gLjsNCVK43k9DRaIqJfuQ5UvnQo=;
 b=eGDG5V/k5OWoqa9NjqrjAyMWuYMBT1mND1PGrXxqo8D8V2UlYSUUDtHE43eifG5wLE
 IXKhq3LBvmV26Pil1OAIaX/qOPZnaTFQQfYOggqjI+9lHRzAjud+Dd9jQaez5SvuNrfS
 G20r3a3oB17NEg7ViQI6M7zasONpv+hXoRY4mua8nALWU+jdsBc8/IzcBGQZP9gGGApx
 7Hfu1o5zMTTdtDXMuTI27+7A1bKbV4zaFH9RNw/ACSRPok98oTZS8+SmN40M0xuIxP4X
 D9wgNbMVywbA0shwZVAq5Pha+Qubru8JpxOcTWIUcJ+Kp0q6X4EGHU+1qYAaEue8Xkj0
 8YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OrymPH9qdF1LbwV8gLjsNCVK43k9DRaIqJfuQ5UvnQo=;
 b=Qt0wpFalkUWpxJZSKdLZRk/KUYxutwevU8Gcypu6/NbQ6I8mMh6SXJs1qNcLYBiHpE
 hIycFzOcCxcWVIscZeM4ODhWp58jcIJuN2WCa6croun3XzAujGVqSla3T5kZ2VoYzQCC
 C8Nuxeh7O2a2Vt9FfqZh0TOF4b5uM/BhxkPtefwNXfd5+QJs19zvaUqMTu1JsYJaZjv1
 w6mMbGc4eeqRyR+JwRKA7MPO6HFvb8kSdMfag0OFJfOqFakkknN4bRJZG+ujMv3Dh26j
 2Tc8huT/9Wt+lT4/CS2uH4+/hI0jRCLkrRdN849JHInApWjpCi9fMYt34qickK8PgCVE
 kgYA==
X-Gm-Message-State: AO0yUKW5yK0l9hUmP5+YhHAV3dUo3dy/nZz21Mw5g5kyoNKVFT4uUQjo
 fD1WSoUQdhRD81YAZXVD6SGHwQ==
X-Google-Smtp-Source: AK7set8+8dCFAK6CxWp/s+nH5v0Dq0oj6whU3FwXDhGRPmpFqI4z/4/orm07k4XnHrEPuyxHNZEfhQ==
X-Received: by 2002:a05:600c:512a:b0:3eb:55d2:9c4c with SMTP id
 o42-20020a05600c512a00b003eb55d29c4cmr1471579wms.16.1678444287882; 
 Fri, 10 Mar 2023 02:31:27 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a7bcb50000000b003eb192787bfsm1715958wmj.25.2023.03.10.02.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 542941FFB7;
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
Subject: [PATCH 08/11] tests/tcg: add some help output for running individual
 tests
Date: Fri, 10 Mar 2023 10:31:20 +0000
Message-Id: <20230310103123.2118519-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

So you can do:

  cd tests/tcg/aarch64-linux-user
  make -f ../Makefile.target help

To see the list of tests. You can then run each one individually.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile.target | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index a3b0aaf8af..8318caf924 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -201,3 +201,10 @@ clean:
 
 distclean:
 	rm -f config-cc.mak config-target.mak ../config-$(TARGET).mak
+
+.PHONY: help
+help:
+	@echo "TCG tests help $(TARGET_NAME)"
+	@echo "Built with $(CC)"
+	@echo "Available tests:"
+	@$(foreach t,$(RUN_TESTS),echo "  $t";)
-- 
2.39.2


