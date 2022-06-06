Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6178E53E164
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 09:42:15 +0200 (CEST)
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny7NO-0006gX-Et
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 03:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79g-0005I6-DA; Mon, 06 Jun 2022 03:28:04 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:59610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79e-0002YM-GL; Mon, 06 Jun 2022 03:28:04 -0400
Received: from sas1-9c28cd37d27b.qloud-c.yandex.net
 (sas1-9c28cd37d27b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:309b:0:640:9c28:cd37])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id AB8282E122C;
 Mon,  6 Jun 2022 10:27:53 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas1-9c28cd37d27b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 eRYedmAcn8-RrKWV3j2; Mon, 06 Jun 2022 10:27:53 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654500473; bh=TADhTFiLKHdt4vPuk6AayRTkmTNSfZ9vFdLs//i35hM=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=oO7cwsiOCJxKeQUugFk5/F0aLmLPcEE84JRuZsAmMCTzZA7x6OBOBL9jQkuEBHl7v
 lNNdt0IhY2Q3ZtwM1e1LRpTXwF6kt3OtB+h0sRqW/D3fURFsOOwsgBbQd9cbE2rTEP
 6W9eETGwkvnZYi8YrRsgW4vwheSlpG2BLsOlWkUk=
Authentication-Results: sas1-9c28cd37d27b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b6b6::1:2c])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Y8SDrjDjAj-RqM47aBv; Mon, 06 Jun 2022 10:27:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 jsnow@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 04/11] iotests: QemuStorageDaemon: add cmd() method like in
 QEMUMachine.
Date: Mon,  6 Jun 2022 10:27:24 +0300
Message-Id: <20220606072731.878226-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606072731.878226-1-vsementsov@yandex-team.ru>
References: <20220606072731.878226-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

Add similar method for consistency.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index c69b10ac82..dd08cd8a2b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -462,6 +462,10 @@ def qmp(self, cmd: str, args: Optional[Dict[str, object]] = None) \
         assert self._qmp is not None
         return self._qmp.cmd_raw(cmd, args)
 
+    def cmd(self, cmd: str, args: Optional[Dict[str, object]] = None) \
+            -> QMPMessage:
+        return self._qmp.cmd(cmd, **args)
+
     def stop(self, kill_signal=15):
         self._p.send_signal(kill_signal)
         self._p.wait()
-- 
2.25.1


