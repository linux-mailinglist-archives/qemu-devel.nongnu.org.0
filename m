Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5413B4759C3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 14:35:48 +0100 (CET)
Received: from localhost ([::1]:43336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxURf-0004pX-Dp
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 08:35:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxTrl-0006iY-KE
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:58:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxTrj-0005SC-Gq
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639573119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jxs5VKpzdwhALfjqhDYzr0GvZpYK6+uFqhSC+CIjp1s=;
 b=cn3u03v1UYcKG8zcRTaMUKmfvcDSIWBpYKDbPbmL4CvDXs/sy8CLLkRWMEDQOaMWw/Mp0Y
 NKGfcalu6vrkni1B+arpH95R8VU2SAsqn27lXv/ValpyvXwSp5EFXYQmj5t9JW4u/ekHKq
 CzAp39N9eAydj0XD2e8E9NtQsPAmuWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-zfijBs4-P1aVVLPD-JAVqQ-1; Wed, 15 Dec 2021 07:58:33 -0500
X-MC-Unique: zfijBs4-P1aVVLPD-JAVqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C34E4801B35;
 Wed, 15 Dec 2021 12:58:32 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94DD85F6B7;
 Wed, 15 Dec 2021 12:58:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/file-posix: Simplify the XFS_IOC_DIOINFO handling
Date: Wed, 15 Dec 2021 13:58:24 +0100
Message-Id: <20211215125824.250091-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index bb99a40ed0..e0d8bedd3a 100755
--- a/configure
+++ b/configure
@@ -291,7 +291,6 @@ EXTRA_CXXFLAGS=""
 EXTRA_LDFLAGS=""
 
 xen_ctrl_version="$default_feature"
-xfs="$default_feature"
 membarrier="$default_feature"
 vhost_kernel="$default_feature"
 vhost_net="$default_feature"
@@ -1020,10 +1019,6 @@ for opt do
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
@@ -1448,7 +1443,6 @@ cat << EOF
   avx512f         AVX512F optimization support
   replication     replication support
   opengl          opengl support
-  xfsctl          xfsctl support
   qom-cast-debug  cast debugging support
   tools           build qemu-io, qemu-nbd and qemu-img tools
   bochs           bochs image format support
@@ -2340,28 +2334,6 @@ EOF
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
 
@@ -3478,9 +3450,6 @@ echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
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
index ae67ca28ab..bd2ed3dd49 100644
--- a/meson.build
+++ b/meson.build
@@ -3417,7 +3417,6 @@ if spice_protocol.found()
   summary_info += {'  spice server support': spice}
 endif
 summary_info += {'rbd support':       rbd}
-summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
 summary_info += {'smartcard support': cacard}
 summary_info += {'U2F support':       u2f}
 summary_info += {'libusb':            libusb}
-- 
2.27.0


