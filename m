Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F6F4AA16E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:53:06 +0100 (CET)
Received: from localhost ([::1]:42084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5Zp-0004LK-FX
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:53:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qu-0006k2-IA
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:52 -0500
Received: from [2a00:1450:4864:20::431] (port=39529
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qr-0007MA-SO
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:52 -0500
Received: by mail-wr1-x431.google.com with SMTP id r17so4363670wrr.6
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fzrsHIr2UBl/pseqKFbHnJlYZQrcZbG/aifIugk8tsI=;
 b=OhHlu72dEWhPvaL63eUgRFi7Litig3J29J1BLN6Huv3854sUpau/NhvJMepYyn1ce9
 XGRPAC6EKIU8VW+BGd6gkYdn6oYGhU75+yL62lPXM9kMwmsXP3qaWIWMGkDbcLM39M1d
 vkUd1aOGGsfYB1Jv3Gxngr/iYrg8ECSwZAD0FDM4Y5KnYaqVD5Dr9ZRig6nME5rRZv/2
 EVpHh8lLN3IaynaCyBUQecrb3vtMy6fTt48YDvQbIjwyUwsf+ZfN+PTpvwOP8H99/tKo
 S3snEabGFoYQfiVy9+ATdO985U7uEjQYqbXopfh0DPnEiRhc6yThNLEO8pgQWmxalb+b
 czmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fzrsHIr2UBl/pseqKFbHnJlYZQrcZbG/aifIugk8tsI=;
 b=J+zNJNg978Iq6ZqQCoHMvbNer+pBYMZXaQUO75DqpoUgnck9tm6Qur7F/vy8E/7NRz
 E2A9a0okxi6R04cVCqn1nQg7Xin3Z1UtwcOOv82Y3/CKMrmPvNBABzcYolrLi0OXie9S
 nCqgwiqWWKZHJKphlk9dX+YQP19o0dVv8LkG5RFCzXIFlBtm+ZBBSGi892XwBJAjHDPP
 6aHs5ZPIyosejioJDiNcVoL3iYbBYPP7xAgTzL+tBFX7xLiL023H4DnVltL99BJsUSAm
 vfTt+5Yhy6dkVIiCzE73iiMokuRklM3BdKdHLVmyC00bLAkbe12VriJmHXxvBSAeaKHl
 tePg==
X-Gm-Message-State: AOAM530Sj1Hoh70lY4Ko+aXwMVYXAClncO7YymWWD8/I6LJmJmWZUE0+
 K4wMgZLBo8SIJ/cOjtAyzIv/8g==
X-Google-Smtp-Source: ABdhPJxW2w7FawcwEhi/0umS6GXJGX9ut0HkORF214sjXTgrv5LVk/RqyGftJkdtsE9Re+N6+zdFWg==
X-Received: by 2002:adf:dec3:: with SMTP id i3mr529622wrn.695.1644007428493;
 Fri, 04 Feb 2022 12:43:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r8sm2765724wrx.2.2022.02.04.12.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D61391FFC0;
 Fri,  4 Feb 2022 20:43:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 08/26] drop libxml2 checks since libxml is not actually
 used (for parallels)
Date: Fri,  4 Feb 2022 20:43:17 +0000
Message-Id: <20220204204335.1689602-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 stefanha@redhat.com, Michael Tokarev <mjt@tls.msk.ru>,
 mahmoudabdalghany@outlook.com,
 "open list:Block layer core" <qemu-block@nongnu.org>, minyihh@uci.edu,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 aaron@os.amperecomputing.com, cota@braap.org, Thomas Huth <thuth@redhat.com>,
 Luke.Craig@ll.mit.edu, crosa@redhat.com, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org, robhenry@microsoft.com,
 Hanna Reitz <hreitz@redhat.com>, pbonzini@redhat.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Tokarev <mjt@tls.msk.ru>

For a long time, we assumed that libxml2 is necessary for parallels
block format support (block/parallels*). However, this format actually
does not use libxml [*]. Since this is the only user of libxml2 in
whole QEMU tree, we can drop all libxml2 checks and dependencies too.

It is even more: --enable-parallels configure option was the only
option which was silently ignored when it's (fake) dependency
(libxml2) isn't installed.

Drop all mentions of libxml2.

[*] Actually the basis for libxml use were introduced in commit
    ed279a06c53 ("configure: add dependency") but the implementation
    was never merged:
    https://lore.kernel.org/qemu-devel/70227bbd-a517-70e9-714f-e6e0ec431be9@openvz.org/

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Updated description and adapted to use lcitool]
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-5-f4bug@amsat.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220124201608.604599-9-alex.bennee@linaro.org>
---
 meson.build                                     | 6 ------
 block/meson.build                               | 3 +--
 meson_options.txt                               | 2 --
 scripts/checkpatch.pl                           | 1 -
 scripts/ci/org.centos/stream/8/x86_64/configure | 1 -
 scripts/coverity-scan/coverity-scan.docker      | 1 -
 scripts/coverity-scan/run-coverity-scan         | 2 +-
 scripts/meson-buildoptions.sh                   | 3 ---
 8 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/meson.build b/meson.build
index 5f43355071..82db1e7e74 100644
--- a/meson.build
+++ b/meson.build
@@ -453,11 +453,6 @@ if not get_option('linux_io_uring').auto() or have_block
                               required: get_option('linux_io_uring'),
                               method: 'pkg-config', kwargs: static_kwargs)
 endif
-libxml2 = not_found
-if not get_option('libxml2').auto() or have_block
-  libxml2 = dependency('libxml-2.0', required: get_option('libxml2'),
-                       method: 'pkg-config', kwargs: static_kwargs)
-endif
 libnfs = not_found
 if not get_option('libnfs').auto() or have_block
   libnfs = dependency('libnfs', version: '>=1.9.3',
@@ -3496,7 +3491,6 @@ summary_info += {'bzip2 support':     libbzip2}
 summary_info += {'lzfse support':     liblzfse}
 summary_info += {'zstd support':      zstd}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
-summary_info += {'libxml2':           libxml2}
 summary_info += {'capstone':          capstone_opt == 'internal' ? capstone_opt : capstone}
 summary_info += {'libpmem support':   libpmem}
 summary_info += {'libdaxctl support': libdaxctl}
diff --git a/block/meson.build b/block/meson.build
index deb73ca389..90dc9983e5 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -58,8 +58,7 @@ block_ss.add(when: 'CONFIG_QED', if_true: files(
   'qed-table.c',
   'qed.c',
 ))
-block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'],
-             if_true: files('parallels.c', 'parallels-ext.c'))
+block_ss.add(when: 'CONFIG_PARALLELS', if_true: files('parallels.c', 'parallels-ext.c'))
 block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c'))
 block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
 block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
diff --git a/meson_options.txt b/meson_options.txt
index 921967eddb..95d527f773 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -113,8 +113,6 @@ option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
 option('libusb', type : 'feature', value : 'auto',
        description: 'libusb support for USB passthrough')
-option('libxml2', type : 'feature', value : 'auto',
-       description: 'libxml2 support for Parallels image format')
 option('linux_aio', type : 'feature', value : 'auto',
        description: 'Linux AIO support')
 option('linux_io_uring', type : 'feature', value : 'auto',
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5caa739db4..5e50111060 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -307,7 +307,6 @@ our @typeList = (
 	qr{target_(?:u)?long},
 	qr{hwaddr},
         # external libraries
-	qr{xml${Ident}},
 	qr{xen\w+_handle},
 	# Glib definitions
 	qr{gchar},
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index e05f2fddcc..9850dd4444 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/configure
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -81,7 +81,6 @@
 --disable-libssh \
 --disable-libudev \
 --disable-libusb \
---disable-libxml2 \
 --disable-linux-aio \
 --disable-linux-io-uring \
 --disable-linux-user \
diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-scan/coverity-scan.docker
index ecff6ac5b4..6f60a52d23 100644
--- a/scripts/coverity-scan/coverity-scan.docker
+++ b/scripts/coverity-scan/coverity-scan.docker
@@ -59,7 +59,6 @@ ENV PACKAGES \
     libubsan \
     libudev-devel \
     libusbx-devel \
-    libxml2-devel \
     libzstd-devel \
     llvm \
     lzo-devel \
diff --git a/scripts/coverity-scan/run-coverity-scan b/scripts/coverity-scan/run-coverity-scan
index 6d443250a9..181bdcb263 100755
--- a/scripts/coverity-scan/run-coverity-scan
+++ b/scripts/coverity-scan/run-coverity-scan
@@ -402,7 +402,7 @@ echo "Configuring..."
     --enable-libiscsi --enable-libnfs --enable-seccomp \
     --enable-tpm --enable-libssh --enable-lzo --enable-snappy --enable-bzip2 \
     --enable-numa --enable-rdma --enable-smartcard --enable-virglrenderer \
-    --enable-mpath --enable-libxml2 --enable-glusterfs \
+    --enable-mpath --enable-glusterfs \
     --enable-virtfs --enable-zstd
 
 echo "Running cov-build..."
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index a4af02c527..48a454cece 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -58,7 +58,6 @@ meson_options_help() {
   printf "%s\n" '  libssh          ssh block device support'
   printf "%s\n" '  libudev         Use libudev to enumerate host devices'
   printf "%s\n" '  libusb          libusb support for USB passthrough'
-  printf "%s\n" '  libxml2         libxml2 support for Parallels image format'
   printf "%s\n" '  linux-aio       Linux AIO support'
   printf "%s\n" '  linux-io-uring  Linux io_uring support'
   printf "%s\n" '  lzfse           lzfse support for DMG images'
@@ -188,8 +187,6 @@ _meson_option_parse() {
     --disable-libudev) printf "%s" -Dlibudev=disabled ;;
     --enable-libusb) printf "%s" -Dlibusb=enabled ;;
     --disable-libusb) printf "%s" -Dlibusb=disabled ;;
-    --enable-libxml2) printf "%s" -Dlibxml2=enabled ;;
-    --disable-libxml2) printf "%s" -Dlibxml2=disabled ;;
     --enable-linux-aio) printf "%s" -Dlinux_aio=enabled ;;
     --disable-linux-aio) printf "%s" -Dlinux_aio=disabled ;;
     --enable-linux-io-uring) printf "%s" -Dlinux_io_uring=enabled ;;
-- 
2.30.2


