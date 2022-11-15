Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97263629AA5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:37:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouw6V-0006WK-H1; Tue, 15 Nov 2022 08:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5Y-0006JR-UW
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:59 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5W-0004Lf-Nm
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:55 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w14so24273448wru.8
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/ae5vrQTt28MH0oBWTUQhGDSwBFm3CuIig1VKCkfko=;
 b=VbhstaIGZSoipOm6VtzHLRWCMMPE+qGdt9UAk6pQtmLhP08uqG+TOM64tLI1RGhIoe
 +o86PjLoAs3nCMvC7DRj3mBtgNY02x+8HyGAX3xC+tJItB/xOnF5PHZ8Rc0QrI8Y9ByP
 B6Oeqiy/PK41wcpcSjUChA5imKerQTItV3/Rts+HmvUzeYXF2i0rBXvcCSG9ISCHSPgq
 jouz/OdzFTv5Y/l4wNUlSuMVQ2zyrXZH009CWUkSfj/fP44DVeRH70qtsCEluD+lnIAe
 G9qolV2wA1DcwjVW/q9YSAf+JEAC1RwaYS4vPAfCepEfZny8XMOEah2YU6wmnwFTqMtW
 Z4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/ae5vrQTt28MH0oBWTUQhGDSwBFm3CuIig1VKCkfko=;
 b=6laLkot7v3vItAwBOFYqjwdGT2+30rwxp8f+nUfdfV98owwPm665ioOmG3jW5iWRue
 g14jB7o0kItlljdSX8tPIwtkk8CBMlv6z8GoKJYi3wX8kf+P5L5pqTt1L6+eOBCpyE7w
 0uqSCWBmmrdZyg76rqID0MYBKm5k6V4DjCVrdIE9qL9mSvjDhH7qQL+FS7V75fZwfuIT
 toN/ncn4j1/Z5b3AzolqGTDSBwgTzhmF15gP6QcskT5PO+NPyWKBfyLQPK1QZEUSazP3
 QiWI/SBiMu5QQ5pxlw0qXJSJAQB3ONw+MJT+aDPu9ZJv0KyR1GFHaXKihfG3gOWF3fWf
 lLMg==
X-Gm-Message-State: ANoB5pkEE+saCLuLgVr2g6VAP4a6T5LmwCs3MIwFnW/V4LQu9yPnnHeQ
 V0hQlmpsoKsUqD/U8ykjh6eGBw==
X-Google-Smtp-Source: AA0mqf4jgkL65zsj/XJcnO4MAIdgMJOV5v1JmfhtRRnNypihy0siMwtqoX4A0XYVPhqoni1E/YaW9w==
X-Received: by 2002:adf:e552:0:b0:236:7a97:12da with SMTP id
 z18-20020adfe552000000b002367a9712damr10691495wrm.237.1668519293233; 
 Tue, 15 Nov 2022 05:34:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n13-20020adff08d000000b002364c77bcacsm12435054wro.38.2022.11.15.05.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:34:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 407751FFC2;
 Tue, 15 Nov 2022 13:34:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 10/10] gitlab: integrate coverage report
Date: Tue, 15 Nov 2022 13:34:39 +0000
Message-Id: <20221115133439.2348929-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133439.2348929-1-alex.bennee@linaro.org>
References: <20221115133439.2348929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-Id: <20221111145529.4020801-12-alex.bennee@linaro.org>

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


