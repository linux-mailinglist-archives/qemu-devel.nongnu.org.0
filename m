Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF2D4994B0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:53:09 +0100 (CET)
Received: from localhost ([::1]:32918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6Kq-0005Lk-D9
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:53:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lX-0006qI-VU
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:40 -0500
Received: from [2a00:1450:4864:20::534] (port=38428
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lW-0003Gr-9s
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:39 -0500
Received: by mail-ed1-x534.google.com with SMTP id j23so53526439edp.5
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HC58EObwQwfK/vMOJz8flDooLpW5CCL0WXMr1KEvE1w=;
 b=LLsjFPSV3Sf6donEnhCKSAnRmdiv3ymYpC0X/fV0dzdjMvm4/fk52+7KsIYbaU6vcW
 HaWM0fOPPxx9swUnIbvVnzANcQUX7jF6s3dNrumJSMNW1mtm43+h+8eNlJzNBppuszfI
 b5y+mqiBywjQJBai3tu0RIKP8rfbKnrUGAuW7JJsTh3yuAMllLPy8sEUIG1vnLzmYPcE
 19Ii9uNX/xaxEUC6b3PvUvl5yTFLmOBvNZdPE5S5AbsNQLRfZlQCjR5WH7VvCbKSv54B
 RISBwDF8H/PFl2pzevG+FIDcc8QWgMZqvxETETsmaVqkt0NHKXuswF7/QXZtJHG2o3MB
 mV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HC58EObwQwfK/vMOJz8flDooLpW5CCL0WXMr1KEvE1w=;
 b=lE1rNBFVHeA1C0MXp7ZPEv+1zY9ERyArdWQooQBbDucollFp8f33h/OjUe8vkSBW1U
 5rGO3PfSTqyA9PjE/QtMNgKIL2sLB+JPt7p8rp/F6gZhvg36jR6jRJOexpSijALwfR8I
 7xP7Nr1VQ3u6Az/Zhyw0claGU+onjo4qfobi4jx8WgbgesaIC5WGfUxRnL+HuE2cYLOx
 NsZuW3zLHPVoI1bj9j72pMAlNwPHnpQ9eLKXElodAqQUsmD2gPygOTdI0uF70n4D+lwK
 nZf7+rYP1bwSil/5vBDhVeSv/blU48s9T+I21j+gWvEC87BTVBAS+0XwUb4ABBwFi2pP
 aJBA==
X-Gm-Message-State: AOAM531pLpWyYgu7D+1ujOx2rVdA3d7RYhKUYArt5VNYjXzvnz3DlNlD
 xq4iNGXt7ouUOjhkX8UKYLNHOg==
X-Google-Smtp-Source: ABdhPJzNB5C4D+6dYP6uQvib2+fPz4gs8b+rfH3KLQNgSyDXJqamSKqZ3CjogyXrwd/JfyFv7T6a0g==
X-Received: by 2002:a05:6402:483:: with SMTP id
 k3mr17134491edv.323.1643055391818; 
 Mon, 24 Jan 2022 12:16:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id uz30sm5297909ejb.61.2022.01.24.12.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9AA651FFC3;
 Mon, 24 Jan 2022 20:16:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/22] tests/lcitool: Install libibumad to cover RDMA on
 Debian based distros
Date: Mon, 24 Jan 2022 20:15:57 +0000
Message-Id: <20220124201608.604599-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

On Debian we also need libibumad to enable RDMA:

  $ ../configure --enable-rdma

  ERROR:  OpenFabrics librdmacm/libibverbs/libibumad not present.
          Your options:
           (1) Fast: Install infiniband packages (devel) from your distro.
           (2) Cleanest: Install libraries from www.openfabrics.org
           (3) Also: Install softiwarp if you don't have RDMA hardware

Add the dependency to lcitool's qemu.yml (where librdmacm and
libibverbs are already listed) and refresh the generated files
by running:

      $ make lcitool-refresh

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-8-f4bug@amsat.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker | 1 +
 tests/lcitool/projects/qemu.yml            | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 003ee2cfed..699f2dfc6a 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libglib2.0-dev \
             libgnutls28-dev \
             libgtk-3-dev \
+            libibumad-dev \
             libibverbs-dev \
             libiscsi-dev \
             libjemalloc-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 8993d2d9e0..87513125b8 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -53,6 +53,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libglusterfs-dev \
             libgnutls28-dev \
             libgtk-3-dev \
+            libibumad-dev \
             libibverbs-dev \
             libiscsi-dev \
             libjemalloc-dev \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index de51a2f1dd..958868a6ee 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -43,6 +43,7 @@ packages:
  - libfdt
  - libffi
  - libgcrypt
+ - libibumad
  - libibverbs
  - libiscsi
  - libjemalloc
-- 
2.30.2


