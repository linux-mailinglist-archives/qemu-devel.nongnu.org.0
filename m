Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C6494DD9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 13:24:20 +0100 (CET)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAWUF-0002Wo-1D
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 07:24:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVH2-0004EK-CF; Thu, 20 Jan 2022 06:06:36 -0500
Received: from [2a00:1450:4864:20::32d] (port=46819
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVGz-0001xZ-4M; Thu, 20 Jan 2022 06:06:36 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so12749863wmb.5; 
 Thu, 20 Jan 2022 03:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pS9OAWouq8KVRXzw5bYHPfuW4Mi4STgtGz18wqOGCxs=;
 b=MLhCIr+Dx74olbOarPOkf+xogU5DK0paUesCvxZCauG95Xkc8LhMYZUAuyPNFQnokd
 2BCtIuhy2Rp8ZiZQ4C5YaumWv9uGlix6lu7nPsWOsoytfbePixfQvw0bUeIyI4giU2dt
 46REAbKsS0y8NOAtlBPEjwkRJhBmqp9NpKLwkTnmhwrASsXmrgft1mf+MINWwWEol57Z
 HVyXC6hz9pngi9iNDTZtM3VkJ3dmmkiO9hiv32jYmZsee8B5Uc8LY3MdZhuADUR/Ks4m
 e10CIqpYmI9PR1LYhtyjVcvF5DHU25TzQE3w58s0tP/AG+iJC/Kv8xIIu9rD1sgoyhZ1
 LXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pS9OAWouq8KVRXzw5bYHPfuW4Mi4STgtGz18wqOGCxs=;
 b=TjLWlKTMInjA/caxKeb1IDo3Zq1T+j3qInayYAKfb9Idz7Jo3t0hnWSvOUWjuhg+co
 +VSiWf4lquukadQHT6G+5gOlZPUJAGnV02E4vcO9YYF1zx0ummtqIorOesapnSFw9Gdi
 jX/ivF1mVKtxdU678cUyenHD+qGvB8ZfWrbUlTlSdHrUrCvW9cTMXwdVfQYkp7wnpTMk
 YO/9p5INybV7o2FmkR4Wm2XSbd16V61/I8cJc3UPpsgNw+e4b0yfMKQpw1lOe8kl8J8B
 8a8wI7Rh2D11ewC+5K6EcixLlPeAaKJU1WzqKj5xoIw6osL7I29ysNpW4LsikRl+/M1J
 efcA==
X-Gm-Message-State: AOAM531TdbdYQOqmVzCItJtIx7nO/E3aWPRZ5mokWzz0YZE5G9pCnBw0
 Nd0eQLxKTaFbb8UrFWjmEAdpspPlfwM=
X-Google-Smtp-Source: ABdhPJzHhlNG0NHXc8QxI7A/V+QpryGeaKTHyinDFTjaum+dLJWMrgwwWA2GaAJwnS1ZdXNl7HkScg==
X-Received: by 2002:a05:6000:1002:: with SMTP id
 a2mr32204697wrx.157.1642676772787; 
 Thu, 20 Jan 2022 03:06:12 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 o12sm3327420wrc.51.2022.01.20.03.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:06:12 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH v2 5/6] tests/lcitool: Remove libxml2
Date: Thu, 20 Jan 2022 12:05:44 +0100
Message-Id: <20220120110545.263404-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120110545.263404-1-f4bug@amsat.org>
References: <20220120110545.263404-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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

The previous commit removed all uses of libxml2.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/alpine.docker        | 1 -
 tests/docker/dockerfiles/centos8.docker       | 1 -
 tests/docker/dockerfiles/fedora.docker        | 1 -
 tests/docker/dockerfiles/opensuse-leap.docker | 1 -
 tests/docker/dockerfiles/ubuntu1804.docker    | 1 -
 tests/docker/dockerfiles/ubuntu2004.docker    | 1 -
 tests/lcitool/projects/qemu.yml               | 1 -
 7 files changed, 7 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 9d7f74fc51e..591af43d60e 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -56,7 +56,6 @@ RUN apk update && \
         libtasn1-dev \
         liburing-dev \
         libusb-dev \
-        libxml2-dev \
         linux-pam-dev \
         llvm11 \
         lttng-ust-dev \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index fde6a036263..3abac7a8b13 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -71,7 +71,6 @@ RUN dnf update -y && \
         libubsan \
         liburing-devel \
         libusbx-devel \
-        libxml2-devel \
         libzstd-devel \
         llvm \
         lttng-ust-devel \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 82f504e40d6..1d01cd94405 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -79,7 +79,6 @@ exec "$@"' > /usr/bin/nosync && \
         libubsan \
         liburing-devel \
         libusbx-devel \
-        libxml2-devel \
         libzstd-devel \
         llvm \
         lttng-ust-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 30e7038148a..1b78d8369a7 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -71,7 +71,6 @@ RUN zypper update -y && \
            libudev-devel \
            liburing-devel \
            libusb-1_0-devel \
-           libxml2-devel \
            libzstd-devel \
            llvm \
            lttng-ust-devel \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 7ebaab82b97..699f2dfc6a9 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -90,7 +90,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev \
             libvte-2.91-dev \
             libxen-dev \
-            libxml2-dev \
             libzstd-dev \
             llvm \
             locales \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index b93707b70d4..87513125b8e 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -92,7 +92,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev \
             libvte-2.91-dev \
             libxen-dev \
-            libxml2-dev \
             libzstd-dev \
             llvm \
             locales \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 948b9912579..958868a6ee9 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -64,7 +64,6 @@ packages:
  - liburing
  - libusbx
  - libvdeplug
- - libxml2
  - libzstd
  - llvm
  - lttng-ust
-- 
2.34.1


