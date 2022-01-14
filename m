Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3492548EB49
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:09:44 +0100 (CET)
Received: from localhost ([::1]:47088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NGx-0007SJ-B7
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0R-0002yE-Sx
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0P-0000It-Va
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HK6/MrM6x/JLY9aKJOmZao7CGx6tGt4z6ZGtdfcmzg=;
 b=YNJqcOGxzm7lzcANO1Sv2DTpFUbbsUvFFQ256MiZcgxOcsMFalINSshRvPfKAZ2w5aCq2t
 9HVJ0G2mCdL4DENSVyqCs5ld/amAlZ6lC4CI9rlKS2zeh7Ekz4m/YK4CvW0TYY55hi04Fi
 P2z55Unp9ODInW51DxlT8y1eABiAksk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-rwjYRH6MN86UKqcBjo2ZhQ-1; Fri, 14 Jan 2022 08:52:34 -0500
X-MC-Unique: rwjYRH6MN86UKqcBjo2ZhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 442111054F90;
 Fri, 14 Jan 2022 13:52:33 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4161D105B213;
 Fri, 14 Jan 2022 13:52:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/16] include/sysemu/blockdev.h: remove
 drive_mark_claimed_by_board and inline drive_def
Date: Fri, 14 Jan 2022 14:52:12 +0100
Message-Id: <20220114135226.185407-3-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

drive_def is only a particular use case of
qemu_opts_parse_noisily, so it can be inlined.

Also remove drive_mark_claimed_by_board, as it is only defined
but not implemented (nor used) anywhere.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20211215121140.456939-3-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/sysemu/blockdev.h      | 2 --
 block/monitor/block-hmp-cmds.c | 2 +-
 blockdev.c                     | 7 +------
 softmmu/vl.c                   | 4 +++-
 4 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index a750f99b79..ea35c42f5c 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -45,13 +45,11 @@ BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo);
 void override_max_devs(BlockInterfaceType type, int max_devs);
 
 DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
-void drive_mark_claimed_by_board(void);
 void drive_check_orphaned(void);
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
 int drive_get_max_bus(BlockInterfaceType type);
 int drive_get_max_devs(BlockInterfaceType type);
 
-QemuOpts *drive_def(const char *optstr);
 QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
                     const char *optstr);
 DriveInfo *drive_new(QemuOpts *arg, BlockInterfaceType block_default_type,
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
index b5ff9b854e..25b3b202e7 100644
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
diff --git a/softmmu/vl.c b/softmmu/vl.c
index a8cad43691..207a9eb8be 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2887,7 +2887,9 @@ void qemu_init(int argc, char **argv, char **envp)
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


