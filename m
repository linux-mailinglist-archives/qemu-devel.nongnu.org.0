Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7964758D7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:28:18 +0100 (CET)
Received: from localhost ([::1]:60192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTOL-0002gz-Jz
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxT9N-0001zV-Im
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:12:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxT9L-0008Au-QA
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639570367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubRnJbHUuUqkDqwDsVfUmaOhZ6ep87pDyz+xtWDKsHo=;
 b=VTOAh77yQX4+LuHPIG68utevMstFOhCZXyHRIyA6306klouWTcxOdB3g5uJzX/DX/8KBXi
 lwQ+aPYWTqhJMQyLwhLQhruLqylAE5hkbhbqloEMYGj4C20ZoDY0SiqdcBYEGTMl7DeWgE
 OcVgvgItFXGS/Gzn37uV/Tp6PUpCzoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-Vym_phKWNg6-S2wNqbmOsQ-1; Wed, 15 Dec 2021 07:12:44 -0500
X-MC-Unique: Vym_phKWNg6-S2wNqbmOsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E5981054F90;
 Wed, 15 Dec 2021 12:12:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEFB17A446;
 Wed, 15 Dec 2021 12:12:30 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/3] include/sysemu/blockdev.h: remove
 drive_mark_claimed_by_board and inline drive_def
Date: Wed, 15 Dec 2021 07:11:39 -0500
Message-Id: <20211215121140.456939-3-eesposit@redhat.com>
In-Reply-To: <20211215121140.456939-1-eesposit@redhat.com>
References: <20211215121140.456939-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_def is only a particular use case of
qemu_opts_parse_noisily, so it can be inlined.

Also remove drive_mark_claimed_by_board, as it is only defined
but not implemented (nor used) anywhere.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/monitor/block-hmp-cmds.c | 2 +-
 blockdev.c                     | 7 +------
 include/sysemu/blockdev.h      | 2 --
 softmmu/vl.c                   | 4 +++-
 4 files changed, 5 insertions(+), 10 deletions(-)

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
index b35072644e..9839e234cb 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -197,17 +197,12 @@ static int drive_index_to_unit_id(BlockInterfaceType type, int index)
     return max_devs ? index % max_devs : index;
 }
 
-QemuOpts *drive_def(const char *optstr)
-{
-    return qemu_opts_parse_noisily(qemu_find_opts("drive"), optstr, false);
-}
-
 QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
                     const char *optstr)
 {
     QemuOpts *opts;
 
-    opts = drive_def(optstr);
+    opts = qemu_opts_parse_noisily(qemu_find_opts("drive"), optstr, false);
     if (!opts) {
         return NULL;
     }
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 32c2d6023c..b236425c6e 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -45,14 +45,12 @@ BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo);
 void override_max_devs(BlockInterfaceType type, int max_devs);
 
 DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
-void drive_mark_claimed_by_board(void);
 void drive_check_orphaned(void);
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
 int drive_get_max_bus(BlockInterfaceType type);
 int drive_get_max_devs(BlockInterfaceType type);
 DriveInfo *drive_get_next(BlockInterfaceType type);
 
-QemuOpts *drive_def(const char *optstr);
 QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
                     const char *optstr);
 DriveInfo *drive_new(QemuOpts *arg, BlockInterfaceType block_default_type,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1159a64bce..fbf12f64d2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2884,7 +2884,9 @@ void qemu_init(int argc, char **argv, char **envp)
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


