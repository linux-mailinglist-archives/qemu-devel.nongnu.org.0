Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB893392209
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:29:35 +0200 (CEST)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm15q-0000a5-NL
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vu-00033y-MG
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:18 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vt-0008TU-6P
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id t206so1535261wmf.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O0qzYaksasQ3pqmWVNp4q3+SWBxcqYet4JUBDANGEWA=;
 b=L3pwWRa1uboq3wYiooudLn74oUKCTXcS9c4DNoaHVNiEliicWCj1E2/P+nYbubfJXG
 9fYRT26+gDwqqB5Gj5oBZ9R0+utAfTd439qQg+Bhptol1dPrhdzfR2bH3loQJicKeKkN
 Hx3YrTV1bCEBSlO8tk22aOu2FSYXDmk11HcGAjwsE9Bc/fzrukMQF81n99wfzM5PPtlz
 QuXHnMKvh9cKc7nrQycHrWhU6tzGSaBrmWIi9Qx6GKTQU93Dz6tnGo54o869Y11+k72S
 7AlonnmS4sBNpTLZdrgwat5XQBY8xjcJix5GKOD6Y3zF1Le5flApnSzJfom18dYJTECH
 +Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O0qzYaksasQ3pqmWVNp4q3+SWBxcqYet4JUBDANGEWA=;
 b=e76H4mywOf5/eLCu/bjLgU/dVTJF081i3m2Yvn67rEAlggONL7g4YtJJ3vXdjf7P9E
 GvR1kUej0E/PQjEPauuOZfpmT/IGE90xcL3QbKpFS07PXF59W67108Jg9RPT3MwlJdEe
 9Do/Nz3Ci+klXTmO7dKEeXCvDNCzMsHpjy1yeIb1M4WhtmBkSZWR8AaS2IBiBw9eDRdx
 Qg/vHt/zo20g7NY13+JtkHQoLh3swNm0h8UMAz79+vy1foeo+Fcvx7M/IPSWCTp/GGS6
 DPU0BoXR4yHVeUyUOkhZWTAcWXcmPJtD/KIRoTB/Cc8M0xiKU6I5WxC6U3qA7rsm8hSV
 SCIw==
X-Gm-Message-State: AOAM5324Xv73C+OZzpwqA7Snm3FriJRtehyG9gT4609m54K1hG+MkbkC
 ZU9knb4M/PWVxUJ4mz6y+rwuP24BOEEUtQ==
X-Google-Smtp-Source: ABdhPJzcQYa+kmC/twyHeMbkY8gl7ZDf44C/KyZd5zRHvcJ/zLh6CRej5AZhMPItjGgqiLW8TN18LA==
X-Received: by 2002:a1c:7713:: with SMTP id t19mr354200wmi.48.1622063955374;
 Wed, 26 May 2021 14:19:15 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id 60sm201701wrq.14.2021.05.26.14.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/19] gitlab: Extract build stages to stages.yml
Date: Wed, 26 May 2021 23:18:26 +0200
Message-Id: <20210526211838.421716-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the build stages used by our job templates to a new file
(stages.yml) to be able to include it with the other templates,
without having to run all the jobs included in the default
.gitlab-ci.yml, which are mainly useful for mainstream CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210519185504.2198573-7-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/stages.yml |  8 ++++++++
 .gitlab-ci.yml          | 10 +---------
 2 files changed, 9 insertions(+), 9 deletions(-)
 create mode 100644 .gitlab-ci.d/stages.yml

diff --git a/.gitlab-ci.d/stages.yml b/.gitlab-ci.d/stages.yml
new file mode 100644
index 00000000000..f50826018df
--- /dev/null
+++ b/.gitlab-ci.d/stages.yml
@@ -0,0 +1,8 @@
+# Currently we have two build stages after our containers are built:
+#  - build (for traditional build and test or first stage build)
+#  - test (for test stages, using build artefacts from a build stage)
+stages:
+  - containers
+  - containers-layer2
+  - build
+  - test
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 03ff9884c30..f170065ac63 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,13 +1,5 @@
-# Currently we have two build stages after our containers are built:
-#  - build (for traditional build and test or first stage build)
-#  - test (for test stages, using build artefacts from a build stage)
-stages:
-  - containers
-  - containers-layer2
-  - build
-  - test
-
 include:
+  - local: '/.gitlab-ci.d/stages.yml'
   - local: '/.gitlab-ci.d/edk2.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
-- 
2.26.3


