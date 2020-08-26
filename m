Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBFE252E95
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 14:18:44 +0200 (CEST)
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAuO3-00056N-KQ
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 08:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1kAuMf-0003ax-BV; Wed, 26 Aug 2020 08:17:17 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:39896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1kAuMb-0004Cl-UM; Wed, 26 Aug 2020 08:17:17 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 98364448C0;
 Wed, 26 Aug 2020 14:17:01 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/3] backup: initialize bcs bitmap on job create, not start
Date: Wed, 26 Aug 2020 14:13:59 +0200
Message-Id: <20200826121359.15450-4-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200826121359.15450-1-s.reiter@proxmox.com>
References: <20200826121359.15450-1-s.reiter@proxmox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 08:17:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, w.bumiller@proxmox.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com,
 dietmar@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After backup_init_bcs_bitmap the copy-before-write behaviour is active.
This way, multiple backup jobs created at once but running in a
sequential transaction will still represent the same point in time.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---

I'd imagine this was done on job start for a purpose, so this is potentially
wrong. In testing it works fine.

Sent along for feedback, since it would be necessary to really make use of the
sequential backup feature (without it, the individual backup jobs would not have
a consistent view of the guest).


 block/backup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 4f13bb20a5..14660eef45 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -237,8 +237,6 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
     int ret = 0;
 
-    backup_init_bcs_bitmap(s);
-
     if (s->sync_mode == MIRROR_SYNC_MODE_TOP) {
         int64_t offset = 0;
         int64_t count;
@@ -471,6 +469,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
                        &error_abort);
 
+    backup_init_bcs_bitmap(job);
+
     return &job->common;
 
  error:
-- 
2.20.1



