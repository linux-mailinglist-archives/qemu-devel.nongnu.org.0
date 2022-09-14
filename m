Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BCD5B8D7D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:49:04 +0200 (CEST)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVZP-0002y3-1I
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu5-0001Yd-Rc
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu3-0003s2-QQ
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id bj14so26424583wrb.12
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DOBOInzSt+enCwl0nSHMUZYxdD3wfdAmUMtGktSPyVQ=;
 b=Ms2OlgqPhxLSrLKJ8GVJXi/RLjtyAeWzBexO2WcAH1/lWo8ImF/QU4ixFSl+HrUWhY
 toN/r6UYqocIOdh892clNUoxTc3hcldS6q4WF2ra97/elbxKxyi1HniFMy+K/lS2CBhj
 k18on2PN6mzEg3/KdClDLmoYXpBUX+raFgAbbPhfQvygrF1Y0VsEap83BR9lX9hihh0A
 rCJA7fqq96frFvuMJ0Wcx2jBNjFS+ivzqdNA1ryBAvPSNEOCsFpTqWahEkCF2FKPYlSx
 NPdB2voKhfeFlZRt1F5Q6K1zv7W9Y+S9kRcU7LFS/f/QT49SiCgH0i/jxT+sTrPcKljL
 A5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DOBOInzSt+enCwl0nSHMUZYxdD3wfdAmUMtGktSPyVQ=;
 b=azrWyIH0Bv37urMli9+ikzWNZaAXS5/7vBGrOppEamUNMdHGZFIdZ2x86nz3ynwf6j
 83YHqrR3PqcJG2f/Hos7msj+gYfVUizDnpkGFzzCAIBjk9JKgkta5Yh0IatCexaxZdS/
 ZaXE60W2YykZNbll+/bJPDFg5MYpkWa3HOcFwd449zKIDB9X4WDe9If//OPIsUCT3uaa
 3mtvxAx5o53D/1kevTqZQNVbKPb+1VOX+Za8+gKxuy8Ydai4mAzYg+RbNsiCuy82sM5y
 vJnMtmz8nKGEmpW+4clsjMvOOYEZIQ7uq1p1lw0sRrTHXTH/pBkVoVCui7lZ2SGLADpD
 Zv2Q==
X-Gm-Message-State: ACgBeo2xSl6gYBAO8RyzwTXf4PGsqcCzGQ70DXksl2LFBB+6DIcyqzEj
 AoD/yXOMh0X2Swy3KXpj8UFt0g==
X-Google-Smtp-Source: AA6agR5aR4zohxKXfpETDJIGxLVLJxKsJYNgVHmSuGCJa5peO985XL1DITFzVMPnMlVx2u9q/+LMWQ==
X-Received: by 2002:a5d:46c9:0:b0:22a:4306:b77d with SMTP id
 g9-20020a5d46c9000000b0022a4306b77dmr14744515wrs.305.1663171576159; 
 Wed, 14 Sep 2022 09:06:16 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4c42000000b002250c35826dsm13773676wrt.104.2022.09.14.09.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88D7D1FFCF;
 Wed, 14 Sep 2022 16:59:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 24/30] tests/lcitool: bump to latest version
Date: Wed, 14 Sep 2022 16:59:44 +0100
Message-Id: <20220914155950.804707-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need this to be able to cleanly build the x86 cross images. There
are a few minor updates triggered by lcitool-refresh including adding
"libslirp" to the freebsd vars and opensuse-leap which will help when
we finally drop the slirp submodule from QEMU.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-19-alex.bennee@linaro.org>

---
v2
  - expand commit re:libslirp
---
 .gitlab-ci.d/cirrus/freebsd-12.vars           | 2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           | 2 +-
 tests/docker/dockerfiles/opensuse-leap.docker | 3 ++-
 tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
 tests/lcitool/libvirt-ci                      | 2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index 8fa5a320e9..1a5959810f 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 8ed7e33a77..5e5aafd7e5 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 047a435ab5..041cf9c1ff 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -66,6 +66,7 @@ RUN zypper update -y && \
            librbd-devel \
            libseccomp-devel \
            libselinux-devel \
+           libslirp-devel \
            libspice-server-devel \
            libssh-devel \
            libtasn1-devel \
@@ -127,7 +128,7 @@ RUN zypper update -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install meson==0.56.0
+RUN /usr/bin/pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 99803b343b..e1f4ed7c80 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -137,7 +137,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install meson==0.56.0
+RUN /usr/bin/pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 324355cf62..e3712b7912 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 324355cf62e86fb551408575afb123bac989ac37
+Subproject commit e3712b79122180fdb3b7a7ea8cbee47ece253f97
-- 
2.34.1


