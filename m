Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB076F1EDF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:51:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psU6W-0000s3-Qs; Fri, 28 Apr 2023 15:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6R-0000qA-ST
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:50:01 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6L-00015u-HQ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:49:56 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 4A84360DC2;
 Fri, 28 Apr 2023 22:49:45 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id TnPWb50Oca60-qOQewefi; Fri, 28 Apr 2023 22:49:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682711384; bh=eUsm5JPrT4xdvJGnnsrNlFCpNAOuzCV906gGboTWh+k=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=kEUoo4fXwbvEu+Q5Yn10pzSVU6+978cDK5qdrQu8zpAUN1QR4fU+zDJ897rB5NcE3
 OvuSjIfCI3VUx6UF7JfTJS5bz7ZbksXqqPl0Ia+mHCHzRCReSoau94VeX7daZmyETO
 aCDwaxR/zkVT1Fq997fhTi9uP6F6QBiZ4sq4jtVU=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: lukasstraub2@web.de, quintela@redhat.com, chen.zhang@intel.com,
 vsementsov@yandex-team.ru, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v4 05/10] migration: drop colo_incoming_thread from
 MigrationIncomingState
Date: Fri, 28 Apr 2023 22:49:23 +0300
Message-Id: <20230428194928.1426370-6-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

have_colo_incoming_thread variable is unused. colo_incoming_thread can
be local.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 7 ++++---
 migration/migration.h | 2 --
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 0c14837cd3..d4fa1a853c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -535,6 +535,8 @@ process_incoming_migration_co(void *opaque)
 
     /* we get COLO info, and know if we are in COLO mode */
     if (!ret && migration_incoming_colo_enabled()) {
+        QemuThread colo_incoming_thread;
+
         /* Make sure all file formats throw away their mutable metadata */
         bdrv_activate_all(&local_err);
         if (local_err) {
@@ -542,14 +544,13 @@ process_incoming_migration_co(void *opaque)
             goto fail;
         }
 
-        qemu_thread_create(&mis->colo_incoming_thread, "COLO incoming",
+        qemu_thread_create(&colo_incoming_thread, "COLO incoming",
              colo_process_incoming_thread, mis, QEMU_THREAD_JOINABLE);
-        mis->have_colo_incoming_thread = true;
         qemu_coroutine_yield();
 
         qemu_mutex_unlock_iothread();
         /* Wait checkpoint incoming thread exit before free resource */
-        qemu_thread_join(&mis->colo_incoming_thread);
+        qemu_thread_join(&colo_incoming_thread);
         qemu_mutex_lock_iothread();
         /* We hold the global iothread lock, so it is safe here */
         colo_release_ram_cache();
diff --git a/migration/migration.h b/migration/migration.h
index 3a918514e7..7721c7658b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -162,8 +162,6 @@ struct MigrationIncomingState {
 
     int state;
 
-    bool have_colo_incoming_thread;
-    QemuThread colo_incoming_thread;
     /* The coroutine we should enter (back) after failover */
     Coroutine *migration_incoming_co;
     QemuSemaphore colo_incoming_sem;
-- 
2.34.1


