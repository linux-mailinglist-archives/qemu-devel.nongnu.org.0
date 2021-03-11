Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075D6336EE7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:31:46 +0100 (CET)
Received: from localhost ([::1]:48726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHfV-00064B-1g
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnr-0001OT-0i
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:59 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnp-0000i5-1t
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:58 -0500
Received: by mail-wm1-x334.google.com with SMTP id g8so406330wmd.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4hPYLRC98/V0CrldtlN5ml4tC4ItQ/Hc4HiTL1mRUx0=;
 b=DqWVV3WzUaufIlIBPpHRDb+UOnahPrnSYQz2fGYLcQ7naDprcL/fcTgxbO/OZHmu2N
 IxSwUxolXfSy4++1bNR1SLBZGl97vR4xAKsjWmrSeSx8X1cFMZeuQ4qUU3w8E4MJuzW2
 bhq0q5FIHQZvRmBSLcyPk3y+CK/KDjn71P/syYUM5QT7LXGL42EOFuezR/hlrf5/DZVI
 vGKJ+lzRqkq4TQKWUEYU8ci0gJbtAjzoCKMuByYzEftkAg06brJmBxP2T0MbTq72L5ew
 9vz7Qyip6F6f7eDCfXpEoExE6P5RcSfgVIwCpzgs6ZxQTvyntbf7dJRrULAkAcZj0WDr
 BYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4hPYLRC98/V0CrldtlN5ml4tC4ItQ/Hc4HiTL1mRUx0=;
 b=GGymZb9TuiR6QResfFRuPrDXxn/NuESzEu3W4cDNVvTa0GxHD1wbOy/M/eMbZ5Vu/E
 ebeI1X2Ph5TAwiGgGRC5QXZUlnQp2E5LWeri/q7ozisvS2yi0o7Ig2JdiIdpyE20ytrr
 MGuQPaLMO9nghuOOxZu4pJ+Og6xxYSkmC3GUVvZ+mvYZywujDrisQaTthmf9+dCUyMBr
 q6HpWG8Lx5j4yIFNNspRGg8WMVT22TYMC3CZ88N8dsyHwTdjdir72rGGcmBeXMVfbQK0
 5ROEH6Cw7kRzWTjpDTYAZ3gN15iWaJhJgaeUJv3O1utRSySOoBb9CYYBD0aMlXNkdUB8
 7roQ==
X-Gm-Message-State: AOAM532xvS/qsLeufDvUUvD0DCegP3wPybXpcszGmvPZ99Ja71veiNPJ
 yGHFJkiwf6uDmiE6TJx8oILgHBoScPVDxl4rwkQ=
X-Google-Smtp-Source: ABdhPJxKgk07ohn5Al6DHslhm1V8A60Ybe5DJbhwem5UsI1PYTnIbW17FRuzyNzdboFLAWbsgLpXQA==
X-Received: by 2002:a1c:3c8b:: with SMTP id j133mr6047926wma.164.1615432554064; 
 Wed, 10 Mar 2021 19:15:54 -0800 (PST)
Received: from localhost.localdomain ([197.61.47.225])
 by smtp.googlemail.com with ESMTPSA id o188sm1450416wme.7.2021.03.10.19.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:15:53 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] util: Replaced qemu_mutex_lock with QEMU_LOCK_GUARDs
Date: Thu, 11 Mar 2021 05:15:33 +0200
Message-Id: <20210311031538.5325-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311031538.5325-1-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:24:52 -0500
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Removed various qemu_mutex_lock calls and their respective
qemu_mutex_unlock calls and used QEMU_LOCK_GUARD. This simplifies
the code by eliminating various goto paths and removes
qemu_mutex_unlock calls.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 util/filemonitor-inotify.c | 24 ++++++++----------------
 util/vfio-helpers.c        | 23 ++++++++++-------------
 2 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/util/filemonitor-inotify.c b/util/filemonitor-inotify.c
index 2c45f7f176..0e1a196088 100644
--- a/util/filemonitor-inotify.c
+++ b/util/filemonitor-inotify.c
@@ -59,10 +59,9 @@ static void qemu_file_monitor_watch(void *arg)
     int used = 0;
     int len;
 
-    qemu_mutex_lock(&mon->lock);
+    QEMU_LOCK_GUARD(&mon->lock);
 
     if (mon->fd == -1) {
-        qemu_mutex_unlock(&mon->lock);
         return;
     }
 
@@ -72,11 +71,11 @@ static void qemu_file_monitor_watch(void *arg)
         if (errno != EAGAIN) {
             error_report("Failure monitoring inotify FD '%s',"
                          "disabling events", strerror(errno));
-            goto cleanup;
+            return;
         }
 
         /* no more events right now */
-        goto cleanup;
+        return;
     }
 
     /* Loop over all events in the buffer */
@@ -142,9 +141,6 @@ static void qemu_file_monitor_watch(void *arg)
             }
         }
     }
-
- cleanup:
-    qemu_mutex_unlock(&mon->lock);
 }
 
 
@@ -250,7 +246,8 @@ qemu_file_monitor_add_watch(QFileMonitor *mon,
     QFileMonitorWatch watch;
     int64_t ret = -1;
 
-    qemu_mutex_lock(&mon->lock);
+    QEMU_LOCK_GUARD(&mon->lock);
+
     dir = g_hash_table_lookup(mon->dirs, dirpath);
     if (!dir) {
         int rv = inotify_add_watch(mon->fd, dirpath,
@@ -259,7 +256,7 @@ qemu_file_monitor_add_watch(QFileMonitor *mon,
 
         if (rv < 0) {
             error_setg_errno(errp, errno, "Unable to watch '%s'", dirpath);
-            goto cleanup;
+            return ret;
         }
 
         trace_qemu_file_monitor_enable_watch(mon, dirpath, rv);
@@ -290,8 +287,6 @@ qemu_file_monitor_add_watch(QFileMonitor *mon,
 
     ret = watch.id;
 
- cleanup:
-    qemu_mutex_unlock(&mon->lock);
     return ret;
 }
 
@@ -303,13 +298,13 @@ void qemu_file_monitor_remove_watch(QFileMonitor *mon,
     QFileMonitorDir *dir;
     gsize i;
 
-    qemu_mutex_lock(&mon->lock);
+    QEMU_LOCK_GUARD(&mon->lock);
 
     trace_qemu_file_monitor_remove_watch(mon, dirpath, id);
 
     dir = g_hash_table_lookup(mon->dirs, dirpath);
     if (!dir) {
-        goto cleanup;
+        return;
     }
 
     for (i = 0; i < dir->watches->len; i++) {
@@ -333,7 +328,4 @@ void qemu_file_monitor_remove_watch(QFileMonitor *mon,
             qemu_set_fd_handler(mon->fd, NULL, NULL, NULL);
         }
     }
-
- cleanup:
-    qemu_mutex_unlock(&mon->lock);
 }
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 97dfa3fd57..dc05755ef1 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -748,41 +748,41 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     assert(QEMU_PTR_IS_ALIGNED(host, qemu_real_host_page_size));
     assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size));
     trace_qemu_vfio_dma_map(s, host, size, temporary, iova);
-    qemu_mutex_lock(&s->lock);
+    QEMU_LOCK_GUARD(&s->lock);
     mapping = qemu_vfio_find_mapping(s, host, &index);
     if (mapping) {
         iova0 = mapping->iova + ((uint8_t *)host - (uint8_t *)mapping->host);
     } else {
         if (s->high_water_mark - s->low_water_mark + 1 < size) {
             ret = -ENOMEM;
-            goto out;
+            return ret;
         }
         if (!temporary) {
             if (qemu_vfio_find_fixed_iova(s, size, &iova0)) {
                 ret = -ENOMEM;
-                goto out;
+                return ret;
             }
 
             mapping = qemu_vfio_add_mapping(s, host, size, index + 1, iova0);
             if (!mapping) {
                 ret = -ENOMEM;
-                goto out;
+                return ret;
             }
             assert(qemu_vfio_verify_mappings(s));
             ret = qemu_vfio_do_mapping(s, host, size, iova0);
             if (ret) {
                 qemu_vfio_undo_mapping(s, mapping, NULL);
-                goto out;
+                return ret;
             }
             qemu_vfio_dump_mappings(s);
         } else {
             if (qemu_vfio_find_temp_iova(s, size, &iova0)) {
                 ret = -ENOMEM;
-                goto out;
+                return ret;
             }
             ret = qemu_vfio_do_mapping(s, host, size, iova0);
             if (ret) {
-                goto out;
+                return ret;
             }
         }
     }
@@ -790,8 +790,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     if (iova) {
         *iova = iova0;
     }
-out:
-    qemu_mutex_unlock(&s->lock);
+
     return ret;
 }
 
@@ -826,14 +825,12 @@ void qemu_vfio_dma_unmap(QEMUVFIOState *s, void *host)
     }
 
     trace_qemu_vfio_dma_unmap(s, host);
-    qemu_mutex_lock(&s->lock);
+    QEMU_LOCK_GUARD(&s->lock);
     m = qemu_vfio_find_mapping(s, host, &index);
     if (!m) {
-        goto out;
+        return;
     }
     qemu_vfio_undo_mapping(s, m, NULL);
-out:
-    qemu_mutex_unlock(&s->lock);
 }
 
 static void qemu_vfio_reset(QEMUVFIOState *s)
-- 
2.25.1


