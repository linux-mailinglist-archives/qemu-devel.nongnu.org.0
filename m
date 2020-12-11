Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FFF2D7CD5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:28:02 +0100 (CET)
Received: from localhost ([::1]:49634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmD3-0001fm-Cp
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluV-0003ld-Dy
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluH-000295-Mp
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2Zq6h7bkhiel0Yl+Jjlx614t8qHnw+60wBkeIOAUNc=;
 b=MyjA3lGeI+0WdcAZl78NyXggGU7Mss7u5pzT6YNbEHJktnzcY7o3tZ7nt3+e7Mycf1zktE
 hC7fLvdU3N7ILkf7F4FKMP0e2iz/LfelCj2b1tSva4t3vo0gJxQGzhFhdIAVj6I8VzwO9m
 Imq+9aN7fhUY56XpRo6ptZi/OOc+bQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-eidId5rVM5OCiDDQl0t0Mw-1; Fri, 11 Dec 2020 12:08:33 -0500
X-MC-Unique: eidId5rVM5OCiDDQl0t0Mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08D19B8100;
 Fri, 11 Dec 2020 17:08:32 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 096DC5D731;
 Fri, 11 Dec 2020 17:08:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/34] fuse: Implement hole detection through lseek
Date: Fri, 11 Dec 2020 18:07:48 +0100
Message-Id: <20201211170812.228643-11-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

This is a relatively new feature in libfuse (available since 3.8.0,
which was released in November 2019), so we have to add a dedicated
check whether it is available before making use of it.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201027190600.192171-7-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 meson_options.txt   |  2 ++
 configure           |  8 ++++-
 block/export/fuse.c | 77 +++++++++++++++++++++++++++++++++++++++++++++
 meson.build         | 20 ++++++++++++
 4 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/meson_options.txt b/meson_options.txt
index 8f9f2e3df6..74ac853548 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -68,6 +68,8 @@ option('vhost_user_blk_server', type: 'feature', value: 'auto',
        description: 'build vhost-user-blk server')
 option('fuse', type: 'feature', value: 'auto',
        description: 'FUSE block device export')
+option('fuse_lseek', type : 'feature', value : 'auto',
+       description: 'SEEK_HOLE/SEEK_DATA support for FUSE exports')
 
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
diff --git a/configure b/configure
index b2f96c0da2..3f823ed163 100755
--- a/configure
+++ b/configure
@@ -450,6 +450,7 @@ ninja=""
 skip_meson=no
 gettext=""
 fuse="auto"
+fuse_lseek="auto"
 
 bogus_os="no"
 malloc_trim="auto"
@@ -1530,6 +1531,10 @@ for opt do
   ;;
   --disable-fuse) fuse="disabled"
   ;;
+  --enable-fuse-lseek) fuse_lseek="enabled"
+  ;;
+  --disable-fuse-lseek) fuse_lseek="disabled"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1856,6 +1861,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   libdaxctl       libdaxctl support
   fuse            FUSE block device export
+  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -7020,7 +7026,7 @@ NINJA=$ninja $meson setup \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
-        -Dfuse=$fuse \
+        -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/block/export/fuse.c b/block/export/fuse.c
index 0b9d226b2f..38f74c94da 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -627,6 +627,80 @@ static void fuse_flush(fuse_req_t req, fuse_ino_t inode,
     fuse_fsync(req, inode, 1, fi);
 }
 
+#ifdef CONFIG_FUSE_LSEEK
+/**
+ * Let clients inquire allocation status.
+ */
+static void fuse_lseek(fuse_req_t req, fuse_ino_t inode, off_t offset,
+                       int whence, struct fuse_file_info *fi)
+{
+    FuseExport *exp = fuse_req_userdata(req);
+
+    if (whence != SEEK_HOLE && whence != SEEK_DATA) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
+    while (true) {
+        int64_t pnum;
+        int ret;
+
+        ret = bdrv_block_status_above(blk_bs(exp->common.blk), NULL,
+                                      offset, INT64_MAX, &pnum, NULL, NULL);
+        if (ret < 0) {
+            fuse_reply_err(req, -ret);
+            return;
+        }
+
+        if (!pnum && (ret & BDRV_BLOCK_EOF)) {
+            int64_t blk_len;
+
+            /*
+             * If blk_getlength() rounds (e.g. by sectors), then the
+             * export length will be rounded, too.  However,
+             * bdrv_block_status_above() may return EOF at unaligned
+             * offsets.  We must not let this become visible and thus
+             * always simulate a hole between @offset (the real EOF)
+             * and @blk_len (the client-visible EOF).
+             */
+
+            blk_len = blk_getlength(exp->common.blk);
+            if (blk_len < 0) {
+                fuse_reply_err(req, -blk_len);
+                return;
+            }
+
+            if (offset > blk_len || whence == SEEK_DATA) {
+                fuse_reply_err(req, ENXIO);
+            } else {
+                fuse_reply_lseek(req, offset);
+            }
+            return;
+        }
+
+        if (ret & BDRV_BLOCK_DATA) {
+            if (whence == SEEK_DATA) {
+                fuse_reply_lseek(req, offset);
+                return;
+            }
+        } else {
+            if (whence == SEEK_HOLE) {
+                fuse_reply_lseek(req, offset);
+                return;
+            }
+        }
+
+        /* Safety check against infinite loops */
+        if (!pnum) {
+            fuse_reply_err(req, ENXIO);
+            return;
+        }
+
+        offset += pnum;
+    }
+}
+#endif
+
 static const struct fuse_lowlevel_ops fuse_ops = {
     .init       = fuse_init,
     .lookup     = fuse_lookup,
@@ -638,6 +712,9 @@ static const struct fuse_lowlevel_ops fuse_ops = {
     .fallocate  = fuse_fallocate,
     .flush      = fuse_flush,
     .fsync      = fuse_fsync,
+#ifdef CONFIG_FUSE_LSEEK
+    .lseek      = fuse_lseek,
+#endif
 };
 
 const BlockExportDriver blk_exp_fuse = {
diff --git a/meson.build b/meson.build
index 6e8ef151d8..f344b25955 100644
--- a/meson.build
+++ b/meson.build
@@ -773,10 +773,28 @@ elif get_option('vhost_user_blk_server').disabled() or not have_system
     have_vhost_user_blk_server = false
 endif
 
+if get_option('fuse').disabled() and get_option('fuse_lseek').enabled()
+  error('Cannot enable fuse-lseek while fuse is disabled')
+endif
+
 fuse = dependency('fuse3', required: get_option('fuse'),
                   version: '>=3.1', method: 'pkg-config',
                   static: enable_static)
 
+fuse_lseek = not_found
+if not get_option('fuse_lseek').disabled()
+  if fuse.version().version_compare('>=3.8')
+    # Dummy dependency
+    fuse_lseek = declare_dependency()
+  elif get_option('fuse_lseek').enabled()
+    if fuse.found()
+      error('fuse-lseek requires libfuse >=3.8, found ' + fuse.version())
+    else
+      error('fuse-lseek requires libfuse, which was not found')
+    endif
+  endif
+endif
+
 #################
 # config-host.h #
 #################
@@ -812,6 +830,7 @@ config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
 config_host_data.set('CONFIG_FUSE', fuse.found())
+config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
@@ -2214,6 +2233,7 @@ summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
+summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary(summary_info, bool_yn: true)
 
 if not supported_cpus.contains(cpu)
-- 
2.29.2


