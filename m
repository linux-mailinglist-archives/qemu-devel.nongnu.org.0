Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F58A5BEFBB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:08:15 +0200 (CEST)
Received: from localhost ([::1]:34208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalPa-0004T5-K9
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzW-0005qW-Lt
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:02 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzU-0001ot-Pk
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:02 -0400
Received: by mail-ej1-x631.google.com with SMTP id y3so7922081ejc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3dsFavzDTb9lwDtGm2WAvmjX0ZIRpS6ht5ulPEZxGuM=;
 b=DxRl9rY+s4PbWTvZBYYBTn6C4TG2fLvM3/dG7bVAq/CDS/zOo9jBWt31HiJ6AWQu2N
 tZtxSswvnFPxQql69/hzf415BHukVFyVadLbkJbnElGaYO/y43TP4/mlJ7ubFCxPtcGI
 ZxWoSKeLuE7tsiabFR8gvVHUKvr3HWJ4xyOvUCqOMbRzlVVyye4IJWtIbR1b+4vu4pjF
 dcyZlHjhDNEh/DjOEvQ/eKjEdWmzZvqAiMRSnjxXaGKm1Ot4v7n7zzB555iNuKssEXMe
 zaJIfE6WdtyLi7KJQnOunirqjybBb0IDPMYvr/WeXfNpJTk9kxA9AaFrRPh8/GgRKFvI
 ZtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3dsFavzDTb9lwDtGm2WAvmjX0ZIRpS6ht5ulPEZxGuM=;
 b=sm08dtnp4jYJB/JrkOIh0t2YljjI8GGGzbQpnJq6GaouaJqpcPgV8SxCnQizpgYQnw
 E9XgRrh5c1maEWr/ZSsWWWi7t9aN+O3WuQvbhBeKj5w3daXZfDPqEgnU7+5sdXoFiQyS
 41aRsfOKgWAloiVFsXKdLfW3AS4b2C+URq0rMLATJrMX3vDZ06UlnRKhU3HqVzVQ36xy
 yTrNB8UHHO8bMIKuhVad0DYdd6vYqLC9Yy5zbfvlj/fCD403aPNJYACg3MYaVhEeaARs
 Uak4wx58aVtNm96/v7OAOujZcCy07pg8ptUEMoNOYH6ZUEyEorYyNabVtQi8wPUYyjTo
 +NEQ==
X-Gm-Message-State: ACrzQf2ViqtaSG5AtzVmPLRB6J/lYvP1DqV86WJX7qT2oLVVYei8R4ZW
 g2V3pd6zsYtGVQNiML+QcvFISQ==
X-Google-Smtp-Source: AMsMyM7WuR5QTJNEsRVtGdJ4WjGZjgsUgkX8WazhwC+sjo094gozFewTWBWD+bR2rskt80GclDa1qw==
X-Received: by 2002:a17:907:7215:b0:780:3153:cca2 with SMTP id
 dr21-20020a170907721500b007803153cca2mr18017124ejc.427.1663694699413; 
 Tue, 20 Sep 2022 10:24:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t20-20020aa7d714000000b0044e91d8ccd2sm203847edq.50.2022.09.20.10.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4AD591FFCF;
 Tue, 20 Sep 2022 18:15:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 24/30] tests/lcitool: bump to latest version
Date: Tue, 20 Sep 2022 18:15:27 +0100
Message-Id: <20220920171533.1098094-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-Id: <20220914155950.804707-25-alex.bennee@linaro.org>

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


