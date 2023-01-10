Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E9663D82
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:07:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA9V-0000zI-5n; Tue, 10 Jan 2023 03:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pFA9P-0000vV-QM; Tue, 10 Jan 2023 03:38:31 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pFA9N-0000Xx-63; Tue, 10 Jan 2023 03:38:31 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 604555F110;
 Tue, 10 Jan 2023 11:38:20 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b685::1:3c])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 2cYnPs1R4a61-chFVTI8C; Tue, 10 Jan 2023 11:38:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1673339899; bh=HyphkAtS/ZjoWqW7aRDdnYZFnvEW/hjNOVRiWiBUXWY=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=hlzmsIeMokAj0vjJ73qhcQB7U5s60cl1RyEAn8XR5xfead1C9k1VA0zktRTT76O1k
 SGSQ1thzEmQ1B270LXfu0NOz9h7adhuGWBCL7JHD2bsNXRNs7B6orAnUZpyXr2ytNE
 wTkPRp8szm04dCo52KZHV2XDQeHB4jbdeeqTpmeA=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: vsementsov@yandex-team.ru, jsnow@redhat.com, crosa@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v4 03/11] python/machine.py: upgrade vm.cmd() method
Date: Tue, 10 Jan 2023 11:37:50 +0300
Message-Id: <20230110083758.161201-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110083758.161201-1-vsementsov@yandex-team.ru>
References: <20230110083758.161201-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

The method is not popular in iotests, we prefer use vm.qmp() and then
check success by hand.. But that's not optimal. To simplify movement to
vm.cmd() let's support same interface improvements like in vm.qmp().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 python/qemu/machine/machine.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 75f1f1c246..c45be440de 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -680,13 +680,23 @@ def qmp(self, cmd: str,
         return ret
 
     def cmd(self, cmd: str,
-            conv_keys: bool = True,
+            args_dict: Optional[Dict[str, object]] = None,
+            conv_keys: Optional[bool] = None,
             **args: Any) -> QMPReturnValue:
         """
         Invoke a QMP command.
         On success return the response dict.
         On failure raise an exception.
         """
+        if args_dict is not None:
+            assert not args
+            assert conv_keys is None
+            args = args_dict
+            conv_keys = False
+
+        if conv_keys is None:
+            conv_keys = True
+
         qmp_args = self._qmp_args(conv_keys, args)
         ret = self._qmp.cmd(cmd, **qmp_args)
         if cmd == 'quit':
-- 
2.34.1


