Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713574B6612
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:30:11 +0100 (CET)
Received: from localhost ([::1]:36518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtDu-0004KK-Ia
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:30:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspy-0003VL-6H
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:05:27 -0500
Received: from [2607:f8b0:4864:20::1030] (port=43576
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspv-0002TX-6y
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:05:25 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so1455814pjm.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qfJBWc7VlSAxcQpybErIaMF3n0Z6M+HIapcTvTq5mnc=;
 b=liUCV82O0/VQ0P5gJce1HfTyLB0ughJg5oNWU8P5mmsfjUdW0Hf82YIi+sZ8EjTP+4
 rD5u29eVFKCdHSOpzcqIbKLswN2aHkbYcGfJNFHy66AdV00+Vscd32HWMxYvV4KVwKsG
 XL0+FIoE2MjUU87LM6l4NMzXdQZ+ZidJGXJG3TtpY2bYA8YlEyXuLjc+RXArxu1/hIwO
 rfPp8EyhXimqNOObaJNZ0sPe/ASMpQ+D27p8q3sH+xkWgMJe0/u07dnkKLlcQkjW6bRd
 DL/d4yLoMpLZAXVN5bitNPGzNwaipDYfbAASVfda/xxl+ppho24VffD4lcU/9+G3KYlY
 eUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qfJBWc7VlSAxcQpybErIaMF3n0Z6M+HIapcTvTq5mnc=;
 b=0YwpSB5a1YdrEsixkUG+aWkOw9pNKEoD3pVgWo2PsQcRqlkF02MEcSWK3rRfJWF7h7
 jg7aFFOmP5rtMjtkohqpJimGE97Hswj52UZTjz+r/KS3bUdT1coMdUlo1If+KV5ptC0u
 SPUG2Vu7AVG7DCj49avSq+djQwWxZ9hJnNu7pPHSKs+pWf1CJPN77AFJBKIFLxiZO/AN
 aMkw0NWQxB6bSEHvhxkkpu34KxPxq7z9DszPzB2NyWTjUOtNROpYRywbqxanhOpMTqOq
 9GgrbDU/5dQ7FIuzgXK3qqWiJO3ZxLpMfICPYNcRIMXL7OxsmI1FbDdbDzX+8vdz+p0/
 eaCQ==
X-Gm-Message-State: AOAM533MhrrI3IOoYlgfcK2NjhGAAcPCFubDouRq4uzZaQAelAYonNDL
 kHmov8/IMw1ibTZET+xzwe2V4KLGMIU=
X-Google-Smtp-Source: ABdhPJzhG4jJaLzItHQvs33ZEhgpFe1VogLCutbTnfhCLPkaFJa+KuvxUS2qKXIYQZUoQ8EDwvS7xA==
X-Received: by 2002:a17:902:b941:: with SMTP id
 h1mr3051902pls.73.1644912321854; 
 Tue, 15 Feb 2022 00:05:21 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id f8sm39470584pfe.204.2022.02.15.00.05.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:05:21 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 15/15] gitlab-ci: Support macOS 12 via cirrus-run
Date: Tue, 15 Feb 2022 09:03:07 +0100
Message-Id: <20220215080307.69550-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 - Run Aarch64 qtests instead of x86_64 ones

Generate the vars file by calling 'make lcitool-refresh'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++
 .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
 tests/lcitool/refresh             |  1 +
 3 files changed, 33 insertions(+)
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index b96b22e269..be1dce5d4e 100644
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
+    TEST_TARGETS: check-unit check-block check-qapi-schema check-qtest-aarch64
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


