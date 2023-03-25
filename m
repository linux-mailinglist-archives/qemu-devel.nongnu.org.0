Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB3D6C8F3D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 16:55:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg6Cn-0005Uv-QH; Sat, 25 Mar 2023 11:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fufuyqqqqqq@gmail.com>)
 id 1pg2ii-00037N-3z; Sat, 25 Mar 2023 08:10:04 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fufuyqqqqqq@gmail.com>)
 id 1pg2if-00009h-L2; Sat, 25 Mar 2023 08:10:03 -0400
Received: by mail-qt1-x82e.google.com with SMTP id s12so362268qtx.11;
 Sat, 25 Mar 2023 05:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679746200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nIk4Ftu5LpbIyNP7uODmVFJADX/1dskgtVg2XJ97txU=;
 b=mIY3wMT9bI2lUErkO0gSvEdjGOJtVatlEPMXF8B0XYMb9mLqJrar/pzSfdrdf2QN6g
 d7W8XlqDJ/OunLJHxuVNvfJDWbQs0cydDcS79LOfleUZad/gODUU3Az+qBnOuujvsIRN
 6yKClxBJVkJ6a34eLcAV5nHxi8aYoFM2zcABmAPQLxm2Y6/AakBblJLJhpWBuyC0Jjse
 tGcrD9hJY1YZcPg2kZl2fHGyf0Pbnk+RLzsQgsW7BuijP616/1o9vch2mjxB/wU1/VXb
 Yb64WicQsERynbaDCyCUkF6uh7z7yA2OAoY63toJMU2ZakD9BsGSs2hxQL7qW7GRPFpa
 QxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679746200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nIk4Ftu5LpbIyNP7uODmVFJADX/1dskgtVg2XJ97txU=;
 b=O0B66uRfSvghxBAIJeKTyLsvxXmu3KOf3ioNvKOMgJZUxQgKFF20ZvUkCjV+NRg50s
 nPXewj8HBHK+ln9qsRR6Q5t1JwOvrnGrQmR6MenB54NGJvqgF2KwvqXsaZNzVorAglkY
 4iJmpRxx6kG7T7OLFg0oU7OQ632qzQTCQOPNWnU3jbNkpYas3BB1VBr+rj+TwpXwo5Y1
 Xmx2PM07EyDrpCQitMyMuy7oq1KV02gQz1BB5+rw3Z5GdH7j+xcserRl1oNMEvfuoNgT
 Ns5EYnX6C69s1v30xmGJsVAqGGNrInt0RY7bsK6ffNiY1bCcyYkPdU5hSQLPXRCzGbTC
 Kwfw==
X-Gm-Message-State: AAQBX9dR/vuz/CcIa3MKj7Cx18ZONhRl6qHnTBqMphLTXv0NTeO6Lw5E
 o8uVrPHMKd3x5sABtVS3YiIUKNyzzllYw7miHkM=
X-Google-Smtp-Source: AKy350YrNFm96uuGF3CJ/UugnJbYpvENsxheIjamQ1I9Z4BPOv2PmvTiGTlv/qhxKLbe1g1ZRKAKXQ==
X-Received: by 2002:a17:902:e5cf:b0:19a:c65d:f90 with SMTP id
 u15-20020a170902e5cf00b0019ac65d0f90mr6005881plf.44.1679734353281; 
 Sat, 25 Mar 2023 01:52:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:8900:c84:a112:bd7b:48e3:7174:ae1e])
 by smtp.gmail.com with ESMTPSA id
 je9-20020a170903264900b001a065d3ea3bsm15391991plb.295.2023.03.25.01.52.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 Mar 2023 01:52:32 -0700 (PDT)
From: Yeqi Fu <fufuyqqqqqq@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Yeqi Fu <fufuyqqqqqq@gmail.com>
Subject: [PATCH v3] block: replace TABs with space
Date: Sat, 25 Mar 2023 16:52:24 +0800
Message-Id: <20230325085224.23842-1-fufuyqqqqqq@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=fufuyqqqqqq@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Mar 2023 11:53:18 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Bring the block files in line with the QEMU coding style, with spaces
for indentation. This patch partially resolves the issue 371.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/371
Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
---
 block/bochs.c       |  18 +++----
 block/file-posix.c  | 126 ++++++++++++++++++++++----------------------
 block/file-win32.c  |  66 +++++++++++------------
 block/parallels.c   |  34 ++++++------
 block/qcow.c        |  44 ++++++++--------
 include/block/nbd.h |   2 +-
 6 files changed, 145 insertions(+), 145 deletions(-)

diff --git a/block/bochs.c b/block/bochs.c
index 2f5ae52c90..18f48d2f89 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -293,15 +293,15 @@ static void bochs_close(BlockDriverState *bs)
 }
 
 static BlockDriver bdrv_bochs = {
-    .format_name	= "bochs",
-    .instance_size	= sizeof(BDRVBochsState),
-    .bdrv_probe		= bochs_probe,
-    .bdrv_open		= bochs_open,
-    .bdrv_child_perm     = bdrv_default_perms,
-    .bdrv_refresh_limits = bochs_refresh_limits,
-    .bdrv_co_preadv = bochs_co_preadv,
-    .bdrv_close		= bochs_close,
-    .is_format          = true,
+    .format_name            = "bochs",
+    .instance_size          = sizeof(BDRVBochsState),
+    .bdrv_probe             = bochs_probe,
+    .bdrv_open              = bochs_open,
+    .bdrv_child_perm        = bdrv_default_perms,
+    .bdrv_refresh_limits    = bochs_refresh_limits,
+    .bdrv_co_preadv         = bochs_co_preadv,
+    .bdrv_close             = bochs_close,
+    .is_format              = true,
 };
 
 static void bdrv_bochs_init(void)
diff --git a/block/file-posix.c b/block/file-posix.c
index 5760cf22d1..bdebe0c9a6 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -124,7 +124,7 @@
 #define FTYPE_FILE   0
 #define FTYPE_CD     1
 
-#define MAX_BLOCKSIZE	4096
+#define MAX_BLOCKSIZE 4096
 
 /* Posix file locking bytes. Libvirt takes byte 0, we start from higher bytes,
  * leaving a few more bytes for its future use. */
@@ -3819,42 +3819,42 @@ static void coroutine_fn cdrom_co_lock_medium(BlockDriverState *bs, bool locked)
 }
 
 static BlockDriver bdrv_host_cdrom = {
-    .format_name        = "host_cdrom",
-    .protocol_name      = "host_cdrom",
-    .instance_size      = sizeof(BDRVRawState),
-    .bdrv_needs_filename = true,
-    .bdrv_probe_device	= cdrom_probe_device,
-    .bdrv_parse_filename = cdrom_parse_filename,
-    .bdrv_file_open     = cdrom_open,
-    .bdrv_close         = raw_close,
-    .bdrv_reopen_prepare = raw_reopen_prepare,
-    .bdrv_reopen_commit  = raw_reopen_commit,
-    .bdrv_reopen_abort   = raw_reopen_abort,
-    .bdrv_co_create_opts = bdrv_co_create_opts_simple,
-    .create_opts         = &bdrv_create_opts_simple,
-    .mutable_opts        = mutable_opts,
-    .bdrv_co_invalidate_cache = raw_co_invalidate_cache,
-
-    .bdrv_co_preadv         = raw_co_preadv,
-    .bdrv_co_pwritev        = raw_co_pwritev,
-    .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
-    .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_co_io_plug        = raw_co_io_plug,
-    .bdrv_co_io_unplug      = raw_co_io_unplug,
-    .bdrv_attach_aio_context = raw_aio_attach_aio_context,
-
-    .bdrv_co_truncate                   = raw_co_truncate,
-    .bdrv_co_getlength                  = raw_co_getlength,
-    .has_variable_length                = true,
-    .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
+    .format_name                     = "host_cdrom",
+    .protocol_name                   = "host_cdrom",
+    .instance_size                   = sizeof(BDRVRawState),
+    .bdrv_needs_filename             = true,
+    .bdrv_probe_device               = cdrom_probe_device,
+    .bdrv_parse_filename             = cdrom_parse_filename,
+    .bdrv_file_open                  = cdrom_open,
+    .bdrv_close                      = raw_close,
+    .bdrv_reopen_prepare             = raw_reopen_prepare,
+    .bdrv_reopen_commit              = raw_reopen_commit,
+    .bdrv_reopen_abort               = raw_reopen_abort,
+    .bdrv_co_create_opts             = bdrv_co_create_opts_simple,
+    .create_opts                     = &bdrv_create_opts_simple,
+    .mutable_opts                    = mutable_opts,
+    .bdrv_co_invalidate_cache        = raw_co_invalidate_cache,
+
+    .bdrv_co_preadv                  = raw_co_preadv,
+    .bdrv_co_pwritev                 = raw_co_pwritev,
+    .bdrv_co_flush_to_disk           = raw_co_flush_to_disk,
+    .bdrv_refresh_limits             = raw_refresh_limits,
+    .bdrv_co_io_plug                 = raw_co_io_plug,
+    .bdrv_co_io_unplug               = raw_co_io_unplug,
+    .bdrv_attach_aio_context         = raw_aio_attach_aio_context,
+
+    .bdrv_co_truncate                = raw_co_truncate,
+    .bdrv_co_getlength               = raw_co_getlength,
+    .has_variable_length             = true,
+    .bdrv_co_get_allocated_file_size = raw_co_get_allocated_file_size,
 
     /* removable device support */
-    .bdrv_co_is_inserted    = cdrom_co_is_inserted,
-    .bdrv_co_eject          = cdrom_co_eject,
-    .bdrv_co_lock_medium    = cdrom_co_lock_medium,
+    .bdrv_co_is_inserted             = cdrom_co_is_inserted,
+    .bdrv_co_eject                   = cdrom_co_eject,
+    .bdrv_co_lock_medium             = cdrom_co_lock_medium,
 
     /* generic scsi device */
-    .bdrv_co_ioctl      = hdev_co_ioctl,
+    .bdrv_co_ioctl                   = hdev_co_ioctl,
 };
 #endif /* __linux__ */
 
@@ -3949,38 +3949,38 @@ static void coroutine_fn cdrom_co_lock_medium(BlockDriverState *bs, bool locked)
 }
 
 static BlockDriver bdrv_host_cdrom = {
-    .format_name        = "host_cdrom",
-    .protocol_name      = "host_cdrom",
-    .instance_size      = sizeof(BDRVRawState),
-    .bdrv_needs_filename = true,
-    .bdrv_probe_device	= cdrom_probe_device,
-    .bdrv_parse_filename = cdrom_parse_filename,
-    .bdrv_file_open     = cdrom_open,
-    .bdrv_close         = raw_close,
-    .bdrv_reopen_prepare = raw_reopen_prepare,
-    .bdrv_reopen_commit  = raw_reopen_commit,
-    .bdrv_reopen_abort   = raw_reopen_abort,
-    .bdrv_co_create_opts = bdrv_co_create_opts_simple,
-    .create_opts         = &bdrv_create_opts_simple,
-    .mutable_opts       = mutable_opts,
-
-    .bdrv_co_preadv         = raw_co_preadv,
-    .bdrv_co_pwritev        = raw_co_pwritev,
-    .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
-    .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_co_io_plug        = raw_co_io_plug,
-    .bdrv_co_io_unplug      = raw_co_io_unplug,
-    .bdrv_attach_aio_context = raw_aio_attach_aio_context,
-
-    .bdrv_co_truncate                   = raw_co_truncate,
-    .bdrv_co_getlength                  = raw_co_getlength,
-    .has_variable_length                = true,
-    .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
+    .format_name                     = "host_cdrom",
+    .protocol_name                   = "host_cdrom",
+    .instance_size                   = sizeof(BDRVRawState),
+    .bdrv_needs_filename             = true,
+    .bdrv_probe_device               = cdrom_probe_device,
+    .bdrv_parse_filename             = cdrom_parse_filename,
+    .bdrv_file_open                  = cdrom_open,
+    .bdrv_close                      = raw_close,
+    .bdrv_reopen_prepare             = raw_reopen_prepare,
+    .bdrv_reopen_commit              = raw_reopen_commit,
+    .bdrv_reopen_abort               = raw_reopen_abort,
+    .bdrv_co_create_opts             = bdrv_co_create_opts_simple,
+    .create_opts                     = &bdrv_create_opts_simple,
+    .mutable_opts                    = mutable_opts,
+
+    .bdrv_co_preadv                  = raw_co_preadv,
+    .bdrv_co_pwritev                 = raw_co_pwritev,
+    .bdrv_co_flush_to_disk           = raw_co_flush_to_disk,
+    .bdrv_refresh_limits             = raw_refresh_limits,
+    .bdrv_co_io_plug                 = raw_co_io_plug,
+    .bdrv_co_io_unplug               = raw_co_io_unplug,
+    .bdrv_attach_aio_context         = raw_aio_attach_aio_context,
+
+    .bdrv_co_truncate                = raw_co_truncate,
+    .bdrv_co_getlength               = raw_co_getlength,
+    .has_variable_length             = true,
+    .bdrv_co_get_allocated_file_size = raw_co_get_allocated_file_size,
 
     /* removable device support */
-    .bdrv_co_is_inserted     = cdrom_co_is_inserted,
-    .bdrv_co_eject           = cdrom_co_eject,
-    .bdrv_co_lock_medium     = cdrom_co_lock_medium,
+    .bdrv_co_is_inserted             = cdrom_co_is_inserted,
+    .bdrv_co_eject                   = cdrom_co_eject,
+    .bdrv_co_lock_medium             = cdrom_co_lock_medium,
 };
 #endif /* __FreeBSD__ */
 
diff --git a/block/file-win32.c b/block/file-win32.c
index c7d0b85306..cb32ac77c0 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -743,31 +743,31 @@ static QemuOptsList raw_create_opts = {
 };
 
 BlockDriver bdrv_file = {
-    .format_name	= "file",
-    .protocol_name	= "file",
-    .instance_size	= sizeof(BDRVRawState),
+    .format_name         = "file",
+    .protocol_name       = "file",
+    .instance_size       = sizeof(BDRVRawState),
     .bdrv_needs_filename = true,
     .bdrv_parse_filename = raw_parse_filename,
-    .bdrv_file_open     = raw_open,
+    .bdrv_file_open      = raw_open,
     .bdrv_refresh_limits = raw_probe_alignment,
-    .bdrv_close         = raw_close,
+    .bdrv_close          = raw_close,
     .bdrv_co_create_opts = raw_co_create_opts,
-    .bdrv_has_zero_init = bdrv_has_zero_init_1,
+    .bdrv_has_zero_init  = bdrv_has_zero_init_1,
 
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit  = raw_reopen_commit,
     .bdrv_reopen_abort   = raw_reopen_abort,
 
-    .bdrv_aio_preadv    = raw_aio_preadv,
-    .bdrv_aio_pwritev   = raw_aio_pwritev,
-    .bdrv_aio_flush     = raw_aio_flush,
+    .bdrv_aio_preadv     = raw_aio_preadv,
+    .bdrv_aio_pwritev    = raw_aio_pwritev,
+    .bdrv_aio_flush      = raw_aio_flush,
 
-    .bdrv_co_truncate   = raw_co_truncate,
-    .bdrv_co_getlength  = raw_co_getlength,
+    .bdrv_co_truncate    = raw_co_truncate,
+    .bdrv_co_getlength   = raw_co_getlength,
     .bdrv_co_get_allocated_file_size
-                        = raw_co_get_allocated_file_size,
+                         = raw_co_get_allocated_file_size,
 
-    .create_opts        = &raw_create_opts,
+    .create_opts         = &raw_create_opts,
 };
 
 /***********************************************/
@@ -915,26 +915,26 @@ done:
 }
 
 static BlockDriver bdrv_host_device = {
-    .format_name	= "host_device",
-    .protocol_name	= "host_device",
-    .instance_size	= sizeof(BDRVRawState),
-    .bdrv_needs_filename = true,
-    .bdrv_parse_filename = hdev_parse_filename,
-    .bdrv_probe_device	= hdev_probe_device,
-    .bdrv_file_open	= hdev_open,
-    .bdrv_close		= raw_close,
-    .bdrv_refresh_limits = hdev_refresh_limits,
-
-    .bdrv_aio_preadv    = raw_aio_preadv,
-    .bdrv_aio_pwritev   = raw_aio_pwritev,
-    .bdrv_aio_flush     = raw_aio_flush,
-
-    .bdrv_detach_aio_context = raw_detach_aio_context,
-    .bdrv_attach_aio_context = raw_attach_aio_context,
-
-    .bdrv_co_getlength                = raw_co_getlength,
-    .has_variable_length              = true,
-    .bdrv_co_get_allocated_file_size  = raw_co_get_allocated_file_size,
+    .format_name                     = "host_device",
+    .protocol_name                   = "host_device",
+    .instance_size                   = sizeof(BDRVRawState),
+    .bdrv_needs_filename             = true,
+    .bdrv_parse_filename             = hdev_parse_filename,
+    .bdrv_probe_device               = hdev_probe_device,
+    .bdrv_file_open                  = hdev_open,
+    .bdrv_close                      = raw_close,
+    .bdrv_refresh_limits             = hdev_refresh_limits,
+
+    .bdrv_aio_preadv                 = raw_aio_preadv,
+    .bdrv_aio_pwritev                = raw_aio_pwritev,
+    .bdrv_aio_flush                  = raw_aio_flush,
+
+    .bdrv_detach_aio_context         = raw_detach_aio_context,
+    .bdrv_attach_aio_context         = raw_attach_aio_context,
+
+    .bdrv_co_getlength               = raw_co_getlength,
+    .has_variable_length             = true,
+    .bdrv_co_get_allocated_file_size = raw_co_get_allocated_file_size,
 };
 
 static void bdrv_file_init(void)
diff --git a/block/parallels.c b/block/parallels.c
index 013684801a..62bbaf6887 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -917,23 +917,23 @@ static void parallels_close(BlockDriverState *bs)
 }
 
 static BlockDriver bdrv_parallels = {
-    .format_name	= "parallels",
-    .instance_size	= sizeof(BDRVParallelsState),
-    .bdrv_probe		= parallels_probe,
-    .bdrv_open		= parallels_open,
-    .bdrv_close		= parallels_close,
-    .bdrv_child_perm          = bdrv_default_perms,
-    .bdrv_co_block_status     = parallels_co_block_status,
-    .bdrv_has_zero_init       = bdrv_has_zero_init_1,
-    .bdrv_co_flush_to_os      = parallels_co_flush_to_os,
-    .bdrv_co_readv  = parallels_co_readv,
-    .bdrv_co_writev = parallels_co_writev,
-    .is_format      = true,
-    .supports_backing = true,
-    .bdrv_co_create      = parallels_co_create,
-    .bdrv_co_create_opts = parallels_co_create_opts,
-    .bdrv_co_check  = parallels_co_check,
-    .create_opts    = &parallels_create_opts,
+    .format_name          = "parallels",
+    .instance_size        = sizeof(BDRVParallelsState),
+    .bdrv_probe           = parallels_probe,
+    .bdrv_open            = parallels_open,
+    .bdrv_close           = parallels_close,
+    .bdrv_child_perm      = bdrv_default_perms,
+    .bdrv_co_block_status = parallels_co_block_status,
+    .bdrv_has_zero_init   = bdrv_has_zero_init_1,
+    .bdrv_co_flush_to_os  = parallels_co_flush_to_os,
+    .bdrv_co_readv        = parallels_co_readv,
+    .bdrv_co_writev       = parallels_co_writev,
+    .is_format            = true,
+    .supports_backing     = true,
+    .bdrv_co_create       = parallels_co_create,
+    .bdrv_co_create_opts  = parallels_co_create_opts,
+    .bdrv_co_check        = parallels_co_check,
+    .create_opts          = &parallels_create_opts,
 };
 
 static void bdrv_parallels_init(void)
diff --git a/block/qcow.c b/block/qcow.c
index 490e4f819e..62b916db6d 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -1177,30 +1177,30 @@ static const char *const qcow_strong_runtime_opts[] = {
 };
 
 static BlockDriver bdrv_qcow = {
-    .format_name	= "qcow",
-    .instance_size	= sizeof(BDRVQcowState),
-    .bdrv_probe		= qcow_probe,
-    .bdrv_open		= qcow_open,
-    .bdrv_close		= qcow_close,
-    .bdrv_child_perm        = bdrv_default_perms,
-    .bdrv_reopen_prepare    = qcow_reopen_prepare,
-    .bdrv_co_create         = qcow_co_create,
-    .bdrv_co_create_opts    = qcow_co_create_opts,
-    .bdrv_has_zero_init     = bdrv_has_zero_init_1,
-    .is_format              = true,
-    .supports_backing       = true,
-    .bdrv_refresh_limits    = qcow_refresh_limits,
-
-    .bdrv_co_preadv         = qcow_co_preadv,
-    .bdrv_co_pwritev        = qcow_co_pwritev,
-    .bdrv_co_block_status   = qcow_co_block_status,
-
-    .bdrv_make_empty        = qcow_make_empty,
+    .format_name                = "qcow",
+    .instance_size              = sizeof(BDRVQcowState),
+    .bdrv_probe                 = qcow_probe,
+    .bdrv_open                  = qcow_open,
+    .bdrv_close                 = qcow_close,
+    .bdrv_child_perm            = bdrv_default_perms,
+    .bdrv_reopen_prepare        = qcow_reopen_prepare,
+    .bdrv_co_create             = qcow_co_create,
+    .bdrv_co_create_opts        = qcow_co_create_opts,
+    .bdrv_has_zero_init         = bdrv_has_zero_init_1,
+    .is_format                  = true,
+    .supports_backing           = true,
+    .bdrv_refresh_limits        = qcow_refresh_limits,
+
+    .bdrv_co_preadv             = qcow_co_preadv,
+    .bdrv_co_pwritev            = qcow_co_pwritev,
+    .bdrv_co_block_status       = qcow_co_block_status,
+
+    .bdrv_make_empty            = qcow_make_empty,
     .bdrv_co_pwritev_compressed = qcow_co_pwritev_compressed,
-    .bdrv_co_get_info       = qcow_co_get_info,
+    .bdrv_co_get_info           = qcow_co_get_info,
 
-    .create_opts            = &qcow_create_opts,
-    .strong_runtime_opts    = qcow_strong_runtime_opts,
+    .create_opts                = &qcow_create_opts,
+    .strong_runtime_opts        = qcow_strong_runtime_opts,
 };
 
 static void bdrv_qcow_init(void)
diff --git a/include/block/nbd.h b/include/block/nbd.h
index a4c98169c3..4f5803fd9b 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -224,7 +224,7 @@ enum {
     NBD_CMD_BLOCK_STATUS = 7,
 };
 
-#define NBD_DEFAULT_PORT	10809
+#define NBD_DEFAULT_PORT    10809
 
 /* Maximum size of a single READ/WRITE data buffer */
 #define NBD_MAX_BUFFER_SIZE (32 * 1024 * 1024)
-- 
2.32.0 (Apple Git-132)


