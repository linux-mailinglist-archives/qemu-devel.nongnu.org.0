Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE49396CED
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 07:43:22 +0200 (CEST)
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnxBR-0004tu-Sx
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 01:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lnx9Z-0004C4-5X
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:41:25 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:42996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lnx9P-0006CI-ED
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:41:24 -0400
Received: by mail-qk1-x731.google.com with SMTP id o27so13156913qkj.9
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 22:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CErbU5fwrwoTWDhzxLF0US4mY/UFz5GZXjSLFk7Xg+0=;
 b=OHaQ3RjDMgZ/gddBbdWRpW8PGpVRCGLV7L4ivYS9LAabp3f+G5HqNAN1Zh/6fTNcvc
 BmEMC1t8SMnlnCMGWOOLqk7yd0aTZm1UF6Vv/SHU+nEdI3+C0kU0l8S57wCf72WwKYKT
 LgwUHlSVKPpMWyltUscsVt7sws/nQ4jPCu4mrsOw74W6SlbKDF1bEL+7TxsxfRb6htkD
 TrCaM3G0CEJEU4GH0lSEpKMPaK7aD0r4mAhbSFcW+AjRUiVVbbporEyqKhvtrkvEhgwg
 awGxxeLIsCd59O9K+Ne/9KM2VoQPb3lYboytS7vtEzPBZMoKAs+IUYvwNsmxfIwX08Yl
 yF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CErbU5fwrwoTWDhzxLF0US4mY/UFz5GZXjSLFk7Xg+0=;
 b=HfekpkSqzG2QK79KSzTlhHq+SQ2t7gmU+ml0XviYej6kHZYqbOUJTuYSBRdWERkDca
 H5UtkuFQunbPqOxfsHxbip31Fkvtfsgz1qbcLBEPvE04z1G2Yw36iCaIg8EZ+QQsS6GE
 Pr5CskpKfz/hr1BrLTg5LT54PAfLf6kE42yl8TLBfxtr+0UGB8VikP8Wziu115bmqekA
 zKZiyYm2+iMD/1iQWgrrk/0wioPbgmb7VRLZh1nTh1Ep4Alnm2+WtxooBzTT2dRktrZa
 bUWzwG78eKVMmiFjeM8vBNHheLeS0znKORBGaNo5eUM93dgf0kB5Pbd84y6xWKA5rCVM
 E65g==
X-Gm-Message-State: AOAM533Ae91z+Ro8sH4oMuFERUHIAkB7mfgL52wJLcj00qKweTf4yjne
 H/62ZRW+135dY1Uek1JXa74=
X-Google-Smtp-Source: ABdhPJydK5MOzi0A6LE2BYbPdghXqmu1yCsVuXs585jG/zAov0/xHIZj2s0Npnw95AxnBjDXdLRUkA==
X-Received: by 2002:a37:6554:: with SMTP id z81mr14161424qkb.121.1622526072744; 
 Mon, 31 May 2021 22:41:12 -0700 (PDT)
Received: from localhost.localdomain ([177.193.53.28])
 by smtp.gmail.com with ESMTPSA id k9sm10567116qkh.11.2021.05.31.22.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 22:41:12 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 lukasstraub2@web.de, berrange@redhat.com
Subject: [PATCH v3 1/1] yank: Unregister function when using TLS migration
Date: Tue,  1 Jun 2021 02:40:31 -0300
Message-Id: <20210601054030.1153249-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=leobras.c@gmail.com; helo=mail-qk1-x731.google.com
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
Cc: Leonardo Bras <leobras.c@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After yank feature was introduced in migration, whenever migration
is started using TLS, the following error happens in both source and
destination hosts:

(qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
Assertion `QLIST_EMPTY(&entry->yankfns)' failed.

This happens because of a missing yank_unregister_function() when using
qio-channel-tls.

Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
yank_unregister_function() in channel_close() and multifd_load_cleanup().

Also, inside migration_channel_connect() and
migration_channel_process_incoming() move yank_register_function() so
it only runs once on a TLS migration.

Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

--
Changes since v2:
- Dropped all references to ioc->master
- yank_register_function() and yank_unregister_function() now only run
  once in a TLS migration.

Changes since v1:
- Cast p->c to QIOChannelTLS into multifd_load_cleanup()
---
 migration/channel.c           | 26 ++++++++++++++------------
 migration/multifd.c           |  3 ++-
 migration/qemu-file-channel.c |  4 +++-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index c9ee902021..01275a9162 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -38,18 +38,19 @@ void migration_channel_process_incoming(QIOChannel *ioc)
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));
 
-    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
-        yank_register_function(MIGRATION_YANK_INSTANCE,
-                               migration_yank_iochannel,
-                               QIO_CHANNEL(ioc));
-    }
-
     if (s->parameters.tls_creds &&
         *s->parameters.tls_creds &&
         !object_dynamic_cast(OBJECT(ioc),
                              TYPE_QIO_CHANNEL_TLS)) {
         migration_tls_channel_process_incoming(s, ioc, &local_err);
     } else {
+        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
+            object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
+            yank_register_function(MIGRATION_YANK_INSTANCE,
+                                   migration_yank_iochannel,
+                                   QIO_CHANNEL(ioc));
+        }
+
         migration_ioc_process_incoming(ioc, &local_err);
     }
 
@@ -76,12 +77,6 @@ void migration_channel_connect(MigrationState *s,
         ioc, object_get_typename(OBJECT(ioc)), hostname, error);
 
     if (!error) {
-        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
-            yank_register_function(MIGRATION_YANK_INSTANCE,
-                                   migration_yank_iochannel,
-                                   QIO_CHANNEL(ioc));
-        }
-
         if (s->parameters.tls_creds &&
             *s->parameters.tls_creds &&
             !object_dynamic_cast(OBJECT(ioc),
@@ -99,6 +94,13 @@ void migration_channel_connect(MigrationState *s,
         } else {
             QEMUFile *f = qemu_fopen_channel_output(ioc);
 
+            if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
+                object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
+                yank_register_function(MIGRATION_YANK_INSTANCE,
+                                       migration_yank_iochannel,
+                                       QIO_CHANNEL(ioc));
+            }
+
             qemu_mutex_lock(&s->qemu_file_lock);
             s->to_dst_file = f;
             qemu_mutex_unlock(&s->qemu_file_lock);
diff --git a/migration/multifd.c b/migration/multifd.c
index 0a4803cfcc..2e8f001bc0 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -987,7 +987,8 @@ int multifd_load_cleanup(Error **errp)
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
-        if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET)
+        if ((object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET) ||
+             object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_TLS))
             && OBJECT(p->c)->ref == 1) {
             yank_unregister_function(MIGRATION_YANK_INSTANCE,
                                      migration_yank_iochannel,
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 876d05a540..fad340ea7a 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -26,6 +26,7 @@
 #include "qemu-file-channel.h"
 #include "qemu-file.h"
 #include "io/channel-socket.h"
+#include "io/channel-tls.h"
 #include "qemu/iov.h"
 #include "qemu/yank.h"
 #include "yank_functions.h"
@@ -106,7 +107,8 @@ static int channel_close(void *opaque, Error **errp)
     int ret;
     QIOChannel *ioc = QIO_CHANNEL(opaque);
     ret = qio_channel_close(ioc, errp);
-    if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)
+    if ((object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
+         object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS))
         && OBJECT(ioc)->ref == 1) {
         yank_unregister_function(MIGRATION_YANK_INSTANCE,
                                  migration_yank_iochannel,
-- 
2.31.1


