Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8F74A88A0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:34:57 +0100 (CET)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFf4S-0002g1-NF
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:34:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf0c-00084v-1v
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:30:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf0L-00008Q-HJ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643905840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RSulqQVW0FxtExJ4AU+SeV2rsAMrAzO29tdEplsmxs=;
 b=MhIM4Q0cCUcznM4GO5xybpFjqlvICxlY9t1CD4srrc2ctA9CosOZI0nNwNfhnsYGuKvIoe
 x2GCtq5cZNhOQmW5zyieeaJH5ZeoVZw0cmZXyIU6MQAaaiexqSlVPqV/JhNStw0P2qOqos
 5XS06FaW5RYpzS4wikcrw9eIafR0fVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-P9umPPGGN-OlFxK9ZZne-A-1; Thu, 03 Feb 2022 11:30:37 -0500
X-MC-Unique: P9umPPGGN-OlFxK9ZZne-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5FE81923E2D;
 Thu,  3 Feb 2022 16:30:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53013838F4;
 Thu,  3 Feb 2022 16:30:36 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/7] iotests.py: Add QemuStorageDaemon class
Date: Thu,  3 Feb 2022 17:30:21 +0100
Message-Id: <20220203163024.38913-5-hreitz@redhat.com>
In-Reply-To: <20220203163024.38913-1-hreitz@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a rather simple class that allows creating a QSD instance
running in the background and stopping it when no longer needed.

The __del__ handler is a safety net for when something goes so wrong in
a test that e.g. the tearDown() method is not called (e.g. setUp()
launches the QSD, but then launching a VM fails).  We do not want the
QSD to continue running after the test has failed, so __del__() will
take care to kill it.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 8cdb381f2a..c75e402b87 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -73,6 +73,8 @@
 qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
 qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
 
+qsd_prog = os.environ.get('QSD_PROG', 'qemu-storage-daemon')
+
 gdb_qemu_env = os.environ.get('GDB_OPTIONS')
 qemu_gdb = []
 if gdb_qemu_env:
@@ -345,6 +347,46 @@ def cmd(self, cmd):
         return self._read_output()
 
 
+class QemuStorageDaemon:
+    def __init__(self, *args: str, instance_id: Optional[str] = None):
+        if not instance_id:
+            instance_id = 'a'
+
+        self.pidfile = os.path.join(test_dir, f'qsd-{instance_id}-pid')
+        all_args = [qsd_prog] + list(args) + ['--pidfile', self.pidfile]
+
+        # Cannot use with here, we want the subprocess to stay around
+        # pylint: disable=consider-using-with
+        self._p = subprocess.Popen(all_args)
+        while not os.path.exists(self.pidfile):
+            if self._p.poll() is not None:
+                cmd = ' '.join(all_args)
+                raise RuntimeError(
+                    'qemu-storage-daemon terminated with exit code ' +
+                    f'{self._p.returncode}: {cmd}')
+
+            time.sleep(0.01)
+
+        with open(self.pidfile, encoding='utf-8') as f:
+            self._pid = int(f.read().strip())
+
+        assert self._pid == self._p.pid
+
+    def stop(self, kill_signal=15):
+        self._p.send_signal(kill_signal)
+        self._p.wait()
+        self._p = None
+
+        try:
+            os.remove(self.pidfile)
+        except OSError:
+            pass
+
+    def __del__(self):
+        if self._p is not None:
+            self.stop(kill_signal=9)
+
+
 def qemu_nbd(*args):
     '''Run qemu-nbd in daemon mode and return the parent's exit code'''
     return subprocess.call(qemu_nbd_args + ['--fork'] + list(args))
-- 
2.34.1


