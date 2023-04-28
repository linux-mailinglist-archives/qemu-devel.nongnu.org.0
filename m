Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888166F1EE0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:51:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psU6T-0000pB-P5; Fri, 28 Apr 2023 15:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6L-0000nm-Oc
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:49:53 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6H-00013O-L1
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:49:52 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 28E2C5E7EC;
 Fri, 28 Apr 2023 22:49:42 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id TnPWb50Oca60-zfzyQfVD; Fri, 28 Apr 2023 22:49:41 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682711381; bh=qXZQ9a2UoFOCKJScTxIbnQa7xYmtnglvTxlpoRXJtE4=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=gpnwhnN5qOgfbKgu78ROdJjM1LlPsKeD3DV2LF1wqQmsIt3lBkpybX+lubR/fR13H
 n06pyi3YpYebz0yzjP5HirkPMT4q5V22fi3bMNhFLQAkEpMTJM3bYjhDjDKFDcF/sW
 a0Am7MgLLKINMkj0jBCJBtk1C61D2bHBymjzSQ9c=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: lukasstraub2@web.de, quintela@redhat.com, chen.zhang@intel.com,
 vsementsov@yandex-team.ru, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v4 02/10] colo: make colo_checkpoint_notify static and provide
 simpler API
Date: Fri, 28 Apr 2023 22:49:20 +0300
Message-Id: <20230428194928.1426370-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

colo_checkpoint_notify() is mostly used in colo.c. Outside we use it
once when x-checkpoint-delay migration parameter is set. So, let's
simplify the external API to only that function - notify COLO that
parameter was set. This make external API more robust and hides
implementation details from external callers. Also this helps us to
make COLO module optional in further patch (i.e. we are going to add
possibility not build the COLO module).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/migration/colo.h |  9 ++++++++-
 migration/colo.c         | 29 ++++++++++++++++++-----------
 migration/options.c      |  4 +---
 3 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/include/migration/colo.h b/include/migration/colo.h
index 5fbe1a6d5d..7ef315473e 100644
--- a/include/migration/colo.h
+++ b/include/migration/colo.h
@@ -36,6 +36,13 @@ COLOMode get_colo_mode(void);
 /* failover */
 void colo_do_failover(void);
 
-void colo_checkpoint_notify(void *opaque);
+/*
+ * colo_checkpoint_delay_set
+ *
+ * Handles change of x-checkpoint-delay migration parameter, called from
+ * migrate_params_apply() to notify COLO module about the change.
+ */
+void colo_checkpoint_delay_set(void);
+
 void colo_shutdown(void);
 #endif
diff --git a/migration/colo.c b/migration/colo.c
index 07bfa21fea..c9e0b909b9 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -65,6 +65,24 @@ static bool colo_runstate_is_stopped(void)
     return runstate_check(RUN_STATE_COLO) || !runstate_is_running();
 }
 
+static void colo_checkpoint_notify(void *opaque)
+{
+    MigrationState *s = opaque;
+    int64_t next_notify_time;
+
+    qemu_event_set(&s->colo_checkpoint_event);
+    s->colo_checkpoint_time = qemu_clock_get_ms(QEMU_CLOCK_HOST);
+    next_notify_time = s->colo_checkpoint_time + migrate_checkpoint_delay();
+    timer_mod(s->colo_delay_timer, next_notify_time);
+}
+
+void colo_checkpoint_delay_set(void)
+{
+    if (migration_in_colo_state()) {
+        colo_checkpoint_notify(migrate_get_current());
+    }
+}
+
 static void secondary_vm_do_failover(void)
 {
 /* COLO needs enable block-replication */
@@ -644,17 +662,6 @@ out:
     }
 }
 
-void colo_checkpoint_notify(void *opaque)
-{
-    MigrationState *s = opaque;
-    int64_t next_notify_time;
-
-    qemu_event_set(&s->colo_checkpoint_event);
-    s->colo_checkpoint_time = qemu_clock_get_ms(QEMU_CLOCK_HOST);
-    next_notify_time = s->colo_checkpoint_time + migrate_checkpoint_delay();
-    timer_mod(s->colo_delay_timer, next_notify_time);
-}
-
 void migrate_start_colo_process(MigrationState *s)
 {
     qemu_mutex_unlock_iothread();
diff --git a/migration/options.c b/migration/options.c
index 53b7fc5d5d..865a0214d8 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -1246,9 +1246,7 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
 
     if (params->has_x_checkpoint_delay) {
         s->parameters.x_checkpoint_delay = params->x_checkpoint_delay;
-        if (migration_in_colo_state()) {
-            colo_checkpoint_notify(s);
-        }
+        colo_checkpoint_delay_set();
     }
 
     if (params->has_block_incremental) {
-- 
2.34.1


