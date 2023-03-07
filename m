Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758186AE2CF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:39:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYSb-0005Ki-9q; Tue, 07 Mar 2023 09:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSP-0005I5-3r
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:26 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSN-0000b4-50
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:24 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l25so12364214wrb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678199901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZvCAx4F7D2VDKqlV3zkasos0ltqlJHomALeskNF44vQ=;
 b=ZBUnatfpBdz5OJFPb70LFCruv0Y0Z4M5oZBT8201uWo/STpDXU7g+Fe4bPY5VKGgqq
 bjMQRfBO9JMrINIo78M7exk+0JkjUhh8NyFf6+NRL70G6jGe2qkWI+uvY815YAaW3wyf
 tvp0Hn1Y0C7zb08aMskhrd+v2sLcGDcxqI6Pshxd12OXQsaTKQ9EI8dlU5CtTqVwd9rp
 FY+g7QEz9/7eRHuodc832Q0iT4ny7TOQiy85Ho3hawOmQlzaripKwLPwjpssdAcj+Gy6
 TEAZxibS4L69/SIqHi+I+s2uuW6U6Rt0zqSUur0aBfPNjVZ5WEXhpjqliPElkTLWhXcr
 sefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678199901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZvCAx4F7D2VDKqlV3zkasos0ltqlJHomALeskNF44vQ=;
 b=yJH7aZ93cX/pIqdlySPjUHDy995bAP9AEXoubWvbcUN2fbjOgwSgdGCk1HP4lHKDTz
 SMBGte/soDmBR17IX+6f1hS1ihgfSUMhNlXhvOFQtToZDKqhtGLZF7lfg7SO4aKax1oK
 57xhJYzk2V8ICzJzUY1WzslfOyaftevP21ZAAysv5neLj6XdUQKvb7O+mvMSYWQXITSM
 Zg7rFNeu19fczmWaeL3pSiX2luvyP/YuTupE8Cc9mDBgESDbHSaj3oT7Ki3r7mW1XvFe
 XbuMq3hQO1S411Oy3TMv7JWGmKrCnwXMiB7gHCd8jvZ44lA8o1wSXeN3REALvj0TfuhO
 +tqQ==
X-Gm-Message-State: AO0yUKWK+Nkr86U18cGUizSBTjIWgJL9tPIvQmAat5nUkkyStjETKQCA
 rO4bxw59KX1d6H3FCPK0WTqhJAxjSgAwUlow28Q=
X-Google-Smtp-Source: AK7set/BMx1GpBXRBIYPy7079IUJt3ZKs3YTorXYhSgMHPqIXnx292q3FrAnq8ABJJmT8SkBoCJAuA==
X-Received: by 2002:adf:e3d0:0:b0:2ce:500a:d5d4 with SMTP id
 k16-20020adfe3d0000000b002ce500ad5d4mr6892748wrm.66.1678199901604; 
 Tue, 07 Mar 2023 06:38:21 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a5d4e48000000b002c5d3f0f737sm12876193wrt.30.2023.03.07.06.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 06:38:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E04F81FFBD;
 Tue,  7 Mar 2023 14:38:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 5/5] gitlab: update centos-8-stream job
Date: Tue,  7 Mar 2023 14:38:19 +0000
Message-Id: <20230307143819.510186-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307143819.510186-1-alex.bennee@linaro.org>
References: <20230307143819.510186-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


