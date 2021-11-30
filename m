Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E027D463013
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 10:48:54 +0100 (CET)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrzkr-00047I-NH
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 04:48:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mrziq-0001sR-F9
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mrzio-0002xy-SG
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638265606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FY+lt2AlJxKBDZIZpqJbephH97L/1EfFr1G8R+ZyA/w=;
 b=LRnRHaa6ZF+Q46CTDPmMG3UvOoSu9KjpDltVEuUvuNkS4PqNZh1LqiIC4GVhStOY2jROXR
 ygs3Sc5bniWLta1hGrDJDUiXrDTFpAGGAQG7MeRaRSX6or9oWhbHjxZD6gAD9slXv7ohYq
 s03FJ1hchMPp4h28IwfMXZo7bxs0dbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-g_K5PCNiN4OQRH5YKLgEzQ-1; Tue, 30 Nov 2021 04:46:45 -0500
X-MC-Unique: g_K5PCNiN4OQRH5YKLgEzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D5A283DD20;
 Tue, 30 Nov 2021 09:46:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57EC667842;
 Tue, 30 Nov 2021 09:46:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/4] include/sysemu/blockdev.h: move drive_add and inline
 drive_def
Date: Tue, 30 Nov 2021 04:46:32 -0500
Message-Id: <20211130094633.277982-4-eesposit@redhat.com>
In-Reply-To: <20211130094633.277982-1-eesposit@redhat.com>
References: <20211130094633.277982-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_add is only used in softmmu/vl.c, so it can be a static
function there, and drive_def is only a particular use case of
qemu_opts_parse_noisily, so it can be inlined.

Also remove drive_mark_claimed_by_board, as it is only defined
but not implemented (nor used) anywhere.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/monitor/block-hmp-cmds.c |  2 +-
 blockdev.c                     | 25 -------------------------
 include/sysemu/blockdev.h      |  4 ----
 softmmu/vl.c                   | 25 ++++++++++++++++++++++++-
 4 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 2ac4aedfff..bfb3c043a0 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -101,7 +101,7 @@ void hmp_drive_add(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    opts = drive_def(optstr);
+    opts = qemu_opts_parse_noisily(qemu_find_opts("drive"), optstr, false);
     if (!opts)
         return;
 
diff --git a/blockdev.c b/blockdev.c
index 1581f0d2f5..e5cb3eb95f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -202,31 +202,6 @@ static int drive_index_to_unit_id(BlockInterfaceType type, int index)
     return max_devs ? index % max_devs : index;
 }
 
-QemuOpts *drive_def(const char *optstr)
-{
-    return qemu_opts_parse_noisily(qemu_find_opts("drive"), optstr, false);
-}
-
-QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
-                    const char *optstr)
-{
-    QemuOpts *opts;
-
-    opts = drive_def(optstr);
-    if (!opts) {
-        return NULL;
-    }
-    if (type != IF_DEFAULT) {
-        qemu_opt_set(opts, "if", if_name[type], &error_abort);
-    }
-    if (index >= 0) {
-        qemu_opt_set_number(opts, "index", index, &error_abort);
-    }
-    if (file)
-        qemu_opt_set(opts, "file", file, &error_abort);
-    return opts;
-}
-
 DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
 {
     BlockBackend *blk;
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index b321286dee..21ae0b994a 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -46,16 +46,12 @@ const char *block_if_name(BlockInterfaceType iface);
 void override_max_devs(BlockInterfaceType type, int max_devs);
 
 DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
-void drive_mark_claimed_by_board(void);
 void drive_check_orphaned(void);
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
 int drive_get_max_bus(BlockInterfaceType type);
 int drive_get_max_devs(BlockInterfaceType type);
 DriveInfo *drive_get_next(BlockInterfaceType type);
 
-QemuOpts *drive_def(const char *optstr);
-QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
-                    const char *optstr);
 DriveInfo *drive_new(QemuOpts *arg, BlockInterfaceType block_default_type,
                      Error **errp);
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1159a64bce..4df30bad14 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -650,6 +650,27 @@ static int drive_enable_snapshot(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+static QemuOpts *drive_add(BlockInterfaceType type, int index,
+                           const char *file, const char *optstr)
+{
+    QemuOpts *opts;
+
+    opts = qemu_opts_parse_noisily(qemu_find_opts("drive"), optstr, false);
+    if (!opts) {
+        return NULL;
+    }
+    if (type != IF_DEFAULT) {
+        qemu_opt_set(opts, "if", block_if_name(type), &error_abort);
+    }
+    if (index >= 0) {
+        qemu_opt_set_number(opts, "index", index, &error_abort);
+    }
+    if (file) {
+        qemu_opt_set(opts, "file", file, &error_abort);
+    }
+    return opts;
+}
+
 static void default_drive(int enable, int snapshot, BlockInterfaceType type,
                           int index, const char *optstr)
 {
@@ -2884,7 +2905,9 @@ void qemu_init(int argc, char **argv, char **envp)
                     break;
                 }
             case QEMU_OPTION_drive:
-                if (drive_def(optarg) == NULL) {
+                opts = qemu_opts_parse_noisily(qemu_find_opts("drive"),
+                                               optarg, false);
+                if (opts == NULL) {
                     exit(1);
                 }
                 break;
-- 
2.31.1


