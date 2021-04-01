Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E85B351537
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:32:31 +0200 (CEST)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxR0-0004Bb-IX
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRxNC-0001L6-Hd
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRxNA-0004Eo-U0
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:28:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617283708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQZf1XUH9nv0RydRhZJIYRzVUDUZVMB6PjhxnjL9WrI=;
 b=el/nzS04XoMSSn6Rc0NvojL9bGRuDRW2PThKX+7hhly+c1ZBx6myhcaJ3IrADh/Xeb3p0h
 9ofvC6Rcd5iRq36nJb/XW4josks/emVAI0op5isLmMdjwjrL4/XtB3GJG2h0CHENITtHB6
 PpgkgSbLcKYuJQ3Zgg6J/u27xCxRy9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-YOLHvh16PzeW4uurVnJ9Vg-1; Thu, 01 Apr 2021 09:28:27 -0400
X-MC-Unique: YOLHvh16PzeW4uurVnJ9Vg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43C7D108BD0A;
 Thu,  1 Apr 2021 13:28:26 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 960771001281;
 Thu,  1 Apr 2021 13:28:22 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] iotests/common.qemu: Allow using the QSD
Date: Thu,  1 Apr 2021 15:28:14 +0200
Message-Id: <20210401132815.139575-2-mreitz@redhat.com>
In-Reply-To: <20210401132815.139575-1-mreitz@redhat.com>
References: <20210401132815.139575-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For block things, we often do not need to run all of qemu, so allow
using the qemu-storage-daemon instead.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.qemu | 53 +++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
index 0fc52d20d7..ca8bb43c63 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -291,6 +291,8 @@ _wait_event()
 # $qmp_pretty: Set this variable to 'y' to enable QMP pretty printing.
 # $keep_stderr: Set this variable to 'y' to keep QEMU's stderr output on stderr.
 #               If this variable is empty, stderr will be redirected to stdout.
+# $qsd: Set this variable to 'y' to use the QSD instead of QEMU.
+#       stdout and stderr are never redirected when using the QSD.
 # Returns:
 # $QEMU_HANDLE: set to a handle value to communicate with this QEMU instance.
 #
@@ -300,18 +302,31 @@ _launch_qemu()
     local fifo_out=
     local fifo_in=
 
+    if [[ $qsd = 'y' ]]; then
+        mon_arg='--monitor'
+    else
+        mon_arg='-mon'
+    fi
+
     if (shopt -s nocasematch; [[ "${qemu_comm_method}" == "monitor" ]])
     then
-        comm="-monitor stdio"
+        comm=(--chardev stdio,id=pipe
+              $mon_arg pipe,mode=readline)
     else
         local qemu_comm_method="qmp"
         if [ "$qmp_pretty" = "y" ]; then
-            comm="-monitor none -qmp-pretty stdio"
+            comm=(--chardev stdio,id=pipe
+                  $mon_arg pipe,mode=control,pretty=on)
         else
-            comm="-monitor none -qmp stdio"
+            comm=(--chardev stdio,id=pipe
+                  $mon_arg pipe,mode=control,pretty=off)
         fi
     fi
 
+    if [[ $qsd != 'y' ]]; then
+        comm=(-monitor none "${comm[@]}")
+    fi
+
     fifo_out=${QEMU_FIFO_OUT}_${_QEMU_HANDLE}
     fifo_in=${QEMU_FIFO_IN}_${_QEMU_HANDLE}
     mkfifo "${fifo_out}"
@@ -322,15 +337,23 @@ _launch_qemu()
         object_options="--object secret,id=keysec0,data=$IMGKEYSECRET"
     fi
 
+    if [[ $qsd = 'y' ]]; then
+        cmd=$QSD
+        args=()
+    else
+        cmd=$QEMU
+        args=(-nographic -serial none)
+    fi
+    args+=(${object_options} "${comm[@]}")
+    args+=("$@")
+
+    # Just set both QEMU_NEED_PID and QSD_NEED_PID, it can't hurt.
     if [ -z "$keep_stderr" ]; then
-        QEMU_NEED_PID='y'\
-        ${QEMU} ${object_options} -nographic -serial none ${comm} "${@}" >"${fifo_out}" \
-                                                       2>&1 \
-                                                       <"${fifo_in}" &
+        QEMU_NEED_PID='y' QSD_NEED_PID='y' $cmd "${args[@]}" \
+            >"$fifo_out" 2>&1 <"$fifo_in" &
     elif [ "$keep_stderr" = "y" ]; then
-        QEMU_NEED_PID='y'\
-        ${QEMU} ${object_options} -nographic -serial none ${comm} "${@}" >"${fifo_out}" \
-                                                       <"${fifo_in}" &
+        QEMU_NEED_PID='y' QSD_NEED_PID='y' $cmd "${args[@]}" \
+            >"$fifo_out" <"$fifo_in" &
     else
         exit 1
     fi
@@ -360,6 +383,16 @@ _launch_qemu()
             silent=yes _timed_wait_for ${_QEMU_HANDLE} "^}"
         fi
     fi
+
+    if [[ $qsd = 'y' ]]; then
+        # Wait for PID file, then move it to where qemu would put it
+        pidfile="$QEMU_TEST_DIR/qemu-storage-daemon.pid"
+        while [[ ! -f $pidfile ]]; do
+            sleep 0.5
+        done
+        mv "$pidfile" "$QEMU_TEST_DIR/qemu-${_QEMU_HANDLE}.pid"
+    fi
+
     QEMU_HANDLE=${_QEMU_HANDLE}
     let _QEMU_HANDLE++
 }
-- 
2.29.2


