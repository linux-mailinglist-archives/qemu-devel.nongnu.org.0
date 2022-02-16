Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7C64B8642
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:56:25 +0100 (CET)
Received: from localhost ([::1]:37638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHyy-0001TS-Fy
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:56:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKHxR-0007ev-I5
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:54:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKHxN-0001uQ-EM
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645008883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmXOH52WHHHlkQ8ykG72P/Fg40u1I9GHba+vw+GwmXk=;
 b=JWOkGTRko9TiVoPf+p+gvqo56uDusYtvdkHL+ZtLpLigyS2aREmkeXnwaRkcl/UsbS2EQY
 ef+BqFN6EH7YDj26bJFFR496zR+GYCZngnIi5R2v2twJp9YX6msILGg7xe5FwrWH+ddx00
 3P+eNqDlhDExd4jqPu/eP7Qcq/WoaDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-7JNYyCx4Pm-c2iDg_tPxUQ-1; Wed, 16 Feb 2022 05:54:42 -0500
X-MC-Unique: 7JNYyCx4Pm-c2iDg_tPxUQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 587D8802924;
 Wed, 16 Feb 2022 10:54:41 +0000 (UTC)
Received: from localhost (unknown [10.39.195.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E0578DD9;
 Wed, 16 Feb 2022 10:54:05 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/3] iotests: Allow using QMP with the QSD
Date: Wed, 16 Feb 2022 11:53:54 +0100
Message-Id: <20220216105355.30729-3-hreitz@redhat.com>
In-Reply-To: <20220216105355.30729-1-hreitz@redhat.com>
References: <20220216105355.30729-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a parameter to optionally open a QMP connection when creating a
QemuStorageDaemon instance.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
2.34.1


