Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F92639A269
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:42:56 +0200 (CEST)
Received: from localhost ([::1]:39348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loncc-0006DX-W7
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXX-00032e-Ox; Thu, 03 Jun 2021 09:37:39 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXV-00009K-Cj; Thu, 03 Jun 2021 09:37:39 -0400
Received: by mail-ed1-x531.google.com with SMTP id cb9so7184701edb.1;
 Thu, 03 Jun 2021 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qIrFxkpuGXtIV+9EMRvjcnSutFmqrJXoTEv9Vpq96gE=;
 b=oN6jqBue4ShFgKipmHCnoWAU3ag7udIjN0R5rQqJ+Ihf4azl6cgKpXTbrgA39m+3Fw
 6Acd0PEqPmW2Mw+YA0Qppc6hHF0Tik7UIshNr+mEpvTIWMRLyA8ej/qzMMaCoLiVE3/n
 RMSkwfkS661ynOUPdwTJR6L0dtRuPQF0IcbqOQj1CVcmB0F6M9OlGNbMvLQh7SbhU7Lg
 2wkt+l09V3zsI0J7N4ykSNpr4t4WDP1rQN+B60uClEql8IUZwEfpwtulUSV3AjcVO7yL
 dsPRd0ZotxtXOR3GXut3ClL/ECWdH5UtXb77pHwd5zZFtxjK2i7MCFGpc2oVx1EDynRD
 rNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qIrFxkpuGXtIV+9EMRvjcnSutFmqrJXoTEv9Vpq96gE=;
 b=E3YaLQvE2zfnRYQoxwh+kWtctSYQfdHk1hkwpJGMYTinjS8LH0vuUnkXuoiDjmrrLw
 cx4UI8gFO0MPoCZlHf99G2L/EjjB6sY/VpjTKRKhTBXxnHTjIaBQ0fKXojgtVKZZcQqp
 c2ZHbpddrvELkJhFW50PB+idagYGq0NSf0rpVOdt9vT0e+PLsLXwVdrkSzC3Gb/l6MoL
 dBJit8AqZ1vgz93vkdciz9gQQD9x2fegWMySqrlzgRQ0jxXCokLz1+MzAxRRDcuccYne
 zP6aGMwvaAZtG0D+t9TQNkAQ/77MUQfzzALtZGPCtxQs3DnwLE6++VI+JE/T+7C980iM
 bvIw==
X-Gm-Message-State: AOAM530IFZtfbWQCZccrje0lvtCboHW8XdQJGsuEwB8XvEGM+YTtw2Qm
 m0H3mSzuy2yc1iUf8rdiOzXxloDl2CrsCg==
X-Google-Smtp-Source: ABdhPJy1PfyxNep9Uo9hdj7n2CVxskOcvf3LJG10Otz1c+UuQQhhchMXz0r5c4yFnW72z2gl9xcprw==
X-Received: by 2002:a05:6402:1bd1:: with SMTP id
 ch17mr1185125edb.357.1622727455705; 
 Thu, 03 Jun 2021 06:37:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e24sm1555369ejb.52.2021.06.03.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:37:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] block: feature detection for host block support
Date: Thu,  3 Jun 2021 15:37:20 +0200
Message-Id: <20210603133722.218465-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603133722.218465-1-pbonzini@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: kwolf@redhat.com, Joelle van Dyne <j@getutm.app>, qemu-block@nongnu.org
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
index 1439293f63..5821e1afed 100644
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
@@ -3028,6 +3041,7 @@ static BlockStatsSpecific *raw_get_specific_stats(BlockDriverState *bs)
     return stats;
 }
 
+#if defined(HAVE_HOST_BLOCK_DEVICE)
 static BlockStatsSpecific *hdev_get_specific_stats(BlockDriverState *bs)
 {
     BlockStatsSpecific *stats = g_new(BlockStatsSpecific, 1);
@@ -3037,6 +3051,7 @@ static BlockStatsSpecific *hdev_get_specific_stats(BlockDriverState *bs)
 
     return stats;
 }
+#endif /* HAVE_HOST_BLOCK_DEVICE */
 
 static QemuOptsList raw_create_opts = {
     .name = "raw-create-opts",
@@ -3252,6 +3267,8 @@ BlockDriver bdrv_file = {
 /***********************************************/
 /* host device */
 
+#if defined(HAVE_HOST_BLOCK_DEVICE)
+
 #if defined(__APPLE__) && defined(__MACH__)
 static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
                                 CFIndex maxPathSize, int flags);
@@ -3544,16 +3561,6 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
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
@@ -3877,6 +3884,8 @@ static BlockDriver bdrv_host_cdrom = {
 };
 #endif /* __FreeBSD__ */
 
+#endif /* HAVE_HOST_BLOCK_DEVICE */
+
 static void bdrv_file_init(void)
 {
     /*
@@ -3884,6 +3893,7 @@ static void bdrv_file_init(void)
      * registered last will get probed first.
      */
     bdrv_register(&bdrv_file);
+#if defined(HAVE_HOST_BLOCK_DEVICE)
     bdrv_register(&bdrv_host_device);
 #ifdef __linux__
     bdrv_register(&bdrv_host_cdrom);
@@ -3891,6 +3901,7 @@ static void bdrv_file_init(void)
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
     bdrv_register(&bdrv_host_cdrom);
 #endif
+#endif /* HAVE_HOST_BLOCK_DEVICE */
 }
 
 block_init(bdrv_file_init);
diff --git a/meson.build b/meson.build
index 913cf2a41a..9387fc5799 100644
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
@@ -1072,6 +1072,9 @@ if get_option('cfi')
   add_global_link_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
 endif
 
+have_host_block_device = (targetos != 'darwin' or
+    cc.has_header('IOKit/storage/IOMedia.h'))
+
 #################
 # config-host.h #
 #################
@@ -1165,6 +1168,7 @@ config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
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



