Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAB2C6709
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:41:42 +0100 (CET)
Received: from localhost ([::1]:48152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kie0L-0002Rs-Dl
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidvR-0005um-Mx; Fri, 27 Nov 2020 08:36:37 -0500
Received: from relay.sw.ru ([185.231.240.75]:52496 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidvP-0003BA-MH; Fri, 27 Nov 2020 08:36:37 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidux-00AfjY-5Y; Fri, 27 Nov 2020 16:36:07 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 mdroth@linux.vnet.ibm.com, thuth@redhat.com, lvivier@redhat.com,
 armbru@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 den@openvz.org, vsementsov@virtuozzo.com, andrey.shinkevich@virtuozzo.com
Subject: [PATCH v3 1/5] monitor: change function obsolete name in comments
Date: Fri, 27 Nov 2020 16:35:42 +0300
Message-Id: <1606484146-913540-2-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

The function name monitor_qmp_bh_dispatcher() has been changed to
monitor_qmp_dispatcher_co() since the commit 9ce44e2c. Let's amend the
comments.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 monitor/qmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index b42f8c6..7169366 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -80,7 +80,7 @@ static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
     qemu_mutex_lock(&mon->qmp_queue_lock);
 
     /*
-     * Same condition as in monitor_qmp_bh_dispatcher(), but before
+     * Same condition as in monitor_qmp_dispatcher_co(), but before
      * removing an element from the queue (hence no `- 1`).
      * Also, the queue should not be empty either, otherwise the
      * monitor hasn't been suspended yet (or was already resumed).
@@ -343,7 +343,7 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
 
     /*
      * Suspend the monitor when we can't queue more requests after
-     * this one.  Dequeuing in monitor_qmp_bh_dispatcher() or
+     * this one.  Dequeuing in monitor_qmp_dispatcher_co() or
      * monitor_qmp_cleanup_queue_and_resume() will resume it.
      * Note that when OOB is disabled, we queue at most one command,
      * for backward compatibility.
-- 
1.8.3.1


