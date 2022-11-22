Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC558633926
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0v-0002Yg-1D; Tue, 22 Nov 2022 04:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0p-0002NW-TR
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:19 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0o-0003sd-8G
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:19 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o30so10330553wms.2
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=poryMUWRLDds72xI/Jm9ugboCEqA18vwJ5mKpSpT8uc=;
 b=i3osRi9QZq5roy5icUm/OH3mPmCaumFYI2iZU3debootxdbAtG3Pmq8gEpQKIlA9IS
 bKJwlkBPUro8z3+3ITdbZSr58t//FkL347BupEW/oCSNwhrEzHL5UDVADjHRba9xE2vI
 PD++u/PVDJZyVf/jw9eszlRbisDrXaw+SKp36flFa2rrbV8KWO7yYTRBKfZLiq+fHXPq
 /V9/WL/sb+JQpdg96HdNDMT07sMz1QzKfjKYcwj78binM3+892fyyjlkA1WnRNy/yt4h
 PWVpO03OY7H0rMtUxMfYC1n7lgATezC91OwgHNZZdLvsuth4m7ChoL7QeuZbmN1KrCqP
 A/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=poryMUWRLDds72xI/Jm9ugboCEqA18vwJ5mKpSpT8uc=;
 b=sER6LChsRpo3WV8ahrfHujfIm/KiJn8G2Jw+03E+sqa+XcsxOCBESPvhUx0IJ+WsVK
 0OwCLW4nUTp5lZ+tBT1vwIIvWHUxRGZqCQEI/vUhkOKHPWx8xjEM9E0asdQZiu00VhbH
 Qmz2CAifymXOdGRsGc72EpQgp5V9mM1TshMEA6SJNoMn7yvRp1WeqCQdWUoSiHd8pTRZ
 bNORzYn0+3s7JJsx6CCPtQlmu9okzKK+AL1LjLMIESzLmqA8F/s3kJ0CFyuMOlhLosBc
 KFGaauDEdvlZF6qxlLm8nkYPDG3OaBqn265vyLUeEZSUTvuimiqPPwtp0+HsOxcCuwf5
 C9uQ==
X-Gm-Message-State: ANoB5plVTtEENa4Xi+16bj5+ETewrk2+e/UJRGWUl4u7Lzs7ylEgnNX+
 ifcn+pLKEfrDyIxKyvtwbjX97w==
X-Google-Smtp-Source: AA0mqf5ZNNN5iKDRbfYpBKSqu7NJD/Je0Q9H64ha6UHqxGp2/l+W4vWAS6Z+C0SFf7RlDWMhAwtQFw==
X-Received: by 2002:a05:600c:92a:b0:3cf:69d4:72ee with SMTP id
 m42-20020a05600c092a00b003cf69d472eemr2005560wmp.122.1669110976587; 
 Tue, 22 Nov 2022 01:56:16 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfdbc2000000b00241b95cae91sm13507885wrj.58.2022.11.22.01.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98ADE1FFC2;
 Tue, 22 Nov 2022 09:56:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 11/11] gitlab: integrate coverage report
Date: Tue, 22 Nov 2022 09:56:10 +0000
Message-Id: <20221122095610.3343175-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-Id: <20221117172532.538149-12-alex.bennee@linaro.org>

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


