Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F28495E13
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:02:46 +0100 (CET)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArgr-0000uG-KY
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:02:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHu-0003mP-Rs; Fri, 21 Jan 2022 05:37:01 -0500
Received: from [2a00:1450:4864:20::335] (port=47070
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHs-0004tD-Vi; Fri, 21 Jan 2022 05:36:58 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so21299625wmb.5; 
 Fri, 21 Jan 2022 02:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZZgerq/Ox+dDJxsITCbhd0a4LAgF31nJn3RW/JNrLhM=;
 b=dL0T5BMTnGgYALL5h/78af2NflrVFBanwHAhYDmYcy9MOihU97fj0gaFTt4ChBitcZ
 kNDAudY7dkJhzwz2BmcbI5+H9PX4ZHi2ZXgnvbpzCN19ne2kWynb4Gp8JvUKaD0DjOUI
 GiXja3b6ZxYb1XQqJVHgBZzEfnECR3P2i51O/nXPGd9r9W5LeK6erFkoWAatVIfzZXwU
 7cfFrINV+bgGaU9YcqBeIkdoPH2WMSLmzqXr1JPwewjGAtdYUZQdddtxUiXPOuAzRRR3
 xW72GFX7UzxitFNKkEImQQ31cdW/zJh3pSpWCUKdTAR8WEOo91imK23iTzOAjsfnlJRm
 doPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZZgerq/Ox+dDJxsITCbhd0a4LAgF31nJn3RW/JNrLhM=;
 b=toabkIbOStylkEWG8Y3ua/rVufuMfTeARBCen0ZlgT/l2bgeMMekdEaNL9JsxRFRlf
 BUco1e3wtpYhaY2vickK1JG1Kf/nolR2UzIfLMbqVnxo+JbKJPYupmNJGkXsRXDT25St
 Cmpbwht3v2IbkxZtEE3gRdyRzPJ3uoUcco5wNiPzyTcufDBXE2+NoVglsnAU83yh3S+P
 gZxdKc8hSFKO/3MZkqDOMcKeEv2t6qsJbaz5swnIH8C8iyorVAuhA0BsdGDoJEfxn9Xw
 7eMLekdv9t6WQqE6ugCgKp0r78Y75SUt2kavkU551EdMiSQnAWrSXJyNJwiNtydQnTjn
 o8cQ==
X-Gm-Message-State: AOAM532zTh47bSZyddsVe9spHsQ9chG2DigqaK3wcSfhafeAEOAdH8MS
 3BVvi69nLCmmcffFTkJX2dn1HjzW3zg=
X-Google-Smtp-Source: ABdhPJz7zUB8OGJmAbQmZuy35rS4x1GfPfcGXdDFH3BL1JDM02Jsr4sz4HSdciYec5l1mAQrZW7kYA==
X-Received: by 2002:a05:600c:6013:: with SMTP id
 az19mr130542wmb.53.1642761415145; 
 Fri, 21 Jan 2022 02:36:55 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 i15sm6791527wry.100.2022.01.21.02.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 02:36:54 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v4 6/8] drop libxml2 checks since libxml is not actually used
 (for parallels)
Date: Fri, 21 Jan 2022 11:36:21 +0100
Message-Id: <20220121103623.288054-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121103623.288054-1-f4bug@amsat.org>
References: <20220121103623.288054-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build                                     | 6 ------
 block/meson.build                               | 3 +--
 meson_options.txt                               | 2 --
 scripts/checkpatch.pl                           | 1 -
 scripts/ci/org.centos/stream/8/x86_64/configure | 1 -
 scripts/coverity-scan/coverity-scan.docker      | 1 -
 scripts/coverity-scan/run-coverity-scan         | 2 +-
 7 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/meson.build b/meson.build
index 333c61deba7..64a146e1d06 100644
--- a/meson.build
+++ b/meson.build
@@ -449,11 +449,6 @@
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
@@ -3489,7 +3484,6 @@
 summary_info += {'lzfse support':     liblzfse}
 summary_info += {'zstd support':      zstd}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
-summary_info += {'libxml2':           libxml2}
 summary_info += {'capstone':          capstone_opt == 'internal' ? capstone_opt : capstone}
 summary_info += {'libpmem support':   libpmem}
 summary_info += {'libdaxctl support': libdaxctl}
diff --git a/block/meson.build b/block/meson.build
index deb73ca389f..90dc9983e56 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -58,8 +58,7 @@
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
index 921967eddbb..95d527f7732 100644
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
index 5caa739db48..5e501110601 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -307,7 +307,6 @@ sub help {
 	qr{target_(?:u)?long},
 	qr{hwaddr},
         # external libraries
-	qr{xml${Ident}},
 	qr{xen\w+_handle},
 	# Glib definitions
 	qr{gchar},
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index e05f2fddcc2..9850dd44444 100755
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
index ecff6ac5b4b..6f60a52d231 100644
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
index 6d443250a9b..181bdcb2638 100755
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
-- 
2.34.1


