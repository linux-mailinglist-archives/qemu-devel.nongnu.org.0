Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10D2697D32
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHnb-0002WG-Ms; Wed, 15 Feb 2023 08:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSHnX-0002Uc-Ar
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:26:12 -0500
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSHnS-0006D7-Hj
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:26:11 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 2EA4260042;
 Wed, 15 Feb 2023 16:25:55 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b4bf::1:2e])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 nPk8g80UxeA1-Zqb6D0Rf; Wed, 15 Feb 2023 16:25:54 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676467554; bh=20ZYspOoLkdDiu/y3xIksBPWcAcMTz8TJrJGLAPEosU=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=ew8mrWUBNcw2LR/rkxUE+wmccBuS9K1J+wXs27XusRck91nq8fmfrUhdu9VTzL+Br
 BpT1NzvNSruCXqBj6i5eqbJjPbQzBO5B2Xz8RZ7cQ9SfJq41MVE4cJdD/3PHoRP77C
 i60TYfjzHnX1ANCAaxBm5A838TGXk2y5vTn3ZsGE=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, jsnow@redhat.com,
 crosa@redhat.com, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 01/16] python: fix superfluous-parens pylint error
Date: Wed, 15 Feb 2023 16:25:32 +0300
Message-Id: <20230215132547.1620575-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
References: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
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

Now make check-dev called in python/ directory fails due to this error.
Let's fix it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 python/qemu/qmp/protocol.py                            | 2 +-
 python/qemu/qmp/qmp_client.py                          | 2 +-
 tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 6d3d739daa..22e60298d2 100644
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
index b5772e7f32..9d73ae6e7a 100644
--- a/python/qemu/qmp/qmp_client.py
+++ b/python/qemu/qmp/qmp_client.py
@@ -198,7 +198,7 @@ async def run(self, address='/tmp/qemu.socket'):
     logger = logging.getLogger(__name__)
 
     # Read buffer limit; 10MB like libvirt default
-    _limit = (10 * 1024 * 1024)
+    _limit = 10 * 1024 * 1024
 
     # Type alias for pending execute() result items
     _PendingT = Union[Message, ExecInterruptedError]
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index fc9c4b4ef4..dda55fad28 100755
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
2.34.1


