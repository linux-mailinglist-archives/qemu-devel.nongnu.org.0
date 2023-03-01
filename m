Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6756A6F62
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:25:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOJy-0000u0-HU; Wed, 01 Mar 2023 10:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJi-0000b9-Dc
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:31 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJd-00011d-BK
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id g3so4744579wri.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHL540s7Ps9RUn0c/E5TovWPNiGeB6LN+M0UzHb3Xfo=;
 b=eC8Qne5g3yfxUuxqme1U/NsuXS53Kx1vXAIJz95igM1fipdUFgp75HqdmdRoaStHns
 ziL6r9rP2/hERTYnDH4I7K1ut9XpWfi5d3SAluM13ulM5NTgGd6FWMjTRInGhmFDHvzh
 VOwfAxjSuG0eQWaseLQ8d7Z9kBdhhU2BKaNuEG6IIgPXTRRdr8JT8Q8OEbuOhrzIZu6h
 HRkRlNFYpci3ZLWvEglzQyEXBqKUZ5gvPlEdaCoWNYb/RP8WNAqWmX0oa+AjIYUJiEpu
 9Y9qoifyvyy9om5pobeUD2R831taswrRnGZ/K1Ag9K3xoNEGUoHhET3JME+fRDHhGAwB
 ayLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHL540s7Ps9RUn0c/E5TovWPNiGeB6LN+M0UzHb3Xfo=;
 b=Q/dn8O8/NUZ5usBKRxPU8IeL4TllJHccO7fhz5KU9/1rx1KE7JrIh+fp08X1CMy/AB
 DDbOrsN7efVjUPfD6LzA8L+2PcQd4ZRBXGgiC5qRVmP1hPpIFd5i0YbZyICqxegGRmy2
 LSTc1GFV8nYxA2eQ/r2DVYscvq6IBL5y5rTZomaRWTx2bTt1/nAlaHZhqpES2V+OWkoD
 msrey5RWCHtL4+ZIWq8mJl6pkTcwjNZrM/jQuyUZ4IAOcSmnBgupE4ILsG7VYskl0h2t
 DcbeCtBCekJ6SLeLKiKDk1OniCKsaXT1D5LWSbqEznShRkz0Qiz1126e1qL9yF84QV/N
 VLcg==
X-Gm-Message-State: AO0yUKUR0GA8nxH+XwiLnIe/UO0+vFHY5bcXwf2BbpNbYfy6v27NqHXH
 wAjUgPjX+tekM1TiswawAof4lw==
X-Google-Smtp-Source: AK7set81a2W0JIospzoyFWKfnqs82ro3bRLNpsp7d97pucKPL5sJjtB6E5Otq7ASzbCJHKRfQHRTHw==
X-Received: by 2002:a05:6000:1548:b0:2c5:a38f:ca3a with SMTP id
 8-20020a056000154800b002c5a38fca3amr12969701wry.10.1677684261011; 
 Wed, 01 Mar 2023 07:24:21 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm12880163wrr.6.2023.03.01.07.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:24:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 026D51FFC2;
 Wed,  1 Mar 2023 15:16:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 12/24] tests: ensure we export job results for some cross
 builds
Date: Wed,  1 Mar 2023 15:15:52 +0000
Message-Id: <20230301151604.1948813-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

We do run tests on some cross builds. Provide a template to ensure we
export the testlog to the build artefacts and report the test results
via the junit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230228190653.1602033-13-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index d07989e3b0..4f93b9e4e5 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -49,3 +49,14 @@
           nios2-linux-user or1k-linux-user ppc-linux-user sparc-linux-user
           xtensa-linux-user $CROSS_SKIP_TARGETS"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+
+# We can still run some tests on some of our cross build jobs. They can add this
+# template to their extends to save the build logs and test results
+.cross_test_artifacts:
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    expire_in: 7 days
+    paths:
+      - build/meson-logs/testlog.txt
+    reports:
+      junit: build/meson-logs/testlog.junit.xml
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 101416080c..d3a31a2112 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -44,7 +44,9 @@ cross-arm64-user:
     IMAGE: debian-arm64-cross
 
 cross-i386-system:
-  extends: .cross_system_build_job
+  extends:
+    - .cross_system_build_job
+    - .cross_test_artifacts
   needs:
     job: i386-fedora-cross-container
   variables:
@@ -52,7 +54,9 @@ cross-i386-system:
     MAKE_CHECK_ARGS: check-qtest
 
 cross-i386-user:
-  extends: .cross_user_build_job
+  extends:
+    - .cross_user_build_job
+    - .cross_test_artifacts
   needs:
     job: i386-fedora-cross-container
   variables:
@@ -60,7 +64,9 @@ cross-i386-user:
     MAKE_CHECK_ARGS: check
 
 cross-i386-tci:
-  extends: .cross_accel_build_job
+  extends:
+    - .cross_accel_build_job
+    - .cross_test_artifacts
   timeout: 60m
   needs:
     job: i386-fedora-cross-container
-- 
2.39.2


