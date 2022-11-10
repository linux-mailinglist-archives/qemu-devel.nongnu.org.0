Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052FB624B23
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 21:04:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otDmQ-0002BP-Q5; Thu, 10 Nov 2022 15:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otDmO-0002Aw-EQ
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:04:04 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otDmM-00015E-QV
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:04:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id g12so3800516wrs.10
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 12:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FZmDXkWIQDQX4rVgrGfLvjkptXWJU1Fmckwyj2CnWPY=;
 b=tiQx+8iDh6P9X0uZXVz0TmRMe5SZZIxcjdpGM9FRhluVu3U22UC3kSaw6fjksXdvnY
 RYeOiGS60+LRaSVwj4LOuY0Yho+8WqFvhpwwNDxcowBKdZytkAoi6BWHAPhHedCFzO4Z
 Pw84xMltCRLwSkGdxlxAA0rzhCcICV9eGPfTqaMytJpeeIKqsi06JNG8eH6vNuh5v2Aa
 iybGne/xhBm2i+jbqEI8UATDwUVlvi/GC7v5iBtER5WZ8Qo6DlFmwYtPdN92jGVP0ybA
 k2AOOxssdueEc+cGMZSI6op7qdGKOJkW4j5bkfIQjYfee1IOW4ZAyQoKjSudCdWF6hje
 mc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZmDXkWIQDQX4rVgrGfLvjkptXWJU1Fmckwyj2CnWPY=;
 b=tmyIWKFpwbvyQKQgxWuzALPAtIQmecEPRKq+Myzk5E6V9iFtsdK4Ms5Zw1FuK6bCtl
 QgPGnMwZ6sSJ+0MwptF4ve6SNS4Mc8wsDpcYOMP8u/WYrQxpy5FrBi9iBTt2mJcoKD8f
 9rslwilhPFqC2ute2q14tA2kPaKdbO0O9x0BMNn86eiQwgdJH1IZYNEdKxmkpHNfWWah
 bLpm70gCYiGi4n7Onw+45ognW3enn/1RPekXjV+hYXsjUBie3PKaNuikZuKrojCzf3Pr
 wfMbAPegq+vBFEHFJqlHUmwAQqRiaUJFOBduaWdkVqn+FpVfg/S2PI2txFeOKGbMtvQ2
 hwYQ==
X-Gm-Message-State: ACrzQf2CTwNuRh5Mq0qxsQia3UdnvBdXG1ZD0v8zHHtT/Lr83DMK/Vvb
 KdRATimrzdQYZIwJNXdS6sP8AA==
X-Google-Smtp-Source: AMsMyM5Q3M0Xkx6eErnIh6mZq2jY5HCKWlc/h7MT9yj8q5VPD2Wf/OYbWvfJgmqFbYgxN0sQK9bY3Q==
X-Received: by 2002:a5d:4e8c:0:b0:236:6f5a:e893 with SMTP id
 e12-20020a5d4e8c000000b002366f5ae893mr41229058wru.44.1668110641081; 
 Thu, 10 Nov 2022 12:04:01 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bt17-20020a056000081100b0023677e1157fsm49296wrb.56.2022.11.10.12.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 12:04:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3EE91FFB7;
 Thu, 10 Nov 2022 20:03:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] gitlab: integrate coverage report
Date: Thu, 10 Nov 2022 20:03:56 +0000
Message-Id: <20221110200356.3425353-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


