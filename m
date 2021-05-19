Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A43A3896D9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:39:41 +0200 (CEST)
Received: from localhost ([::1]:42834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljS2e-00024i-29
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRM4-0007Oz-EB
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:40 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRM2-0002Oh-LG
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:40 -0400
Received: by mail-wm1-x331.google.com with SMTP id 62so6800676wmb.3
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h/Ig0v1yuZQWNoZm6vkO9AxQtQH1VqcNpoimhQNUuSQ=;
 b=RgPnsHxaboWY8UujdPCoIWTYfg4Nud1MyqhVI/F+MXCIsq+e4EUtR+MxwQPZh0vJeU
 WMCJWwkZE6/tWHOhP8yeLozhP+v+VfZ/S06fX96epkbxfcNMDKWZHARHDc0qqoy+jH6h
 2XMpT2zdQPediaZG5zAUU4j1wQKzgzrBgHZqZlY72Dsz9ySpNUd+OS7iE3J9w473MYed
 leKa2UVLShg5syhMuAsnDplDHt35QrAjU2TAo4RiPQIeNlr1jNVnz0g36eR4p1mWMQ0d
 ynay9yu0edeHsBU/UiKQPSAUZXOZaSBGwxZ1YacbqUmS6nwmEwKOBZ3n37ESGcwZD6Bp
 c8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h/Ig0v1yuZQWNoZm6vkO9AxQtQH1VqcNpoimhQNUuSQ=;
 b=UrW7a10AhEkbb+4HTyUbXMOX9TbQr0A5PKygw69x+1WqE5Vy8CBifr9APurx8EQsoB
 w1CfGyL9+h0oWSqr0dLWnlKS5C48/pfRbOzImx2+PcE015X5R3simQ/mgrU+h6N5BJ/3
 wOqLyGxZ5iggio0pTxFpm0aaD8q26S6iNSEN5ImJY9wP7Mtn/Q8ksBb4cQPslz0PDaT8
 PkuLzboBPaXwS/yVsZkGaJmf7ool6geqClyYgr/mbeHioh0mtnz0Iu9dznHhal01CQFf
 i/937nNHXGk8iPNiiGwAUSZQvWDpPmak3pqDywbbKUtD4H6VyQTu0Ry+IlXa9kIK4x9M
 znRA==
X-Gm-Message-State: AOAM530PI281JYI1WDS3lSuAlyWuefpSgRzrag3IknbJIOsV6TpdnWDe
 3lappxjVRNtawl7tKhZ3RNqyM58IlLEUJg==
X-Google-Smtp-Source: ABdhPJwZBjMZMf2IuE2kVoJu/Ka05CB8zfhHYMh1lNxLIlL1P00xq0q7Dv/FEgsJ58hFbsTqUGRT2g==
X-Received: by 2002:a05:600c:2143:: with SMTP id
 v3mr605075wml.57.1621450537011; 
 Wed, 19 May 2021 11:55:37 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t204sm7211656wmg.38.2021.05.19.11.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/10] gitlab-ci: Extract build stages to stages.yml
Date: Wed, 19 May 2021 20:55:00 +0200
Message-Id: <20210519185504.2198573-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519185504.2198573-1-f4bug@amsat.org>
References: <20210519185504.2198573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the build stages used by our job templates to a new file
(stages.yml) to be able to include it with the other templates,
without having to run all the jobs included in the default
.gitlab-ci.yml, which are mainly useful for mainstream CI.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index bc7bad3d905..a348c101f6d 100644
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


