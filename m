Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB1F47E2CB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:59:54 +0100 (CET)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0MlF-00027V-Kk
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:59:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdN-0004I1-EZ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:45 -0500
Received: from [2a00:1450:4864:20::42b] (port=36419
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdI-0008Or-DU
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:42 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r17so10965510wrc.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z6I+SMUEMqCO+sBfVu8hmaBQHAkiAEVjZO5GR+m0mdQ=;
 b=oEurIMHVEDG6uq2rzE+Y9EaZNaWCUjHzi9AqWKhJNpgi1ukaV+Om+TcTsd+lK8qOd9
 Z8gPNcQpxB8lBVQp5YpN7stfOOrLjnEPDd/VylNIl7ce4Yz7tQ0EIzpjTy5maRRAMmDk
 HFz1q+ZKsebx+qA1O39DoO9pUD1yyahLqOdHo8mzd6wi7q7mlYyy/6ZEsbMgoO9zRdrm
 jVOgdBGMzJ6YoAKZKhyxLZq85m157//S37jYNaJSK5yjSjmYMyxAM+JESKjEk7LIGDxw
 HNu+b/FoXphPCjv2PRiyHw+tCVm5rJZLy6q4IaLdWUNwEf1Aez1SUwazNY3jfJ0QWlAp
 kJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z6I+SMUEMqCO+sBfVu8hmaBQHAkiAEVjZO5GR+m0mdQ=;
 b=OA1Eb4ujjXd9tMgFImYr0KuvHwr1z8sEegwCvI5qK01iKoLwu0+lHZqfbBbEb5Vhiy
 tz2MKNBwtSQBUd4u8YhH6GwCh59xABxQbaMLouJWtkFdkUQF6ZKWMNdRH9S84AOfrFZD
 Ec3HYoscpdODOMafwN4froG92izrGOu9uWHKwZZHWn+CBYGbIAbzXGOpI349bN9A4hbP
 vqH09bzPYQDAWibIxLuuhvsaYjQPr8oAMgsOPwzTJjyNHxHeU60yAmTA/cvrYvyFL4ZB
 NvNTT7fQ8lxNFkCYU6nOg0qv4bbQGOgRbtgVL7YydS9KcZnajeRAYk9ezp2sAUAisrre
 Ftsg==
X-Gm-Message-State: AOAM5329r7+XlfwcGOE0Redm04zwP1jGEGByA49ISuHSKdWLKGg8NDNX
 WtJ7ezB6yopjNUgE2OmVfpN74bJtF8U=
X-Google-Smtp-Source: ABdhPJyAvHqjnq/kor6PlyoNIw8gXRsGiB87W7c2SSJo/DQLQq1isR2fEAe+BuANakqzyz4ztJdAqg==
X-Received: by 2002:a5d:6b8f:: with SMTP id n15mr1499493wrx.189.1640260298933; 
 Thu, 23 Dec 2021 03:51:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] block/file-posix: Simplify the XFS_IOC_DIOINFO handling
Date: Thu, 23 Dec 2021 12:51:24 +0100
Message-Id: <20211223115134.579235-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
index 8ccfe51673..b66ab31834 100755
--- a/configure
+++ b/configure
@@ -291,7 +291,6 @@ EXTRA_CXXFLAGS=""
 EXTRA_LDFLAGS=""
 
 xen_ctrl_version="$default_feature"
-xfs="$default_feature"
 membarrier="$default_feature"
 vhost_kernel="$default_feature"
 vhost_net="$default_feature"
@@ -1019,10 +1018,6 @@ for opt do
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
@@ -1429,7 +1424,6 @@ cat << EOF
   avx512f         AVX512F optimization support
   replication     replication support
   opengl          opengl support
-  xfsctl          xfsctl support
   qom-cast-debug  cast debugging support
   tools           build qemu-io, qemu-nbd and qemu-img tools
   bochs           bochs image format support
@@ -2321,28 +2315,6 @@ EOF
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
 
@@ -3454,9 +3426,6 @@ echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
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
index 879628ab68..993a591983 100644
--- a/meson.build
+++ b/meson.build
@@ -3422,7 +3422,6 @@ if spice_protocol.found()
   summary_info += {'  spice server support': spice}
 endif
 summary_info += {'rbd support':       rbd}
-summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
 summary_info += {'smartcard support': cacard}
 summary_info += {'U2F support':       u2f}
 summary_info += {'libusb':            libusb}
-- 
2.33.1



