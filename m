Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A5348C6A2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:01:02 +0100 (CET)
Received: from localhost ([::1]:53136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7f7U-00070q-CI
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:01:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n7eTo-0008NF-V3
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:20:01 -0500
Received: from [2a00:1450:4864:20::530] (port=34654
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n7eTm-0006jq-Cr
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:20:00 -0500
Received: by mail-ed1-x530.google.com with SMTP id u25so10664859edf.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 06:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FAYvpuCNCez0LKM7653xbVznWv16QmdgybFo9Wqpoh4=;
 b=PyDH29q1AYio2fjkgHHFIed1RUHdP5ZlZKhHeTyvH1PMOCP6DRliSgOb5EeyDfbDec
 MtQwAQ3QLi1Y4gVv5P4hV3T+cDcH1rUbnryAPLNu/CbRjCdL3zonS5kQwwiTsvT9iOSP
 MasqL0eQyAXD5aOw8FJUuJHlkvIU4AkR9Kg91yiGthqqVQaDr6psZsLAw9d7m5zqQmnX
 a+zxziAHivMew//NTmXwl5O2xHExYE22x7IutbFRfuTzDF5fZuZd8zBZTJRDq7QTUgVU
 1vuLje4FIGaitAV4mZGOM9lAQdAAY8xGrDFJxrCmbGKgkisA3T9JLa4HGa9bnkcVbhJL
 sW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FAYvpuCNCez0LKM7653xbVznWv16QmdgybFo9Wqpoh4=;
 b=3LNK/BNBSonPR+2QKnR5NotW+6vwuN5PhKm02xDlJayRrDbBv9T6bf18aOrWCkwagi
 gb+YuPtjLytUGVKl0oaFdfSD8pdaVWYXhuD8lfyp/Xai1Q+DqYsBswAnFyAjXejXXJmi
 rOFJDwhkpjsr1riJ86luC8iTu2p5PgLEDp7PacE5tB8yVzpgtkiIDBVX+qmkyMswRQiJ
 Gh2LBa2SQKX21CmOVaZ43nazrKmLaqNgutSTbhENamgOPFLcq3lVLmiXrpWkN8Z/NLOa
 59ve/0ADwVuuXJVZjaybcWRnrJpMMpGvoUxLmpuOaWBFq4FpGUnKbY7Ax5hU50ftLDzk
 FY8g==
X-Gm-Message-State: AOAM532vBEResizVTrNscpR2iKR47ITf1Uze3d5nbFEAKsFvLe/3we0y
 59UfrCn5e+E2QrXMFYSUNSOZpI4j2TU=
X-Google-Smtp-Source: ABdhPJx58SmHynG/BMkH1LYp6Z0G7uA1mQzCXwdxcrfr+ePBoaBQWc0nRc59oaUYoJTAYaaY6edMUg==
X-Received: by 2002:a17:907:2ce5:: with SMTP id
 hz5mr7813239ejc.153.1641997196007; 
 Wed, 12 Jan 2022 06:19:56 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x20sm6137893edd.28.2022.01.12.06.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 06:19:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v5 04/18] block/file-posix: Simplify the XFS_IOC_DIOINFO
 handling
Date: Wed, 12 Jan 2022 15:19:53 +0100
Message-Id: <20220112141953.59545-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220112141953.59545-1-pbonzini@redhat.com>
References: <20220112141953.59545-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The handling for the XFS_IOC_DIOINFO ioctl is currently quite excessive:
This is not a "real" feature like the other features that we provide with
the "--enable-xxx" and "--disable-xxx" switches for the configure script,
since this does not influence lots of code (it's only about one call to
xfsctl() in file-posix.c), so people don't gain much with the ability to
disable this with "--disable-xfsctl".
It's also unfortunate that the ioctl will be disabled on Linux in case
the user did not install the right xfsprogs-devel package before running
configure. Thus let's simplify this by providing the ioctl definition
on our own, so we can completely get rid of the header dependency and
thus the related code in the configure script.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211215125824.250091-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c                            | 37 ++++++++-----------
 configure                                     | 31 ----------------
 meson.build                                   |  1 -
 .../ci/org.centos/stream/8/x86_64/configure   |  1 -
 scripts/coverity-scan/run-coverity-scan       |  2 +-
 5 files changed, 17 insertions(+), 55 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index b283093e5b..1f1756e192 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -106,10 +106,6 @@
 #include <sys/diskslice.h>
 #endif
 
-#ifdef CONFIG_XFS
-#include <xfs/xfs.h>
-#endif
-
 /* OS X does not have O_DSYNC */
 #ifndef O_DSYNC
 #ifdef O_SYNC
@@ -156,9 +152,6 @@ typedef struct BDRVRawState {
     int perm_change_flags;
     BDRVReopenState *reopen_state;
 
-#ifdef CONFIG_XFS
-    bool is_xfs:1;
-#endif
     bool has_discard:1;
     bool has_write_zeroes:1;
     bool discard_zeroes:1;
@@ -409,14 +402,22 @@ static void raw_probe_alignment(BlockDriverState *bs, int fd, Error **errp)
     if (probe_logical_blocksize(fd, &bs->bl.request_alignment) < 0) {
         bs->bl.request_alignment = 0;
     }
-#ifdef CONFIG_XFS
-    if (s->is_xfs) {
-        struct dioattr da;
-        if (xfsctl(NULL, fd, XFS_IOC_DIOINFO, &da) >= 0) {
-            bs->bl.request_alignment = da.d_miniosz;
-            /* The kernel returns wrong information for d_mem */
-            /* s->buf_align = da.d_mem; */
-        }
+
+#ifdef __linux__
+    /*
+     * The XFS ioctl definitions are shipped in extra packages that might
+     * not always be available. Since we just need the XFS_IOC_DIOINFO ioctl
+     * here, we simply use our own definition instead:
+     */
+    struct xfs_dioattr {
+        uint32_t d_mem;
+        uint32_t d_miniosz;
+        uint32_t d_maxiosz;
+    } da;
+    if (ioctl(fd, _IOR('X', 30, struct xfs_dioattr), &da) >= 0) {
+        bs->bl.request_alignment = da.d_miniosz;
+        /* The kernel returns wrong information for d_mem */
+        /* s->buf_align = da.d_mem; */
     }
 #endif
 
@@ -798,12 +799,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
 #endif
     s->needs_alignment = raw_needs_alignment(bs);
 
-#ifdef CONFIG_XFS
-    if (platform_test_xfs_fd(s->fd)) {
-        s->is_xfs = true;
-    }
-#endif
-
     bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK;
     if (S_ISREG(st.st_mode)) {
         /* When extending regular files, we get zeros from the OS */
diff --git a/configure b/configure
index 030728d11e..3a523a3d14 100755
--- a/configure
+++ b/configure
@@ -291,7 +291,6 @@ EXTRA_CXXFLAGS=""
 EXTRA_LDFLAGS=""
 
 xen_ctrl_version="$default_feature"
-xfs="$default_feature"
 membarrier="$default_feature"
 vhost_kernel="$default_feature"
 vhost_net="$default_feature"
@@ -1021,10 +1020,6 @@ for opt do
   ;;
   --enable-opengl) opengl="yes"
   ;;
-  --disable-xfsctl) xfs="no"
-  ;;
-  --enable-xfsctl) xfs="yes"
-  ;;
   --disable-zlib-test)
   ;;
   --enable-guest-agent) guest_agent="yes"
@@ -1431,7 +1426,6 @@ cat << EOF
   avx512f         AVX512F optimization support
   replication     replication support
   opengl          opengl support
-  xfsctl          xfsctl support
   qom-cast-debug  cast debugging support
   tools           build qemu-io, qemu-nbd and qemu-img tools
   bochs           bochs image format support
@@ -2323,28 +2317,6 @@ EOF
     fi
 fi
 
-##########################################
-# xfsctl() probe, used for file-posix.c
-if test "$xfs" != "no" ; then
-  cat > $TMPC << EOF
-#include <stddef.h>  /* NULL */
-#include <xfs/xfs.h>
-int main(void)
-{
-    xfsctl(NULL, 0, 0, NULL);
-    return 0;
-}
-EOF
-  if compile_prog "" "" ; then
-    xfs="yes"
-  else
-    if test "$xfs" = "yes" ; then
-      feature_not_found "xfs" "Install xfsprogs/xfslibs devel"
-    fi
-    xfs=no
-  fi
-fi
-
 ##########################################
 # plugin linker support probe
 
@@ -3456,9 +3428,6 @@ echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
 if test "$block_drv_whitelist_tools" = "yes" ; then
   echo "CONFIG_BDRV_WHITELIST_TOOLS=y" >> $config_host_mak
 fi
-if test "$xfs" = "yes" ; then
-  echo "CONFIG_XFS=y" >> $config_host_mak
-fi
 qemu_version=$(head $source_path/VERSION)
 echo "PKGVERSION=$pkgversion" >>$config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
diff --git a/meson.build b/meson.build
index f0567daf42..be592aa942 100644
--- a/meson.build
+++ b/meson.build
@@ -3445,7 +3445,6 @@ if spice_protocol.found()
   summary_info += {'  spice server support': spice}
 endif
 summary_info += {'rbd support':       rbd}
-summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
 summary_info += {'smartcard support': cacard}
 summary_info += {'U2F support':       u2f}
 summary_info += {'libusb':            libusb}
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index 048e80dc49..e05f2fddcc 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/configure
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -151,7 +151,6 @@
 --disable-whpx \
 --disable-xen \
 --disable-xen-pci-passthrough \
---disable-xfsctl \
 --disable-xkbcommon \
 --disable-zstd \
 --enable-attr \
diff --git a/scripts/coverity-scan/run-coverity-scan b/scripts/coverity-scan/run-coverity-scan
index 7395bbfad4..6d443250a9 100755
--- a/scripts/coverity-scan/run-coverity-scan
+++ b/scripts/coverity-scan/run-coverity-scan
@@ -398,7 +398,7 @@ echo "Configuring..."
     --enable-xen --enable-brlapi \
     --enable-linux-aio --enable-attr \
     --enable-cap-ng --enable-trace-backends=log --enable-spice --enable-rbd \
-    --enable-xfsctl --enable-libusb --enable-usb-redir \
+    --enable-libusb --enable-usb-redir \
     --enable-libiscsi --enable-libnfs --enable-seccomp \
     --enable-tpm --enable-libssh --enable-lzo --enable-snappy --enable-bzip2 \
     --enable-numa --enable-rdma --enable-smartcard --enable-virglrenderer \
-- 
2.33.1

