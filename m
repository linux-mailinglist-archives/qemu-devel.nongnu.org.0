Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1354B2AF5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:53:19 +0100 (CET)
Received: from localhost ([::1]:39746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIZAc-0004r8-Mt
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:53:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYue-00014f-8s
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:48 -0500
Received: from [2607:f8b0:4864:20::102b] (port=54066
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYub-0002Ui-MG
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:47 -0500
Received: by mail-pj1-x102b.google.com with SMTP id qe15so8559778pjb.3
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EdCCUQ1/pVNCX/y4KEFOb4KAj9TbQf1CtmpsmL9hEJQ=;
 b=EUwZLBVu2WZ/vOK20Wcq6GRkgCwTkrvGekZ0VNNrYsjCn0sCjGeJiYRGJnnzQqHp9d
 dB/SPBH3pl/dnHiMkq3dMLxyIZXuDWMapWpZdB8kupMfM8bSu2zHFZ+GGIcqgb6xMHZJ
 XUnOwZPxfNocBNdG1q0hu4E0T2QoNfuSS7vH2Sv/K9HQKJPXF+eTaMAxpAcINXuhS+B8
 8taae4aTiF3UKrTZKM31Du6QHozBcJEzwrL/VQrNo+rguHPsscpj9odJEbiSQXRK7Q7y
 f97Si3DoFWjphVrC8qCDP0G4jRu8dkEyJa4Ffi2DLKCzAqTeveozC3qRmzj9Vnl25hC3
 uVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EdCCUQ1/pVNCX/y4KEFOb4KAj9TbQf1CtmpsmL9hEJQ=;
 b=JwTGQFwUhYHzx/zVl1Me/DxmGlhNGkqvQOQPzfNgOXpFFLp4N6EGmKzvkGyHLszWWH
 F7SZR/epC7yOepsIOv5YYte/MeOZu3Up6m/yAr6el3kPNNZRIg9SpZ7dAZKTgS0UWr7P
 +ekDafq8Om0QR06Kk4EdbGudAQs1ksEl5WVII+5e3eKHGRxjd0S0lzCJoKIptU+ckNsU
 Tl3XnZMw6/XIw991RwU4P8HlyCRdnjduxFVu0MS4kjQpvtDsdt1tt2esnTVppCcRAq8w
 UtrHjw38+lNy90vNCOnka7fmRjwqB1U5QUKzs4IAcAnpYaUWEnqp0wYztCfYKdcIKFFg
 jbYQ==
X-Gm-Message-State: AOAM532CCteT5O5ns5jfCiV8In35jACOZfpfoc4wGKCePZnZAsloU44+
 Fpq7GdnmxNQkROBvW6PW4yciLrz2vgg=
X-Google-Smtp-Source: ABdhPJyCSvSnTeGJs4Dhz9jEqvB0j0JvSOHTwh8nummYXgo8vvYglwzc7zJadHK/e9pgmUEEa1rVKg==
X-Received: by 2002:a17:902:e883:: with SMTP id
 w3mr2192233plg.33.1644597404045; 
 Fri, 11 Feb 2022 08:36:44 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id x126sm13626030pfb.117.2022.02.11.08.36.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:36:43 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 13/13] gitlab-ci: Support macOS 12 via cirrus-run
Date: Fri, 11 Feb 2022 17:34:34 +0100
Message-Id: <20220211163434.58423-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add support for macOS 12 build on Cirrus-CI, similarly to commit
0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run"),
but with the following differences:
 - Enable modules (configure --enable-modules)
 - Do not run softfloat3 tests (make check-softfloat)

Generate the vars file by calling 'make lcitool-refresh'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++
 .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
 tests/lcitool/refresh             |  1 +
 3 files changed, 33 insertions(+)
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index b96b22e269..b4e501d423 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -87,6 +87,22 @@ x64-macos-11-base-build:
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
+    CONFIGURE_ARGS: --enable-modules
+    TEST_TARGETS: check-unit check-block check-qapi-schema check-qtest-x86_64
+
 
 # The following jobs run VM-based tests via KVM on a Linux-based Cirrus-CI job
 .cirrus_kvm_job:
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
new file mode 100644
index 0000000000..a793258c64
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
+PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
+PYTHON='/usr/local/bin/python3'
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 4ab90a310a..a714e2851d 100755
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
2.34.1


