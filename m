Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBA53BD960
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:06:48 +0200 (CEST)
Received: from localhost ([::1]:41824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0met-0002Q4-ON
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mX7-0004iY-1A
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:45 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mWt-00023t-Q1
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:43 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1973757wmh.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vp/dNCh38Mi79xbfwOjgNPw51ttemhaIbt3S+P08Mv0=;
 b=zkxF2icfug0NRuruMY1yTiQazIKm2zIYAjywenaj9Ddx64+wRlQDWPcDHv65aVrD5k
 H/xW8VOWV8ZB+qRAjcxbEgsXfuqQWJUoV9ijzdzZS9/gXzJo0flGuSrZ4h7R0tDXOiFY
 4bktjXcJKfJqLAS9UgZLwbSAHnnVeiOjNl/wVSb934vn201KDS4ioDqEhN08qwRmcp3N
 lMohRZS4UV5Vp5dEb5y89YXa4hkOFC0odlTMEKno2zERcIADyrP9gx1QQR+/U5O2yxRn
 DjvQqlETA5Mej4jgosKhMdiUz/lmbV5V8rl5PN9DZve2uvGpjRh8ZepXjkzrpgAEnlle
 JZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vp/dNCh38Mi79xbfwOjgNPw51ttemhaIbt3S+P08Mv0=;
 b=nURPhjK1g46g+S2yag9o4EXEAzgto8BtVcU+5sVb51MegNuGWvD+IJSNP3hBlLbBSR
 U0WCBZ1BSe6/h0RaL+s/F4YOIIT3xnnalKkqNMVQUpIZ3sqpV+LSRMrffDfYwFqJej7f
 vAXoysEDempusBGTuEHCSTWo360nxfmW00/N+Rv4mAS0Q2qHpLcF7YpL5OZmzh/rhvWQ
 IeRfqbpJV/n4CTyLZ5k9Zn0bF4RNKUY/uRzGuBSnNKecmzNpKtTTqPQaLMnK0S8wkC6a
 6qUV0O/7Pt1a2PAEiBgEZC6IWEY/3k4nel3XJcD9FppIWqK7Os8iCFu+QgVQ1EKoRdJd
 w3Gg==
X-Gm-Message-State: AOAM533B2zSZn62nqUFSpSTAkPCT/8rC7CxCJ9ZaNfY1WeWrnGYryjPY
 vd18L8qJNI2NHFggVggp9qFbFQ==
X-Google-Smtp-Source: ABdhPJx2waSiK6dQmAI1/L69Ott/YwWA7gsisSfeTNKMGark0ehHe6mb21a5ZWFnzxdaLtuOT6pN2A==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr1271354wmq.154.1625583507761; 
 Tue, 06 Jul 2021 07:58:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e23sm3133843wme.31.2021.07.06.07.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:58:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 512151FF91;
 Tue,  6 Jul 2021 15:58:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/39] tests/tcg: generalise the disabling of the signals
 test
Date: Tue,  6 Jul 2021 15:57:43 +0100
Message-Id: <20210706145817.24109-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It turns out you push down in one place and failures pop-up elsewhere.
Especially on CI. Disable for now for all targets.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/hppa/Makefile.target      | 3 ---
 tests/tcg/multiarch/Makefile.target | 6 ++++++
 tests/tcg/s390x/Makefile.target     | 3 ---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.target
index 71791235f6..473864d1d4 100644
--- a/tests/tcg/hppa/Makefile.target
+++ b/tests/tcg/hppa/Makefile.target
@@ -5,6 +5,3 @@
 # On parisc Linux supports 4K/16K/64K (but currently only 4k works)
 EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-16384 run-test-mmap-65536
 
-# There is a race that causes this to fail about 1% of the time
-run-signals: signals
-	$(call skip-test, $<, "BROKEN awaiting vdso support")
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 3f283eabe6..d57a115873 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -32,6 +32,12 @@ threadcount: LDFLAGS+=-lpthread
 
 signals: LDFLAGS+=-lrt -lpthread
 
+# This triggers failures on s390x hosts about 4% of the time
+# This triggers failures for hppa-linux about 1% of the time
+run-signals: signals
+	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
+
+
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 0036b8a505..5d3de1b27a 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -9,6 +9,3 @@ TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
 
-# This triggers failures on s390x hosts about 4% of the time
-run-signals: signals
-	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups")
-- 
2.20.1


