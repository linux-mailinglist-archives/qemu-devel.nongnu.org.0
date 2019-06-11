Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A8E3D4FD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 20:05:58 +0200 (CEST)
Received: from localhost ([::1]:33552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hal9h-00084W-OS
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 14:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hal6K-00067y-M9
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 14:02:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hal6I-0005S7-DD
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 14:02:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:34314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hal6C-0005Iy-IA; Tue, 11 Jun 2019 14:02:22 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hal66-0002AB-T8; Tue, 11 Jun 2019 21:02:15 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 11 Jun 2019 21:02:10 +0300
Message-Id: <1560276131-683243-7-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1560276131-683243-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1560276131-683243-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 6/7] iotests: amend QEMU NBD process
 synchronization
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 mreitz@redhat.com, rkagan@virtuozzo.com, andrey.shinkevich@virtuozzo.com,
 den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Processes are dying harder under the Valgring. It results in counting
the dying process as a newborn one. Make it sure that old NBD job get
finished before starting a new one.

Suggested-by: Roman Kagan <rkagan@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/common.nbd | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qemu-iotests/common.nbd b/tests/qemu-iotests/common.nbd
index 25fc9ff..e3dcc60 100644
--- a/tests/qemu-iotests/common.nbd
+++ b/tests/qemu-iotests/common.nbd
@@ -22,6 +22,7 @@
 nbd_unix_socket="${TEST_DIR}/qemu-nbd.sock"
 nbd_tcp_addr="127.0.0.1"
 nbd_pid_file="${TEST_DIR}/qemu-nbd.pid"
+nbd_job_pid=""
 
 nbd_server_stop()
 {
@@ -33,6 +34,9 @@ nbd_server_stop()
             kill "$NBD_PID"
         fi
     fi
+    if [ -n "$nbd_job_pid" ] && kill -s 0 "$nbd_job_pid" 2>/dev/null; then
+        wait "$nbd_job_pid"
+    fi
     rm -f "$nbd_unix_socket"
 }
 
@@ -61,6 +65,7 @@ nbd_server_start_unix_socket()
 {
     nbd_server_stop
     $QEMU_NBD -v -t -k "$nbd_unix_socket" "$@" &
+    nbd_job_pid=$!
     nbd_server_wait_for_unix_socket $!
 }
 
@@ -105,5 +110,6 @@ nbd_server_start_tcp_socket()
 {
     nbd_server_stop
     $QEMU_NBD -v -t -b $nbd_tcp_addr -p $nbd_tcp_port "$@" &
+    nbd_job_pid=$!
     nbd_server_wait_for_tcp_socket $!
 }
-- 
1.8.3.1


