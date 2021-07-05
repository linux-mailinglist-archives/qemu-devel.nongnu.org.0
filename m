Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F3A3BB77B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 09:06:15 +0200 (CEST)
Received: from localhost ([::1]:37880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0IgI-0000mT-2V
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 03:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m0IY9-0002iL-P1
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:57:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m0IY6-0004K2-Uz
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625468266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHWZtqNvl/YLGyLOiUuiUalq5tGvTYqCzazXdWHLgxQ=;
 b=LrMBo7PFLQKBC4iGnxAlnl9Q7JERHhUInHkmBlUnuxj68V91GmW54inCWA0Ue7dZ12BQci
 ChP3xKF6kp5PT738L6qULKoyou475Yc9y2FZwrxYNy7vRW6+pylKJkLQkOhinjP5sqHk/w
 tihwyylGDfSDDmx7Ms5X/tRpR3RPvds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-sA8tHWskNHuQeGfiUrdnHQ-1; Mon, 05 Jul 2021 02:57:45 -0400
X-MC-Unique: sA8tHWskNHuQeGfiUrdnHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14C3B804140;
 Mon,  5 Jul 2021 06:57:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-244.ams2.redhat.com
 [10.36.112.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 898CB100EBAF;
 Mon,  5 Jul 2021 06:57:41 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 08/16] qemu-iotests: add gdbserver option to script tests
 too
Date: Mon,  5 Jul 2021 08:57:03 +0200
Message-Id: <20210705065711.127119-9-eesposit@redhat.com>
In-Reply-To: <20210705065711.127119-1-eesposit@redhat.com>
References: <20210705065711.127119-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove read timer in test script when GDB_OPTIONS are set,
so that the bash tests won't timeout while running gdb.

The only limitation here is that running a script with gdbserver
will make the test output mismatch with the expected
results, making the test fail.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/common.qemu | 7 ++++++-
 tests/qemu-iotests/common.rc   | 8 +++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
index 0fc52d20d7..cbca757b49 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -85,7 +85,12 @@ _timed_wait_for()
     timeout=yes
 
     QEMU_STATUS[$h]=0
-    while IFS= read -t ${QEMU_COMM_TIMEOUT} resp <&${QEMU_OUT[$h]}
+    read_timeout="-t ${QEMU_COMM_TIMEOUT}"
+    if [ ! -z ${GDB_OPTIONS} ]; then
+        read_timeout=
+    fi
+
+    while IFS= read ${read_timeout} resp <&${QEMU_OUT[$h]}
     do
         if [ -n "$capture_events" ]; then
             capture=0
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index cbbf6d7c7f..a1ef2b5c2f 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -166,8 +166,14 @@ _qemu_wrapper()
         if [ -n "${QEMU_NEED_PID}" ]; then
             echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid"
         fi
+
+        GDB=""
+        if [ ! -z ${GDB_OPTIONS} ]; then
+            GDB="gdbserver ${GDB_OPTIONS}"
+        fi
+
         VALGRIND_QEMU="${VALGRIND_QEMU_VM}" _qemu_proc_exec "${VALGRIND_LOGFILE}" \
-            "$QEMU_PROG" $QEMU_OPTIONS "$@"
+            $GDB "$QEMU_PROG" $QEMU_OPTIONS "$@"
     )
     RETVAL=$?
     _qemu_proc_valgrind_log "${VALGRIND_LOGFILE}" $RETVAL
-- 
2.31.1


