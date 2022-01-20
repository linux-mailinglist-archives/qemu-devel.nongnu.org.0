Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40F494CF2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:29:30 +0100 (CET)
Received: from localhost ([::1]:34266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVdA-0001PA-RT
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVGY-0003zA-Eg; Thu, 20 Jan 2022 06:06:06 -0500
Received: from [2a00:1450:4864:20::336] (port=50958
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVGW-0001vn-UN; Thu, 20 Jan 2022 06:06:06 -0500
Received: by mail-wm1-x336.google.com with SMTP id w26so11360486wmi.0;
 Thu, 20 Jan 2022 03:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hLgqbzNXFs/GpIvzZYV2CAjeBl5SzV+RyDP4Wa3X0i4=;
 b=IaRta1HX4w82N4CbjpOMRPSEPdGe2WdCj9KbjIhUvOApynh9mxLmI5rBYvLu12v2X8
 eLr2D8JfBY6pDzGttnqobbBDWQuPAH1lR9pD0tiKwUUPeBwpIdCpFxoi1r/L5cKY7TfS
 nAQZDgU9m9eEXGCxrS4q902hkLmQQg4kMJPE8dWeJgWIH0VMfzSxk9vi6rgs87En2yTz
 BmHwCz/xq/VoMRvu3vO6480YbMeshG5Ms7nuhO3LvD+iX4ETi711cXuG4N+tTA82c8CD
 aH6Aq5MJyR/Q0hgYIpjM/n8LhcsislqFr6aXClumZ0FzIsIaRAdfB1GWlmTQ7jPtFlcW
 YNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hLgqbzNXFs/GpIvzZYV2CAjeBl5SzV+RyDP4Wa3X0i4=;
 b=nb72xhkJYZc8Kc9P6GUA2FCK6Y/N8IiUM2098chxBCPqJQHsASURh/YHPVjfxAvYqW
 047U42uf8mM/PowJ0JANxvwKkr+46yaQ6XCT2ceXYuJfqol2e1YOlBbegly/6ootxeR1
 PHyu+JqxXCWWvygQfwCKls2VcSGzdClCzvuGn2jt6jm5l1kmUc4Em6JWADUERsUpU+wv
 np7+uurdFkEk8F/+H+VFKjiMuTWgfng8rIsl81y9RTbeo5Niee5/HNaJ3MUBu4JM2T1g
 Txtf5GqeKt+Se9sZb3iBXgkbYtFWKGf6iavo9XEacGg8o/yKlf0a+zZxFBjcfaHSem3L
 7AKg==
X-Gm-Message-State: AOAM533ai3UR0FwhyytfZ10MMZSkaj2givMT7GmaWEcQcNhApiSTnLZ0
 MSey5HYGMmK5OuLaf/mB0qFkB6WAtHQ=
X-Google-Smtp-Source: ABdhPJzFwEZYM+qAYQqTh1h4v/ciMq7kJ/mh+U5G3H2GIJcSTyg95ODZc0juK3z3NWzzM+BinoSHsQ==
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr8390320wmj.68.1642676763055;
 Thu, 20 Jan 2022 03:06:03 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 g7sm2337338wmq.28.2022.01.20.03.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:06:02 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH v2 3/6] tests/lcitool: Install libibumad to cover RDMA on
 Debian based distros
Date: Thu, 20 Jan 2022 12:05:42 +0100
Message-Id: <20220120110545.263404-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120110545.263404-1-f4bug@amsat.org>
References: <20220120110545.263404-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

On Debian we also need libibumad to enable RDMA:

  $ ../configure --enable-rdma

  ERROR:  OpenFabrics librdmacm/libibverbs/libibumad not present.
          Your options:
           (1) Fast: Install infiniband packages (devel) from your distro.
           (2) Cleanest: Install libraries from www.openfabrics.org
           (3) Also: Install softiwarp if you don't have RDMA hardware

Note, librdmacm and libibverbs are already listed in lcitool's qemu.yml.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker | 1 +
 tests/lcitool/projects/qemu.yml            | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 4ea272d143b..7ebaab82b97 100644
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
index 90988b2bc53..b93707b70d4 100644
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
index ed5ab1407a9..948b9912579 100644
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
2.34.1


