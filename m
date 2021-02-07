Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406D6312200
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 07:35:49 +0100 (CET)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8dff-0003xz-Ov
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 01:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1l8ddI-0003WG-OO; Sun, 07 Feb 2021 01:33:20 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1l8ddG-0006u0-L9; Sun, 07 Feb 2021 01:33:20 -0500
Received: by mail-pl1-x633.google.com with SMTP id u11so6126635plg.13;
 Sat, 06 Feb 2021 22:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=b97nA8LO6OWiasuSiL6L/KEZxJJs85z2bYbetLjMQAQ=;
 b=Z+yNI18dPepW+9Kmvy60sR0xahwfHVyw+D//tZXiUReWErUORFRJPYCSxuBDGPnSy4
 6vY0Q6RYrMQHUsgT6JRqwRNjbnUq9UNylWL9dqVhKsxjk50vRVOpt5Op3wFUShU1cBSb
 8FiUfyz57PkGf94TMnOq2tVwaDefoGVthCnAeuQDZGu1m8LuKv/G0jLPUoOlRzRH8atv
 p55AnNOV2Hv+OfHcuzr4zjzq9d4+5ZJfU/7bF5nRQIN3ZqDKmO5PjePELNhsSPqXRtAc
 ssJPuKH1ZpHVofB83AxnQGZiuH0X4P7c4S6JJZIyozYpJcFsutwE/qcbfVdhs8ifMWjr
 fM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=b97nA8LO6OWiasuSiL6L/KEZxJJs85z2bYbetLjMQAQ=;
 b=oqFBYCGhf/sZ0/GyGioHRwXb+isTY1VIHf9FCK4PgYP7P1xNG16c3riDjFWK3EuXty
 Z/wdD0YVG0hmHipbf5gOPeQW2WWaDufQlCQw/skX1aF2MD9jC9YgIRmRjY/iWn0p0h4l
 Lv2xULt8sSnq7oA9MMocN5QIO3K31H+B8XU9u5kMr3svcNQm66S4JeEPTsprpoia7rMd
 BBBFCwePJ33juNWcejbxCbGpBq7C81lGEDUFgOb6DJb3LuKIVG2scibLObkFTfIxdMtD
 HiyFlC1uCK4loQu8ngMcZdnm1uSPs/JpVE1pQ5bT5af1h9Jm8ZP2qgwFHWIBmQIpcIUB
 Xl9A==
X-Gm-Message-State: AOAM531B4QhFxqsNx9K9RYuA9rQTrTOHnInSya1kKH2+1ACnQjT1wKPy
 nJX1nv0A0FY5FhrgZB6ub6IWp+VHBvsNKA==
X-Google-Smtp-Source: ABdhPJzeDUSsJvNvXsB3MnONKstgnaUoLOABUzPv1oLkR43pVNbl5hsycP57qJjb5Tq+QSjn05Pptg==
X-Received: by 2002:a17:90a:a10e:: with SMTP id
 s14mr11959449pjp.19.1612679594530; 
 Sat, 06 Feb 2021 22:33:14 -0800 (PST)
Received: from localhost.localdomain ([45.115.91.17])
 by smtp.gmail.com with ESMTPSA id f13sm15535405pjj.1.2021.02.06.22.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 22:33:13 -0800 (PST)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-trivial@nongnu.org
Subject: [PATCH] block/iscsi: Use lock guards
Date: Sun,  7 Feb 2021 12:03:04 +0530
Message-Id: <20210207063304.15227-1-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, G S Niteesh Babu <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 block/iscsi.c | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 4d2a416ce7..4f7abc665a 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -48,6 +48,7 @@
 #include "crypto/secret.h"
 #include "scsi/utils.h"
 #include "trace.h"
+#include "qemu/lockable.h"
 
 /* Conflict between scsi/utils.h and libiscsi! :( */
 #define SCSI_XFER_NONE ISCSI_XFER_NONE
@@ -399,10 +400,9 @@ iscsi_process_read(void *arg)
     IscsiLun *iscsilun = arg;
     struct iscsi_context *iscsi = iscsilun->iscsi;
 
-    qemu_mutex_lock(&iscsilun->mutex);
+    QEMU_LOCK_GUARD(&iscsilun->mutex);
     iscsi_service(iscsi, POLLIN);
     iscsi_set_events(iscsilun);
-    qemu_mutex_unlock(&iscsilun->mutex);
 }
 
 static void
@@ -411,10 +411,9 @@ iscsi_process_write(void *arg)
     IscsiLun *iscsilun = arg;
     struct iscsi_context *iscsi = iscsilun->iscsi;
 
-    qemu_mutex_lock(&iscsilun->mutex);
+    QEMU_LOCK_GUARD(&iscsilun->mutex);
     iscsi_service(iscsi, POLLOUT);
     iscsi_set_events(iscsilun);
-    qemu_mutex_unlock(&iscsilun->mutex);
 }
 
 static int64_t sector_lun2qemu(int64_t sector, IscsiLun *iscsilun)
@@ -623,7 +622,7 @@ iscsi_co_writev(BlockDriverState *bs, int64_t sector_num, int nb_sectors,
     lba = sector_qemu2lun(sector_num, iscsilun);
     num_sectors = sector_qemu2lun(nb_sectors, iscsilun);
     iscsi_co_init_iscsitask(iscsilun, &iTask);
-    qemu_mutex_lock(&iscsilun->mutex);
+    QEMU_LOCK_GUARD(&iscsilun->mutex);
 retry:
     if (iscsilun->use_16_for_rw) {
 #if LIBISCSI_API_VERSION >= (20160603)
@@ -652,7 +651,6 @@ retry:
     }
 #endif
     if (iTask.task == NULL) {
-        qemu_mutex_unlock(&iscsilun->mutex);
         return -ENOMEM;
     }
 #if LIBISCSI_API_VERSION < (20160603)
@@ -684,7 +682,6 @@ retry:
                                  nb_sectors * BDRV_SECTOR_SIZE);
 
 out_unlock:
-    qemu_mutex_unlock(&iscsilun->mutex);
     g_free(iTask.err_str);
     return r;
 }
@@ -723,7 +720,7 @@ static int coroutine_fn iscsi_co_block_status(BlockDriverState *bs,
     lba = offset / iscsilun->block_size;
     max_bytes = (iscsilun->num_blocks - lba) * iscsilun->block_size;
 
-    qemu_mutex_lock(&iscsilun->mutex);
+    QEMU_LOCK_GUARD(&iscsilun->mutex);
 retry:
     if (iscsi_get_lba_status_task(iscsilun->iscsi, iscsilun->lun,
                                   lba, 8 + 16, iscsi_co_generic_cb,
@@ -785,7 +782,6 @@ retry:
         *pnum = bytes;
     }
 out_unlock:
-    qemu_mutex_unlock(&iscsilun->mutex);
     g_free(iTask.err_str);
 out:
     if (iTask.task != NULL) {
@@ -858,7 +854,7 @@ static int coroutine_fn iscsi_co_readv(BlockDriverState *bs,
     num_sectors = sector_qemu2lun(nb_sectors, iscsilun);
 
     iscsi_co_init_iscsitask(iscsilun, &iTask);
-    qemu_mutex_lock(&iscsilun->mutex);
+    QEMU_LOCK_GUARD(&iscsilun->mutex);
 retry:
     if (iscsilun->use_16_for_rw) {
 #if LIBISCSI_API_VERSION >= (20160603)
@@ -889,7 +885,6 @@ retry:
     }
 #endif
     if (iTask.task == NULL) {
-        qemu_mutex_unlock(&iscsilun->mutex);
         return -ENOMEM;
     }
 #if LIBISCSI_API_VERSION < (20160603)
@@ -913,7 +908,6 @@ retry:
         r = iTask.err_code;
     }
 
-    qemu_mutex_unlock(&iscsilun->mutex);
     g_free(iTask.err_str);
     return r;
 }
@@ -925,11 +919,10 @@ static int coroutine_fn iscsi_co_flush(BlockDriverState *bs)
     int r = 0;
 
     iscsi_co_init_iscsitask(iscsilun, &iTask);
-    qemu_mutex_lock(&iscsilun->mutex);
+    QEMU_LOCK_GUARD(&iscsilun->mutex);
 retry:
     if (iscsi_synchronizecache10_task(iscsilun->iscsi, iscsilun->lun, 0, 0, 0,
                                       0, iscsi_co_generic_cb, &iTask) == NULL) {
-        qemu_mutex_unlock(&iscsilun->mutex);
         return -ENOMEM;
     }
 
@@ -950,7 +943,6 @@ retry:
         r = iTask.err_code;
     }
 
-    qemu_mutex_unlock(&iscsilun->mutex);
     g_free(iTask.err_str);
     return r;
 }
@@ -1085,7 +1077,8 @@ static BlockAIOCB *iscsi_aio_ioctl(BlockDriverState *bs,
     acb->task->expxferlen = acb->ioh->dxfer_len;
 
     data.size = 0;
-    qemu_mutex_lock(&iscsilun->mutex);
+
+    QEMU_LOCK_GUARD(&iscsilun->mutex);
     if (acb->task->xfer_dir == SCSI_XFER_WRITE) {
         if (acb->ioh->iovec_count == 0) {
             data.data = acb->ioh->dxferp;
@@ -1101,7 +1094,6 @@ static BlockAIOCB *iscsi_aio_ioctl(BlockDriverState *bs,
                                  iscsi_aio_ioctl_cb,
                                  (data.size > 0) ? &data : NULL,
                                  acb) != 0) {
-        qemu_mutex_unlock(&iscsilun->mutex);
         scsi_free_scsi_task(acb->task);
         qemu_aio_unref(acb);
         return NULL;
@@ -1121,7 +1113,6 @@ static BlockAIOCB *iscsi_aio_ioctl(BlockDriverState *bs,
     }
 
     iscsi_set_events(iscsilun);
-    qemu_mutex_unlock(&iscsilun->mutex);
 
     return &acb->common;
 }
@@ -1161,7 +1152,7 @@ coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
     list.num = bytes / iscsilun->block_size;
 
     iscsi_co_init_iscsitask(iscsilun, &iTask);
-    qemu_mutex_lock(&iscsilun->mutex);
+    QEMU_LOCK_GUARD(&iscsilun->mutex);
 retry:
     if (iscsi_unmap_task(iscsilun->iscsi, iscsilun->lun, 0, 0, &list, 1,
                          iscsi_co_generic_cb, &iTask) == NULL) {
@@ -1198,7 +1189,6 @@ retry:
     }
 
 out_unlock:
-    qemu_mutex_unlock(&iscsilun->mutex);
     g_free(iTask.err_str);
     return r;
 }
@@ -1246,7 +1236,7 @@ coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
         }
     }
 
-    qemu_mutex_lock(&iscsilun->mutex);
+    QEMU_LOCK_GUARD(&iscsilun->mutex);
     iscsi_co_init_iscsitask(iscsilun, &iTask);
 retry:
     if (use_16_for_ws) {
@@ -1261,7 +1251,6 @@ retry:
                                             0, 0, iscsi_co_generic_cb, &iTask);
     }
     if (iTask.task == NULL) {
-        qemu_mutex_unlock(&iscsilun->mutex);
         return -ENOMEM;
     }
 
@@ -1303,7 +1292,6 @@ retry:
     }
 
 out_unlock:
-    qemu_mutex_unlock(&iscsilun->mutex);
     g_free(iTask.err_str);
     return r;
 }
@@ -2358,7 +2346,7 @@ static int coroutine_fn iscsi_co_copy_range_to(BlockDriverState *bs,
 
     iscsi_co_init_iscsitask(dst_lun, &iscsi_task);
 
-    qemu_mutex_lock(&dst_lun->mutex);
+    QEMU_LOCK_GUARD(&dst_lun->mutex);
     iscsi_task.task = iscsi_xcopy_task(data.size);
 retry:
     if (iscsi_scsi_command_async(dst_lun->iscsi, dst_lun->lun,
@@ -2385,7 +2373,6 @@ out_unlock:
 
     trace_iscsi_xcopy(src_lun, src_offset, dst_lun, dst_offset, bytes, r);
     g_free(iscsi_task.task);
-    qemu_mutex_unlock(&dst_lun->mutex);
     g_free(iscsi_task.err_str);
     return r;
 }
-- 
2.17.1


