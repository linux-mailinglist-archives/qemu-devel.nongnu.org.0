Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DB1489BD2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:07:59 +0100 (CET)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wH8-0003eh-4d
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:07:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqt-0001w0-Lw
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:51 -0500
Received: from [2a00:1450:4864:20::52e] (port=40734
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqo-0000Se-Sa
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:49 -0500
Received: by mail-ed1-x52e.google.com with SMTP id a18so53406522edj.7
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JePqecmS0meombKTS33f5FvbmSwi5wC8hckPf3PFsDw=;
 b=T+4QuvGseB28cC6tFL3aJUljbj8vSI8TanuVHQ0gBAnK8VL8+z7Ge+A3wvDqjYOjql
 LdM8jVpsPbpmBhU2smRIzvn0PWuj0t1VE+2kwQI55NLxbReWkFiTBv5FSS+a1A8nyohj
 2HXR3SsAe/HvzhBu9ZUxq+VQP2TZlgphf8wqpFOF11dHTo5jPoReWv4aU6SxNd3chOsM
 f3J8lU0J8I8IrkiQqj2QTBhGFoqn9/q6+Of0BKrS7cPs2iYHe2+//STwmPPg1ZdtyK1k
 evlfSSQy9OPhdSgLNO1GZFjYcWEGJp8bzV8+xT1H4eVt9cVqzUUSrVtnIOVMDLDBoss8
 LAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JePqecmS0meombKTS33f5FvbmSwi5wC8hckPf3PFsDw=;
 b=nApjBz5gK+/w08RCVa2z+ABrC1X0OIM51qLzund0EFY93IY1s25uhm3SJE2bfmvrgE
 smJcy/zJX9noFIjsKg0d2rGp1OKqrzuDvOEx18MaQjLRHBsZpNy3eoIiK7medzEDHEZh
 cJ8kcJiQxRr7HAhuqD9zrr+uhEETQ1dUWLe2p4IEC8xFJWUFf4+xWcb/iIyuFm0G5nuo
 PAd+0tmxgnMe3BDzppZ6KJlrSRcHsNuvv2t6CVj4QzQQ13ri+y55dke512KNDdR5LYh4
 5unMyLJFSWsACZ8VLoIAR3EWwmbyUVqFrfg3f4Sy1S1rfGTwzazZhMm9F3S8Xj4DaQMN
 8HHw==
X-Gm-Message-State: AOAM533sVVJMFsRDb2R7RhHGX/X6wmuD5/Tdt1WEhCYDWzwN/w83iI7z
 NGoASofcUxntulwOgIKS9k7M5nRgcX4=
X-Google-Smtp-Source: ABdhPJzk/4DavMCnwGFsIYOfZqpXMngbOX490eJfiL9tcmvo7Qmlg98di7X8Q0O9PotIcyHbgmazJw==
X-Received: by 2002:a05:6402:5202:: with SMTP id
 s2mr67936473edd.206.1641825645092; 
 Mon, 10 Jan 2022 06:40:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/18] block/file-posix: Simplify the XFS_IOC_DIOINFO handling
Date: Mon, 10 Jan 2022 15:40:20 +0100
Message-Id: <20220110144034.67410-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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
 block/file-posix.c | 37 ++++++++++++++++---------------------
 configure          | 31 -------------------------------
 meson.build        |  1 -
 3 files changed, 16 insertions(+), 53 deletions(-)

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
index 5f0b6300b4..5a57906e98 100644
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
-- 
2.33.1



