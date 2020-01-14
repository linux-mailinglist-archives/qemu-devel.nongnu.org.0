Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156713A4BF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 11:00:41 +0100 (CET)
Received: from localhost ([::1]:35744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irJ04-00087P-Fo
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 05:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fengzhimin1@huawei.com>) id 1irIjU-0002U3-Tf
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:43:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fengzhimin1@huawei.com>) id 1irIjR-00029Z-3P
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:43:32 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:60678 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fengzhimin1@huawei.com>)
 id 1irIjQ-00026e-PC
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:43:29 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 991745033930F92FDFD6;
 Tue, 14 Jan 2020 17:43:18 +0800 (CST)
Received: from huawei.com (10.173.220.198) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Tue, 14 Jan 2020
 17:43:12 +0800
From: Zhimin Feng <fengzhimin1@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH] migration: Maybe VM is paused when migration is cancelled
Date: Tue, 14 Jan 2020 17:43:09 +0800
Message-ID: <20200114094309.1309-1-fengzhimin1@huawei.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.220.198]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: Euler Robot <euler.robot@huawei.com>, Zhimin Feng <fengzhimin1@huawei.com>,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the migration is cancelled when it is in the completion phase,
the migration state is set to MIGRATION_STATUS_CANCELLING.
The VM maybe wait for the 'pause_sem' semaphore in migration_maybe_pause
function, so that VM always is paused.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
---
 migration/migration.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 354ad07..82ee981 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2765,14 +2765,22 @@ static int migration_maybe_pause(MigrationState *=
s,
         /* This block intentionally left blank */
     }
=20
-    qemu_mutex_unlock_iothread();
-    migrate_set_state(&s->state, *current_active_state,
-                      MIGRATION_STATUS_PRE_SWITCHOVER);
-    qemu_sem_wait(&s->pause_sem);
-    migrate_set_state(&s->state, MIGRATION_STATUS_PRE_SWITCHOVER,
-                      new_state);
-    *current_active_state =3D new_state;
-    qemu_mutex_lock_iothread();
+    /*
+     * If the migration is cancelled when it is in the completion phase,
+     * the migration state is set to MIGRATION_STATUS_CANCELLING.
+     * So we don't need to wait a semaphore, otherwise we would always
+     * wait for the 'pause_sem' semaphore.
+     */
+    if (s->state !=3D MIGRATION_STATUS_CANCELLING) {
+        qemu_mutex_unlock_iothread();
+        migrate_set_state(&s->state, *current_active_state,
+                          MIGRATION_STATUS_PRE_SWITCHOVER);
+        qemu_sem_wait(&s->pause_sem);
+        migrate_set_state(&s->state, MIGRATION_STATUS_PRE_SWITCHOVER,
+                          new_state);
+        *current_active_state =3D new_state;
+        qemu_mutex_lock_iothread();
+    }
=20
     return s->state =3D=3D new_state ? 0 : -EINVAL;
 }
--=20
1.8.3.1



