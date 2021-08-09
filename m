Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143033E4201
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:05:20 +0200 (CEST)
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1Dj-0001PR-4h
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1AH-0001gv-0u
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1AE-0001dG-Eo
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628499701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OERMqEF2Etx1y+VJKLVPHzdWkDEEnP16BJst/vW/fZI=;
 b=D0b8bOfE/4az39E50I2wtgei/aGEfeIJK5t5a64JL9Un1CqvOTCxzHri+Hp5ryN00mWZzW
 p00979bnFGRMPp3AtKn9xzgpr18oySj0TTg9F924wgcphNVtdctPRX/BkAEPUaUvOajv6C
 bDzLKlDNtwjkIgTXpXPrFJQP+AxSVMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-XOdeZYogPT2xYoJIPPQMHQ-1; Mon, 09 Aug 2021 05:01:40 -0400
X-MC-Unique: XOdeZYogPT2xYoJIPPQMHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74982801B3D;
 Mon,  9 Aug 2021 09:01:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1D686A05F;
 Mon,  9 Aug 2021 09:01:36 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 08/16] qemu-iotests: add gdbserver option to script tests
 too
Date: Mon,  9 Aug 2021 11:01:06 +0200
Message-Id: <20210809090114.64834-9-eesposit@redhat.com>
In-Reply-To: <20210809090114.64834-1-eesposit@redhat.com>
References: <20210809090114.64834-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 0fc52d20d7..0f1fecc68e 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -85,7 +85,12 @@ _timed_wait_for()
     timeout=yes
 
     QEMU_STATUS[$h]=0
-    while IFS= read -t ${QEMU_COMM_TIMEOUT} resp <&${QEMU_OUT[$h]}
+    read_timeout="-t ${QEMU_COMM_TIMEOUT}"
+    if [ -n "${GDB_OPTIONS}" ]; then
+        read_timeout=
+    fi
+
+    while IFS= read ${read_timeout} resp <&${QEMU_OUT[$h]}
     do
         if [ -n "$capture_events" ]; then
             capture=0
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 609d82de89..d8582454de 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -166,8 +166,14 @@ _qemu_wrapper()
         if [ -n "${QEMU_NEED_PID}" ]; then
             echo $BASHPID > "${QEMU_TEST_DIR}/qemu-${_QEMU_HANDLE}.pid"
         fi
+
+        GDB=""
+        if [ -n "${GDB_OPTIONS}" ]; then
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


