Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFEC6F1EE9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:51:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psU6e-0000u9-45; Fri, 28 Apr 2023 15:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6R-0000qB-TP
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:50:01 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6N-00017E-DU
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:49:58 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id B83895F768;
 Fri, 28 Apr 2023 22:49:48 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id TnPWb50Oca60-7ktlBZag; Fri, 28 Apr 2023 22:49:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682711388; bh=B2qHv37nMRhw3yfiZx6NhyUq5cpbiXzOgJrOlkKnTXw=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=IqgJaTfyEEVn+OCT1/9XlUcMzHApHt1+KK1eRxx8pE+WRf4AEZl+nc+Zm6MnBwP+N
 itSdM1cdveEPVOh/V55ULH1TWwALyS5YlPy2E3C/v1cB1StUIXKyHhBuJjjwJdmmLF
 4k+aN+ElbAUzEBQ8ts7HG15T/jgRpkazY9fCPZ/Y=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: lukasstraub2@web.de, quintela@redhat.com, chen.zhang@intel.com,
 vsementsov@yandex-team.ru, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v4 09/10] migration: disallow change capabilities in COLO state
Date: Fri, 28 Apr 2023 22:49:27 +0300
Message-Id: <20230428194928.1426370-10-vsementsov@yandex-team.ru>
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

COLO is not listed as running state in migrate_is_running(), so, it's
theoretically possible to disable colo capability in COLO state and the
unexpected error in migration_iteration_finish() is reachable.

Let's disallow that in qmp_migrate_set_capabilities. Than the error
becomes absolutely unreachable: we can get into COLO state only with
enabled capability and can't disable it while we are in COLO state. So
substitute the error by simple assertion.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 5 +----
 migration/options.c   | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 0d912ee0d7..8c5bbf3e94 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2751,10 +2751,7 @@ static void migration_iteration_finish(MigrationState *s)
         runstate_set(RUN_STATE_POSTMIGRATE);
         break;
     case MIGRATION_STATUS_COLO:
-        if (!migrate_colo()) {
-            error_report("%s: critical error: calling COLO code without "
-                         "COLO enabled", __func__);
-        }
+        assert(migrate_colo());
         migrate_start_colo_process(s);
         s->vm_was_running = true;
         /* Fallthrough */
diff --git a/migration/options.c b/migration/options.c
index 865a0214d8..f461d02eeb 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -598,7 +598,7 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
     MigrationCapabilityStatusList *cap;
     bool new_caps[MIGRATION_CAPABILITY__MAX];
 
-    if (migration_is_running(s->state)) {
+    if (migration_is_running(s->state) || migration_in_colo_state()) {
         error_setg(errp, QERR_MIGRATION_ACTIVE);
         return;
     }
-- 
2.34.1


