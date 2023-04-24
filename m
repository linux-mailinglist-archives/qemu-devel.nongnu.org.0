Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBA16EC8B8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:24:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsQ9-0007qt-FW; Mon, 24 Apr 2023 05:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPl-0007Ni-JB
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPP-0004mI-9a
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso2462329f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328174; x=1684920174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9uTXovsPx5Gwk+eN7aB5uoOgo/DjD2jpEQnWvJoeYzI=;
 b=RUzuoLa2FBaXvdu9twXit9kiSbf/sqQZ0s9bv5c7NMWA5th2m728Lkjzpj1Jax/SUE
 VSKD6yk9wDGYK5Qt79b3QFszL3dirRz7JK2DXq2QJOaXU4NaGLJMMNfSEfLsJtX0pWTu
 cMdwTElHbwQiB6BBQaP8I4YDdP+CzI60lcdCavBg1KR1dbfTfEW9NWhtJnqhmRMK37Dj
 ECDmgpkafa/+wsI0w9xNTvRjf2dwkvuNwfB6/gH6/vcDFTrbGvWlHXa7RgkNlChhk+Wc
 V9RrR5c22RtAwy23Ein/Az+F54MTSBmOq09f1hFoIwH6SkXsfy6rrIVeiWrRwOKZjlUT
 V7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328174; x=1684920174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9uTXovsPx5Gwk+eN7aB5uoOgo/DjD2jpEQnWvJoeYzI=;
 b=N0TizoAICcXf/W5iuknrWbn+J3ogbu7K0cmo3zlMlK3EeIlZdyHxb/kDI7/BCKGE0L
 QTy+P/kO03wDU61o82HPkybcKQA/Ar1sp4p0mq73o2vxiVPTKkCsXCjqPRPqyF1ijywo
 a+fdLiwOsAHC4baEPMbvKN2Mg7nU9g4Ega2Y7tLHBP4i0ciPodM3AIrH1DYCpipSzvDt
 OR+3TxyZj+G4PvMb1h3bUGzyRzBSDdit78KRxcRMIJ3c/b66XAlzETo/aKATmPBCdRGv
 LyX7WscZjohIKYoYJSGaU1hy0P5f0o9KHw8e20IDe+w2LeauFkfZEjgvcZb6SstrVzs6
 gOEA==
X-Gm-Message-State: AAQBX9ezeMTQa7vMt1YM67qXDPh/50Kv8WF5b0vy01EU6HfS1m9rm3Ix
 faFftM0A2YOlus63ePN0xK6O/A==
X-Google-Smtp-Source: AKy350YzSIrF6DBaP6LtahvU1x5794k/jIwuVm/Ex0oeT/FU03x4KI+7ysfTD+fMF5V9pWvBtrII0A==
X-Received: by 2002:a05:6000:1290:b0:2f9:1224:2474 with SMTP id
 f16-20020a056000129000b002f912242474mr8930818wrx.23.1682328173804; 
 Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c181000b003f046ad52efsm14993862wmp.31.2023.04.24.02.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 41F521FFBF;
 Mon, 24 Apr 2023 10:22:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 07/18] .gitlab-ci.d/cirrus: Drop the CI job for compiling with
 FreeBSD 12
Date: Mon, 24 Apr 2023 10:22:38 +0100
Message-Id: <20230424092249.58552-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
 .gitlab-ci.d/cirrus.yml             | 13 -------------
 .gitlab-ci.d/cirrus/freebsd-12.vars | 16 ----------------
 tests/lcitool/refresh               |  1 -
 3 files changed, 30 deletions(-)
 delete mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars

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


