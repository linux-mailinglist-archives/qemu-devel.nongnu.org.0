Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC04301321
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 05:58:26 +0100 (CET)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3B0D-00005A-7V
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 23:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3AyV-0006pN-UG; Fri, 22 Jan 2021 23:56:39 -0500
Received: from mail-pj1-f43.google.com ([209.85.216.43]:54561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3AyU-0005nw-6z; Fri, 22 Jan 2021 23:56:39 -0500
Received: by mail-pj1-f43.google.com with SMTP id cq1so5068552pjb.4;
 Fri, 22 Jan 2021 20:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lr0g9cBtE48tU4EJmSiiQmz+iS86Z7gy8ZRT7zhMcpo=;
 b=pTsdKKUldjVNKuR4GUW/m07JlAXiSil0kDbjIkAFepkVTF0/gN7827gPvRxC8ZdTR0
 592jX2dqz2hgoA+5+vFkkPuKVe7JWqecnn0Lzq3uf46Gsv+HJ4YCkXNNl+713TOQC5mF
 nEtor0T+W6qR84OdysZSE/rQ6JC5XKeQ5a3GEgzlTxAO8s2DHUEKH0pMX57U1a+muTHZ
 21ziioA7hErdomZS261hxfVQS7ADTeEh+bMeM252DHsrS9hbAIwy91rj2RXFJmXLZSUn
 gtt/ph7Q1skVZObFzv5ybIFIhV9xArx5SsAvOic7u5qRg+8XrjGIpbNXAbm/HqKe9EMu
 bd0Q==
X-Gm-Message-State: AOAM532u724QScvDGu6GEUs7VeIyyy7VBWj0tewYi8d7FaJbOchdLUwv
 Lp1ILj5X+T1k/NWnyEAO50hD2I1VJ8U=
X-Google-Smtp-Source: ABdhPJykaqXVK26vUry1DtYqtUt9QwGWJXSE8nBsyomf01+7prSvL/ezE0Xmuwm4Pkshydy6RXZBxg==
X-Received: by 2002:a17:90a:de06:: with SMTP id
 m6mr1555925pjv.167.1611377796442; 
 Fri, 22 Jan 2021 20:56:36 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.229])
 by smtp.gmail.com with ESMTPSA id c62sm9872772pfa.116.2021.01.22.20.56.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 20:56:36 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/11] block: feature detection for host block support
Date: Fri, 22 Jan 2021 20:56:22 -0800
Message-Id: <20210123045632.18482-2-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210123045632.18482-1-j@getutm.app>
References: <20210123045632.18482-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.43; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f43.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:raw" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Darwin (iOS), there are no system level APIs for directly accessing
host block devices. We detect this at configure time.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 meson.build          |  6 +++++-
 qapi/block-core.json | 10 +++++++---
 block/file-posix.c   | 33 ++++++++++++++++++++++-----------
 3 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index af2bc89741..27110075df 100644
--- a/meson.build
+++ b/meson.build
@@ -180,7 +180,7 @@ if targetos == 'windows'
                                       include_directories: include_directories('.'))
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
-  iokit = dependency('appleframeworks', modules: 'IOKit')
+  iokit = dependency('appleframeworks', modules: 'IOKit', required: false)
 elif targetos == 'sunos'
   socket = [cc.find_library('socket'),
             cc.find_library('nsl'),
@@ -1023,6 +1023,9 @@ if get_option('cfi')
   add_project_link_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
 endif
 
+have_host_block_device = (targetos != 'darwin' or
+    cc.has_header('IOKit/storage/IOMedia.h'))
+
 #################
 # config-host.h #
 #################
@@ -1113,6 +1116,7 @@ config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
+config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 3484986d1c..1a9576de8d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -959,7 +959,8 @@
   'discriminator': 'driver',
   'data': {
       'file': 'BlockStatsSpecificFile',
-      'host_device': 'BlockStatsSpecificFile',
+      'host_device': { 'type': 'BlockStatsSpecificFile',
+                       'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
       'nvme': 'BlockStatsSpecificNvme' } }
 
 ##
@@ -2827,7 +2828,9 @@
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
@@ -4012,7 +4015,8 @@
       'ftps':       'BlockdevOptionsCurlFtps',
       'gluster':    'BlockdevOptionsGluster',
       'host_cdrom': 'BlockdevOptionsFile',
-      'host_device':'BlockdevOptionsFile',
+      'host_device': { 'type': 'BlockdevOptionsFile',
+                       'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
       'http':       'BlockdevOptionsCurlHttp',
       'https':      'BlockdevOptionsCurlHttps',
       'iscsi':      'BlockdevOptionsIscsi',
diff --git a/block/file-posix.c b/block/file-posix.c
index 00cdaaa2d4..11d2021346 100644
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
@@ -181,7 +184,17 @@ typedef struct BDRVRawReopenState {
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
@@ -3014,6 +3027,7 @@ static BlockStatsSpecific *raw_get_specific_stats(BlockDriverState *bs)
     return stats;
 }
 
+#if defined(HAVE_HOST_BLOCK_DEVICE)
 static BlockStatsSpecific *hdev_get_specific_stats(BlockDriverState *bs)
 {
     BlockStatsSpecific *stats = g_new(BlockStatsSpecific, 1);
@@ -3023,6 +3037,7 @@ static BlockStatsSpecific *hdev_get_specific_stats(BlockDriverState *bs)
 
     return stats;
 }
+#endif /* HAVE_HOST_BLOCK_DEVICE */
 
 static QemuOptsList raw_create_opts = {
     .name = "raw-create-opts",
@@ -3247,6 +3262,8 @@ BlockDriver bdrv_file = {
 /***********************************************/
 /* host device */
 
+#if defined(HAVE_HOST_BLOCK_DEVICE)
+
 #if defined(__APPLE__) && defined(__MACH__)
 static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
                                 CFIndex maxPathSize, int flags);
@@ -3539,16 +3556,6 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
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
@@ -3872,6 +3879,8 @@ static BlockDriver bdrv_host_cdrom = {
 };
 #endif /* __FreeBSD__ */
 
+#endif /* HAVE_HOST_BLOCK_DEVICE */
+
 static void bdrv_file_init(void)
 {
     /*
@@ -3879,6 +3888,7 @@ static void bdrv_file_init(void)
      * registered last will get probed first.
      */
     bdrv_register(&bdrv_file);
+#if defined(HAVE_HOST_BLOCK_DEVICE)
     bdrv_register(&bdrv_host_device);
 #ifdef __linux__
     bdrv_register(&bdrv_host_cdrom);
@@ -3886,6 +3896,7 @@ static void bdrv_file_init(void)
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
     bdrv_register(&bdrv_host_cdrom);
 #endif
+#endif /* HAVE_HOST_BLOCK_DEVICE */
 }
 
 block_init(bdrv_file_init);
-- 
2.28.0


