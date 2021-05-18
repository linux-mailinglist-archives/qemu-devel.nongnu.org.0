Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64B3387438
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:42:33 +0200 (CEST)
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livJ8-0006de-7L
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFv-0003YC-2D; Tue, 18 May 2021 04:39:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livFp-00048a-LL; Tue, 18 May 2021 04:39:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id r12so9250831wrp.1;
 Tue, 18 May 2021 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3IOoGiTeTATnDAZQ2tgPicty7sASRWe0f4T7r6PyMl0=;
 b=cEAwVdPVxi8bY2UwmP/oVScHchYcA/rI1Gvhcqkj4e1PdAMcls4JtYCoDcO+zygKc/
 SywQMnN1UbI0/4At292lCbOdisjtlaYAyw4qiKqhMnHj8RX8qM6DKv2YSGjnd3XX8di5
 esoDoZ8UA+8IoaPDzZhGYcLpSOkL512N00eQi2ANY+zy7LvMsBr6eYMO7f+MWBh9ehwf
 GM3Rtoluqdq7W9daPWnCHpVO7rtFA8Ks289RtIiqjn4Fw/pEWK1unPX9ZdT2HtK7qlaX
 wAma+6c3k/CpEfIFMq2ckXqBKz7dnEwSWvPXuLj9bTA/pNmOBpfSVetogkoosDt/kpbJ
 c/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3IOoGiTeTATnDAZQ2tgPicty7sASRWe0f4T7r6PyMl0=;
 b=CeFK0SMOG7tpDjI5imn5KJvrd9HNxcmy9uMNuUfxoyEdsaGr42EILXoGobCmXU5TnO
 BcgjnASLrCsoQoyJY7T26sFLdMF3TlA62IdccVnlEAuxCooum4ZRCQ/0IMvr/DnElvyE
 p1NmC3IibJ8SwX8fzZ7zpjOmCarlmUwU9wWQdWSM190qlxlWagkWXKmyss0kSi5/aNJr
 RcmTNrfgekEZiyJS1vEFu0JUx2GvM/vZ2HQikj0E6oF1/jKYXTK3lf3ZnPValDB15eSY
 CSHHj+sKg/GWRvpUM5SPPDNCCBZKZbxsNoB6GtFfZrY0l6UJiar/ySEi0uQKyajlDeys
 IB/w==
X-Gm-Message-State: AOAM5326xXme9I1BGklk5uQu+XvIiWOtOcB6HTR8nqmxl6ZuR0FaRkpF
 gYwcciDRSVLwOasdmyHSULXOCAJrhtDAtQ==
X-Google-Smtp-Source: ABdhPJxTElG2TYrsVgz5ESw2ihQqeqxxTRfjm9vUKKl2HEoGHW/645yR8iKvj1Rnlt794KjPZ23MAQ==
X-Received: by 2002:adf:f7c9:: with SMTP id a9mr5371955wrq.395.1621327144076; 
 Tue, 18 May 2021 01:39:04 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y6sm70959wmy.23.2021.05.18.01.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:39:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] block: feature detection for host block support
Date: Tue, 18 May 2021 10:38:59 +0200
Message-Id: <20210518083901.97369-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518083901.97369-1-pbonzini@redhat.com>
References: <20210518083901.97369-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Joelle van Dyne <j@getutm.app>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

On Darwin (iOS), there are no system level APIs for directly accessing
host block devices. We detect this at configure time.

Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-Id: <20210315180341.31638-2-j@getutm.app>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c   | 33 ++++++++++++++++++++++-----------
 meson.build          |  6 +++++-
 qapi/block-core.json | 10 +++++++---
 3 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 77a45083a6..e83f34a960 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -42,6 +42,8 @@
 #include "scsi/constants.h"
 
 #if defined(__APPLE__) && (__MACH__)
+#include <sys/ioctl.h>
+#if defined(HAVE_HOST_BLOCK_DEVICE)
 #include <paths.h>
 #include <sys/param.h>
 #include <IOKit/IOKitLib.h>
@@ -52,6 +54,7 @@
 //#include <IOKit/storage/IOCDTypes.h>
 #include <IOKit/storage/IODVDMedia.h>
 #include <CoreFoundation/CoreFoundation.h>
+#endif /* defined(HAVE_HOST_BLOCK_DEVICE) */
 #endif
 
 #ifdef __sun__
@@ -180,7 +183,17 @@ typedef struct BDRVRawReopenState {
     bool check_cache_dropped;
 } BDRVRawReopenState;
 
-static int fd_open(BlockDriverState *bs);
+static int fd_open(BlockDriverState *bs)
+{
+    BDRVRawState *s = bs->opaque;
+
+    /* this is just to ensure s->fd is sane (its called by io ops) */
+    if (s->fd >= 0) {
+        return 0;
+    }
+    return -EIO;
+}
+
 static int64_t raw_getlength(BlockDriverState *bs);
 
 typedef struct RawPosixAIOData {
@@ -3017,6 +3030,7 @@ static BlockStatsSpecific *raw_get_specific_stats(BlockDriverState *bs)
     return stats;
 }
 
+#if defined(HAVE_HOST_BLOCK_DEVICE)
 static BlockStatsSpecific *hdev_get_specific_stats(BlockDriverState *bs)
 {
     BlockStatsSpecific *stats = g_new(BlockStatsSpecific, 1);
@@ -3026,6 +3040,7 @@ static BlockStatsSpecific *hdev_get_specific_stats(BlockDriverState *bs)
 
     return stats;
 }
+#endif /* HAVE_HOST_BLOCK_DEVICE */
 
 static QemuOptsList raw_create_opts = {
     .name = "raw-create-opts",
@@ -3241,6 +3256,8 @@ BlockDriver bdrv_file = {
 /***********************************************/
 /* host device */
 
+#if defined(HAVE_HOST_BLOCK_DEVICE)
+
 #if defined(__APPLE__) && defined(__MACH__)
 static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
                                 CFIndex maxPathSize, int flags);
@@ -3533,16 +3550,6 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
 }
 #endif /* linux */
 
-static int fd_open(BlockDriverState *bs)
-{
-    BDRVRawState *s = bs->opaque;
-
-    /* this is just to ensure s->fd is sane (its called by io ops) */
-    if (s->fd >= 0)
-        return 0;
-    return -EIO;
-}
-
 static coroutine_fn int
 hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
 {
@@ -3866,6 +3873,8 @@ static BlockDriver bdrv_host_cdrom = {
 };
 #endif /* __FreeBSD__ */
 
+#endif /* HAVE_HOST_BLOCK_DEVICE */
+
 static void bdrv_file_init(void)
 {
     /*
@@ -3873,6 +3882,7 @@ static void bdrv_file_init(void)
      * registered last will get probed first.
      */
     bdrv_register(&bdrv_file);
+#if defined(HAVE_HOST_BLOCK_DEVICE)
     bdrv_register(&bdrv_host_device);
 #ifdef __linux__
     bdrv_register(&bdrv_host_cdrom);
@@ -3880,6 +3890,7 @@ static void bdrv_file_init(void)
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
     bdrv_register(&bdrv_host_cdrom);
 #endif
+#endif /* HAVE_HOST_BLOCK_DEVICE */
 }
 
 block_init(bdrv_file_init);
diff --git a/meson.build b/meson.build
index 5cf0dce695..b3cc45c41d 100644
--- a/meson.build
+++ b/meson.build
@@ -182,7 +182,7 @@ if targetos == 'windows'
                                       include_directories: include_directories('.'))
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
-  iokit = dependency('appleframeworks', modules: 'IOKit')
+  iokit = dependency('appleframeworks', modules: 'IOKit', required: false)
 elif targetos == 'sunos'
   socket = [cc.find_library('socket'),
             cc.find_library('nsl'),
@@ -1067,6 +1067,9 @@ if get_option('cfi')
   add_global_link_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
 endif
 
+have_host_block_device = (targetos != 'darwin' or
+    cc.has_header('IOKit/storage/IOMedia.h'))
+
 #################
 # config-host.h #
 #################
@@ -1160,6 +1163,7 @@ config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
+config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2ea294129e..2dd41be156 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -897,7 +897,8 @@
   'discriminator': 'driver',
   'data': {
       'file': 'BlockStatsSpecificFile',
-      'host_device': 'BlockStatsSpecificFile',
+      'host_device': { 'type': 'BlockStatsSpecificFile',
+                       'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
       'nvme': 'BlockStatsSpecificNvme' } }
 
 ##
@@ -2814,7 +2815,9 @@
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
             'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
-            'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
+            'gluster', 'host_cdrom',
+            {'name': 'host_device', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
+            'http', 'https', 'iscsi',
             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
             'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
@@ -3996,7 +3999,8 @@
       'ftps':       'BlockdevOptionsCurlFtps',
       'gluster':    'BlockdevOptionsGluster',
       'host_cdrom': 'BlockdevOptionsFile',
-      'host_device':'BlockdevOptionsFile',
+      'host_device': { 'type': 'BlockdevOptionsFile',
+                       'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
       'http':       'BlockdevOptionsCurlHttp',
       'https':      'BlockdevOptionsCurlHttps',
       'iscsi':      'BlockdevOptionsIscsi',
-- 
2.31.1



