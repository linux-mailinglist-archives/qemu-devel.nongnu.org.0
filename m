Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DEA2ED173
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:11:18 +0100 (CET)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxW0T-0002k4-Kn
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqW-0003yN-Cm
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:01:01 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqQ-0006xq-29
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:58 -0500
Received: by mail-ej1-x635.google.com with SMTP id lt17so9848481ejb.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qP2nGPMj7ejX87GrrmtKQKOPPcyw21Ka8nzCNxMJ8kQ=;
 b=WOZn9t9VcThGHKdsNbKeVD0IGqpqy04H8PcPxWNyn93vw1h0J3YzZ3blVN+zi6ng74
 KO4zbkinELobhd7IYdkCe0oeNfmBP8Z+pdSeQdWHZ8dSt6VcCOdHS6fKRsWL+0jjQ6eP
 xPEc/hg5tksNYlVykIkqBgVvDeXJL0bBtkLRqPasf5vefq5hAl1G44UEorrie9gtZh3a
 T9IELQS0HbxLJnb5xJ1s5Y/7REpv77Xk1DA9eg2W0QBWweWzbxwwIlhdtl+/MeRpGaQo
 vL/XuUXjeeT2rCSbcRziytRLg4xuQ6i/S3Cj6qolHb0+stsoDA9T2Y7rcitCYy2yGAn3
 EpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qP2nGPMj7ejX87GrrmtKQKOPPcyw21Ka8nzCNxMJ8kQ=;
 b=iPr28/v5yfYWUlcjMxEYXfn7hqz7qCdicTMxPZruQ1Fh1wttJ/au5tXh4cOre2Bro9
 MzkKBVIUXI0wbuEw6sStO1wbY2VXDbwsxi2xaX5Ndlnqb9Q6nouxA7VdTrQ03a1U0u3y
 lbtHLnYwU001g5X2rD9hZVHYBz6OfvkTubGXH6NUJPr2dx+05bgwAGCVJ6XFK8NeBGYk
 65Of7v61S2P9BH30kIoQrHqV05Ncv5exkGRSt9Q+6emMlfXnkamgrKSTyQ1wluIZDgsk
 jIl4zN3pMNIe3d6g2e5DWifu6MCcGg0FztdnNrBdH6Jq5ydInq15HZ66neOgn3aMfi9t
 Lv4w==
X-Gm-Message-State: AOAM531oul6+rHmhHhbMzy37M2CYEpqpSnWlp2NZWAjJklSa9Ycg+svO
 evLr4krf1iDpLDNCy27OHq8RQhNfDJ9URQ==
X-Google-Smtp-Source: ABdhPJyQQzRPUMKsNN6116QU0Md9gB2P+FIhmw+qcmnuYV3VWAsLbDZu166vIHF4ceVWdl2f1UOs8A==
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr6621363ejj.105.1610028049676; 
 Thu, 07 Jan 2021 06:00:49 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oq27sm2438523ejb.108.2021.01.07.06.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 06:00:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] configure: automatically parse command line for meson -D
 options
Date: Thu,  7 Jan 2021 15:00:39 +0100
Message-Id: <20210107140039.467969-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107140039.467969-1-pbonzini@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, LONGWORDS=2.035,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now meson_options.txt lists almost 60 options.  Each option
needs code in configure to parse it and pass the option down to Meson as
a -D command-line argument; in addition the default must be duplicated
between configure and meson_options.txt.

This series tries to remove the code duplication by passing unknown
--enable and --disable options to a Perl program, and using Meson's
introspection support to match those to meson_options.txt.
About 80% of the options can be handled completely by the new
mechanism.  Five meson options are not of the --enable/--disable
kind.  Six more need to be parsed in configure for various reasons
documented in the patch, but they still have their help automatically
generated.

The advantages are simple to explain, and are basically what you
can expect from an introspection-based system:

- there is obviously much less code in configure.  About 1000 lines
  of the script deal with command line parsing, and the patch removes
  a quarter of them.

- the script is higher quality than the repetitive code in configure.
  Help is generally more complete and useful, for example it consistently
  lists defaults as well as the possible choices if they are not just
  enabled/disabled/auto.  Parsing is more consistent too, for example
  --enable-slirp and --enable-blobs were not supported.

- new Meson options do not need any change to the configure script.
  This increases the attractiveness of converting options from
  hand-crafted parsing and config-host.mak to Meson.

The disadvantages are:

- a few options change name: --enable-tcmalloc and --enable-jemalloc
  become --enable-malloc={tcmalloc,jemalloc}; --disable-blobs becomes
  --disable-install-blobs.

- because we need to run the script to generate the full help, we
  cannot rely on the user supplying the path to a Python interpreter
  with --python.  For this reason, the script is written in Perl.
  Perl 5 is universally available as "/usr/bin/env perl", while
  (even ignoring the Python 2/3 difference) some systems do not
  have a "python" or "python3" binary on the path.

- because we parse command-line options before meson is available,
  the introspection output is stored in the source tree.  This is
  the reason for the unattractive diffstat; the number of JSON lines
  added is higher than the number of configure lines removed.
  Of course the latter are code that must be maintained manually and
  the former is not.

Note that the output of "meson introspect --buildoptions" is massaged
slightly, in order to make it more stable and avoid horrible conflicts
on every modification to meson_options.txt.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                                |  11 +
 configure                               | 371 ++----------
 docs/devel/build-system.rst             |  49 +-
 meson-buildoptions.json                 | 717 ++++++++++++++++++++++++
 meson_options.txt                       |   9 +-
 scripts/configure-parse-buildoptions.pl | 205 +++++++
 6 files changed, 993 insertions(+), 369 deletions(-)
 create mode 100644 meson-buildoptions.json
 create mode 100755 scripts/configure-parse-buildoptions.pl

diff --git a/Makefile b/Makefile
index fb9923ff22..eca42f08d3 100644
--- a/Makefile
+++ b/Makefile
@@ -142,6 +142,17 @@ ifneq ($(MESON),)
 Makefile.mtest: build.ninja scripts/mtest2make.py
 	$(MESON) introspect --targets --tests --benchmarks | $(PYTHON) scripts/mtest2make.py > $@
 -include Makefile.mtest
+
+# python is used to keep the result stable
+.PHONY: update-buildoptions
+all update-buildoptions: $(SRC_PATH)/meson-buildoptions.json
+$(SRC_PATH)/meson-buildoptions.json: $(SRC_PATH)/meson_options.txt
+	$(MESON) introspect --buildoptions $(SRC_PATH)/meson.build | $(PYTHON) -c \
+	         'import json, sys; print( \
+	            json.dumps(sorted([x for x in json.loads(sys.stdin.read()) \
+	                               if x["section"] == "user"], \
+	                              key=lambda x: x["name"]), \
+	                       indent=2))' > $@
 endif
 
 # 4. Rules to bridge to other makefiles
diff --git a/configure b/configure
index 41866cc38e..64e19026f3 100755
--- a/configure
+++ b/configure
@@ -309,47 +309,19 @@ for opt do
   esac
 done
 
-brlapi="auto"
-curl="auto"
-iconv="auto"
-curses="auto"
-docs="auto"
-fdt="auto"
 netmap="no"
-sdl="auto"
-sdl_image="auto"
-virtiofsd="auto"
-virtfs="auto"
-libudev="auto"
-mpath="auto"
-vnc="enabled"
-sparse="auto"
 vde="$default_feature"
-vnc_sasl="auto"
-vnc_jpeg="auto"
-vnc_png="auto"
-xkbcommon="auto"
-xen="$default_feature"
 xen_ctrl_version="$default_feature"
-xen_pci_passthrough="auto"
 linux_aio="$default_feature"
 linux_io_uring="$default_feature"
-cap_ng="auto"
-attr="auto"
 xfs="$default_feature"
-tcg="enabled"
 membarrier="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
 vhost_scsi="$default_feature"
 vhost_vsock="$default_feature"
 vhost_user="no"
-vhost_user_blk_server="auto"
 vhost_user_fs="$default_feature"
-kvm="auto"
-hax="auto"
-hvf="auto"
-whpx="auto"
 rdma="$default_feature"
 pvrdma="$default_feature"
 gprof="no"
@@ -359,7 +331,6 @@ sanitizers="no"
 tsan="no"
 fortify_source="$default_feature"
 strip_opt="yes"
-tcg_interpreter="auto"
 bigendian="no"
 mingw32="no"
 gcov="no"
@@ -369,38 +340,27 @@ modules="no"
 module_upgrades="no"
 prefix="/usr/local"
 qemu_suffix="qemu"
-slirp="auto"
 oss_lib=""
 bsd="no"
 linux="no"
 solaris="no"
 profiler="no"
-cocoa="auto"
 softmmu="yes"
 linux_user="no"
 bsd_user="no"
-blobs="true"
 pkgversion=""
 pie=""
 qom_cast_debug="yes"
 trace_backends="log"
 trace_file="trace"
 spice="$default_feature"
-rbd="auto"
 smartcard="$default_feature"
-u2f="auto"
 libusb="$default_feature"
 usb_redir="$default_feature"
 opengl="$default_feature"
 opengl_dmabuf="no"
 cpuid_h="no"
 avx2_opt="$default_feature"
-capstone="auto"
-lzo="auto"
-snappy="auto"
-bzip2="auto"
-lzfse="auto"
-zstd="auto"
 guest_agent="$default_feature"
 guest_agent_with_vss="no"
 guest_agent_ntddscsi="no"
@@ -408,8 +368,6 @@ guest_agent_msi="$default_feature"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
-libiscsi="auto"
-libnfs="auto"
 coroutine=""
 coroutine_pool="$default_feature"
 debug_stack_usage="no"
@@ -418,7 +376,6 @@ cfi="false"
 cfi_debug="false"
 seccomp="auto"
 glusterfs="auto"
-gtk="auto"
 tls_priority="NORMAL"
 gnutls="$default_feature"
 nettle="$default_feature"
@@ -449,20 +406,32 @@ sheepdog="no"
 libxml2="$default_feature"
 debug_mutex="no"
 libpmem="$default_feature"
-default_devices="true"
 plugins="no"
 fuzzing="no"
 rng_none="no"
 secret_keyring="$default_feature"
 libdaxctl="$default_feature"
 meson=""
+meson_args=""
 ninja=""
 skip_meson=no
-gettext="auto"
-fuse="auto"
-fuse_lseek="auto"
 
-malloc_trim="auto"
+# The following Meson options are handled manually (still they
+# are included in the automatically generated help message)
+
+# 1. Change "git" to "internal"
+capstone="auto"
+fdt="auto"
+slirp="auto"
+
+# 2. Support --with/--without option
+default_devices="true"
+
+# 3. Automatically enable LTO
+cfi="false"
+
+# 4. Detection partly done in configure
+xen="$default_feature"
 
 # parse CC options second
 for opt do
@@ -993,42 +962,10 @@ for opt do
     # configure to be used by RPM and similar macros that set
     # lots of directory switches by default.
   ;;
-  --disable-sdl) sdl="disabled"
-  ;;
-  --enable-sdl) sdl="enabled"
-  ;;
-  --disable-sdl-image) sdl_image="disabled"
-  ;;
-  --enable-sdl-image) sdl_image="enabled"
-  ;;
   --disable-qom-cast-debug) qom_cast_debug="no"
   ;;
   --enable-qom-cast-debug) qom_cast_debug="yes"
   ;;
-  --disable-virtfs) virtfs="disabled"
-  ;;
-  --enable-virtfs) virtfs="enabled"
-  ;;
-  --disable-libudev) libudev="disabled"
-  ;;
-  --enable-libudev) libudev="enabled"
-  ;;
-  --disable-virtiofsd) virtiofsd="disabled"
-  ;;
-  --enable-virtiofsd) virtiofsd="enabled"
-  ;;
-  --disable-mpath) mpath="disabled"
-  ;;
-  --enable-mpath) mpath="enabled"
-  ;;
-  --disable-vnc) vnc="disabled"
-  ;;
-  --enable-vnc) vnc="enabled"
-  ;;
-  --disable-gettext) gettext="disabled"
-  ;;
-  --enable-gettext) gettext="enabled"
-  ;;
   --oss-lib=*) oss_lib="$optarg"
   ;;
   --audio-drv-list=*) audio_drv_list="$optarg"
@@ -1057,24 +994,8 @@ for opt do
   ;;
   --disable-tsan) tsan="no"
   ;;
-  --enable-sparse) sparse="enabled"
-  ;;
-  --disable-sparse) sparse="disabled"
-  ;;
   --disable-strip) strip_opt="no"
   ;;
-  --disable-vnc-sasl) vnc_sasl="disabled"
-  ;;
-  --enable-vnc-sasl) vnc_sasl="enabled"
-  ;;
-  --disable-vnc-jpeg) vnc_jpeg="disabled"
-  ;;
-  --enable-vnc-jpeg) vnc_jpeg="enabled"
-  ;;
-  --disable-vnc-png) vnc_png="disabled"
-  ;;
-  --enable-vnc-png) vnc_png="enabled"
-  ;;
   --disable-slirp) slirp="disabled"
   ;;
   --enable-slirp) slirp="enabled"
@@ -1095,64 +1016,12 @@ for opt do
   ;;
   --enable-xen) xen="enabled"
   ;;
-  --disable-xen-pci-passthrough) xen_pci_passthrough="disabled"
-  ;;
-  --enable-xen-pci-passthrough) xen_pci_passthrough="enabled"
-  ;;
-  --disable-brlapi) brlapi="disabled"
-  ;;
-  --enable-brlapi) brlapi="enabled"
-  ;;
-  --disable-kvm) kvm="disabled"
-  ;;
-  --enable-kvm) kvm="enabled"
-  ;;
-  --disable-hax) hax="disabled"
-  ;;
-  --enable-hax) hax="enabled"
-  ;;
-  --disable-hvf) hvf="disabled"
-  ;;
-  --enable-hvf) hvf="enabled"
-  ;;
-  --disable-whpx) whpx="disabled"
-  ;;
-  --enable-whpx) whpx="enabled"
-  ;;
-  --disable-tcg-interpreter) tcg_interpreter="disabled"
-  ;;
-  --enable-tcg-interpreter) tcg_interpreter="enabled"
-  ;;
-  --disable-cap-ng)  cap_ng="disabled"
-  ;;
-  --enable-cap-ng) cap_ng="enabled"
-  ;;
-  --disable-tcg) tcg="disabled"
-  ;;
-  --enable-tcg) tcg="enabled"
-  ;;
-  --disable-malloc-trim) malloc_trim="disabled"
-  ;;
-  --enable-malloc-trim) malloc_trim="enabled"
-  ;;
   --disable-spice) spice="no"
   ;;
   --enable-spice) spice="yes"
   ;;
-  --disable-libiscsi) libiscsi="disabled"
-  ;;
-  --enable-libiscsi) libiscsi="enabled"
-  ;;
-  --disable-libnfs) libnfs="disabled"
-  ;;
-  --enable-libnfs) libnfs="enabled"
-  ;;
   --enable-profiler) profiler="yes"
   ;;
-  --disable-cocoa) cocoa="disabled"
-  ;;
-  --enable-cocoa) cocoa="enabled"
-  ;;
   --disable-system) softmmu="no"
   ;;
   --enable-system) softmmu="yes"
@@ -1196,22 +1065,6 @@ for opt do
   ;;
   --disable-cfi) cfi="false"
   ;;
-  --enable-cfi-debug) cfi_debug="true"
-  ;;
-  --disable-cfi-debug) cfi_debug="false"
-  ;;
-  --disable-curses) curses="disabled"
-  ;;
-  --enable-curses) curses="enabled"
-  ;;
-  --disable-iconv) iconv="disabled"
-  ;;
-  --enable-iconv) iconv="enabled"
-  ;;
-  --disable-curl) curl="disabled"
-  ;;
-  --enable-curl) curl="enabled"
-  ;;
   --disable-fdt) fdt="disabled"
   ;;
   --enable-fdt) fdt="enabled"
@@ -1228,16 +1081,10 @@ for opt do
   ;;
   --enable-linux-io-uring) linux_io_uring="yes"
   ;;
-  --disable-attr) attr="disabled"
-  ;;
-  --enable-attr) attr="enabled"
-  ;;
   --disable-membarrier) membarrier="no"
   ;;
   --enable-membarrier) membarrier="yes"
   ;;
-  --disable-blobs) blobs="false"
-  ;;
   --with-pkgversion=*) pkgversion="$optarg"
   ;;
   --with-coroutine=*) coroutine="$optarg"
@@ -1252,10 +1099,6 @@ for opt do
   ;;
   --disable-crypto-afalg) crypto_afalg="no"
   ;;
-  --disable-docs) docs="disabled"
-  ;;
-  --enable-docs) docs="enabled"
-  ;;
   --disable-vhost-net) vhost_net="no"
   ;;
   --enable-vhost-net) vhost_net="yes"
@@ -1272,10 +1115,6 @@ for opt do
   ;;
   --enable-vhost-vsock) vhost_vsock="yes"
   ;;
-  --disable-vhost-user-blk-server) vhost_user_blk_server="disabled"
-  ;;
-  --enable-vhost-user-blk-server) vhost_user_blk_server="enabled"
-  ;;
   --disable-vhost-user-fs) vhost_user_fs="no"
   ;;
   --enable-vhost-user-fs) vhost_user_fs="yes"
@@ -1284,10 +1123,6 @@ for opt do
   ;;
   --enable-opengl) opengl="yes"
   ;;
-  --disable-rbd) rbd="disabled"
-  ;;
-  --enable-rbd) rbd="enabled"
-  ;;
   --disable-xfsctl) xfs="no"
   ;;
   --enable-xfsctl) xfs="yes"
@@ -1296,10 +1131,6 @@ for opt do
   ;;
   --enable-smartcard) smartcard="yes"
   ;;
-  --disable-u2f) u2f="disabled"
-  ;;
-  --enable-u2f) u2f="enabled"
-  ;;
   --disable-libusb) libusb="no"
   ;;
   --enable-libusb) libusb="yes"
@@ -1310,26 +1141,6 @@ for opt do
   ;;
   --disable-zlib-test)
   ;;
-  --disable-lzo) lzo="disabled"
-  ;;
-  --enable-lzo) lzo="enabled"
-  ;;
-  --disable-snappy) snappy="disabled"
-  ;;
-  --enable-snappy) snappy="enabled"
-  ;;
-  --disable-bzip2) bzip2="disabled"
-  ;;
-  --enable-bzip2) bzip2="enabled"
-  ;;
-  --enable-lzfse) lzfse="enabled"
-  ;;
-  --disable-lzfse) lzfse="disabled"
-  ;;
-  --disable-zstd) zstd="disabled"
-  ;;
-  --enable-zstd) zstd="enabled"
-  ;;
   --enable-guest-agent) guest_agent="yes"
   ;;
   --disable-guest-agent) guest_agent="no"
@@ -1354,12 +1165,6 @@ for opt do
   ;;
   --disable-tools) want_tools="no"
   ;;
-  --enable-seccomp) seccomp="enabled"
-  ;;
-  --disable-seccomp) seccomp="disabled"
-  ;;
-  --disable-glusterfs) glusterfs="disabled"
-  ;;
   --disable-avx2) avx2_opt="no"
   ;;
   --enable-avx2) avx2_opt="yes"
@@ -1368,9 +1173,6 @@ for opt do
   ;;
   --enable-avx512f) avx512f_opt="yes"
   ;;
-
-  --enable-glusterfs) glusterfs="enabled"
-  ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
       echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
   ;;
@@ -1380,10 +1182,6 @@ for opt do
   --enable-uuid|--disable-uuid)
       echo "$0: $opt is obsolete, UUID support is always built" >&2
   ;;
-  --disable-gtk) gtk="disabled"
-  ;;
-  --enable-gtk) gtk="enabled"
-  ;;
   --tls-priority=*) tls_priority="$optarg"
   ;;
   --disable-gnutls) gnutls="no"
@@ -1438,14 +1236,6 @@ for opt do
   ;;
   --enable-libxml2) libxml2="yes"
   ;;
-  --disable-tcmalloc) tcmalloc="no"
-  ;;
-  --enable-tcmalloc) tcmalloc="yes"
-  ;;
-  --disable-jemalloc) jemalloc="no"
-  ;;
-  --enable-jemalloc) jemalloc="yes"
-  ;;
   --disable-replication) replication="no"
   ;;
   --enable-replication) replication="yes"
@@ -1520,10 +1310,6 @@ for opt do
   ;;
   --disable-libpmem) libpmem=no
   ;;
-  --enable-xkbcommon) xkbcommon="enabled"
-  ;;
-  --disable-xkbcommon) xkbcommon="disabled"
-  ;;
   --enable-plugins) plugins="yes"
   ;;
   --disable-plugins) plugins="no"
@@ -1550,13 +1336,8 @@ for opt do
   ;;
   --disable-libdaxctl) libdaxctl=no
   ;;
-  --enable-fuse) fuse="enabled"
-  ;;
-  --disable-fuse) fuse="disabled"
-  ;;
-  --enable-fuse-lseek) fuse_lseek="enabled"
-  ;;
-  --disable-fuse-lseek) fuse_lseek="disabled"
+  --enable-* | --disable-*)
+      meson_args="$meson_args $(quote_sh "$opt")"
   ;;
   *)
       echo "ERROR: unknown option $opt"
@@ -1566,6 +1347,15 @@ for opt do
   esac
 done
 
+# Convert unknown --enable/--disable arguments to Meson build options.
+meson_options=$(eval \
+    perl \$source_path/scripts/configure-parse-buildoptions.pl \
+         \< \$source_path/meson-buildoptions.json $meson_args)
+if test $? = 1; then
+    echo "Try '$0 --help' for more information"
+    exit 1
+fi
+
 libdir="${libdir:-$prefix/lib}"
 libexecdir="${libexecdir:-$prefix/libexec}"
 includedir="${includedir:-$prefix/include}"
@@ -1752,15 +1542,11 @@ Advanced options (experts only):
                            Available backends: $trace_backend_list
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
-  --disable-slirp          disable SLIRP userspace network connectivity
-  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
-  --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
-  --disable-blobs          disable installing provided firmware blobs
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
   --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
   --tls-priority           default TLS protocol/cipher priority string
@@ -1772,16 +1558,13 @@ Advanced options (experts only):
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
   --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
-
-Optional features, enabled with --enable-FEATURE and
-disabled with --disable-FEATURE, default is enabled if available
-(unless built with --without-default-features):
-
+EOF
+  perl $source_path/scripts/configure-parse-buildoptions.pl --print-help < $source_path/meson-buildoptions.json
+cat << EOF
   system          all system emulation targets
   user            supported user emulation targets
   linux-user      all linux usermode emulation targets
   bsd-user        all BSD usermode emulation targets
-  docs            build documentation
   guest-agent     build the QEMU Guest Agent
   guest-agent-msi build guest agent Windows MSI installation package
   pie             Position Independent Executables
@@ -1793,84 +1576,35 @@ disabled with --disable-FEATURE, default is enabled if available
   sparse          sparse checker
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
-  cfi             Enable Control-Flow Integrity for indirect function calls.
-                  In case of a cfi violation, QEMU is terminated with SIGILL
-                  Depends on lto and is incompatible with modules
-                  Automatically enables Link-Time Optimization (lto)
-  cfi-debug       In case of a cfi violation, a message containing the line that
-                  triggered the error is written to stderr. After the error,
-                  QEMU is still terminated with SIGILL
   gnutls          GNUTLS cryptography support
   nettle          nettle cryptography support
   gcrypt          libgcrypt cryptography support
   auth-pam        PAM access control
-  sdl             SDL UI
-  sdl-image       SDL Image support for icons
-  gtk             gtk UI
   vte             vte support for the gtk UI
-  curses          curses UI
-  iconv           font glyph conversion support
-  vnc             VNC UI support
-  vnc-sasl        SASL encryption for VNC server
-  vnc-jpeg        JPEG lossy compression for VNC server
-  vnc-png         PNG compression for VNC server
-  cocoa           Cocoa UI (Mac OS X only)
-  virtfs          VirtFS
-  virtiofsd       build virtiofs daemon (virtiofsd)
-  libudev         Use libudev to enumerate host devices
-  mpath           Multipath persistent reservation passthrough
-  xen             xen backend driver support
-  xen-pci-passthrough    PCI passthrough support for Xen
-  brlapi          BrlAPI (Braile)
-  curl            curl connectivity
   membarrier      membarrier system call (for Linux 4.14+ or Windows)
-  fdt             fdt device tree
-  kvm             KVM acceleration support
-  hax             HAX acceleration support
-  hvf             Hypervisor.framework acceleration support
-  whpx            Windows Hypervisor Platform acceleration support
   rdma            Enable RDMA-based migration
   pvrdma          Enable PVRDMA support
   vde             support for vde network
   netmap          support for netmap network
   linux-aio       Linux AIO support
   linux-io-uring  Linux io_uring support
-  cap-ng          libcap-ng support
-  attr            attr and xattr support
   vhost-net       vhost-net kernel acceleration support
   vhost-vsock     virtio sockets device support
   vhost-scsi      vhost-scsi kernel target support
   vhost-crypto    vhost-user-crypto backend support
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
-  vhost-user-blk-server    vhost-user-blk server support
   vhost-vdpa      vhost-vdpa kernel backend support
   spice           spice
-  rbd             rados block device (rbd)
-  libiscsi        iscsi support
-  libnfs          nfs support
   smartcard       smartcard support (libcacard)
-  u2f             U2F support (u2f-emu)
   libusb          libusb (for usb passthrough)
   live-block-migration   Block migration in the main migration stream
   usb-redir       usb network redirection support
-  lzo             support of lzo compression library
-  snappy          support of snappy compression library
-  bzip2           support of bzip2 compression library
-                  (for reading bzip2-compressed dmg images)
-  lzfse           support of lzfse compression library
-                  (for reading lzfse-compressed dmg images)
-  zstd            support for zstd compression library
-                  (for migration compression and qcow2 cluster compression)
-  seccomp         seccomp support
   coroutine-pool  coroutine freelist (better performance)
-  glusterfs       GlusterFS backend
   tpm             TPM support
   libssh          ssh block device support
   numa            libnuma support
   libxml2         for Parallels image format
-  tcmalloc        tcmalloc support
-  jemalloc        jemalloc support
   avx2            AVX2 optimization support
   avx512f         AVX512F optimization support
   replication     replication support
@@ -1889,14 +1623,10 @@ disabled with --disable-FEATURE, default is enabled if available
   parallels       parallels image format support
   sheepdog        sheepdog block driver support (deprecated)
   crypto-afalg    Linux AF_ALG crypto backend driver
-  capstone        capstone disassembler support
   debug-mutex     mutex debugging support
   libpmem         libpmem support
-  xkbcommon       xkbcommon support
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   libdaxctl       libdaxctl support
-  fuse            FUSE block device export
-  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -3725,16 +3455,6 @@ EOF
   fi
 fi
 
-malloc=system
-if test "$tcmalloc" = "yes" && test "$jemalloc" = "yes" ; then
-    echo "ERROR: tcmalloc && jemalloc can't be used at the same time"
-    exit 1
-elif test "$tcmalloc" = "yes" ; then
-    malloc=tcmalloc
-elif test "$jemalloc" = "yes" ; then
-    malloc=jemalloc
-fi
-
 ##########################################
 # signalfd probe
 signalfd="no"
@@ -6413,7 +6133,8 @@ fi
 mv $cross config-meson.cross
 
 rm -rf meson-private meson-info meson-logs
-NINJA=$ninja $meson setup \
+run_meson() {
+  NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --libdir "$libdir" \
         --libexecdir "$libexecdir" \
@@ -6427,32 +6148,20 @@ NINJA=$ninja $meson setup \
         -Ddocdir="$docdir" \
         -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
+        -Dsphinx_build="$sphinx_build" \
         -Doptimization=$(if test "$debug" = yes; then echo 0; else echo 2; fi) \
         -Ddebug=$(if test "$debug_info" = yes; then echo true; else echo false; fi) \
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
         -Dstrip=$(if test "$strip_opt" = yes; then echo true; else echo false; fi) \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
-        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
-        -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
-        -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
-        -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
-        -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
-        -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
-        -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
-        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
-        -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
-        -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
-        -Dattr=$attr -Ddefault_devices=$default_devices \
-        -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
-        -Dvhost_user_blk_server=$vhost_user_blk_server \
-        -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
+        -Db_lto=$lto -Dcfi=$cfi \
+        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
+        -Ddefault_devices=$default_devices -Dxen=$xen \
         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
-        $cross_arg \
-        "$PWD" "$source_path"
-
+        "$@" $cross_arg "$PWD" "$source_path"
+}
+eval run_meson $meson_options
 if test "$?" -ne 0 ; then
     error_exit "meson setup failed"
 fi
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 31f4dced2a..3ada0b878e 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -42,22 +42,17 @@ perform a build:
      ../configure
      make
 
-For now, checks on the compilation environment are found in configure
-rather than meson.build, though this is expected to change.  The command
-line is parsed in the configure script and, whenever needed, converted
-into the appropriate options to Meson.
+Many checks on the compilation environment are still found in configure
+rather than `meson.build`, but new checks should be added directly to
+`meson.build`.  The configure script automatically recognizes
+command line options for which a same-named Meson option exists;
+dashes in the command line are replaced with underscores.
 
 New checks should be added to Meson, which usually comprises the
 following tasks:
 
  - Add a Meson build option to meson_options.txt.
 
- - Add support to the command line arg parser to handle any new
-   `--enable-XXX`/`--disable-XXX` flags required by the feature.
-
- - Add information to the help output message to report on the new
-   feature flag.
-
  - Add code to perform the actual feature check.
 
  - Add code to include the feature status in `config-host.h`
@@ -66,36 +61,13 @@ following tasks:
    upon completion.
 
 
-Taking the probe for SDL2_Image as an example, we have the following pieces
-in configure::
-
-  # Initial variable state
-  sdl_image=auto
-
-  ..snip..
-
-  # Configure flag processing
-  --disable-sdl-image) sdl_image=disabled
-  ;;
-  --enable-sdl-image) sdl_image=enabled
-  ;;
-
-  ..snip..
-
-  # Help output feature message
-  sdl-image         SDL Image support for icons
-
-  ..snip..
-
-  # Meson invocation
-  -Dsdl_image=$sdl_image
-
-In meson_options.txt::
+Taking the probe for SDL2_Image as an example, we have the following
+in ``meson_options.txt``::
 
-  option('sdl', type : 'feature', value : 'auto',
+  option('sdl_image', type : 'feature', value : 'auto',
          description: 'SDL Image support for icons')
 
-In meson.build::
+And the detection code in ``meson.build``::
 
   # Detect dependency
   sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
@@ -108,6 +80,9 @@ In meson.build::
   # Summary
   summary_info += {'SDL image support': sdl_image.found()}
 
+For the configure script to parse the option, the ``meson-buildoptions.json``
+file in the root source directory must be up-to-date; ``make
+update-buildoptions`` (or just `make`) will take care of updating it.
 
 
 Helper functions
diff --git a/meson-buildoptions.json b/meson-buildoptions.json
new file mode 100644
index 0000000000..8e245e0d79
--- /dev/null
+++ b/meson-buildoptions.json
@@ -0,0 +1,717 @@
+[
+  {
+    "name": "attr",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "attr/xattr support"
+  },
+  {
+    "name": "brlapi",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "brlapi character device driver"
+  },
+  {
+    "name": "bzip2",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "bzip2 support for DMG images"
+  },
+  {
+    "name": "cap_ng",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "cap_ng support"
+  },
+  {
+    "name": "capstone",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "disabled",
+      "enabled",
+      "auto",
+      "system",
+      "internal"
+    ],
+    "type": "combo",
+    "description": "Whether and how to find the capstone library"
+  },
+  {
+    "name": "cfi",
+    "value": false,
+    "section": "user",
+    "machine": "any",
+    "type": "boolean",
+    "description": "Control-Flow Integrity (CFI)"
+  },
+  {
+    "name": "cfi_debug",
+    "value": false,
+    "section": "user",
+    "machine": "any",
+    "type": "boolean",
+    "description": "Verbose errors in case of CFI violation"
+  },
+  {
+    "name": "cocoa",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "Cocoa user interface (macOS only)"
+  },
+  {
+    "name": "curl",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "CURL block device driver"
+  },
+  {
+    "name": "curses",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "curses UI"
+  },
+  {
+    "name": "default_devices",
+    "value": true,
+    "section": "user",
+    "machine": "any",
+    "type": "boolean",
+    "description": "Include a default selection of devices in emulators"
+  },
+  {
+    "name": "docdir",
+    "value": "doc",
+    "section": "user",
+    "machine": "any",
+    "type": "string",
+    "description": "Base directory for documentation installation (can be empty)"
+  },
+  {
+    "name": "docs",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "Documentations build support"
+  },
+  {
+    "name": "fdt",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "disabled",
+      "enabled",
+      "auto",
+      "system",
+      "internal"
+    ],
+    "type": "combo",
+    "description": "Whether and how to find the libfdt library"
+  },
+  {
+    "name": "fuse",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "FUSE block device export"
+  },
+  {
+    "name": "fuse_lseek",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "SEEK_HOLE/SEEK_DATA support for FUSE exports"
+  },
+  {
+    "name": "gettext",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "Localization of the GTK+ user interface"
+  },
+  {
+    "name": "glusterfs",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "Glusterfs block device driver"
+  },
+  {
+    "name": "gtk",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "GTK+ user interface"
+  },
+  {
+    "name": "hax",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "HAX acceleration support"
+  },
+  {
+    "name": "hvf",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "HVF acceleration support"
+  },
+  {
+    "name": "iconv",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "Font glyph conversion support"
+  },
+  {
+    "name": "install_blobs",
+    "value": true,
+    "section": "user",
+    "machine": "any",
+    "type": "boolean",
+    "description": "install provided firmware blobs"
+  },
+  {
+    "name": "kvm",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "KVM acceleration support"
+  },
+  {
+    "name": "libiscsi",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "libiscsi userspace initiator"
+  },
+  {
+    "name": "libnfs",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "libnfs block device driver"
+  },
+  {
+    "name": "libslirp:version_suffix",
+    "value": "",
+    "section": "user",
+    "machine": "any",
+    "type": "string",
+    "description": "Suffix to append to SLIRP_VERSION_STRING"
+  },
+  {
+    "name": "libudev",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "Use libudev to enumerate host devices"
+  },
+  {
+    "name": "lzfse",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "lzfse support for DMG images"
+  },
+  {
+    "name": "lzo",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "lzo compression support"
+  },
+  {
+    "name": "malloc",
+    "value": "system",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "system",
+      "tcmalloc",
+      "jemalloc"
+    ],
+    "type": "combo",
+    "description": "choose memory allocator to use"
+  },
+  {
+    "name": "malloc_trim",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "enable libc malloc_trim() for memory optimization"
+  },
+  {
+    "name": "mpath",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "Multipath persistent reservation passthrough"
+  },
+  {
+    "name": "qemu_firmwarepath",
+    "value": "",
+    "section": "user",
+    "machine": "any",
+    "type": "string",
+    "description": "search PATH for firmware files"
+  },
+  {
+    "name": "qemu_suffix",
+    "value": "qemu",
+    "section": "user",
+    "machine": "any",
+    "type": "string",
+    "description": "Suffix for QEMU data/modules/config directories (can be empty)"
+  },
+  {
+    "name": "rbd",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "Ceph block device driver"
+  },
+  {
+    "name": "sdl",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "SDL user interface"
+  },
+  {
+    "name": "sdl_image",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "SDL Image support for icons"
+  },
+  {
+    "name": "seccomp",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "seccomp support"
+  },
+  {
+    "name": "slirp",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "disabled",
+      "enabled",
+      "auto",
+      "system",
+      "internal"
+    ],
+    "type": "combo",
+    "description": "Whether and how to find the slirp library"
+  },
+  {
+    "name": "snappy",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "snappy compression support"
+  },
+  {
+    "name": "sparse",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "sparse checker"
+  },
+  {
+    "name": "sphinx_build",
+    "value": "",
+    "section": "user",
+    "machine": "any",
+    "type": "string",
+    "description": "Use specified sphinx-build [$sphinx_build] for building document (default to be empty)"
+  },
+  {
+    "name": "tcg",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "TCG support"
+  },
+  {
+    "name": "tcg_interpreter",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "TCG bytecode interpreter (TCI)"
+  },
+  {
+    "name": "u2f",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "U2F emulation support"
+  },
+  {
+    "name": "vhost_user_blk_server",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "build vhost-user-blk server"
+  },
+  {
+    "name": "virtfs",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "virtio-9p support"
+  },
+  {
+    "name": "virtiofsd",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "build virtiofs daemon (virtiofsd)"
+  },
+  {
+    "name": "vnc",
+    "value": "enabled",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "VNC server"
+  },
+  {
+    "name": "vnc_jpeg",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "JPEG lossy compression for VNC server"
+  },
+  {
+    "name": "vnc_png",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "PNG compression for VNC server"
+  },
+  {
+    "name": "vnc_sasl",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "SASL authentication for VNC server"
+  },
+  {
+    "name": "whpx",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "WHPX acceleration support"
+  },
+  {
+    "name": "xen",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "Xen backend support"
+  },
+  {
+    "name": "xen_pci_passthrough",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "Xen PCI passthrough support"
+  },
+  {
+    "name": "xkbcommon",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "xkbcommon support"
+  },
+  {
+    "name": "zstd",
+    "value": "auto",
+    "section": "user",
+    "machine": "any",
+    "choices": [
+      "enabled",
+      "disabled",
+      "auto"
+    ],
+    "type": "combo",
+    "description": "zstd compression support"
+  }
+]
diff --git a/meson_options.txt b/meson_options.txt
index b9b106675f..08d02498ac 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -1,3 +1,7 @@
+# These options do not correspond to a --enable/--disable-* option
+# on the configure script command line.  If you add more, list them in
+# scripts/configure-parse-buildoptions.pl's SKIP_OPTIONS constant too.
+
 option('qemu_suffix', type : 'string', value: 'qemu',
        description: 'Suffix for QEMU data/modules/config directories (can be empty)')
 option('docdir', type : 'string', value : 'doc',
@@ -6,9 +10,12 @@ option('qemu_firmwarepath', type : 'string', value : '',
        description: 'search PATH for firmware files')
 option('sphinx_build', type : 'string', value : '',
        description: 'Use specified sphinx-build [$sphinx_build] for building document (default to be empty)')
-
 option('default_devices', type : 'boolean', value : true,
        description: 'Include a default selection of devices in emulators')
+
+# Everything else can be set via --enable/--disable-* option
+# on the configure script command line.
+
 option('docs', type : 'feature', value : 'auto',
        description: 'Documentations build support')
 option('gettext', type : 'feature', value : 'auto',
diff --git a/scripts/configure-parse-buildoptions.pl b/scripts/configure-parse-buildoptions.pl
new file mode 100755
index 0000000000..33402b0583
--- /dev/null
+++ b/scripts/configure-parse-buildoptions.pl
@@ -0,0 +1,205 @@
+#! /usr/bin/env perl
+
+# Parse configure command line options based on Meson's user build options
+# introspection data (passed on stdin).
+#
+# Copyright (C) 2021 Red Hat, Inc.
+#
+# Author: Paolo Bonzini <pbonzini@redhat.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2, or (at your option)
+# any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <https://www.gnu.org/licenses/>.
+
+use warnings FATAL => 'all';
+use strict;
+use JSON::PP;
+
+# Meson options that do not correspond to a --enable/--disable option
+# in configure
+use constant SKIP_OPTIONS => ('docdir', 'qemu_firmwarepath', 'sphinx_build', 'qemu_suffix',
+                              'default_devices');
+
+use constant FEATURE_CHOICES => 'auto/disabled/enabled';
+use constant LINE_WIDTH => 74;
+
+# Convert the default value of an option to the string used in
+# the help message
+sub value_to_help ($)
+{
+  my ($value) = @_;
+  return $value if not JSON::PP::is_bool($value);
+  return $value ? 'enabled' : 'disabled';
+}
+
+# Print an entry of a two-column table, wrapping the text
+# to LINE_WIDTH characters.
+sub wrap($$$)
+{
+  my ($left, $text, $indent) = @_;
+  my $length = LINE_WIDTH - $indent;
+  my $line_re = qr/^(\s*) (.{1,$length}|\S+?) (?=\s|$)/x;
+  my $spaces = ' ' x $indent;
+
+  if (length ($left) >= $indent) {
+    print "$left\n";
+    $left = $spaces;
+  } else {
+    $left = substr ($left . $spaces, 0, $indent);
+}
+  while ($text =~ $line_re) {
+    print "$left$2\n";
+    $text = substr($text, (length $1) + (length $2));
+    $left = $spaces;
+  }
+}
+
+sub choices($)
+{
+  my ($opt) = @_;
+  my $choices = $opt->{'choices'};
+  return join('/', sort @$choices);
+}
+
+# Print the help for the option dictionary in the second argument.
+# The first argument is the left column in the table, the third
+# is the width of the first column.
+sub print_help_line($$$)
+{
+  my ($left, $opt, $indent) = @_;
+  my $help = value_to_help($opt->{'value'});
+  my $value = $opt->{'description'} . " [$help]";
+
+  $left =~ s/_/-/g;
+  wrap("  $left", $value, $indent);
+  if ($opt->{'type'} eq 'combo') {
+    my $list = choices($opt);
+    wrap('', "(choices: $list)", $indent)
+      if $list ne FEATURE_CHOICES;
+  }
+}
+
+# Return whether the option (a dictionary) can be used without
+# arguments.  Booleans can always be used without arguments;
+# combos allow no argument only if "enabled" and "disabled"
+# are valid values.
+sub allow_no_arg($)
+{
+  my ($opt) = @_;
+  return 1 if $opt->{'type'} eq 'boolean';
+  return 0 if $opt->{'type'} ne 'combo';
+
+  my $choices = $opt->{'choices'};
+  return (grep {$_ eq 'enabled'} @$choices) &&
+         (grep {$_ eq 'disabled'} @$choices);
+}
+
+# Return whether the option (a dictionary) can be used with
+# arguments.  Booleans can never be used without arguments;
+# combos allow an argument only if they accept other values
+# than "auto", "enabled", and "disabled".
+sub allow_arg($)
+{
+  my ($opt) = @_;
+  return 0 if $opt->{'type'} eq 'boolean';
+  return 1 if $opt->{'type'} ne 'combo';
+  return choices($opt) ne FEATURE_CHOICES;
+}
+
+sub print_help(%)
+{
+  my (%options) = @_;
+  # The first section includes options that have an arguments,
+  # and booleans (i.e., only one of enable/disable makes sense)
+  foreach my $opt (sort keys %options) {
+    my $item = $options{$opt};
+    my $left;
+    next if allow_no_arg($item) and $item->{'type'} ne 'boolean';
+
+    if ($item->{'type'} eq 'boolean') {
+      $left = $item->{'value'} ? "--disable-$opt" : "--enable-$opt";
+    } else {
+      $left = "--enable-$opt=CHOICE";
+    }
+    print_help_line($left, $item, 27);
+  }
+  print("\n");
+  print("Optional features, enabled with --enable-FEATURE and\n");
+  print("disabled with --disable-FEATURE:\n");
+
+  foreach my $opt (sort keys %options) {
+    my $item = $options{$opt};
+    print_help_line($opt, $item, 18)
+      if allow_no_arg($item);
+  }
+  exit 0;
+}
+
+sub error($)
+{
+  my ($msg) = @_;
+  print STDERR "ERROR: $msg\n";
+  exit 1;
+}
+
+sub shell_quote($)
+{
+  my ($word) = @_;
+  $word =~ s/'/'\\''/g;
+  return "'$word'";
+}
+
+
+# Read Meson introspection data and convert it to a dictionary
+
+my $input = do { local $/; <STDIN> };
+my $json = decode_json $input;
+my %options = ();
+
+foreach my $item (@$json) {
+  next if $item->{'section'} ne 'user';
+  next if $item->{'name'} =~ /:/;
+  next if grep {$_ eq $item->{'name'}} SKIP_OPTIONS;
+  $options{$item->{'name'}} = $item;
+}
+
+exit if ! @ARGV;
+print_help(%options) if ($ARGV[0] eq '--print-help');
+
+my @args = ();
+foreach my $arg (@ARGV) {
+  my ($before, $opt, $value) = $arg =~ /--(enable|disable)-([^=]*)(?:=(.*))?/;
+  die "internal error parsing command line"
+    if ! defined $before ;
+  my ($key, $option);
+
+  $key = $opt;
+  $key =~ s/-/_/g;
+  $option = $options{$key};
+  error("Unknown option --$before-$opt")
+    if ! defined $option || ($before eq 'disable' && ! allow_no_arg ($option));
+
+  if (! defined $value) {
+    error("option --$before-$opt requires an argument")
+      if (! allow_no_arg ($option));
+    if ($option->{'type'} eq 'combo') {
+      $value = "${before}d";
+    } else {
+      $value = $before eq 'enable' ? 'true' : 'false';
+    }
+  } else {
+    error("option --$before-$opt does not take an argument")
+      if ($before eq 'disable' || ! allow_arg ($option));
+  }
+  push @args, shell_quote("-D$key=$value");
+}
+print join(' ', @args);
-- 
2.29.2


