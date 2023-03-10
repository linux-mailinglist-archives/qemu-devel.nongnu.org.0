Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932026B3C4E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa2G-0007gQ-Bh; Fri, 10 Mar 2023 05:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa2A-0007bo-Al
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:34 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa25-0004Hf-RM
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:34 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c18so3055164wmr.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZvCAx4F7D2VDKqlV3zkasos0ltqlJHomALeskNF44vQ=;
 b=fWnNK8ZPZX4N/lr+FRO5rGeuQfQAt16wAYFCpePT5ET5UctT/bOY56MJ2gE3gOwfs+
 IIOB+Ezp/vNp/Y8hbjdFAcAdBWYJz7FbBghnruqvFD8cCoGVBiP31OLJitl8M0eltl/s
 rKojPKgzz1a+pstm7YjWtMJ6/O60C6BeJl8V8AH8ZXUPjBZ5ldqYSZjxvTEZlb7KCkqE
 U0ulvi5rjuXIYwCJpxCeI3D2CInciV+mgefsPySI1MTUhjVoq5zeFpNRXagEnjJYAMVb
 GNYGxgf4pMBgEDdLN1wfp91VacxvtrZWovQ5rwf60/5HJfwFFXn7Guw1z1UiSrqzt3SC
 weuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZvCAx4F7D2VDKqlV3zkasos0ltqlJHomALeskNF44vQ=;
 b=D+3lkcxFe2r7+KKzvoLhx9rIEtWbtzvgF2KCWGZqsmDfWZjKiAoi4Q+3IEDcgE0UEi
 ZcSRxvJlq/aSn1mKVHsGZcA1rCLlAK4H9yLxiVVMzW0MDL/4Ke+Bp6GikfEJTl29CYm5
 y3tozUkMeIemiODxBedOFWiXbMZGtnmvm/xW3GsVL8g9zt5BIcF/kw/wZOWMYE/g60Rh
 JT3c0xbo0WCs+F25vnmh5PyJR/5LyLGtAzFONf8HODzvi0uq+AnQE7CDqmiv6qkbTma9
 HLF9wMlPEiij8xHmJw70kB6Sxe0cIs6mGdikN6O9wAZh5Grm9AI9djECiSnhr+DH/9FS
 lwbA==
X-Gm-Message-State: AO0yUKWlgnROuGIaV7jFILUwO+XofaL8wJocCWdfh3+FKF20wf6I8lIL
 otqwimdQ5uaNB77iPuCqRBvTKA==
X-Google-Smtp-Source: AK7set/O/UjoatoCRlRS3U2/ZL5naXZP/SPh2bnAv3Qkpjdzqx785rMmC1aVviuuIi9miwsfceTgDA==
X-Received: by 2002:a05:600c:4751:b0:3ea:f0d6:5d36 with SMTP id
 w17-20020a05600c475100b003eaf0d65d36mr2209549wmo.29.1678444288056; 
 Fri, 10 Mar 2023 02:31:28 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c229200b003dc4a47605fsm2617132wmf.8.2023.03.10.02.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C2331FFBD;
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
Subject: [PATCH 05/11] gitlab: update centos-8-stream job
Date: Fri, 10 Mar 2023 10:31:17 +0000
Message-Id: <20230310103123.2118519-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

A couple of clean-ups here:

  - inherit from the custom runners job for artefacts
  - call check-avocado directly
  - add some comments to the top about setup

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../custom-runners/centos-stream-8-x86_64.yml  | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
index 068b0c4335..367424db78 100644
--- a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
+++ b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
@@ -1,4 +1,9 @@
+# All centos-stream-8 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/stream/8/build-environment.yml task
+# "Installation of extra packages to build QEMU"
+
 centos-stream-8-x86_64:
+ extends: .custom_runner_template
  allow_failure: true
  needs: []
  stage: build
@@ -8,15 +13,6 @@ centos-stream-8-x86_64:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
  - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
- artifacts:
-   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-   when: on_failure
-   expire_in: 7 days
-   paths:
-     - build/tests/results/latest/results.xml
-     - build/tests/results/latest/test-results
-   reports:
-     junit: build/tests/results/latest/results.xml
  before_script:
  - JOBS=$(expr $(nproc) + 1)
  script:
@@ -25,6 +21,4 @@ centos-stream-8-x86_64:
  - ../scripts/ci/org.centos/stream/8/x86_64/configure
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make -j"$JOBS"
- - make NINJA=":" check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
- - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
+ - make NINJA=":" check check-avocado
-- 
2.39.2


