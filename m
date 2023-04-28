Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8845D6F1EE8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:51:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psU6e-0000vd-N6; Fri, 28 Apr 2023 15:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6R-0000qC-Tn
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:50:01 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6L-00015w-HP
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:49:57 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 191DB5F745;
 Fri, 28 Apr 2023 22:49:46 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id TnPWb50Oca60-qDmFkLUz; Fri, 28 Apr 2023 22:49:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682711385; bh=e9WvsMkW12VlVf9DXehqlqSfFgrPtBAaggJQ0vR+rz4=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=eL57psKsay2RM4t195bJ0n5FCOoqX8qOwk2cpF4gxLPpYY12bKmx1zg/BLKtDyQHg
 0eG8DiiWspz+rJVYYFHgWUw6MaIieN4eQlIQzHdXyGTKwLUfhzSsjHVJs0xhH5ZfQs
 OrBJ9bRc6cQGgtI5F4FrtpnA97hVy/D8983Qomjg=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: lukasstraub2@web.de, quintela@redhat.com, chen.zhang@intel.com,
 vsementsov@yandex-team.ru, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v4 06/10] migration: process_incoming_migration_co: simplify
 code flow around ret
Date: Fri, 28 Apr 2023 22:49:24 +0300
Message-Id: <20230428194928.1426370-7-vsementsov@yandex-team.ru>
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index d4fa1a853c..8db0892317 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -533,8 +533,13 @@ process_incoming_migration_co(void *opaque)
         /* Else if something went wrong then just fall out of the normal exit */
     }
 
+    if (ret < 0) {
+        error_report("load of migration failed: %s", strerror(-ret));
+        goto fail;
+    }
+
     /* we get COLO info, and know if we are in COLO mode */
-    if (!ret && migration_incoming_colo_enabled()) {
+    if (migration_incoming_colo_enabled()) {
         QemuThread colo_incoming_thread;
 
         /* Make sure all file formats throw away their mutable metadata */
@@ -556,10 +561,6 @@ process_incoming_migration_co(void *opaque)
         colo_release_ram_cache();
     }
 
-    if (ret < 0) {
-        error_report("load of migration failed: %s", strerror(-ret));
-        goto fail;
-    }
     mis->bh = qemu_bh_new(process_incoming_migration_bh, mis);
     qemu_bh_schedule(mis->bh);
     mis->migration_incoming_co = NULL;
-- 
2.34.1


