Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A1D45376F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:29:23 +0100 (CET)
Received: from localhost ([::1]:46840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1Kk-0001AE-F5
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gw-0004iM-QL
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:26 -0500
Received: from [2a00:1450:4864:20::332] (port=42829
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gv-0004DA-1J
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2842359wmd.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WVAywrlpluP52dH3NNzrsF0nn2WTrXKhzycjudmP84=;
 b=V4s0aoaevL3Qkstxx37uMUNTUP6VAbU+bQn+HAR4U6CM8JgXe4qYOpOJiUK6xheT5s
 QHJyKcV6p7SCUZAYi06pFdGFXLzNJFEPRqtEGjOjeKPFpyWOvB3iwGuPftZ5ddJCqT1y
 V1MUCg3mwiLt5bltOJ12CVVuf2Bqae9kCO5AbQEvC9fHnoqukjto8wzUsquUbJdp5mRE
 yj6fxapdTVZWVbUPGT78C3xkOhcmqjN7MBcztSCy+da8nK3+OCN7C1/Z3xmXLGuEUZEf
 Ge+uFJwWZ/pg+wRr+tEaA32xfptwPVT2QsP8JgYQQ44b7pBj01AduhcLICGVQyJm9zwZ
 sWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WVAywrlpluP52dH3NNzrsF0nn2WTrXKhzycjudmP84=;
 b=5NQweyEGrDRgq+CERe4hYH4HPQLoCPaS8ESERb0yDbUPY2Z1RXwpIFmc8qDBodNdVv
 5WD8b95BmRP0kbD/Qgfkj3MCTMTKcwTjQdi1z9LRhp/fQWhsPiDB1g/KA1sRFaKpLv8M
 W3gxhj3Lk92XNJSgg8UAXSH4g5ATqlhog7HkBx/aKp2QGUqMVll5+Zt+33XqxhPETidj
 v81QMXjFX+AXRw2mGvouGSPsoxHDEI93472AOb3CyWYYpPsw8sRBCDhoLZIn/g7LrphP
 XrTYReAzJNE3ia7ybMENXwBaBFUKlVa9PNiOvvjz2S1Rt+0LVlMnWsuiXE6A02AtaQZR
 Gftw==
X-Gm-Message-State: AOAM532HeztTQ9NRPbqIofNIoljF6lxBovApK0AdikO6vJUFAqvKJv1G
 lztWgTUIHSyr6Ogfscy83WUN1A==
X-Google-Smtp-Source: ABdhPJznJPivc5oZz6/++qvBrrGsz7ywapn5BMHqB1BPA+kjqoWZmIoaRXJvhaTFjudgrpLkh4pHTQ==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr9087022wmh.170.1637079923622; 
 Tue, 16 Nov 2021 08:25:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n13sm18141009wrt.44.2021.11.16.08.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:25:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11EC41FF9E;
 Tue, 16 Nov 2021 16:25:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 7/7] gitlab: skip cirrus jobs on master and stable branches
Date: Tue, 16 Nov 2021 16:25:15 +0000
Message-Id: <20211116162515.4100231-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116162515.4100231-1-alex.bennee@linaro.org>
References: <20211116162515.4100231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

On the primary QEMU repository we want the CI jobs to run on the staging
branch as a gating CI test.

Cirrus CI has very limited job concurrency, so if there are too many
jobs triggered they'll queue up and hit the GitLab CI job timeout before
they complete on Cirrus.

If we let Cirrus jobs run again on the master branch immediately after
merging from staging, that just increases the chances jobs will get
queued and subsequently timeout.

The same applies for merges to the stable branches.

User forks meanwhile should be allowed to run Cirrus CI jobs freely.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20211116112757.1909176-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index e7b25e7427..cc2f2e8906 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -40,6 +40,9 @@
     - cat .gitlab-ci.d/cirrus/$NAME.yml
     - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
   rules:
+    # Allow on 'staging' branch and 'stable-X.Y-staging' branches only
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH !~ /staging/'
+      when: never
     - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
 
 x64-freebsd-12-build:
-- 
2.30.2


