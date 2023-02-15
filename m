Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C9697D4B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:28:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHnd-0002aN-T9; Wed, 15 Feb 2023 08:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSHnX-0002UY-5r; Wed, 15 Feb 2023 08:26:12 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSHnS-0006D9-Kd; Wed, 15 Feb 2023 08:26:10 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 4AB8C6005D;
 Wed, 15 Feb 2023 16:25:56 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b4bf::1:2e])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 nPk8g80UxeA1-uNAGPYbq; Wed, 15 Feb 2023 16:25:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676467555; bh=BF9Ccif5Ao6lLQH10lJ7mApDNkEiYj8kKEyoD/cEacE=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=neGDs6cJbzIvGVyIip8Z02L31sPzxqwyzQNhcV2sBsNzW6d2ZomT4KuOhpkCDgM1l
 qO00dOPJ/AF4pm56PArOzCh6WOONhdPb4i8qbhOdO0sphiKmLD4DLK9shPbUo0+hU2
 ZW9cCf0myxymVivuXe/cyampaQiw359ZQSK1+CyI=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, jsnow@redhat.com,
 crosa@redhat.com, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 02/16] python: fix broad-exception-raised pylint error
Date: Wed, 15 Feb 2023 16:25:33 +0300
Message-Id: <20230215132547.1620575-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
References: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Now 'make check-dev' called in python/ directory raises several

W0719: Raising too general exception: Exception (broad-exception-raised)

Let's fix.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 python/qemu/utils/qemu_ga_client.py | 6 +++---
 tests/qemu-iotests/iotests.py       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/python/qemu/utils/qemu_ga_client.py b/python/qemu/utils/qemu_ga_client.py
index 8c38a7ac9c..d8411bb2d0 100644
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
index 94aeb3f3b2..3e82c634cf 100644
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
-- 
2.34.1


