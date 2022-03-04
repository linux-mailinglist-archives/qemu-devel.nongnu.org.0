Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9074CDB71
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:56:04 +0100 (CET)
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQC9q-00085o-Uo
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:56:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6l-0006ml-Fc
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6j-00081M-J1
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjYOx8PF5XhaZNI6XlydFCe206hP78FYRIgWjsb9uQs=;
 b=LiKPyR597Z+XUSXKWHfh9FlOHNJW04QZ48iVsbc/s7iZL+SRqny5yyMLxgGyIFxAFciWSv
 kS0ek/glMXEwIeIGxZGMwMNj1ahPQ9uihonT1J8IT8k62Uov7ruSFMtg5RJWuUeNTzLkbJ
 B0YJaewsfamrUn6hTglaF+0T3gyxDg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-v0jQjU0lOM-fH0GuDPtBKg-1; Fri, 04 Mar 2022 11:48:43 -0500
X-MC-Unique: v0jQjU0lOM-fH0GuDPtBKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1027814600;
 Fri,  4 Mar 2022 16:48:42 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01D6E8658F;
 Fri,  4 Mar 2022 16:48:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 46/50] iotests: Allow using QMP with the QSD
Date: Fri,  4 Mar 2022 17:47:07 +0100
Message-Id: <20220304164711.474713-47-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

Add a parameter to optionally open a QMP connection when creating a
QemuStorageDaemon instance.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220216105355.30729-3-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/iotests.py | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6ba65eb1ff..6027780180 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -39,6 +39,7 @@
 
 from qemu.machine import qtest
 from qemu.qmp import QMPMessage
+from qemu.aqmp.legacy import QEMUMonitorProtocol
 
 # Use this logger for logging messages directly from the iotests module
 logger = logging.getLogger('qemu.iotests')
@@ -348,14 +349,30 @@ def cmd(self, cmd):
 
 
 class QemuStorageDaemon:
-    def __init__(self, *args: str, instance_id: str = 'a'):
+    _qmp: Optional[QEMUMonitorProtocol] = None
+    _qmpsock: Optional[str] = None
+    # Python < 3.8 would complain if this type were not a string literal
+    # (importing `annotations` from `__future__` would work; but not on <= 3.6)
+    _p: 'Optional[subprocess.Popen[bytes]]' = None
+
+    def __init__(self, *args: str, instance_id: str = 'a', qmp: bool = False):
         assert '--pidfile' not in args
         self.pidfile = os.path.join(test_dir, f'qsd-{instance_id}-pid')
         all_args = [qsd_prog] + list(args) + ['--pidfile', self.pidfile]
 
+        if qmp:
+            self._qmpsock = os.path.join(sock_dir, f'qsd-{instance_id}.sock')
+            all_args += ['--chardev',
+                         f'socket,id=qmp-sock,path={self._qmpsock}',
+                         '--monitor', 'qmp-sock']
+
+            self._qmp = QEMUMonitorProtocol(self._qmpsock, server=True)
+
         # Cannot use with here, we want the subprocess to stay around
         # pylint: disable=consider-using-with
         self._p = subprocess.Popen(all_args)
+        if self._qmp is not None:
+            self._qmp.accept()
         while not os.path.exists(self.pidfile):
             if self._p.poll() is not None:
                 cmd = ' '.join(all_args)
@@ -370,11 +387,24 @@ def __init__(self, *args: str, instance_id: str = 'a'):
 
         assert self._pid == self._p.pid
 
+    def qmp(self, cmd: str, args: Optional[Dict[str, object]] = None) \
+            -> QMPMessage:
+        assert self._qmp is not None
+        return self._qmp.cmd(cmd, args)
+
     def stop(self, kill_signal=15):
         self._p.send_signal(kill_signal)
         self._p.wait()
         self._p = None
 
+        if self._qmp:
+            self._qmp.close()
+
+        if self._qmpsock is not None:
+            try:
+                os.remove(self._qmpsock)
+            except OSError:
+                pass
         try:
             os.remove(self.pidfile)
         except OSError:
-- 
2.35.1


