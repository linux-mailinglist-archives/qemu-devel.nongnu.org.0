Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96B489A3E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:44:38 +0100 (CET)
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uyT-0005kw-Ru
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:44:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRv-00008c-TQ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:11:00 -0500
Received: from [2a00:1450:4864:20::433] (port=42921
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRh-0008VJ-DZ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:59 -0500
Received: by mail-wr1-x433.google.com with SMTP id k30so9096249wrd.9
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MyQw0vRvhpYAru8FNSMFrr5l9kS0HF1eFpUQdevfGzQ=;
 b=M882QNNLuRpiWJpL3GRKsWNZX8Nf+rt5b2TTNV51iq8S63CAzOJhxJl2mokCQkwhNE
 DQLL+5rmHH3xqKBwauo/dEKo2IY/KHO47srrZ5lpt8kghPQb2Iv+lmrb63E2+A/vAqkf
 xUdVAmpL9Y+ulARySrzw9rrhHFAF4ssaRcPUVr+c4gHctQN/Oh0nfgW+YQojjr9RdNBh
 carUAfYjoQa3Nc9HWMo9TXNA6QAAxXIt7VlIdODfy9qwBRbfxMfuoChvmiN07vxdcwJQ
 WHxCVg410a/5STmtnFHKqHAxr7GadfdSDOH8wwtsgAZiwT/GzUuOa/7ZPTYUAIbRwKhG
 dWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MyQw0vRvhpYAru8FNSMFrr5l9kS0HF1eFpUQdevfGzQ=;
 b=gnMxzqryz5wy5qD5G6JudP+0YGsI62USLZjcLeWS4K+ZM3FNPGCrYozCtIA0IoBrTB
 rSTS8yoFvwT91RZvC4j0AyFyf3XJ8ppfLC6QGB4MJWpznbvDF5ssby1bcGxbKr4ZpnkG
 P97PgabD9UwddS29O6K0v1Nd4YeLtf3Q+QtDWB3QPO8ddR32CDbb97QbwYjQh0FrDjf7
 xSWXvV7FKPy30y30U6MVRIKWYyj8Ttszt5ocX6tDDnRDBOkDx39Qmc69yFSO6ClKWH3h
 KQxMeikf+/Y2NAqDBzOAxdsc/3a+TZ9q9fmDfOWB0TyoCUir/MMWGMcg4AbKSoAqj7uu
 yo2w==
X-Gm-Message-State: AOAM531vuO1JJdYGTA92DYGbZwb9OAeoCpBJt9833bjYl1/gpVNVQ+n4
 Q9Jlt/PHQ0ODC/rX0lBzsdeKSoSPd3YsMA==
X-Google-Smtp-Source: ABdhPJy+IxRIbBNTQz753+p3412ULp3QvjWGaDTmTMDw9rpY7KLbehlsHyRmGweqwMb2Vzq5Hz0rGg==
X-Received: by 2002:a5d:42d2:: with SMTP id t18mr64394695wrr.271.1641820238426; 
 Mon, 10 Jan 2022 05:10:38 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id f10sm6982246wmq.16.2022.01.10.05.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 05:10:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 7/7] gitlab-ci: Support macOS 12 via cirrus-run
Date: Mon, 10 Jan 2022 14:10:01 +0100
Message-Id: <20220110131001.614319-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110131001.614319-1-f4bug@amsat.org>
References: <20220110131001.614319-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for macOS 12 build on Cirrus-CI, similarly to commit
0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run").

Update the lcitool repository to get the macos12 mappings,
and generate the vars file by calling 'make lcitool-refresh'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Pending on libvirt-ci MR #210:
https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/210
---
 .gitlab-ci.d/cirrus.yml           | 15 +++++++++++++++
 .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
 tests/lcitool/libvirt-ci          |  2 +-
 tests/lcitool/refresh             |  1 +
 4 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index b96b22e2697..b7662959070 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -87,6 +87,21 @@ x64-macos-11-base-build:
     PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
     TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
 
+x64-macos-12-base-build:
+  extends: .cirrus_build_job
+  variables:
+    NAME: macos-12
+    CIRRUS_VM_INSTANCE_TYPE: osx_instance
+    CIRRUS_VM_IMAGE_SELECTOR: image
+    CIRRUS_VM_IMAGE_NAME: monterey-base
+    CIRRUS_VM_CPUS: 12
+    CIRRUS_VM_RAM: 24G
+    UPDATE_COMMAND: brew update
+    INSTALL_COMMAND: brew install
+    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
+    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
+    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
+
 
 # The following jobs run VM-based tests via KVM on a Linux-based Cirrus-CI job
 .cirrus_kvm_job:
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
new file mode 100644
index 00000000000..997dbc762c8
--- /dev/null
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -0,0 +1,16 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables macos-12 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+CCACHE='/usr/local/bin/ccache'
+CPAN_PKGS='Test::Harness'
+CROSS_PKGS=''
+MAKE='/usr/local/bin/gmake'
+NINJA='/usr/local/bin/ninja'
+PACKAGING_COMMAND='brew'
+PIP3='/usr/local/bin/pip3'
+PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb libxml2 llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
+PYTHON='/usr/local/bin/python3'
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 8f48e54238d..e91e83fed20 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 8f48e54238d28d7a427a541d6dbe56432e3c4660
+Subproject commit e91e83fed2086163013242e8a33c74fbfba7f729
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 033120e223d..6ac8b888927 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -89,6 +89,7 @@ try:
    generate_cirrus("freebsd-12")
    generate_cirrus("freebsd-13")
    generate_cirrus("macos-11")
+   generate_cirrus("macos-12")
 
    sys.exit(0)
 except Exception as ex:
-- 
2.33.1


