Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF83E37A0FB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:40:51 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgN0c-0003Gz-Mm
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqY-0004Cx-3J
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:26 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqW-0008ME-L1
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a4so19045580wrr.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qj+Lzfuwxy78ivp7wbT+ICY6VHgDT26ec+hxPTVL25Q=;
 b=LPBmz3bv+m0KKs1egWy/N0fQBMwA3yUgeHAWGnsghLx99+F/ElebC6nq5WJn64NUqT
 HAwAVRXnCds5U1GWLFEzOR2dcqR2W5qqEphBHfKHafuGmt1BMjsZjjG85nLlTnvD4nj+
 uFRPRyTWyFrgsUlYmUkjrzwSr1sqtUBWo2/DUABVrUFeRI+Kf1q94anKDyGCisJ6FKRl
 PrSde5KIsoWtDXo58y82aPo8wHT25NaW0zRZ0i6ZRYZ8M3D37dJ5K0kL/kuzceJROqpc
 HV+cW8IgkFFMWP26it8iH3M/T5574btOPu7AX7to81KI444ZS7vf9nvqz+59BX92nxBu
 PtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qj+Lzfuwxy78ivp7wbT+ICY6VHgDT26ec+hxPTVL25Q=;
 b=GnVt9cg1bjTv6WYyMN4VB1tVRd0QImOIyNDC2Mm9uVgBTVvlLgsBysq0hOwYLC8nZS
 qTN4K+cZdMZMqStcrqdnl5ZIrbHQaXoRH1SpCSc9FU3D1kJX8yaJCCPXLDWEkW4I5074
 Yq3Ys540zb/TEGwOcJtcP5kweYy2EHugrvMdf9sLPLAbeBcsBWYOrDcKeuc3GeT2JSar
 umqLhL+BKjYmszghC+Mt3aqmuD5OdPqr+fITzsBI+O7JokwVZfAxge8y2guFG8bPlGo9
 0OdnkQitGeQHB4FuhME83AHZvRzQFC2syqezgdBntH7Wmg782FzbwMNWkwfWgQckm5mR
 H3mQ==
X-Gm-Message-State: AOAM533NO2pmwLKBu7Ezx7ZI0V1/02HJXDBNaFegdLaCXBdp3/S0Vbs6
 Pnk2Ta08kjb8q4YtWh3ou/4hnmSa1rB7GA==
X-Google-Smtp-Source: ABdhPJwtS7hffTmDc8yjjSzGD1CRBFfI/qEsbCCjjf1WBhXM8ObNjq0e/fI8Y1GXvPGz0tk2f+wvIQ==
X-Received: by 2002:a5d:6885:: with SMTP id h5mr36144550wru.229.1620718223251; 
 Tue, 11 May 2021 00:30:23 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y12sm22788431wma.47.2021.05.11.00.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:30:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/10] gitlab-ci: Extract build stages to stages.yml
Date: Tue, 11 May 2021 09:29:48 +0200
Message-Id: <20210511072952.2813358-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511072952.2813358-1-f4bug@amsat.org>
References: <20210511072952.2813358-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
index ab9edc78879..5bfcd8aaca4 100644
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


