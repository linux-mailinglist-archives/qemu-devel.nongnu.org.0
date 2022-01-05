Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856648542F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:16:54 +0100 (CET)
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n575x-0000gQ-Gb
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:16:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56pz-0004YS-JA
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:26 -0500
Received: from [2a00:1450:4864:20::431] (port=44936
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56pv-0006R4-7A
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:22 -0500
Received: by mail-wr1-x431.google.com with SMTP id k18so46505448wrg.11
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fFB9jNm1X2+UHqIZO7UGcc0OcE8vZ7w9cyMR7yqZvgk=;
 b=weTNpjbsjN/bhPBbDk3QjbSK4dEwn++YcZPsao6d1VUvnc9wA74QZxPSjigEoRCyMB
 wGhc9HsqlVDA1FVuwwnNDibnriDqZrwPG0CvouLAbYz/lvAMdk3gX/BCpmziMfGgNj1q
 ffKmPer696GnStJZ4rrPvEe8KxrFvBvuFTKcizaZspHdj61NQ3AGDaJW+rb+kdY0h3CH
 QuX+hfat1hbuDhNwY2FLuPRd/oR6kBqK/2qBtn+W0FKhAtotPVRj9vjrxClrMKfrmilJ
 s9piaFRskNnNlfqtCPFQ81Ax/lvDy792Ak/CrTx2nOxEcNgQSfJ2vE8w6QvIU8oqUfOB
 KpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fFB9jNm1X2+UHqIZO7UGcc0OcE8vZ7w9cyMR7yqZvgk=;
 b=ODR7c48vJ1QPu/9HLNjaBwhDLpE9l4u+/LPymT/iLX0v8rCmeXHzTi0wZ3FxXbyAVK
 CwdHmpy+7lzJoncI8HeqdVx5l/kC3uvfsbPUokT3b+HyiLt0lxBiprLKqKZ+tXnA6IUb
 fwAc/yT+0V+t2P+va3gdzODNPOxzg2ihJJxBGHRPqwXBgcPzOlgYSahrhJas+q1pDr1V
 Gd+m3yWhlfhU1Zp3f2c7meC5G/IXhWajxags3Ao1XYe/bmQZZt2lWgSThae+SpcSjnLo
 muVnkojY7Z1eLPY8hVFKLSItXzMiGKfTqWgUcqaV3XIQQYVQTzPgOIL/X2GgxNK+5vlO
 Tc2g==
X-Gm-Message-State: AOAM533s+lacAVVK+PKAFxd/rpyPtiVb8WsU6y3hF2UT/JbFK4HIExya
 8LhUmLnbGhjBE0eO36TKvS5mzA==
X-Google-Smtp-Source: ABdhPJzFnl0ScUdRNDDsCivUfXHRX1HcKs74ox682NXx0JHFqZ0ubo376OyNGmWAr6ixHu7yqbKDng==
X-Received: by 2002:a05:6000:15c9:: with SMTP id
 y9mr1864402wry.32.1641391217760; 
 Wed, 05 Jan 2022 06:00:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b13sm41953490wrh.32.2022.01.05.06.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67BA41FFC6;
 Wed,  5 Jan 2022 13:50:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 14/34] .gitlab-ci.d/cirrus: auto-generate variables with
 lcitool
Date: Wed,  5 Jan 2022 13:49:49 +0000
Message-Id: <20220105135009.1584676-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The current Cirrus CI variables files were previously generated by using
lcitool. This change wires them up to the refresh script to make that
link explicit.

This changes the package list because libvirt-ci now knows about the
mapping for dtc on FreeBSD and macOS platforms.

The variables are also now emit in sorted order for stability across
runs.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-15-berrange@redhat.com>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars | 11 +++++++----
 .gitlab-ci.d/cirrus/freebsd-13.vars | 11 +++++++----
 .gitlab-ci.d/cirrus/macos-11.vars   | 11 ++++++-----
 tests/lcitool/refresh               | 10 ++++++++++
 4 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index 2099b21354..9c52266811 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -2,12 +2,15 @@
 #
 #  $ lcitool variables freebsd-12 qemu
 #
-# https://gitlab.com/libvirt/libvirt-ci/-/commit/c7e275ab27ac0dcd09da290817b9adeea1fd1eb1
+# https://gitlab.com/libvirt/libvirt-ci
 
-PACKAGING_COMMAND='pkg'
 CCACHE='/usr/local/bin/ccache'
+CPAN_PKGS=''
+CROSS_PKGS=''
 MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
-PYTHON='/usr/local/bin/python3'
+PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PYPI_PKGS=''
+PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 323fe806d5..7b44dba324 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -2,12 +2,15 @@
 #
 #  $ lcitool variables freebsd-13 qemu
 #
-# https://gitlab.com/libvirt/libvirt-ci/-/commit/c7e275ab27ac0dcd09da290817b9adeea1fd1eb1
+# https://gitlab.com/libvirt/libvirt-ci
 
-PACKAGING_COMMAND='pkg'
 CCACHE='/usr/local/bin/ccache'
+CPAN_PKGS=''
+CROSS_PKGS=''
 MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
-PYTHON='/usr/local/bin/python3'
+PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PYPI_PKGS=''
+PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-11.vars
index cbec8a44a3..613d1373c2 100644
--- a/.gitlab-ci.d/cirrus/macos-11.vars
+++ b/.gitlab-ci.d/cirrus/macos-11.vars
@@ -2,14 +2,15 @@
 #
 #  $ lcitool variables macos-11 qemu
 #
-# https://gitlab.com/libvirt/libvirt-ci/-/commit/c7e275ab27ac0dcd09da290817b9adeea1fd1eb1
+# https://gitlab.com/libvirt/libvirt-ci
 
-PACKAGING_COMMAND='brew'
 CCACHE='/usr/local/bin/ccache'
+CPAN_PKGS='Test::Harness'
+CROSS_PKGS=''
 MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
-PYTHON='/usr/local/bin/python3'
+PACKAGING_COMMAND='brew'
 PIP3='/usr/local/bin/pip3'
-PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb libxml2 llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb libxml2 llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
-CPAN_PKGS='Test::Harness'
+PYTHON='/usr/local/bin/python3'
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index b8a69cee59..b8cf0a7386 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -60,6 +60,11 @@ def generate_dockerfile(host, target, cross=None, trailer=None):
    cmd.extend([target, "qemu"])
    generate(filename, cmd, trailer)
 
+def generate_cirrus(target, trailer=None):
+   filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
+   cmd = [lcitool_path, "variables", target, "qemu"]
+   generate(filename, cmd, trailer)
+
 ubuntu1804_skipssh = [
    "# https://bugs.launchpad.net/qemu/+bug/1838763\n",
    "ENV QEMU_CONFIGURE_OPTS --disable-libssh\n"
@@ -79,6 +84,11 @@ try:
    generate_dockerfile("ubuntu2004", "ubuntu-2004",
                        trailer="".join(ubuntu2004_tsanhack))
    generate_dockerfile("opensuse-leap", "opensuse-leap-152")
+
+   generate_cirrus("freebsd-12")
+   generate_cirrus("freebsd-13")
+   generate_cirrus("macos-11")
+
    sys.exit(0)
 except Exception as ex:
    print(str(ex), file=sys.stderr)
-- 
2.30.2


