Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8223C4A984E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 12:17:19 +0100 (CET)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFwac-0007Jn-KW
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 06:17:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwU1-0003Jl-L2
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:10:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFwTz-0004Vg-Vu
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643973027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vg0OZdTaTYHT99tm8TpXpMaC2CEMVOg4VunklFZeHc=;
 b=AB+Hp7n7AQu91xE/8d//CxJ6ORiN0/zBqbGZCW5Ik9auZlSfMGKNdC0tAeOfgAb+QrgsRL
 K7/N0a8rkY7+aL4/ZEdSKdTZlBlR4euSm7q+hnYnuAHfWRPAL6hmbNkr8xU0utW8UabHZl
 e7FfS7FLKnKUqbq8MguF7fhMy+q9ztQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-bhGtOlPcPtWGI1cUshch5g-1; Fri, 04 Feb 2022 06:10:24 -0500
X-MC-Unique: bhGtOlPcPtWGI1cUshch5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 364E483DD2A;
 Fri,  4 Feb 2022 11:10:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF24E7B6F1;
 Fri,  4 Feb 2022 11:10:22 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 4/7] iotests.py: Add QemuStorageDaemon class
Date: Fri,  4 Feb 2022 12:10:09 +0100
Message-Id: <20220204111012.34720-5-hreitz@redhat.com>
In-Reply-To: <20220204111012.34720-1-hreitz@redhat.com>
References: <20220204111012.34720-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 8cdb381f2a..6ba65eb1ff 100644
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
@@ -345,6 +347,44 @@ def cmd(self, cmd):
         return self._read_output()
 
 
+class QemuStorageDaemon:
+    def __init__(self, *args: str, instance_id: str = 'a'):
+        assert '--pidfile' not in args
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


