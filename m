Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A076F6A0212
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 05:38:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV3Lj-0001Ry-DB; Wed, 22 Feb 2023 23:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pV3Lh-0001RU-J4
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 23:36:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pV3Lf-00027H-Gv
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 23:36:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677127010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EgD+xiO9RSRAA6HJQfndYjjvnSkcM8XaGbx0sxO7I90=;
 b=goj28tUagQvADEMg89Ju4ZlMVlB3vDeAPguJ/a0iR08vhSuh7DjO9cY2UYCpW2RYC9e+le
 oBc77dwTBzM52ZjtKtDR3knUuoNOzSq9Alwp8a0qqIIP/GrltsJlI+zDtsMhFNm3FOB8AJ
 YyRLhZonjMtUu0CFN6z+W11PnwUPOL0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-cALYqS2RNJiogt1ICughUg-1; Wed, 22 Feb 2023 23:36:49 -0500
X-MC-Unique: cALYqS2RNJiogt1ICughUg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E742E858F09;
 Thu, 23 Feb 2023 04:36:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67FCC492B00;
 Thu, 23 Feb 2023 04:36:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Subject: [PULL 1/2] python: support pylint 2.16
Date: Wed, 22 Feb 2023 23:36:46 -0500
Message-Id: <20230223043647.3161732-2-jsnow@redhat.com>
In-Reply-To: <20230223043647.3161732-1-jsnow@redhat.com>
References: <20230223043647.3161732-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Pylint 2.16 adds a few new checks that cause the optional check-tox CI
job to fail.

1. The superfluous-parens check seems to be a bit more aggressive,
2. broad-exception-raised is new; it discourages "raise Exception".

Fix these minor issues and turn the lights green.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Message-id: 20230210003147.1309376-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/protocol.py                            | 2 +-
 python/qemu/qmp/qmp_client.py                          | 2 +-
 python/qemu/utils/qemu_ga_client.py                    | 6 +++---
 tests/qemu-iotests/iotests.py                          | 4 ++--
 tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 6d3d739daa7..22e60298d28 100644
--- a/python/qemu/qmp/protocol.py
+++ b/python/qemu/qmp/protocol.py
@@ -207,7 +207,7 @@ class AsyncProtocol(Generic[T]):
     logger = logging.getLogger(__name__)
 
     # Maximum allowable size of read buffer
-    _limit = (64 * 1024)
+    _limit = 64 * 1024
 
     # -------------------------
     # Section: Public interface
diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
index b5772e7f32b..9d73ae6e7ad 100644
--- a/python/qemu/qmp/qmp_client.py
+++ b/python/qemu/qmp/qmp_client.py
@@ -198,7 +198,7 @@ async def run(self, address='/tmp/qemu.socket'):
     logger = logging.getLogger(__name__)
 
     # Read buffer limit; 10MB like libvirt default
-    _limit = (10 * 1024 * 1024)
+    _limit = 10 * 1024 * 1024
 
     # Type alias for pending execute() result items
     _PendingT = Union[Message, ExecInterruptedError]
diff --git a/python/qemu/utils/qemu_ga_client.py b/python/qemu/utils/qemu_ga_client.py
index 8c38a7ac9c0..d8411bb2d0b 100644
--- a/python/qemu/utils/qemu_ga_client.py
+++ b/python/qemu/utils/qemu_ga_client.py
@@ -155,7 +155,7 @@ def ping(self, timeout: Optional[float]) -> bool:
 
     def fsfreeze(self, cmd: str) -> object:
         if cmd not in ['status', 'freeze', 'thaw']:
-            raise Exception('Invalid command: ' + cmd)
+            raise ValueError('Invalid command: ' + cmd)
         # Can be int (freeze, thaw) or GuestFsfreezeStatus (status)
         return getattr(self.qga, 'fsfreeze' + '_' + cmd)()
 
@@ -167,7 +167,7 @@ def fstrim(self, minimum: int) -> Dict[str, object]:
 
     def suspend(self, mode: str) -> None:
         if mode not in ['disk', 'ram', 'hybrid']:
-            raise Exception('Invalid mode: ' + mode)
+            raise ValueError('Invalid mode: ' + mode)
 
         try:
             getattr(self.qga, 'suspend' + '_' + mode)()
@@ -178,7 +178,7 @@ def suspend(self, mode: str) -> None:
 
     def shutdown(self, mode: str = 'powerdown') -> None:
         if mode not in ['powerdown', 'halt', 'reboot']:
-            raise Exception('Invalid mode: ' + mode)
+            raise ValueError('Invalid mode: ' + mode)
 
         try:
             self.qga.shutdown(mode=mode)
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 94aeb3f3b20..3e82c634cfe 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -720,7 +720,7 @@ def __exit__(self, exc_type, value, traceback):
         signal.setitimer(signal.ITIMER_REAL, 0)
         return False
     def timeout(self, signum, frame):
-        raise Exception(self.errmsg)
+        raise TimeoutError(self.errmsg)
 
 def file_pattern(name):
     return "{0}-{1}".format(os.getpid(), name)
@@ -804,7 +804,7 @@ def remote_filename(path):
     elif imgproto == 'ssh':
         return "ssh://%s@127.0.0.1:22%s" % (os.environ.get('USER'), path)
     else:
-        raise Exception("Protocol %s not supported" % (imgproto))
+        raise ValueError("Protocol %s not supported" % (imgproto))
 
 class VM(qtest.QEMUQtestMachine):
     '''A QEMU VM'''
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index fc9c4b4ef41..dda55fad284 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
@@ -84,7 +84,7 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
                 e['vm'] = 'SRC'
             for e in self.vm_b_events:
                 e['vm'] = 'DST'
-            events = (self.vm_a_events + self.vm_b_events)
+            events = self.vm_a_events + self.vm_b_events
             events = [(e['timestamp']['seconds'],
                        e['timestamp']['microseconds'],
                        e['vm'],
-- 
2.39.0


