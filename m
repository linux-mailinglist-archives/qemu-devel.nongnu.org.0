Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729E3B4583
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:27:32 +0200 (CEST)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmnr-0000rv-Hl
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfN-0003VL-8t
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:45 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfL-0003Gc-Ey
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:44 -0400
Received: by mail-ej1-x633.google.com with SMTP id ot9so14371657ejb.8
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=arX+811Fkq+PDjksSN+JOqKo9fQXt3s9scD5oPGpotw=;
 b=Z/7cxK60AirNIf9fVaUacbOI4UxnqXPGQlre50BoiCl/P8+CRBNH15qgYaLx6HQ2j5
 p+0Wm2aVYyAWGNLl+uv97Glcq8TF0uZA0jACjvLEpuZB9QNohFvj5uVt8tLV8vGjtuh/
 CJIl12kwC4WaIwQj6+cq2LcBMV/un++R/iQ4Ei3HRkAUupGyfyB4NwVtdUNgxnpdWtC3
 2jCoE7yV4CdE5xXCwQlOGCxqX0xJEuTW0JGwmZge1RY7U2BLzMsYHT9fcB0hX3d8bBCY
 Jhuom5SW5cO4Po73K4kL15dwcDAqe2xtfKxt83aa7ZAbEPcym1kUnSF8zML8J7RCL2iP
 zXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=arX+811Fkq+PDjksSN+JOqKo9fQXt3s9scD5oPGpotw=;
 b=E3F2ltVvAPIsyTY4l1vuBHzjLFtvvCYaykFf3p2arNfGMUQD0EWme2cOV7FQjXsmYH
 Cfo5AJK40hfmoSwnbSTrdCHEL7OMjw1QAVSUr35rXtIYg8p6BwGChuNuM9sAsls1X7Ia
 jcHFG9ewmI6ebwMZnpX+WEko+n/bd1rgXM/cO7wde+IftqSjdNcg+dxvK70CLmFIa6Hk
 hPNcraQ6plo1p6/CwIYT+Swy7qPDgt/p1oNxkuJNcUHvNYE4Z4B8e1naWQjM/799A6Ec
 yDwg4F7BlKiwp2qcfq6JxVdyTaHJACKZHAQ99dLxCbhcx8kYepnBp+DVefwDE5IvjQkl
 GyAw==
X-Gm-Message-State: AOAM532+XPBFZNqnRI2KkNHmBi96C5wqpCLjTgvu/9W4oSiu/HUql1si
 ngwAStXWWnbbeFme5rEW2pv7Cqvlwdc=
X-Google-Smtp-Source: ABdhPJxuJh8l069fwWjFwwFeasBzbHeDSoXq2juK3H0JXSEQrEPwOgNY2MX0I9S8OxuND0HRbKGAFQ==
X-Received: by 2002:a17:907:2637:: with SMTP id
 aq23mr11398613ejc.17.1624630722293; 
 Fri, 25 Jun 2021 07:18:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/28] block: feature detection for host block support
Date: Fri, 25 Jun 2021 16:18:13 +0200
Message-Id: <20210625141822.1368639-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Joelle van Dyne <j@getutm.app>
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
 qapi/block-core.json | 14 ++++++++++----
 3 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index ea102483b0..e56bb491a1 100644
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
@@ -178,7 +181,17 @@ typedef struct BDRVRawReopenState {
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
@@ -3033,6 +3046,7 @@ static BlockStatsSpecific *raw_get_specific_stats(BlockDriverState *bs)
     return stats;
 }
 
+#if defined(HAVE_HOST_BLOCK_DEVICE)
 static BlockStatsSpecific *hdev_get_specific_stats(BlockDriverState *bs)
 {
     BlockStatsSpecific *stats = g_new(BlockStatsSpecific, 1);
@@ -3042,6 +3056,7 @@ static BlockStatsSpecific *hdev_get_specific_stats(BlockDriverState *bs)
 
     return stats;
 }
+#endif /* HAVE_HOST_BLOCK_DEVICE */
 
 static QemuOptsList raw_create_opts = {
     .name = "raw-create-opts",
@@ -3257,6 +3272,8 @@ BlockDriver bdrv_file = {
 /***********************************************/
 /* host device */
 
+#if defined(HAVE_HOST_BLOCK_DEVICE)
+
 #if defined(__APPLE__) && defined(__MACH__)
 static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
                                 CFIndex maxPathSize, int flags);
@@ -3549,16 +3566,6 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
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
@@ -3882,6 +3889,8 @@ static BlockDriver bdrv_host_cdrom = {
 };
 #endif /* __FreeBSD__ */
 
+#endif /* HAVE_HOST_BLOCK_DEVICE */
+
 static void bdrv_file_init(void)
 {
     /*
@@ -3889,6 +3898,7 @@ static void bdrv_file_init(void)
      * registered last will get probed first.
      */
     bdrv_register(&bdrv_file);
+#if defined(HAVE_HOST_BLOCK_DEVICE)
     bdrv_register(&bdrv_host_device);
 #ifdef __linux__
     bdrv_register(&bdrv_host_cdrom);
@@ -3896,6 +3906,7 @@ static void bdrv_file_init(void)
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
     bdrv_register(&bdrv_host_cdrom);
 #endif
+#endif /* HAVE_HOST_BLOCK_DEVICE */
 }
 
 block_init(bdrv_file_init);
diff --git a/meson.build b/meson.build
index 64e23175ab..6419d4ee41 100644
--- a/meson.build
+++ b/meson.build
@@ -183,7 +183,7 @@ if targetos == 'windows'
                                       include_directories: include_directories('.'))
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
-  iokit = dependency('appleframeworks', modules: 'IOKit')
+  iokit = dependency('appleframeworks', modules: 'IOKit', required: false)
 elif targetos == 'sunos'
   socket = [cc.find_library('socket'),
             cc.find_library('nsl'),
@@ -1148,6 +1148,9 @@ if get_option('cfi')
   add_global_link_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
 endif
 
+have_host_block_device = (targetos != 'darwin' or
+    cc.has_header('IOKit/storage/IOMedia.h'))
+
 #################
 # config-host.h #
 #################
@@ -1247,6 +1250,7 @@ config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
+config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2ea294129e..a54f37dbef 100644
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
@@ -2814,7 +2815,10 @@
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
             'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
-            'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
+            'gluster',
+            {'name': 'host_cdrom', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
+            {'name': 'host_device', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
+            'http', 'https', 'iscsi',
             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
             'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
@@ -3995,8 +3999,10 @@
       'ftp':        'BlockdevOptionsCurlFtp',
       'ftps':       'BlockdevOptionsCurlFtps',
       'gluster':    'BlockdevOptionsGluster',
-      'host_cdrom': 'BlockdevOptionsFile',
-      'host_device':'BlockdevOptionsFile',
+      'host_cdrom':  { 'type': 'BlockdevOptionsFile',
+                       'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
+      'host_device': { 'type': 'BlockdevOptionsFile',
+                       'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
       'http':       'BlockdevOptionsCurlHttp',
       'https':      'BlockdevOptionsCurlHttps',
       'iscsi':      'BlockdevOptionsIscsi',
-- 
2.31.1



