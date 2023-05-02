Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E46F4395
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:20:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptov9-00043f-NK; Tue, 02 May 2023 08:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoub-0003ml-4d
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouT-0003Bh-QE
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so36975025e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029707; x=1685621707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Hk9R87CvbspxpZBkM2QfZXfK8qeYNuFizeeEiFCp1Do=;
 b=k+TKXJtDtpS2ijo4WRhaaHtgcs7D4BNwSs+oEzIPK4ptf7aHED3b8k1BI0PWMS/+QD
 zwhGUP5xhyPFDFlmnhDKXBY7qoXGQRdmkQCAg09eHI45nzN//AydmufYYBTv2W8edexq
 xoblGshtgAE9f0dxsrseYdT6m4EXDmwvRJEzenb6pSh/jh3L3Lx5GH4bF4GgIRDOex1u
 oYnvjRFftYcxBw3Vi8B2A/tuAzmQRdFkoNuD8M5e4Im4vK8Qxhnx/wyF5YuXeXTNSypg
 6tv2FYqqYjN2JNNg1rz9Z7Q+idcMUEU9r0DK8OueS1GCaT3hVJTHtTbdxYXOTqUdpsfv
 Mz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029707; x=1685621707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hk9R87CvbspxpZBkM2QfZXfK8qeYNuFizeeEiFCp1Do=;
 b=UT+XRw9Jcf6RnIpE4mCGtYkYSM0vWcg8drFvq3E1p2pRmPxvyEpBAzspsdmdmIgeG/
 NN62HDzufjBxydCwAmMpboBnNC1GIC8hL+SFSWl4/ri58TeWc//kiuvbrNYi4VDXH5Sd
 5wMLizQVlkMNoYpnJAC9mT0VNOg9q/5VqIvUnhGCfZYnn1alGlkJ6VnhpdEUofSCEXcs
 3HSDuKBr2/O5mXPtOjdKM3CJmll1II6dWP8U0sA9EaqvIg5AQY6HuSOwACtkIyzLpjN7
 acpCDJ8XUAhm13ESd0To0oJgTpgl3X+XtoqaA7o4KTF3swvh9ytnJ/ykBseIN1otx5zh
 O/YQ==
X-Gm-Message-State: AC+VfDzLYDIZcjEZNuFx0H8qs0loVFGjJ6jwbbH55bF8Mh64HsCEGFgL
 OCSClrWMICAhlsKL9P2+IY/OVjDGcMvuaALCoDQ=
X-Google-Smtp-Source: ACHHUZ4PyzLS1jYH1q9IL8YUChVlqKF/+3IgdKfzm5k4mAY3Xbwtjonz9hke+m86+diRBoMXHQ0Qtg==
X-Received: by 2002:a05:600c:3783:b0:3f1:7277:ea6 with SMTP id
 o3-20020a05600c378300b003f172770ea6mr12054731wmr.31.1683029707238; 
 Tue, 02 May 2023 05:15:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/35] gitlab-ci: Check building KVM-only aarch64 target
Date: Tue,  2 May 2023 13:14:37 +0100
Message-Id: <20230502121459.2422303-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Add a manual new job to cross-build the aarch64 target with
only the KVM accelerator enabled (in particular, no TCG).

Re-enable running the similar job on the project Aarch64
custom runner.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230426180013.14814-14-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml                         | 11 +++++++++++
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml |  4 ----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 61b8ac86ee3..da787ea9bf4 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -196,3 +196,14 @@ cross-arm64-xen-only:
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
index 13e14a0f879..c61be46b82c 100644
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
2.34.1


