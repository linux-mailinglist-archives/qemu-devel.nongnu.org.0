Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31AE6F08B0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:48:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oj-0002JL-3L; Thu, 27 Apr 2023 11:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o9-0001r7-Md
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o6-0004lH-AF
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:20 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f315712406so29275205e9.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610315; x=1685202315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hmaz0tTnTlT4tA/o8R0lO6yD1wszvUTG7WLcL70qJw=;
 b=l0vesrr/Oov8fuAThdb96xaiN8IZ7IX+UPHPEIBbwCRGNbBN30SiRezI8nV8Vm5xxC
 1Na+U6CAU1XMxaBxaBl8sok98Q3tKhjwg7CqmAJpRfVIMgtLJyq/o7IhFvB7UT+/dL+V
 Vilu59sW/ntgCGUmRALV76N0onXZcobRVxetyL0qEFGlaICpbKxBHQ4/a5ZLVJEkv4qr
 pxbCvJbh1NJjlPTDuYgrkNWeNmnUKMm+Vo0nqWIVxIT2LScc+N6GNH3J9wPJriyn0n2o
 BeMt1rvOS0Vmstdi0bhSkUvuHABWBRqjNAQye8ZFEaaqSLajV/Cs9GWS5vcxYdS4fCRd
 PEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610315; x=1685202315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hmaz0tTnTlT4tA/o8R0lO6yD1wszvUTG7WLcL70qJw=;
 b=kXmQm21DTA7bAfKAkk2MfnotjdQpc6IE1juLfDzFvyoVrkXHkwEmZa94yOrhiH+4HX
 cEdg5j7BrzUTA6lH6vg29Pe9SaWrsMJH2o3lQCuKcs8gB62Dw8FyM6UxE+OFaZsGuzQv
 fuDdm2BW08oYv7v/X0583jeO6nW3GDaJCVMc2H8fu4tzCz8Z8M4H5jD6AsTjTFoO13Fg
 QIuuf3Rgb6VUSzWoHCVv6JPj1T7qLwEXOH3bqh3zQR0yow6dbHrAHI2tS24OamWI4RYf
 FHRYTEZVwHNS2v+jGiJuZeML8dU8cVfew3IehdLyKIwOH7yv6h6E45b+Qmjy4Yu0YDFz
 cQBA==
X-Gm-Message-State: AC+VfDzw/wX/rgQJGHBYs1MEIshtWdm0jBi+RHnw7aD882xL1WKhtfXy
 1eyIUVHh7jT/8cvc+SG/17WdIw==
X-Google-Smtp-Source: ACHHUZ5Ij6trf7L/irSeKyaTnjM5UjrLxjXnfRZZPp2W/OmqNVM+9hKQVPik8Gh/dW9x5uLSIkPb6w==
X-Received: by 2002:adf:cf0d:0:b0:2fb:4680:1b59 with SMTP id
 o13-20020adfcf0d000000b002fb46801b59mr1848290wrj.31.1682610315519; 
 Thu, 27 Apr 2023 08:45:15 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfea4e000000b002fc3d8c134bsm18924298wrn.74.2023.04.27.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 68A791FFBF;
 Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 07/18] .gitlab-ci.d/cirrus: Drop the CI job for compiling with
 FreeBSD 12
Date: Thu, 27 Apr 2023 16:44:59 +0100
Message-Id: <20230427154510.1791273-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Thomas Huth <thuth@redhat.com>

FreeBSD 13.0 has been released in April 2021:

 https://www.freebsd.org/releases/13.0R/announce/

According to QEMU's support policy, we stop supporting the previous
major release two years after the the new major release has been
published. So we can stop testing FreeBSD 12 in our CI now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230418160225.529172-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20230424092249.58552-8-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 502dfd612c..1507c928e5 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -44,19 +44,6 @@
   variables:
     QEMU_JOB_CIRRUS: 1
 
-x64-freebsd-12-build:
-  extends: .cirrus_build_job
-  variables:
-    NAME: freebsd-12
-    CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
-    CIRRUS_VM_IMAGE_SELECTOR: image_family
-    CIRRUS_VM_IMAGE_NAME: freebsd-12-4
-    CIRRUS_VM_CPUS: 8
-    CIRRUS_VM_RAM: 8G
-    UPDATE_COMMAND: pkg update; pkg upgrade -y
-    INSTALL_COMMAND: pkg install -y
-    TEST_TARGETS: check
-
 x64-freebsd-13-build:
   extends: .cirrus_build_job
   variables:
diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
deleted file mode 100644
index 44d8a2a511..0000000000
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ /dev/null
@@ -1,16 +0,0 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool variables freebsd-12 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
-
-CCACHE='/usr/local/bin/ccache'
-CPAN_PKGS=''
-CROSS_PKGS=''
-MAKE='/usr/local/bin/gmake'
-NINJA='/usr/local/bin/ninja'
-PACKAGING_COMMAND='pkg'
-PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
-PYPI_PKGS=''
-PYTHON='/usr/local/bin/python3'
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 33ef1282da..f1570b54df 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -182,7 +182,6 @@ try:
     #
     # Cirrus packages lists for GitLab
     #
-    generate_cirrus("freebsd-12")
     generate_cirrus("freebsd-13")
     generate_cirrus("macos-12")
 
-- 
2.39.2


