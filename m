Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3EE4393CD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:33:57 +0200 (CEST)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexIi-00077e-7j
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4C-0005Ri-Ud
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex49-0006y8-SB
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GmRtqQ10mLcJVGx/qdMj/7sytmJU8nj1DsfCWEZVBg=;
 b=eCd7h7Np+xGY8OSRCck/xInKBUEUBv31aU2IxiMO3MJXIdL/lNlQQR5bSudbgzIzdzsZA2
 zw6F3f2jy8WunDpVOHgVb/AOf3ZLEHIZhN+OF2rtMZz2UpoGYVqDp2znUfSkUYyM3VGTZe
 2xS9Ranjb4I1WS00XlEOPKwiPi9K8AQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-PduIcddlNN-xiw17ZI5gkg-1; Mon, 25 Oct 2021 06:18:50 -0400
X-MC-Unique: PduIcddlNN-xiw17ZI5gkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18722802682;
 Mon, 25 Oct 2021 10:18:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDB135E26A;
 Mon, 25 Oct 2021 10:18:47 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 13/25] include/sysemu/blockdev.h: move drive_add and inline
 drive_def
Date: Mon, 25 Oct 2021 06:17:23 -0400
Message-Id: <20211025101735.2060852-14-eesposit@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_add is only used in softmmu/vl.c, so it can be a static
function there, and drive_def is only a particular use case of
qemu_opts_parse_noisily, so it can be inlined.

Also remove drive_mark_claimed_by_board, as it is only defined
but not implemented (nor used) anywhere.

This also helps simplifying next patch.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/monitor/block-hmp-cmds.c |  2 +-
 blockdev.c                     | 27 +--------------------------
 include/sysemu/blockdev.h      |  6 ++----
 softmmu/vl.c                   | 25 ++++++++++++++++++++++++-
 4 files changed, 28 insertions(+), 32 deletions(-)

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
index c1f6171c6c..1bf49ef610 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -73,7 +73,7 @@ void bdrv_set_monitor_owned(BlockDriverState *bs)
     QTAILQ_INSERT_TAIL(&monitor_bdrv_states, bs, monitor_list);
 }
 
-static const char *const if_name[IF_COUNT] = {
+const char *const if_name[IF_COUNT] = {
     [IF_NONE] = "none",
     [IF_IDE] = "ide",
     [IF_SCSI] = "scsi",
@@ -199,31 +199,6 @@ static int drive_index_to_unit_id(BlockInterfaceType type, int index)
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
index 32c2d6023c..960b54d320 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -27,6 +27,8 @@ typedef enum {
     IF_COUNT
 } BlockInterfaceType;
 
+extern const char *const if_name[];
+
 struct DriveInfo {
     BlockInterfaceType type;
     int bus;
@@ -45,16 +47,12 @@ BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo);
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
index af0c4cbd99..6938798bdb 100644
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
+        qemu_opt_set(opts, "if", if_name[type], &error_abort);
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
2.27.0


