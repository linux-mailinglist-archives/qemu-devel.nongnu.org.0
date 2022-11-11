Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77EC625D9D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:57:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVRc-00075A-2u; Fri, 11 Nov 2022 09:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRY-00073W-8N
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:45 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRV-0007xo-UU
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:43 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso3300483wmo.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVzdQxsHhnuYq5mRH3xtvS6YyI7O0gS+e+/HR5H+7a8=;
 b=mBcf2KfbKpC5B1l0tpd425lKEVZ7Is3T0ONaIHhl7IzOlxnLCV1nodqvvfc21fvIy2
 1IaajB3RE3Yt7gUhpTNJMiJ9BnosOe7hpXeYupli2zenk7lVo2rvD56Ao60HPfifp67m
 wVQ/ppmXYR/KeD6+6itBrs4a84g5AS3eRz/kpbhbq5AbfHJPKKnU55Qoc5/DgDr4I6Qj
 NpNoYoz8GcjFoWqtS8ssfPf5FdzADkaCzwwWF+c+r5JEJh5eNk9uoPD1cJOSALT+3Ugu
 Xjry66L9KJF6toLpbeYRhkPeZaht992LRt0k34H3k/8BHmZwuj9rSCAdf/i6MAgxgVIp
 4qRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GVzdQxsHhnuYq5mRH3xtvS6YyI7O0gS+e+/HR5H+7a8=;
 b=vIRmsg5JNNfBiImoEwPKAVN3zloP9b8GGdpGS8qY8hKxh14RqmtZMXjKgYnscwK/Pp
 8R+nE8q2HuOb7ANBlqJ9b8E1s2xiZKhWGm8nbg8080qDjN5MihHjgh2zKqizUKLcf4EL
 mLtgim56yeNSx98g0akdtvSTiMqng1akzpksUzll298qqVfa2KfjhYr8C6xhV818jhny
 N8SkP3DnTwkDAbm+ve5oXinPTDUi4aSoDcUD/A8sye/nCw3YRjp6OcXiliHQ1R7P2u2s
 J543fKFuwsN24roiNLB/N78knogxkwwZB7f3QCxCPg/V0Ic1RUzQengI2ZvBIxbLz7y+
 hCMg==
X-Gm-Message-State: ANoB5pnAZGYArqZh2sdR5Iq/3aHNyIaZxoEbBpM2mqbz0tfoa81chAGW
 7nRM0ICF18qL8H2zEM9GwPhDeg==
X-Google-Smtp-Source: AA0mqf7A+QjXsWjgukBrVmWYB7PGM4XijjajUxKDGSBWg7GQbMZ5vhIsxk8zjr9tEQ4k3D8Oj3WOZw==
X-Received: by 2002:a05:600c:43d6:b0:3cf:a18d:39b1 with SMTP id
 f22-20020a05600c43d600b003cfa18d39b1mr1447850wmn.149.1668178539906; 
 Fri, 11 Nov 2022 06:55:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t67-20020a1c4646000000b003cfa622a18asm8890923wma.3.2022.11.11.06.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:55:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 109141FFC3;
 Fri, 11 Nov 2022 14:55:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 11/12] gitlab: integrate coverage report
Date: Fri, 11 Nov 2022 14:55:28 +0000
Message-Id: <20221111145529.4020801-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111145529.4020801-1-alex.bennee@linaro.org>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


