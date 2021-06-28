Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA44E3B5E51
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:44:20 +0200 (CEST)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqcd-0005Qn-Lq
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lxqRC-00078u-2d
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:32:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lxqR7-0003Dm-KI
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624883544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHWZtqNvl/YLGyLOiUuiUalq5tGvTYqCzazXdWHLgxQ=;
 b=IBD+MbkdedBfvvTB5k+xU7cOqLs2d9UxH5k3iZQDOZfaQ5RYa9MsmKnDr4ofXsuDxMKwlJ
 bqzBk1/MXrXTKvcyM+fDWEOqLfAfFvEwUcCvPHrY9RyvQijcLdxr1HM/xVhTqR2gLDMZAt
 xVR263Pf6Tz1L5jVp8JHdp+WwU54ueI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-NEHaGIJlMna5UdXWH10p2A-1; Mon, 28 Jun 2021 08:32:23 -0400
X-MC-Unique: NEHaGIJlMna5UdXWH10p2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3480D81CCC7;
 Mon, 28 Jun 2021 12:32:16 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-69.ams2.redhat.com
 [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6F2046;
 Mon, 28 Jun 2021 12:32:13 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 08/16] qemu-iotests: add gdbserver option to script tests
 too
Date: Mon, 28 Jun 2021 14:31:42 +0200
Message-Id: <20210628123150.56567-9-eesposit@redhat.com>
In-Reply-To: <20210628123150.56567-1-eesposit@redhat.com>
References: <20210628123150.56567-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


