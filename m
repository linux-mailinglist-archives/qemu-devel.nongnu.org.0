Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4912C0F40
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:48:21 +0100 (CET)
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khE4h-0006xd-BW
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khE1W-0005LU-P4; Mon, 23 Nov 2020 10:45:02 -0500
Received: from relay.sw.ru ([185.231.240.75]:43472 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khE1U-0008Om-W6; Mon, 23 Nov 2020 10:45:02 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khE18-009zBo-R6; Mon, 23 Nov 2020 18:44:38 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com,
 dgilbert@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v2 1/2] iotests: add another bash sleep command to 247
Date: Mon, 23 Nov 2020 18:44:33 +0300
Message-Id: <1606146274-246154-2-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
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

This patch paves the way for the one that follows. The following patch
makes the QMP monitor to read up to 4K from stdin at once. That results
in running the bash 'sleep' command before the _qemu_proc_exec() starts
in subshell. Another 'sleep' command with an unobtrusive 'query-status'
plays as a workaround.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/247     | 2 ++
 tests/qemu-iotests/247.out | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/247 b/tests/qemu-iotests/247
index 87e37b3..7d316ec 100755
--- a/tests/qemu-iotests/247
+++ b/tests/qemu-iotests/247
@@ -59,6 +59,8 @@ TEST_IMG="$TEST_IMG.4" _make_test_img $size
 {"execute":"block-commit",
  "arguments":{"device":"format-4", "top-node": "format-2", "base-node":"format-0", "job-id":"job0"}}
 EOF
+sleep 1
+echo '{"execute":"query-status"}'
 if [ "${VALGRIND_QEMU}" == "y" ]; then
     sleep 10
 else
diff --git a/tests/qemu-iotests/247.out b/tests/qemu-iotests/247.out
index e909e83..13d9547 100644
--- a/tests/qemu-iotests/247.out
+++ b/tests/qemu-iotests/247.out
@@ -17,6 +17,7 @@ QMP_VERSION
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 134217728, "offset": 134217728, "speed": 0, "type": "commit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
+{"return": {"status": "running", "singlestep": false, "running": true}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 *** done
-- 
1.8.3.1


