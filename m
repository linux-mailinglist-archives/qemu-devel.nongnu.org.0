Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8635442A42F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:17:02 +0200 (CEST)
Received: from localhost ([::1]:46966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGiK-0002N0-00
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFir-00011X-ED
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:29 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFim-0007bT-QC
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:28 -0400
Received: by mail-ed1-x533.google.com with SMTP id w19so19750435edd.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iiQz9Qf03wLCY+gATn/L/RznjhG5KiQ4F67KjCAHknY=;
 b=f5Em4+AmbZBWHLQbNJCjYcEvU22e3FY9rqMOHNG0l06ohs9LAWkrkPEogFomuzpbnt
 Pcbg7CCqa/BzPWFL1AllaUodstpSiLVQMwFXsFRdnAAjbrzfBRQvFdgx2t0AHunJHPuW
 7/TPdQaOVHM2q6EFeqsc0wNfJajqNAU073mcAN5jvYWox5zY1YUjg41TSki6/uPs5ug4
 m5MZvkpwAZZ3bzJ5bVgCKBrmKQrr6KT53meg8ARkh12EnntkkU498Pt0simCSfI1J+8a
 Wd7D0VUZpJmEdZaJFdwp5NziSnOfFqBod45LvXaCh1NObuZ/fVhzL8levNYp6FQipaKZ
 LZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iiQz9Qf03wLCY+gATn/L/RznjhG5KiQ4F67KjCAHknY=;
 b=jrrlhiUGa4wbjB8NipdE9isdf5KOD8SLEapdhyUpu9vaqUvAt8XegaKrMS70WY/BdY
 RyrLpuU1Us5eVNO2HD0ZxyQ3pl/GUWU9lYsOfIk70JYKKo5LB5qcA3RTWtdIyu8zrrtB
 crs/koHTznxgGUosixjggdjfG833NTOSPo2EG16+KnDzjuagqTEJrjONp0ZTQDFG6s7c
 kWHX4wykTWwYPYk1kyFXjgIAdbChMXbfhvfIkeC3u4aER5JOdtbJhgwMRfnXRYPigL+z
 xYBjWa2ulLOrkeTfY3kaGULFJblRFxpFiwHaYaSh4WOgfR+qPDEWvnzzcRv9TU7/APQa
 pxrQ==
X-Gm-Message-State: AOAM532JavwcHT3HcHsG2WY5wTstw/1JFDzWoj0Cd6yjVgrdFlEGqoQK
 cLj3g02FcJhqegoCi/qhpwDJkr/2IQQ=
X-Google-Smtp-Source: ABdhPJy4RUx1vpNsUvqyd4uyrDL8f1sOLI4T+SfKBfFxZAWBUJOIyUaAKuhxAANY7WiJjbu8byJu5w==
X-Received: by 2002:a17:906:5482:: with SMTP id
 r2mr31163217ejo.348.1634037203155; 
 Tue, 12 Oct 2021 04:13:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/24] configure: automatically parse command line for
 meson -D options
Date: Tue, 12 Oct 2021 13:13:02 +0200
Message-Id: <20211012111302.246627-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now meson_options.txt lists about 90 options.  Each option
needs code in configure to parse it and pass the option down to Meson as
a -D command-line argument; in addition the default must be duplicated
between configure and meson_options.txt.  This series tries to remove
the code duplication by generating the case statement for those --enable
and --disable options, as well as the corresponding help text.

About 80% of the options can be handled completely by the new mechanism.
Eight meson options are not of the --enable/--disable kind.  Six more need
to be parsed in configure for various reasons documented in the patch,
but they still have their help automatically generated.

The advantages are:

- less code in configure

- parsing and help is more consistent (for example --enable-blobs was
  not supported)

- options are described entirely in one place, meson_options.txt.
  This make it more attractive to use Meson options instead of
  hand-crafted configure options and config-host.mak

A few options change name: --enable-tcmalloc and --enable-jemalloc
become --enable-malloc={tcmalloc,jemalloc}; --disable-blobs becomes
--disable-install-blobs; --enable-trace-backend becomes
--enable-trace-backends.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20211007130829.632254-19-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 550 +++-------------------------------
 docs/devel/build-system.rst   | 132 ++++----
 meson_options.txt             |   8 +
 scripts/meson-buildoptions.py |  92 ++++++
 scripts/meson-buildoptions.sh | 256 ++++++++++++++++
 5 files changed, 458 insertions(+), 580 deletions(-)

diff --git a/configure b/configure
index d979476e03..d4b714f789 100755
--- a/configure
+++ b/configure
@@ -286,41 +286,8 @@ for opt do
   esac
 done
 
-brlapi="auto"
-curl="auto"
-iconv="auto"
-curses="auto"
-docs="auto"
-fdt="auto"
-netmap="auto"
-sdl="auto"
-sdl_image="auto"
-virtiofsd="auto"
-virtfs="auto"
-libudev="auto"
-mpath="auto"
-vnc="auto"
-sparse="auto"
-vde="auto"
-vnc_sasl="auto"
-vnc_jpeg="auto"
-vnc_png="auto"
-xkbcommon="auto"
-alsa="auto"
-coreaudio="auto"
-dsound="auto"
-jack="auto"
-oss="auto"
-pa="auto"
-xen=${default_feature:+disabled}
 xen_ctrl_version="$default_feature"
-xen_pci_passthrough="auto"
-linux_aio="auto"
-linux_io_uring="auto"
-cap_ng="auto"
-attr="auto"
 xfs="$default_feature"
-tcg="enabled"
 membarrier="$default_feature"
 vhost_kernel="$default_feature"
 vhost_net="$default_feature"
@@ -328,15 +295,8 @@ vhost_crypto="$default_feature"
 vhost_scsi="$default_feature"
 vhost_vsock="$default_feature"
 vhost_user="no"
-vhost_user_blk_server="auto"
 vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
-bpf="auto"
-kvm="auto"
-hax="auto"
-hvf="auto"
-whpx="auto"
-nvmm="auto"
 rdma="$default_feature"
 pvrdma="$default_feature"
 gprof="no"
@@ -346,7 +306,6 @@ sanitizers="no"
 tsan="no"
 fortify_source="$default_feature"
 strip_opt="yes"
-tcg_interpreter="false"
 mingw32="no"
 gcov="no"
 EXESUF=""
@@ -354,62 +313,32 @@ modules="no"
 module_upgrades="no"
 prefix="/usr/local"
 qemu_suffix="qemu"
-slirp="auto"
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
-spice="auto"
-spice_protocol="auto"
-rbd="auto"
-smartcard="auto"
-u2f="auto"
-libusb="auto"
-usb_redir="auto"
 opengl="$default_feature"
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
-guest_agent_msi="auto"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
-libiscsi="auto"
-libnfs="auto"
 coroutine=""
 coroutine_pool="$default_feature"
 debug_stack_usage="no"
 crypto_afalg="no"
-cfi="false"
-cfi_debug="false"
-seccomp="auto"
-glusterfs="auto"
-gtk="auto"
 tls_priority="NORMAL"
-gnutls="auto"
-nettle="auto"
-gcrypt="auto"
-auth_pam="auto"
-vte="auto"
-virglrenderer="auto"
 tpm="$default_feature"
 libssh="$default_feature"
 live_block_migration=${default_feature:-yes}
@@ -427,24 +356,34 @@ qed=${default_feature:-yes}
 parallels=${default_feature:-yes}
 libxml2="auto"
 debug_mutex="no"
-libpmem="auto"
-default_devices="true"
 plugins="$default_feature"
-fuzzing="false"
 rng_none="no"
 secret_keyring="$default_feature"
 libdaxctl="auto"
 meson=""
+meson_args=""
 ninja=""
+gio="$default_feature"
 skip_meson=no
-gettext="auto"
-fuse="auto"
-fuse_lseek="auto"
-multiprocess="auto"
 slirp_smbd="$default_feature"
 
-malloc_trim="auto"
-gio="$default_feature"
+# The following Meson options are handled manually (still they
+# are included in the automatically generated help message)
+
+# 1. Track which submodules are needed
+capstone="auto"
+fdt="auto"
+slirp="auto"
+
+# 2. Support --with/--without option
+default_devices="true"
+
+# 3. Automatically enable/disable other options
+tcg="enabled"
+cfi="false"
+
+# 4. Detection partly done in configure
+xen=${default_feature:+disabled}
 
 # parse CC options second
 for opt do
@@ -874,11 +813,6 @@ for opt do
                        error_exit "Can't mix --target-list-exclude with --target-list"
                    fi
   ;;
-  --enable-trace-backends=*) trace_backends="$optarg"
-  ;;
-  # XXX: backwards compatibility
-  --enable-trace-backend=*) trace_backends="$optarg"
-  ;;
   --with-trace-file=*) trace_file="$optarg"
   ;;
   --with-default-devices) default_devices="true"
@@ -941,42 +875,10 @@ for opt do
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
   --audio-drv-list=*) audio_drv_list="$optarg"
   ;;
   --block-drv-rw-whitelist=*|--block-drv-whitelist=*) block_drv_rw_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
@@ -1007,24 +909,8 @@ for opt do
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
@@ -1033,113 +919,17 @@ for opt do
   ;;
   --enable-slirp=*) slirp="$optarg"
   ;;
-  --disable-vde) vde="disabled"
-  ;;
-  --enable-vde) vde="enabled"
-  ;;
-  --disable-netmap) netmap="disabled"
-  ;;
-  --enable-netmap) netmap="enabled"
-  ;;
   --disable-xen) xen="disabled"
   ;;
   --enable-xen) xen="enabled"
   ;;
-  --disable-xen-pci-passthrough) xen_pci_passthrough="disabled"
-  ;;
-  --enable-xen-pci-passthrough) xen_pci_passthrough="enabled"
-  ;;
-  --disable-alsa) alsa="disabled"
-  ;;
-  --enable-alsa) alsa="enabled"
-  ;;
-  --disable-coreaudio) coreaudio="disabled"
-  ;;
-  --enable-coreaudio) coreaudio="enabled"
-  ;;
-  --disable-dsound) dsound="disabled"
-  ;;
-  --enable-dsound) dsound="enabled"
-  ;;
-  --disable-jack) jack="disabled"
-  ;;
-  --enable-jack) jack="enabled"
-  ;;
-  --disable-oss) oss="disabled"
-  ;;
-  --enable-oss) oss="enabled"
-  ;;
-  --disable-pa) pa="disabled"
-  ;;
-  --enable-pa) pa="enabled"
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
-  --disable-nvmm) nvmm="disabled"
-  ;;
-  --enable-nvmm) nvmm="enabled"
-  ;;
-  --disable-whpx) whpx="disabled"
-  ;;
-  --enable-whpx) whpx="enabled"
-  ;;
-  --disable-tcg-interpreter) tcg_interpreter="false"
-  ;;
-  --enable-tcg-interpreter) tcg_interpreter="true"
-  ;;
-  --disable-cap-ng)  cap_ng="disabled"
-  ;;
-  --enable-cap-ng) cap_ng="enabled"
-  ;;
   --disable-tcg) tcg="disabled"
                  plugins="no"
   ;;
   --enable-tcg) tcg="enabled"
   ;;
-  --disable-malloc-trim) malloc_trim="disabled"
-  ;;
-  --enable-malloc-trim) malloc_trim="enabled"
-  ;;
-  --disable-spice) spice="no"
-  ;;
-  --enable-spice)
-      spice_protocol="yes"
-      spice="yes"
-  ;;
-  --disable-spice-protocol)
-      spice_protocol="no"
-      spice="no"
-  ;;
-  --enable-spice-protocol) spice_protocol="yes"
-  ;;
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
@@ -1183,22 +973,6 @@ for opt do
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
@@ -1207,28 +981,10 @@ for opt do
   ;;
   --enable-fdt=*) fdt="$optarg"
   ;;
-  --disable-linux-aio) linux_aio="disabled"
-  ;;
-  --enable-linux-aio) linux_aio="enabled"
-  ;;
-  --disable-linux-io-uring) linux_io_uring="disabled"
-  ;;
-  --enable-linux-io-uring) linux_io_uring="enabled"
-  ;;
-  --disable-attr) attr="disabled"
-  ;;
-  --enable-attr) attr="enabled"
-  ;;
   --disable-membarrier) membarrier="no"
   ;;
   --enable-membarrier) membarrier="yes"
   ;;
-  --disable-bpf) bpf="disabled"
-  ;;
-  --enable-bpf) bpf="enabled"
-  ;;
-  --disable-blobs) blobs="false"
-  ;;
   --with-pkgversion=*) pkgversion="$optarg"
   ;;
   --with-coroutine=*) coroutine="$optarg"
@@ -1243,10 +999,6 @@ for opt do
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
@@ -1263,10 +1015,6 @@ for opt do
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
@@ -1275,60 +1023,16 @@ for opt do
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
   ;;
-  --disable-smartcard) smartcard="disabled"
-  ;;
-  --enable-smartcard) smartcard="enabled"
-  ;;
-  --disable-u2f) u2f="disabled"
-  ;;
-  --enable-u2f) u2f="enabled"
-  ;;
-  --disable-libusb) libusb="disabled"
-  ;;
-  --enable-libusb) libusb="enabled"
-  ;;
-  --disable-usb-redir) usb_redir="disabled"
-  ;;
-  --enable-usb-redir) usb_redir="enabled"
-  ;;
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
   ;;
-  --enable-guest-agent-msi) guest_agent_msi="enabled"
-  ;;
-  --disable-guest-agent-msi) guest_agent_msi="disabled"
-  ;;
   --with-vss-sdk) vss_win32_sdk=""
   ;;
   --with-vss-sdk=*) vss_win32_sdk="$optarg"
@@ -1345,12 +1049,6 @@ for opt do
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
@@ -1359,9 +1057,6 @@ for opt do
   ;;
   --enable-avx512f) avx512f_opt="yes"
   ;;
-
-  --enable-glusterfs) glusterfs="enabled"
-  ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
       echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
   ;;
@@ -1371,28 +1066,8 @@ for opt do
   --enable-uuid|--disable-uuid)
       echo "$0: $opt is obsolete, UUID support is always built" >&2
   ;;
-  --disable-gtk) gtk="disabled"
-  ;;
-  --enable-gtk) gtk="enabled"
-  ;;
   --tls-priority=*) tls_priority="$optarg"
   ;;
-  --disable-gnutls) gnutls="disabled"
-  ;;
-  --enable-gnutls) gnutls="enabled"
-  ;;
-  --disable-nettle) nettle="disabled"
-  ;;
-  --enable-nettle) nettle="enabled"
-  ;;
-  --disable-gcrypt) gcrypt="disabled"
-  ;;
-  --enable-gcrypt) gcrypt="enabled"
-  ;;
-  --disable-auth-pam) auth_pam="disabled"
-  ;;
-  --enable-auth-pam) auth_pam="enabled"
-  ;;
   --enable-rdma) rdma="yes"
   ;;
   --disable-rdma) rdma="no"
@@ -1401,14 +1076,6 @@ for opt do
   ;;
   --disable-pvrdma) pvrdma="no"
   ;;
-  --disable-vte) vte="disabled"
-  ;;
-  --enable-vte) vte="enabled"
-  ;;
-  --disable-virglrenderer) virglrenderer="disabled"
-  ;;
-  --enable-virglrenderer) virglrenderer="enabled"
-  ;;
   --disable-tpm) tpm="no"
   ;;
   --enable-tpm) tpm="yes"
@@ -1425,18 +1092,6 @@ for opt do
   ;;
   --enable-numa) numa="yes"
   ;;
-  --disable-libxml2) libxml2="disabled"
-  ;;
-  --enable-libxml2) libxml2="enabled"
-  ;;
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
@@ -1502,14 +1157,6 @@ for opt do
   ;;
   --disable-debug-mutex) debug_mutex=no
   ;;
-  --enable-libpmem) libpmem="enabled"
-  ;;
-  --disable-libpmem) libpmem="disabled"
-  ;;
-  --enable-xkbcommon) xkbcommon="enabled"
-  ;;
-  --disable-xkbcommon) xkbcommon="disabled"
-  ;;
   --enable-plugins) if test "$mingw32" = "yes"; then
                         error_exit "TCG plugins not currently supported on Windows platforms"
                     else
@@ -1522,10 +1169,6 @@ for opt do
   ;;
   --disable-containers) use_containers="no"
   ;;
-  --enable-fuzzing) fuzzing=true
-  ;;
-  --disable-fuzzing) fuzzing=false
-  ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
   --enable-rng-none) rng_none=yes
@@ -1536,22 +1179,6 @@ for opt do
   ;;
   --disable-keyring) secret_keyring="no"
   ;;
-  --enable-libdaxctl) libdaxctl="enabled"
-  ;;
-  --disable-libdaxctl) libdaxctl="disabled"
-  ;;
-  --enable-fuse) fuse="enabled"
-  ;;
-  --disable-fuse) fuse="disabled"
-  ;;
-  --enable-fuse-lseek) fuse_lseek="enabled"
-  ;;
-  --disable-fuse-lseek) fuse_lseek="disabled"
-  ;;
-  --enable-multiprocess) multiprocess="enabled"
-  ;;
-  --disable-multiprocess) multiprocess="disabled"
-  ;;
   --enable-gio) gio=yes
   ;;
   --disable-gio) gio=no
@@ -1560,6 +1187,16 @@ for opt do
   ;;
   --disable-slirp-smbd) slirp_smbd=no
   ;;
+  # backwards compatibility options
+  --enable-trace-backend=*) meson_option_parse "--enable-trace-backends=$optarg" "$optarg"
+  ;;
+  --disable-blobs) meson_option_parse --disable-install-blobs ""
+  ;;
+  --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
+  ;;
+  --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
+  ;;
+  # everything else has the same name in configure and meson
   --enable-* | --disable-*) meson_option_parse "$opt" "$optarg"
   ;;
   *)
@@ -1714,9 +1351,6 @@ for config in $mak_wilds; do
     fi
 done
 
-# Enumerate public trace backends for --help output
-trace_backend_list=$(echo $(grep -le '^PUBLIC = True$' "$source_path"/scripts/tracetool/backend/*.py | sed -e 's/^.*\/\(.*\)\.py$/\1/'))
-
 if test x"$show_help" = x"yes" ; then
 cat << EOF
 
@@ -1793,18 +1427,12 @@ Advanced options (experts only):
                            (by default affects only QEMU, not tools like qemu-img)
   --enable-block-drv-whitelist-in-tools
                            use block whitelist also in tools instead of only QEMU
-  --enable-trace-backends=B Set trace backend
-                           Available backends: $trace_backend_list
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
-  --disable-slirp          disable SLIRP userspace network connectivity
-  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
-  --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
-  --disable-blobs          disable installing provided firmware blobs
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
   --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
   --tls-priority           default TLS protocol/cipher priority string
@@ -1823,9 +1451,7 @@ cat << EOF
   user            supported user emulation targets
   linux-user      all linux usermode emulation targets
   bsd-user        all BSD usermode emulation targets
-  docs            build documentation
   guest-agent     build the QEMU Guest Agent
-  guest-agent-msi build guest agent Windows MSI installation package
   pie             Position Independent Executables
   modules         modules support (non-Windows)
   module-upgrades try to load modules from alternate paths for upgrades
@@ -1835,98 +1461,26 @@ cat << EOF
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
-  gnutls          GNUTLS cryptography support
-  nettle          nettle cryptography support
-  gcrypt          libgcrypt cryptography support
-  auth-pam        PAM access control
-  sdl             SDL UI
-  sdl-image       SDL Image support for icons
-  gtk             gtk UI
-  vte             vte support for the gtk UI
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
-  alsa            ALSA sound support
-  coreaudio       CoreAudio sound support
-  dsound          DirectSound sound support
-  jack            JACK sound support
-  oss             OSS sound support
-  pa              PulseAudio sound support
-  brlapi          BrlAPI (Braile)
-  curl            curl connectivity
   membarrier      membarrier system call (for Linux 4.14+ or Windows)
-  fdt             fdt device tree
-  kvm             KVM acceleration support
-  hax             HAX acceleration support
-  hvf             Hypervisor.framework acceleration support
-  nvmm            NVMM acceleration support
-  whpx            Windows Hypervisor Platform acceleration support
   rdma            Enable RDMA-based migration
   pvrdma          Enable PVRDMA support
-  vde             support for vde network
-  netmap          support for netmap network
-  linux-aio       Linux AIO support
-  linux-io-uring  Linux io_uring support
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
-  bpf             BPF kernel support
-  spice           spice
-  spice-protocol  spice-protocol
-  rbd             rados block device (rbd)
-  libiscsi        iscsi support
-  libnfs          nfs support
-  smartcard       smartcard support (libcacard)
-  u2f             U2F support (u2f-emu)
-  libusb          libusb (for usb passthrough)
   live-block-migration   Block migration in the main migration stream
-  usb-redir       usb network redirection support
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
   opengl          opengl support
-  virglrenderer   virgl rendering support
   xfsctl          xfsctl support
   qom-cast-debug  cast debugging support
   tools           build qemu-io, qemu-nbd and qemu-img tools
@@ -1939,15 +1493,8 @@ cat << EOF
   qed             qed image format support
   parallels       parallels image format support
   crypto-afalg    Linux AF_ALG crypto backend driver
-  capstone        capstone disassembler support
   debug-mutex     mutex debugging support
-  libpmem         libpmem support
-  xkbcommon       xkbcommon support
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
-  libdaxctl       libdaxctl support
-  fuse            FUSE block device export
-  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
-  multiprocess    Out of process device emulation support
   gio             libgio support
   slirp-smbd      use smbd (at path --smbd=*) in slirp networking
 
@@ -3171,16 +2718,6 @@ EOF
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
 # check for usbfs
 have_usbfs=no
 if test "$linux_user" = "yes"; then
@@ -4511,40 +4048,23 @@ if test "$skip_meson" = no; then
         --sysconfdir "$sysconfdir" \
         --localedir "$localedir" \
         --localstatedir "$local_statedir" \
+        -Daudio_drv_list=$audio_drv_list \
+        -Ddefault_devices=$default_devices \
         -Ddocdir="$docdir" \
         -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
+        -Dsphinx_build="$sphinx_build" \
+        -Dtrace_file="$trace_file" \
         -Doptimization=$(if test "$debug" = yes; then echo 0; else echo 2; fi) \
         -Ddebug=$(if test "$debug_info" = yes; then echo true; else echo false; fi) \
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
         -Dstrip=$(if test "$strip_opt" = yes; then echo true; else echo false; fi) \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
-        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug -Dfuzzing=$fuzzing \
+        -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
+        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
-        -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
-        -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
-        -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
-        -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
-        -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir -Dvte=$vte \
-        -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
-        -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
-        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
-        -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
-        -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse -Dlibxml2=$libxml2 \
-        -Dlibdaxctl=$libdaxctl -Dlibpmem=$libpmem -Dlinux_io_uring=$linux_io_uring \
-        -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
-        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
-        -Dattr=$attr -Ddefault_devices=$default_devices -Dvirglrenderer=$virglrenderer \
-        -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
-        -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
-        -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
-        -Dalsa=$alsa -Dcoreaudio=$coreaudio -Ddsound=$dsound -Djack=$jack -Doss=$oss \
-        -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
-        -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file -Dlinux_aio=$linux_aio \
-        -Dnetmap=$netmap -Dvde=$vde \
         "$@" $cross_arg "$PWD" "$source_path"
   }
   eval run_meson $meson_options
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 0f636d620e..7f106d2f1c 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -42,73 +42,21 @@ perform a build:
      ../configure
      make
 
-For now, checks on the compilation environment are found in configure
-rather than meson.build, though this is expected to change.  The command
-line is parsed in the configure script and, whenever needed, converted
-into the appropriate options to Meson.
-
-New checks should be added to Meson, which usually comprises the
-following tasks:
-
- - Add a Meson build option to meson_options.txt.
-
- - Add support to the command line arg parser to handle any new
-   ``--enable-XXX``/``--disable-XXX`` flags required by the feature.
-
- - Add information to the help output message to report on the new
-   feature flag.
-
- - Add code to perform the actual feature check.
-
- - Add code to include the feature status in ``config-host.h``
-
- - Add code to print out the feature status in the configure summary
-   upon completion.
-
-
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
-
-  option('sdl', type : 'feature', value : 'auto',
-         description: 'SDL Image support for icons')
-
-In meson.build::
-
-  # Detect dependency
-  sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
-                         method: 'pkg-config',
-                         kwargs: static_kwargs)
-
-  # Create config-host.h (if applicable)
-  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
-
-  # Summary
-  summary_info += {'SDL image support': sdl_image.found()}
+The configure script automatically recognizes
+command line options for which a same-named Meson option exists;
+dashes in the command line are replaced with underscores.
 
+Many checks on the compilation environment are still found in configure
+rather than `meson.build`, but new checks should be added directly to
+`meson.build`.
 
+Patches are also welcome to move existing checks from the configure
+phase to `meson.build`.  When doing so, ensure that `meson.build` does
+not use anymore the keys that you have removed from `config-host.mak`.
+Typically these will be replaced in `meson.build` by boolean variables,
+``get_option('optname')`` invocations, or `dep.found()` expressions.
+In general, the remaining checks have little or no interdependencies,
+so they can be moved one by one.
 
 Helper functions
 ----------------
@@ -335,6 +283,60 @@ new target, or enabling new devices or hardware for a particular
 system/userspace emulation target
 
 
+Adding checks
+-------------
+
+New checks should be added to Meson.  Compiler checks can be as simple as
+the following::
+
+  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
+
+A more complex task such as adding a new dependency usually
+comprises the following tasks:
+
+ - Add a Meson build option to meson_options.txt.
+
+ - Add code to perform the actual feature check.
+
+ - Add code to include the feature status in `config-host.h`
+
+ - Add code to print out the feature status in the configure summary
+   upon completion.
+
+Taking the probe for SDL2_Image as an example, we have the following
+in ``meson_options.txt``::
+
+  option('sdl_image', type : 'feature', value : 'auto',
+         description: 'SDL Image support for icons')
+
+Unless the option was given a non-``auto`` value (on the configure
+command line), the detection code must be performed only if the
+dependency will be used::
+
+  sdl_image = not_found
+  if not get_option('sdl_image').auto() or have_system
+    sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
+                           method: 'pkg-config',
+                           static: enable_static)
+  endif
+
+This avoids warnings on static builds of user-mode emulators, for example.
+Most of the libraries used by system-mode emulators are not available for
+static linking.
+
+The other supporting code is generally simple::
+
+  # Create config-host.h (if applicable)
+  config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
+
+  # Summary
+  summary_info += {'SDL image support': sdl_image.found()}
+
+For the configure script to parse the new option, the
+``scripts/meson-buildoptions.sh`` file must be up-to-date; ``make
+update-buildoptions`` (or just `make`) will take care of updating it.
+
+
 Support scripts
 ---------------
 
diff --git a/meson_options.txt b/meson_options.txt
index 5a140af7f7..4ab4570125 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -1,3 +1,7 @@
+# These options do not correspond to a --enable/--disable-* option
+# on the configure script command line.  If you add more, list them in
+# scripts/meson-buildoptions.py's SKIP_OPTIONS constant too.
+
 option('qemu_suffix', type : 'string', value: 'qemu',
        description: 'Suffix for QEMU data/modules/config directories (can be empty)')
 option('docdir', type : 'string', value : 'doc',
@@ -16,6 +20,10 @@ option('fuzzing_engine', type : 'string', value : '',
 option('trace_file', type: 'string', value: 'trace',
        description: 'Trace file prefix for simple backend')
 
+# Everything else can be set via --enable/--disable-* option
+# on the configure script command line.  After adding an option
+# here make sure to run "make update-buildoptions".
+
 option('docs', type : 'feature', value : 'auto',
        description: 'Documentations build support')
 option('fuzzing', type : 'boolean', value: false,
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 71ee56bd22..54b591d8a4 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -25,10 +25,71 @@
 import shlex
 import sys
 
+SKIP_OPTIONS = {
+    "audio_drv_list",
+    "default_devices",
+    "docdir",
+    "fuzzing_engine",
+    "qemu_firmwarepath",
+    "qemu_suffix",
+    "sphinx_build",
+    "trace_file",
+}
+
+LINE_WIDTH = 76
+
+
+# Convert the default value of an option to the string used in
+# the help message
+def value_to_help(value):
+    if isinstance(value, list):
+        return ",".join(value)
+    if isinstance(value, bool):
+        return "enabled" if value else "disabled"
+    return str(value)
+
+
+def wrap(left, text, indent):
+    spaces = " " * indent
+    if len(left) >= indent:
+        yield left
+        left = spaces
+    else:
+        left = (left + spaces)[0:indent]
+    yield from textwrap.wrap(
+        text, width=LINE_WIDTH, initial_indent=left, subsequent_indent=spaces
+    )
+
+
 def sh_print(line=""):
     print('  printf "%s\\n"', shlex.quote(line))
 
 
+def help_line(left, opt, indent, long):
+    right = f"{opt['description']}"
+    if long:
+        value = value_to_help(opt["value"])
+        if value != "auto":
+            right += f" [{value}]"
+    if "choices" in opt and long:
+        choices = "/".join(sorted(opt["choices"]))
+        right += f" (choices: {choices})"
+    for x in wrap("  " + left, right, indent):
+        sh_print(x)
+
+
+# Return whether the option (a dictionary) can be used with
+# arguments.  Booleans can never be used with arguments;
+# combos allow an argument only if they accept other values
+# than "auto", "enabled", and "disabled".
+def allow_arg(opt):
+    if opt["type"] == "boolean":
+        return False
+    if opt["type"] != "combo":
+        return True
+    return not (set(opt["choices"]) <= {"auto", "disabled", "enabled"})
+
+
 def load_options(json):
     json = [
         x
@@ -42,17 +103,48 @@ def load_options(json):
 
 def print_help(options):
     print("meson_options_help() {")
+    for opt in options:
+        key = opt["name"].replace("_", "-")
+        # The first section includes options that have an arguments,
+        # and booleans (i.e., only one of enable/disable makes sense)
+        if opt["type"] == "boolean":
+            left = f"--disable-{key}" if opt["value"] else f"--enable-{key}"
+            help_line(left, opt, 27, False)
+        elif allow_arg(opt):
+            if opt["type"] == "combo" and "enabled" in opt["choices"]:
+                left = f"--enable-{key}[=CHOICE]"
+            else:
+                left = f"--enable-{key}=CHOICE"
+            help_line(left, opt, 27, True)
+
     sh_print()
     sh_print("Optional features, enabled with --enable-FEATURE and")
     sh_print("disabled with --disable-FEATURE, default is enabled if available")
     sh_print("(unless built with --without-default-features):")
     sh_print()
+    for opt in options:
+        key = opt["name"].replace("_", "-")
+        if opt["type"] != "boolean" and not allow_arg(opt):
+            help_line(key, opt, 18, False)
     print("}")
 
 
 def print_parse(options):
     print("_meson_option_parse() {")
     print("  case $1 in")
+    for opt in options:
+        key = opt["name"].replace("_", "-")
+        name = opt["name"]
+        if opt["type"] == "boolean":
+            print(f'    --enable-{key}) printf "%s" -D{name}=true ;;')
+            print(f'    --disable-{key}) printf "%s" -D{name}=false ;;')
+        else:
+            if opt["type"] == "combo" and "enabled" in opt["choices"]:
+                print(f'    --enable-{key}) printf "%s" -D{name}=enabled ;;')
+            if opt["type"] == "combo" and "disabled" in opt["choices"]:
+                print(f'    --disable-{key}) printf "%s" -D{name}=disabled ;;')
+            if allow_arg(opt):
+                print(f'    --enable-{key}=*) quote_sh "-D{name}=$2" ;;')
     print("    *) return 1 ;;")
     print("  esac")
     print("}")
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c8ae205601..12188c2530 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -1,13 +1,269 @@
 # This file is generated by meson-buildoptions.py, do not edit!
 meson_options_help() {
+  printf "%s\n" '  --enable-capstone[=CHOICE]'
+  printf "%s\n" '                           Whether and how to find the capstone library'
+  printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
+  printf "%s\n" '  --enable-cfi             Control-Flow Integrity (CFI)'
+  printf "%s\n" '  --enable-cfi-debug       Verbose errors in case of CFI violation'
+  printf "%s\n" '  --enable-fdt[=CHOICE]    Whether and how to find the libfdt library'
+  printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
+  printf "%s\n" '  --enable-fuzzing         build fuzzing targets'
+  printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
+  printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to use [system] (choices:'
+  printf "%s\n" '                           jemalloc/system/tcmalloc)'
+  printf "%s\n" '  --enable-slirp[=CHOICE]  Whether and how to find the slirp library'
+  printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
+  printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (experimental and'
+  printf "%s\n" '                           slow)'
+  printf "%s\n" '  --enable-trace-backends=CHOICE'
+  printf "%s\n" '                           Set available tracing backends [log]'
   printf "%s\n" ''
   printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
   printf "%s\n" 'disabled with --disable-FEATURE, default is enabled if available'
   printf "%s\n" '(unless built with --without-default-features):'
   printf "%s\n" ''
+  printf "%s\n" '  alsa            ALSA sound support'
+  printf "%s\n" '  attr            attr/xattr support'
+  printf "%s\n" '  auth-pam        PAM access control'
+  printf "%s\n" '  bpf             eBPF support'
+  printf "%s\n" '  brlapi          brlapi character device driver'
+  printf "%s\n" '  bzip2           bzip2 support for DMG images'
+  printf "%s\n" '  cap-ng          cap_ng support'
+  printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
+  printf "%s\n" '  coreaudio       CoreAudio sound support'
+  printf "%s\n" '  curl            CURL block device driver'
+  printf "%s\n" '  curses          curses UI'
+  printf "%s\n" '  docs            Documentations build support'
+  printf "%s\n" '  dsound          DirectSound sound support'
+  printf "%s\n" '  fuse            FUSE block device export'
+  printf "%s\n" '  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports'
+  printf "%s\n" '  gcrypt          libgcrypt cryptography support'
+  printf "%s\n" '  gettext         Localization of the GTK+ user interface'
+  printf "%s\n" '  glusterfs       Glusterfs block device driver'
+  printf "%s\n" '  gnutls          GNUTLS cryptography support'
+  printf "%s\n" '  gtk             GTK+ user interface'
+  printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest Agent'
+  printf "%s\n" '  hax             HAX acceleration support'
+  printf "%s\n" '  hvf             HVF acceleration support'
+  printf "%s\n" '  iconv           Font glyph conversion support'
+  printf "%s\n" '  jack            JACK sound support'
+  printf "%s\n" '  kvm             KVM acceleration support'
+  printf "%s\n" '  libdaxctl       libdaxctl support'
+  printf "%s\n" '  libiscsi        libiscsi userspace initiator'
+  printf "%s\n" '  libnfs          libnfs block device driver'
+  printf "%s\n" '  libpmem         libpmem support'
+  printf "%s\n" '  libudev         Use libudev to enumerate host devices'
+  printf "%s\n" '  libusb          libusb support for USB passthrough'
+  printf "%s\n" '  libxml2         libxml2 support for Parallels image format'
+  printf "%s\n" '  linux-aio       Linux AIO support'
+  printf "%s\n" '  linux-io-uring  Linux io_uring support'
+  printf "%s\n" '  lzfse           lzfse support for DMG images'
+  printf "%s\n" '  lzo             lzo compression support'
+  printf "%s\n" '  malloc-trim     enable libc malloc_trim() for memory optimization'
+  printf "%s\n" '  mpath           Multipath persistent reservation passthrough'
+  printf "%s\n" '  multiprocess    Out of process device emulation support'
+  printf "%s\n" '  netmap          netmap network backend support'
+  printf "%s\n" '  nettle          nettle cryptography support'
+  printf "%s\n" '  nvmm            NVMM acceleration support'
+  printf "%s\n" '  oss             OSS sound support'
+  printf "%s\n" '  pa              PulseAudio sound support'
+  printf "%s\n" '  rbd             Ceph block device driver'
+  printf "%s\n" '  sdl             SDL user interface'
+  printf "%s\n" '  sdl-image       SDL Image support for icons'
+  printf "%s\n" '  seccomp         seccomp support'
+  printf "%s\n" '  smartcard       CA smartcard emulation support'
+  printf "%s\n" '  snappy          snappy compression support'
+  printf "%s\n" '  sparse          sparse checker'
+  printf "%s\n" '  spice           Spice server support'
+  printf "%s\n" '  spice-protocol  Spice protocol support'
+  printf "%s\n" '  tcg             TCG support'
+  printf "%s\n" '  u2f             U2F emulation support'
+  printf "%s\n" '  usb-redir       libusbredir support'
+  printf "%s\n" '  vde             vde network backend support'
+  printf "%s\n" '  vhost-user-blk-server'
+  printf "%s\n" '                  build vhost-user-blk server'
+  printf "%s\n" '  virglrenderer   virgl rendering support'
+  printf "%s\n" '  virtfs          virtio-9p support'
+  printf "%s\n" '  virtiofsd       build virtiofs daemon (virtiofsd)'
+  printf "%s\n" '  vnc             VNC server'
+  printf "%s\n" '  vnc-jpeg        JPEG lossy compression for VNC server'
+  printf "%s\n" '  vnc-png         PNG compression for VNC server'
+  printf "%s\n" '  vnc-sasl        SASL authentication for VNC server'
+  printf "%s\n" '  vte             vte support for the gtk UI'
+  printf "%s\n" '  whpx            WHPX acceleration support'
+  printf "%s\n" '  xen             Xen backend support'
+  printf "%s\n" '  xen-pci-passthrough'
+  printf "%s\n" '                  Xen PCI passthrough support'
+  printf "%s\n" '  xkbcommon       xkbcommon support'
+  printf "%s\n" '  zstd            zstd compression support'
 }
 _meson_option_parse() {
   case $1 in
+    --enable-alsa) printf "%s" -Dalsa=enabled ;;
+    --disable-alsa) printf "%s" -Dalsa=disabled ;;
+    --enable-attr) printf "%s" -Dattr=enabled ;;
+    --disable-attr) printf "%s" -Dattr=disabled ;;
+    --enable-auth-pam) printf "%s" -Dauth_pam=enabled ;;
+    --disable-auth-pam) printf "%s" -Dauth_pam=disabled ;;
+    --enable-bpf) printf "%s" -Dbpf=enabled ;;
+    --disable-bpf) printf "%s" -Dbpf=disabled ;;
+    --enable-brlapi) printf "%s" -Dbrlapi=enabled ;;
+    --disable-brlapi) printf "%s" -Dbrlapi=disabled ;;
+    --enable-bzip2) printf "%s" -Dbzip2=enabled ;;
+    --disable-bzip2) printf "%s" -Dbzip2=disabled ;;
+    --enable-cap-ng) printf "%s" -Dcap_ng=enabled ;;
+    --disable-cap-ng) printf "%s" -Dcap_ng=disabled ;;
+    --enable-capstone) printf "%s" -Dcapstone=enabled ;;
+    --disable-capstone) printf "%s" -Dcapstone=disabled ;;
+    --enable-capstone=*) quote_sh "-Dcapstone=$2" ;;
+    --enable-cfi) printf "%s" -Dcfi=true ;;
+    --disable-cfi) printf "%s" -Dcfi=false ;;
+    --enable-cfi-debug) printf "%s" -Dcfi_debug=true ;;
+    --disable-cfi-debug) printf "%s" -Dcfi_debug=false ;;
+    --enable-cocoa) printf "%s" -Dcocoa=enabled ;;
+    --disable-cocoa) printf "%s" -Dcocoa=disabled ;;
+    --enable-coreaudio) printf "%s" -Dcoreaudio=enabled ;;
+    --disable-coreaudio) printf "%s" -Dcoreaudio=disabled ;;
+    --enable-curl) printf "%s" -Dcurl=enabled ;;
+    --disable-curl) printf "%s" -Dcurl=disabled ;;
+    --enable-curses) printf "%s" -Dcurses=enabled ;;
+    --disable-curses) printf "%s" -Dcurses=disabled ;;
+    --enable-docs) printf "%s" -Ddocs=enabled ;;
+    --disable-docs) printf "%s" -Ddocs=disabled ;;
+    --enable-dsound) printf "%s" -Ddsound=enabled ;;
+    --disable-dsound) printf "%s" -Ddsound=disabled ;;
+    --enable-fdt) printf "%s" -Dfdt=enabled ;;
+    --disable-fdt) printf "%s" -Dfdt=disabled ;;
+    --enable-fdt=*) quote_sh "-Dfdt=$2" ;;
+    --enable-fuse) printf "%s" -Dfuse=enabled ;;
+    --disable-fuse) printf "%s" -Dfuse=disabled ;;
+    --enable-fuse-lseek) printf "%s" -Dfuse_lseek=enabled ;;
+    --disable-fuse-lseek) printf "%s" -Dfuse_lseek=disabled ;;
+    --enable-fuzzing) printf "%s" -Dfuzzing=true ;;
+    --disable-fuzzing) printf "%s" -Dfuzzing=false ;;
+    --enable-gcrypt) printf "%s" -Dgcrypt=enabled ;;
+    --disable-gcrypt) printf "%s" -Dgcrypt=disabled ;;
+    --enable-gettext) printf "%s" -Dgettext=enabled ;;
+    --disable-gettext) printf "%s" -Dgettext=disabled ;;
+    --enable-glusterfs) printf "%s" -Dglusterfs=enabled ;;
+    --disable-glusterfs) printf "%s" -Dglusterfs=disabled ;;
+    --enable-gnutls) printf "%s" -Dgnutls=enabled ;;
+    --disable-gnutls) printf "%s" -Dgnutls=disabled ;;
+    --enable-gtk) printf "%s" -Dgtk=enabled ;;
+    --disable-gtk) printf "%s" -Dgtk=disabled ;;
+    --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=enabled ;;
+    --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=disabled ;;
+    --enable-hax) printf "%s" -Dhax=enabled ;;
+    --disable-hax) printf "%s" -Dhax=disabled ;;
+    --enable-hvf) printf "%s" -Dhvf=enabled ;;
+    --disable-hvf) printf "%s" -Dhvf=disabled ;;
+    --enable-iconv) printf "%s" -Diconv=enabled ;;
+    --disable-iconv) printf "%s" -Diconv=disabled ;;
+    --enable-install-blobs) printf "%s" -Dinstall_blobs=true ;;
+    --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
+    --enable-jack) printf "%s" -Djack=enabled ;;
+    --disable-jack) printf "%s" -Djack=disabled ;;
+    --enable-kvm) printf "%s" -Dkvm=enabled ;;
+    --disable-kvm) printf "%s" -Dkvm=disabled ;;
+    --enable-libdaxctl) printf "%s" -Dlibdaxctl=enabled ;;
+    --disable-libdaxctl) printf "%s" -Dlibdaxctl=disabled ;;
+    --enable-libiscsi) printf "%s" -Dlibiscsi=enabled ;;
+    --disable-libiscsi) printf "%s" -Dlibiscsi=disabled ;;
+    --enable-libnfs) printf "%s" -Dlibnfs=enabled ;;
+    --disable-libnfs) printf "%s" -Dlibnfs=disabled ;;
+    --enable-libpmem) printf "%s" -Dlibpmem=enabled ;;
+    --disable-libpmem) printf "%s" -Dlibpmem=disabled ;;
+    --enable-libudev) printf "%s" -Dlibudev=enabled ;;
+    --disable-libudev) printf "%s" -Dlibudev=disabled ;;
+    --enable-libusb) printf "%s" -Dlibusb=enabled ;;
+    --disable-libusb) printf "%s" -Dlibusb=disabled ;;
+    --enable-libxml2) printf "%s" -Dlibxml2=enabled ;;
+    --disable-libxml2) printf "%s" -Dlibxml2=disabled ;;
+    --enable-linux-aio) printf "%s" -Dlinux_aio=enabled ;;
+    --disable-linux-aio) printf "%s" -Dlinux_aio=disabled ;;
+    --enable-linux-io-uring) printf "%s" -Dlinux_io_uring=enabled ;;
+    --disable-linux-io-uring) printf "%s" -Dlinux_io_uring=disabled ;;
+    --enable-lzfse) printf "%s" -Dlzfse=enabled ;;
+    --disable-lzfse) printf "%s" -Dlzfse=disabled ;;
+    --enable-lzo) printf "%s" -Dlzo=enabled ;;
+    --disable-lzo) printf "%s" -Dlzo=disabled ;;
+    --enable-malloc=*) quote_sh "-Dmalloc=$2" ;;
+    --enable-malloc-trim) printf "%s" -Dmalloc_trim=enabled ;;
+    --disable-malloc-trim) printf "%s" -Dmalloc_trim=disabled ;;
+    --enable-mpath) printf "%s" -Dmpath=enabled ;;
+    --disable-mpath) printf "%s" -Dmpath=disabled ;;
+    --enable-multiprocess) printf "%s" -Dmultiprocess=enabled ;;
+    --disable-multiprocess) printf "%s" -Dmultiprocess=disabled ;;
+    --enable-netmap) printf "%s" -Dnetmap=enabled ;;
+    --disable-netmap) printf "%s" -Dnetmap=disabled ;;
+    --enable-nettle) printf "%s" -Dnettle=enabled ;;
+    --disable-nettle) printf "%s" -Dnettle=disabled ;;
+    --enable-nvmm) printf "%s" -Dnvmm=enabled ;;
+    --disable-nvmm) printf "%s" -Dnvmm=disabled ;;
+    --enable-oss) printf "%s" -Doss=enabled ;;
+    --disable-oss) printf "%s" -Doss=disabled ;;
+    --enable-pa) printf "%s" -Dpa=enabled ;;
+    --disable-pa) printf "%s" -Dpa=disabled ;;
+    --enable-rbd) printf "%s" -Drbd=enabled ;;
+    --disable-rbd) printf "%s" -Drbd=disabled ;;
+    --enable-sdl) printf "%s" -Dsdl=enabled ;;
+    --disable-sdl) printf "%s" -Dsdl=disabled ;;
+    --enable-sdl-image) printf "%s" -Dsdl_image=enabled ;;
+    --disable-sdl-image) printf "%s" -Dsdl_image=disabled ;;
+    --enable-seccomp) printf "%s" -Dseccomp=enabled ;;
+    --disable-seccomp) printf "%s" -Dseccomp=disabled ;;
+    --enable-slirp) printf "%s" -Dslirp=enabled ;;
+    --disable-slirp) printf "%s" -Dslirp=disabled ;;
+    --enable-slirp=*) quote_sh "-Dslirp=$2" ;;
+    --enable-smartcard) printf "%s" -Dsmartcard=enabled ;;
+    --disable-smartcard) printf "%s" -Dsmartcard=disabled ;;
+    --enable-snappy) printf "%s" -Dsnappy=enabled ;;
+    --disable-snappy) printf "%s" -Dsnappy=disabled ;;
+    --enable-sparse) printf "%s" -Dsparse=enabled ;;
+    --disable-sparse) printf "%s" -Dsparse=disabled ;;
+    --enable-spice) printf "%s" -Dspice=enabled ;;
+    --disable-spice) printf "%s" -Dspice=disabled ;;
+    --enable-spice-protocol) printf "%s" -Dspice_protocol=enabled ;;
+    --disable-spice-protocol) printf "%s" -Dspice_protocol=disabled ;;
+    --enable-tcg) printf "%s" -Dtcg=enabled ;;
+    --disable-tcg) printf "%s" -Dtcg=disabled ;;
+    --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=true ;;
+    --disable-tcg-interpreter) printf "%s" -Dtcg_interpreter=false ;;
+    --enable-trace-backends=*) quote_sh "-Dtrace_backends=$2" ;;
+    --enable-u2f) printf "%s" -Du2f=enabled ;;
+    --disable-u2f) printf "%s" -Du2f=disabled ;;
+    --enable-usb-redir) printf "%s" -Dusb_redir=enabled ;;
+    --disable-usb-redir) printf "%s" -Dusb_redir=disabled ;;
+    --enable-vde) printf "%s" -Dvde=enabled ;;
+    --disable-vde) printf "%s" -Dvde=disabled ;;
+    --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
+    --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
+    --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
+    --disable-virglrenderer) printf "%s" -Dvirglrenderer=disabled ;;
+    --enable-virtfs) printf "%s" -Dvirtfs=enabled ;;
+    --disable-virtfs) printf "%s" -Dvirtfs=disabled ;;
+    --enable-virtiofsd) printf "%s" -Dvirtiofsd=enabled ;;
+    --disable-virtiofsd) printf "%s" -Dvirtiofsd=disabled ;;
+    --enable-vnc) printf "%s" -Dvnc=enabled ;;
+    --disable-vnc) printf "%s" -Dvnc=disabled ;;
+    --enable-vnc-jpeg) printf "%s" -Dvnc_jpeg=enabled ;;
+    --disable-vnc-jpeg) printf "%s" -Dvnc_jpeg=disabled ;;
+    --enable-vnc-png) printf "%s" -Dvnc_png=enabled ;;
+    --disable-vnc-png) printf "%s" -Dvnc_png=disabled ;;
+    --enable-vnc-sasl) printf "%s" -Dvnc_sasl=enabled ;;
+    --disable-vnc-sasl) printf "%s" -Dvnc_sasl=disabled ;;
+    --enable-vte) printf "%s" -Dvte=enabled ;;
+    --disable-vte) printf "%s" -Dvte=disabled ;;
+    --enable-whpx) printf "%s" -Dwhpx=enabled ;;
+    --disable-whpx) printf "%s" -Dwhpx=disabled ;;
+    --enable-xen) printf "%s" -Dxen=enabled ;;
+    --disable-xen) printf "%s" -Dxen=disabled ;;
+    --enable-xen-pci-passthrough) printf "%s" -Dxen_pci_passthrough=enabled ;;
+    --disable-xen-pci-passthrough) printf "%s" -Dxen_pci_passthrough=disabled ;;
+    --enable-xkbcommon) printf "%s" -Dxkbcommon=enabled ;;
+    --disable-xkbcommon) printf "%s" -Dxkbcommon=disabled ;;
+    --enable-zstd) printf "%s" -Dzstd=enabled ;;
+    --disable-zstd) printf "%s" -Dzstd=disabled ;;
     *) return 1 ;;
   esac
 }
-- 
2.31.1


