Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C2062E300
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:28:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieI-0006SL-Sl; Thu, 17 Nov 2022 12:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie8-0006NT-I2
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:56 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie2-0006FL-A8
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:52 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso2246001wmp.5
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KsoXyv/ps+YbWahAkHox+gO9CbRysA54OuU4lgnIP2M=;
 b=LrNMXYZh4HdY6xoENMuEilMMzR92JAiCLd4VXmwV8jKL9uxrm/+867pSNs1Tp2+cZa
 GEaglqS6AYsmmhVpS+rjlqsX3u0F+RefnXFfpGF8Df738R34fsR9rdFcNnrSRQvCLA9U
 OX2hgL6zPvrPNyYmPjhIszHS2IKm9bGQTaVCwPAkcHu0vR222tAWNuyj2ut500U3ONhf
 6pbQOFk7XjyXo4v9EVMitxFUX04e2lshbJrnT8ltl0yCJCgaxYwJPKaTEmQCzh/9Dgfk
 DT/c5KPiiMXJtnSK3WV0Cbk2zh8ttRHPG04pC043i9NAJcJ4bv9N8Ta8CA0IY661kKHQ
 JPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KsoXyv/ps+YbWahAkHox+gO9CbRysA54OuU4lgnIP2M=;
 b=nAiGfCpnDKbYMKRDLmqTHrJcDEtHsChxJWl+8FjaUVfwq6ZUhNB7ImdQ3SN9G3kn4o
 v0hQ8OYBeh+CYdT4bDwIYDZgG5PsvG8T8O9phECY3Z2qv+uioEMTE6+NWwIxPlHHrPVX
 QL3sjMkKWy50foqwxkY7zN549EJBDUaFWysuTTT73ZCdcz6vFaONbtdXXBsQBXfCni1I
 OCiydi+LfjB6sKyQuEd0Fat+q3E8Pl/RdskPjvZFtvk7IhN5sEGZsWb98bIqUCfBObzs
 6doDrsQ3+oXfJ4CoUILhddc1X50YDnTrfp0Wfx2DbC4aRE+sO91XiEufuixskf5emlhf
 SeWA==
X-Gm-Message-State: ANoB5plJ9ocaNRVYzxn9FezMpsaKR2vaUF4eqfOfvuofUaIq0xXUnQ1m
 tKbcRe0vb3Lm102e9BW+PYDe9w==
X-Google-Smtp-Source: AA0mqf5nlv2dzoIOYBWyUk+hFDnNOMTWXjJgLqmICih2Rgp2uO5xMl4yjVkOETCIEYjQyNw6jnLcQQ==
X-Received: by 2002:a05:600c:4891:b0:3cf:d367:2765 with SMTP id
 j17-20020a05600c489100b003cfd3672765mr6071371wmp.12.1668705941418; 
 Thu, 17 Nov 2022 09:25:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q125-20020a1c4383000000b003c6cd82596esm6259337wma.43.2022.11.17.09.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E43C41FFBA;
 Thu, 17 Nov 2022 17:25:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v3 11/13] gitlab: integrate coverage report
Date: Thu, 17 Nov 2022 17:25:30 +0000
Message-Id: <20221117172532.538149-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This should hopefully give is nice coverage information about what our
tests (or at least the subset we are running) have hit. Ideally we
would want a way to trigger coverage on tests likely to be affected by
the current commit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221111145529.4020801-12-alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 7173749c52..d21b4a1fd4 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -494,7 +494,17 @@ check-gprof-gcov:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
   after_script:
-    - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
+    - cd build
+    - gcovr --xml-pretty --exclude-unreachable-branches --print-summary
+        -o coverage.xml --root ${CI_PROJECT_DIR} . *.p
+  coverage: /^\s*lines:\s*\d+.\d+\%/
+  artifacts:
+    name: ${CI_JOB_NAME}-${CI_COMMIT_REF_NAME}-${CI_COMMIT_SHA}
+    expire_in: 2 days
+    reports:
+      coverage_report:
+        coverage_format: cobertura
+        path: build/coverage.xml
 
 build-oss-fuzz:
   extends: .native_build_job_template
-- 
2.34.1


