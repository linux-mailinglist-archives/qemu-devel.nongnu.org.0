Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76A453E171
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 09:48:44 +0200 (CEST)
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny7Te-0003k4-RK
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 03:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79h-0005LI-Kf; Mon, 06 Jun 2022 03:28:05 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:43242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79f-0002YH-R0; Mon, 06 Jun 2022 03:28:05 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id B01792E0929;
 Mon,  6 Jun 2022 10:27:52 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 2NoPqQAVXo-RqK0p68w; Mon, 06 Jun 2022 10:27:52 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654500472; bh=eLWMfMpL4ZcPp/OcEBqe7eqlTLC8tWbOtZ4hTrOYDng=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=kttPwdTn4+JBJm8Hojjzp10ygG/8JgkP2gog9nssfhAgDl7LoqZ7TLNGcysv3puUd
 rdGIlGBo0ZAiyVSrjvv9EyT+CCVHKw/KOWDVxb/DMCwUZei0GKviDDpigPYPLgLTFh
 pjGihQNMIRgPFYQrihow2wIj78rsWfooZoq/LR3w=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b6b6::1:2c])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Y8SDrjDjAj-RpM45sso; Mon, 06 Jun 2022 10:27:51 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 jsnow@redhat.com, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 03/11] python/machine.py: upgrade vm.cmd() method
Date: Mon,  6 Jun 2022 10:27:23 +0300
Message-Id: <20220606072731.878226-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606072731.878226-1-vsementsov@yandex-team.ru>
References: <20220606072731.878226-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The method is not popular in iotests, we prefer use vm.qmp() and then
check success by hand.. But that's not optimal. To simplify movement to
vm.cmd() let's support same interface improvements like in vm.qmp().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 python/qemu/machine/machine.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 65703176e5..10d3304dcf 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -649,13 +649,23 @@ def qmp(self, cmd: str,
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
2.25.1


