Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE24E5150
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:30:06 +0100 (CET)
Received: from localhost ([::1]:35136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzBl-00070U-E8
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:30:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz92-0001p5-Ir
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:17 -0400
Received: from [2a00:1450:4864:20::432] (port=36846
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz91-00063l-8O
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id u3so1668683wrg.3
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UpUMEwXzhRo+XLBPv7qvIiKEkh5HaA9HDk47+cj80M8=;
 b=Pinwfmqm4Sp2EBOWIzzBks1o/fcIfEiOUeRA+njUsgquxs7nkpa3XApCIuPBddMeCF
 dDFke/kWfr7hwlbOZPwVZMaYCUdnmsAiEgWVcpRc+VWbFqmdbQz2M8JYrsd3O6cxTtom
 LRz2GxjLdIljmO/o9phh06zT9hsAYAu1/kZZuOlK2B7LQYs333qR2BD6Kew59N0ysXft
 LG1Bhvc8YvtVdt2SDxK9+BbYAQBBMLYEAeW6pNNg8uMH7opd67qUjWN+Wm59IgOpokyd
 1i2q2kYeyqEpyq6v6GhWczKwdK9rvR4S18x4HS1+L4OAcxj5SaiDAigX2r7VHOXVWlJC
 gUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UpUMEwXzhRo+XLBPv7qvIiKEkh5HaA9HDk47+cj80M8=;
 b=2pqJxHvYS0VXQT6Q8efDafpBkFfOIZ1nf+LEbvXg/O0xxk7vwKs3RhYGs37fOXtkwa
 d0SIVlw5wMy3vDMhCgbeN3M1heHIl+AUbCQrzeQ7aXtDjyViAvgeWN5DTSZdL6aPOrjK
 975y3yw1cuK9loKt7ze3i7ZLSvrWx1ZVrvn9w17ewKiR/1lm9U6FYErQEx+QaEsiHSZ/
 FCkVHbYPb0jvXWN/KthhwJxq/m+AKjErkT0GW5byS1+BdLj4yed7Q2ND4/VkgUgblhGw
 87OYB5aDlmacyHfL8B6XfymsV823zOCjFDHv4DSqThpSYeZgd9cmYq2vj71tdc/XMVXU
 sqtw==
X-Gm-Message-State: AOAM531F3niCmKtHb/vQpEhxnGS0P+6ImfBTIUa//sjXFpTK5lC65dx3
 99QUIjEdGQuNUfZOM+GnJVh9Cw==
X-Google-Smtp-Source: ABdhPJwEFUR6h1082DHWXDvPQHqxP5P37V3aFA+103K6c7TlIGVMqC88Xwm/f6Ob4GiYjrIrsyY30Q==
X-Received: by 2002:a05:6000:18c9:b0:203:fb67:debe with SMTP id
 w9-20020a05600018c900b00203fb67debemr19496263wrq.494.1648034833931; 
 Wed, 23 Mar 2022 04:27:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p30-20020a05600c1d9e00b0038cc9d6ff0bsm483559wms.33.2022.03.23.04.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E0221FFB8;
 Wed, 23 Mar 2022 11:27:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 1/8] tests/Makefile.include: Let "make clean" remove the TCG
 tests, too
Date: Wed, 23 Mar 2022 11:27:04 +0000
Message-Id: <20220323112711.440376-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323112711.440376-1-alex.bennee@linaro.org>
References: <20220323112711.440376-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

"make clean" should clear all binaries that have been built, but so
far it left the TCG tests still in place. Let's make sure that they
are now removed, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220301085900.1443232-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/Makefile.include b/tests/Makefile.include
index b89018cdcc..05c534ea56 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -155,6 +155,6 @@ check-build: run-ninja
 check-clean:
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
 
-clean: check-clean
+clean: check-clean clean-tcg
 
 endif
-- 
2.30.2


