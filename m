Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EBB674F6C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:26:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImis-0001uI-Um; Fri, 20 Jan 2023 03:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImif-0001Wz-Eq
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:25:53 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImid-0005Ej-IO
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:25:53 -0500
Received: by mail-wr1-x433.google.com with SMTP id n7so4135927wrx.5
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bbjrxOsuOTcth+mLQNmzkRsGZbaHbsEXMCDtE8u0O40=;
 b=DKUZR2gHdmITvbAeydk/icVEj5PbBK4lH7+RPZZzkspAFeb8L1rUlk9Y+sm2TnkeSD
 Okok7WeQYxQig0okl92fXUdwYg7DiSttl6VuADGabxqXNXpnUe45UvsbGpO6JNcvh6mF
 S0W4MBIs/UKpg/t4GfkRh8rfzVf8g07kqacvnTdYXtuXmaOCwYmPm6rCuhs2IQAsfUgZ
 ZpPtDsf95c5NZqZvlCaDgoDj72YrCQDx7OQhSLZoxi9RsoXuLGnkE/D8gzAyMe7P2E1l
 ZnRNbloBQsp9/arjHz11nbfjC8sBPYhWicfC3biATwRYGVmL0QUnRgp7E1skjXtOtWd/
 hyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbjrxOsuOTcth+mLQNmzkRsGZbaHbsEXMCDtE8u0O40=;
 b=xL/EeU/EhBETsf4EdnlA/u55qyb3Av1kGxHDL2ZhkBBD8UaUIJMqKKfYBlv/krAbph
 DUvX+a9901go8kp9QaJPCNyibFk4EuZXcfntoxE/HCi2mrmh5VKbhYF21tc4Yw/27jw1
 MGPHMNXTsfAEjKZ8OFIfi0EEOIRLf8RoUuJId6Qg9YKyJXn7dqb+61CYaDORHuSupEQv
 JQd2VxRbZEc6xP8NA5aIjoU45/NtD9tUj3PajPlGAkh6FzsilnjrSk1D+9Wellwi4dE9
 ZepfiV7++uauqgHp7vVD7yptxUWoIz0wy3GAtj6JIdX2MisN0lmO4uQIqalL4X+ZugvV
 hwZg==
X-Gm-Message-State: AFqh2kqUPWtvXlTeI6UgFnX4ZUxv2hTfjTXDpQd3nDdU3sPmi7OZ5cPD
 PhNaAYAOtfYzZqiTJmu1p+0OYuadxm0GKJpL
X-Google-Smtp-Source: AMrXdXs4mA9vXqR6zsvkHO2RXdFVrIvustTW8KiKzuHRwNF00T5Mg87BhVRHuC8ySjRrZ9xWdOcGgw==
X-Received: by 2002:a5d:5265:0:b0:2be:515f:cc2b with SMTP id
 l5-20020a5d5265000000b002be515fcc2bmr2498368wrc.39.1674203150139; 
 Fri, 20 Jan 2023 00:25:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adff68e000000b002365730eae8sm35621553wrp.55.2023.01.20.00.25.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:25:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] gitlab-ci: Check building KVM-only aarch64 target
Date: Fri, 20 Jan 2023 09:25:48 +0100
Message-Id: <20230120082548.60144-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Add a manual new job to cross-build the aarch64 target with
only the KVM accelerator enabled (in particular, no TCG).

Re-enable running the similar job on the project Aarch64
custom runner.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20230118193518.26433-1-farosas@suse.de>
          target/arm: CONFIG_TCG=n part 1

Successful job:
  https://gitlab.com/philmd/qemu/-/jobs/3630178191
  Duration: 15 minutes 25 seconds

Since v1:
- mark job as manual (Alex)
- re-enable on custom runner
---
 .gitlab-ci.d/crossbuilds.yml                         | 11 +++++++++++
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml |  4 ----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 8dbbb8f881..2d47a5dec3 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -210,3 +210,14 @@ cross-arm64-xen-only:
     IMAGE: debian-arm64-cross
     ACCEL: xen
     EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+
+# Similar job is run by qemu-project's custom runner by default
+cross-arm64-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: arm64-debian-cross-container
+  variables:
+    QEMU_JOB_OPTIONAL: 1
+    IMAGE: debian-arm64-cross
+    ACCEL: kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-xen --without-default-devices
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index abeb33eaff..40ed011f29 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -115,11 +115,7 @@ ubuntu-22.04-aarch64-notcg:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
  - if: "$AARCH64_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
  script:
  - mkdir build
  - cd build
-- 
2.38.1


