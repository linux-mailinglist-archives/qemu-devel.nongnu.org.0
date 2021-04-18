Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD8336389B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:51:22 +0200 (CEST)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYHCD-0006NU-V1
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGxK-0001TE-MI
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGxJ-0003UI-4g
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so7565809wmq.4
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rPpdvyQdnjV1hyP8p6HQlY/fim5Hnf4QrSAGX3smJ5Y=;
 b=bV/GjduJ/QxCmctnK6WULgr46i8cn0yymikRkP1QL/nXLrj3mJc13NzPi8bqLltY8C
 5C4uqeKVx3Jn6lEB8RfeLTY2O1EgghoFSqdPkkCjJCno0ghmYXjNOmZya1040djrIkWK
 5Xd4z8SZPD1KEPrrA9TcjFIMU3HZRVd8W1IbP/7wP1a8livd/1c6Dfv6WhLIlGxc8RgE
 aSYh/6UIE7Etk6/ZO2mHyzsBHtugyjCyfIOiRODRMJ8B1om/NTTnyN9aOBBwod7VTetN
 hpOZFsv2CAA1S43wkS1InJaTOieHgVq+frgbPQivhTUievLumMltzfBWLeUN/0Li0n1Y
 RonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rPpdvyQdnjV1hyP8p6HQlY/fim5Hnf4QrSAGX3smJ5Y=;
 b=M56Q0tEv7gSM7DNkAnN12H7Um6s98rPRQ00CGRVh7r8W2Zs1dyNH66f1niPpCxhfuS
 dTWV6exTtwf7Hu3JjIPw/Co3V17p0hOh6okc+eZ16dGshdgedz7+hMe0ytJ233Qa8PZF
 U+v/GyYP0wSsepXlfnQ+hiu0ECh+fHi69URaUBP/VCU3qux6dOqsEJ1cb3hgwspFaeN7
 dWaoocoUAEGFfhvX0S9J1G1gMUz74sGa7lv1/YMST8pcrioHevBKxceFQCxi3VWMspyU
 0daMfiToq4dymQEz9ZvLyVjuHmoe4YCtjLpCnWfbo+DEOJRtyfqRdHsqFTWwNvApkz7B
 86lw==
X-Gm-Message-State: AOAM531kQBiPEzYwQL3OgSE2/OJmcr3qRrQN+ndUxtChBSFTBe7GCIbd
 L2Ni3Sv4sJIuYZzcsSp8X+r6kV/MGF5Z/g==
X-Google-Smtp-Source: ABdhPJzkdZU6p+WmffXJEnhHazwwC2JQnWLxBOkYMurbmu/Sh4eUKMY4v/UghzUMMH7M0+gEr9ePbg==
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr18981645wme.60.1618788955710; 
 Sun, 18 Apr 2021 16:35:55 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a72sm17050210wme.29.2021.04.18.16.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/15] gitlab-ci: Switch to dynamically generated pipelines
Date: Mon, 19 Apr 2021 01:34:46 +0200
Message-Id: <20210418233448.1267991-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to the dynamically generated pipeline scheme described in:
https://docs.gitlab.com/ee/ci/parent_child_pipelines.html#dynamic-child-pipelines

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.yml | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 533a7e61339..718c8e004be 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,2 +1,21 @@
-include:
-  - local: '/.gitlab-ci.d/qemu-project.yml'
+# Dynamic child pipelines
+# https://docs.gitlab.com/ee/ci/parent_child_pipelines.html#dynamic-child-pipelines
+
+generate-config:
+  stage: build
+  variables:
+    GIT_SUBMODULE_STRATEGY: none
+  artifacts:
+    paths:
+      - generated-config.yml
+  script:
+    - cp .gitlab-ci.d/qemu-project.yml generated-config.yml
+
+generate-pipeline:
+  stage: test
+  variables:
+    GIT_SUBMODULE_STRATEGY: none
+  trigger:
+    include:
+      - artifact: generated-config.yml
+        job: generate-config
-- 
2.26.3


