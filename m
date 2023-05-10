Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4928D6FE139
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:10:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPI-0006tx-Jy; Wed, 10 May 2023 11:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPF-0006sT-7W
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPC-0001Vo-9j
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:04 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f315712406so251112905e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731221; x=1686323221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KoXK86fLWvdd2wu29cai/tI+78Sen1sg80vVZCIKXsc=;
 b=wjEm9czrP9IKQkZb823iPUNNXwyG9vyIHrbM1QA793HVaA1MH912+Qs7V3rou4Rj3l
 9NF1aeFeVJimI1CbwNxrgXckMyEFcPvjEGsyGXA6u37TFXifxgndTjec/T3W0lYrxFDj
 2aqO1vaP70xMS4klBH8uf3DY0Ll7gx87h4nrfBjzntOFyrGh8lZOBvtNePddAxDGAzrg
 zCj+b1TrWXzWZ7yWoL32gBrQxI0jqyFbjCYPQ5cQFHevfD/6YBgCfdgfZ5DpwqtGpvwO
 dhmaTAUEqOKWdqfnmyO+E2hPG/q4v/RuQVhFjibAI7etTDQ6d3mCt0DmsS8VYHJ1dVxs
 MmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731221; x=1686323221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KoXK86fLWvdd2wu29cai/tI+78Sen1sg80vVZCIKXsc=;
 b=hCmv2eZfCDQSHv2hILDLvUL7b1CiuYZvKsuRlHv1ULx5PX8QGJP87FJtS32X17zU8p
 uTR3y6YkIjZ9o0C40kARuEUkKVeWrE4Z+qIOnUPvPKuIHFgBYGjxVmy9Mj1TjczogzMC
 RTraD7KT3QsCfHyC2iP8Nr3xjI4lyjvafIYc8WmEBELLt61fnvaa7LEnUEpmsOEEZoJP
 WWoQa8uWp8B2fwEM59Y10siIidHNeeBM5X9S56i6qQnPgyZbbDy47l3gPtna4sORiw4Z
 z4nADA0cjpSNuFJL9Q+b2g3dq6R5NoEyqo4ksAF+JRi0ySzEGGk1ngdK5KGrvVgOa+wD
 duTA==
X-Gm-Message-State: AC+VfDy4LAV7DsTaTrC0LxDrNlFDx96tpOXqHaqSloMA0HhJVrKUAQGD
 cLz9kH6IAzTjsX8UboCArZ5JIt2rXd7uHLyAt24M4A==
X-Google-Smtp-Source: ACHHUZ47kb/8xqr4yt/wMfEqcPi2veCtQNH6TEiEHMT/eDIm1thG3Hhy4tVXCvRxHVwZODEptm7czg==
X-Received: by 2002:a05:600c:2294:b0:3f4:2a69:409 with SMTP id
 20-20020a05600c229400b003f42a690409mr4335402wmf.11.1683731220916; 
 Wed, 10 May 2023 08:07:00 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c1c0f00b003f1738d0d13sm7735521wms.1.2023.05.10.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:06:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16A991FFBF;
 Wed, 10 May 2023 16:06:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 4/8] scripts/ci: clean-up the 20.04/22.04 confusion in ansible
Date: Wed, 10 May 2023 16:06:54 +0100
Message-Id: <20230510150658.1399087-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510150658.1399087-1-alex.bennee@linaro.org>
References: <20230510150658.1399087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We have a bunch of references to 20.04 (which s390x is still on)
although we are basically building on 22.04 now. Clean up the textual
references and use lcitool to generate the full package list to be
consistent.

We can drop "Install packages to build QEMU on Ubuntu on non-s390x" as
when we upgrade the s390x builder to 22.04 it won't need this
workaround.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230503091244.1450613-19-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
index 50e5646a44..b8a0d75162 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
@@ -1,6 +1,6 @@
 # All ubuntu-22.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/qemu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 20.04"
+# "Install basic packages to build QEMU on Ubuntu 22.04"
 
 ubuntu-22.04-aarch32-all:
  extends: .custom_runner_template
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 13e14a0f87..57303c12e1 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -1,6 +1,6 @@
-# All ubuntu-20.04 jobs should run successfully in an environment
+# All ubuntu-22.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/qemu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 20.04"
+# "Install basic packages to build QEMU on Ubuntu 22.04"
 
 ubuntu-22.04-aarch64-all-linux-static:
  extends: .custom_runner_template
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 78b1021cd4..f344d1a850 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -24,7 +24,6 @@
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
 
     - name: Update apt cache / upgrade packages via apt
       apt:
@@ -33,87 +32,131 @@
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
 
-    - name: Install basic packages to build QEMU on Ubuntu 20.04
+    # lcitool variables -f json ubuntu-2204 qemu | jq -r '.pkgs[]' | xargs -n 1 echo "-"
+    - name: Install basic packages to build QEMU on Ubuntu 22.04
       package:
         name:
+          - bash
+          - bc
+          - bison
+          - bsdextrautils
+          - bzip2
+          - ca-certificates
           - ccache
+          - clang
+          - dbus
+          - debianutils
+          - diffutils
+          - exuberant-ctags
+          - findutils
+          - flex
+          - g++
           - gcc
+          - gcovr
+          - genisoimage
           - gettext
           - git
-          - glusterfs-common
+          - hostname
           - libaio-dev
+          - libasan5
+          - libasound2-dev
           - libattr1-dev
+          - libbpf-dev
           - libbrlapi-dev
           - libbz2-dev
+          - libc6-dev
           - libcacard-dev
-          - libcapstone-dev
           - libcap-ng-dev
+          - libcapstone-dev
+          - libcmocka-dev
           - libcurl4-gnutls-dev
+          - libdaxctl-dev
           - libdrm-dev
           - libepoxy-dev
           - libfdt-dev
+          - libffi-dev
           - libgbm-dev
+          - libgcrypt20-dev
+          - libglib2.0-dev
+          - libglusterfs-dev
+          - libgnutls28-dev
           - libgtk-3-dev
+          - libibumad-dev
           - libibverbs-dev
           - libiscsi-dev
           - libjemalloc-dev
           - libjpeg-turbo8-dev
+          - libjson-c-dev
+          - liblttng-ust-dev
           - liblzo2-dev
-          - libncurses5-dev
           - libncursesw5-dev
           - libnfs-dev
-          - libnss3-dev
           - libnuma-dev
+          - libpam0g-dev
+          - libpcre2-dev
           - libpixman-1-dev
-          - librados-dev
+          - libpmem-dev
+          - libpng-dev
+          - libpulse-dev
           - librbd-dev
           - librdmacm-dev
           - libsasl2-dev
           - libsdl2-dev
+          - libsdl2-image-dev
           - libseccomp-dev
+          - libslirp-dev
           - libsnappy-dev
           - libspice-protocol-dev
+          - libspice-server-dev
           - libssh-dev
+          - libsystemd-dev
+          - libtasn1-6-dev
+          - libubsan1
+          - libudev-dev
+          - liburing-dev
           - libusb-1.0-0-dev
           - libusbredirhost-dev
           - libvdeplug-dev
+          - libvirglrenderer-dev
           - libvte-2.91-dev
+          - libxen-dev
+          - libxml2-dev
           - libzstd-dev
+          - llvm
+          - locales
           - make
-          - python3-yaml
+          - meson
+          - multipath-tools
+          - ncat
+          - nettle-dev
+          - ninja-build
+          - openssh-client
+          - pkgconf
+          - python3
+          - python3-numpy
+          - python3-opencv
+          - python3-pillow
+          - python3-pip
           - python3-sphinx
           - python3-sphinx-rtd-theme
-          - ninja-build
+          - python3-venv
+          - python3-yaml
+          - rpm2cpio
+          - sed
           - sparse
+          - systemtap-sdt-dev
+          - tar
+          - tesseract-ocr
+          - tesseract-ocr-eng
+          - texinfo
           - xfslibs-dev
+          - zlib1g-dev
         state: present
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution_version'] == '22.04'
 
-    - name: Install packages to build QEMU on Ubuntu 20.04 on non-s390x
-      package:
-        name:
-          - libspice-server-dev
-          - libxen-dev
-        state: present
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
-
-    - name: Install basic packages to build QEMU on Ubuntu 20.04
-      package:
-        name:
-        # Originally from tests/docker/dockerfiles/ubuntu2004.docker
-          - clang-10
-          - genisoimage
-          - liblttng-ust-dev
-          - libslirp-dev
-          - netcat-openbsd
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['distribution_version'] == '20.04'
-
-    - name: Install armhf cross-compile packages to build QEMU on AArch64 Ubuntu 20.04
+    - name: Install armhf cross-compile packages to build QEMU on AArch64 Ubuntu 22.04
       package:
         name:
           - binutils-arm-linux-gnueabihf
@@ -128,7 +171,7 @@
           - zlib1g-dev:armhf
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
         - ansible_facts['architecture'] == 'aarch64'
 
     - name: Enable EPEL repo on EL8
-- 
2.39.2


