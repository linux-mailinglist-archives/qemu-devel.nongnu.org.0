Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ECB663D21
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:43:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA9U-0000xP-7h; Tue, 10 Jan 2023 03:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pFA9P-0000vW-Ml; Tue, 10 Jan 2023 03:38:31 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pFA9N-0000Y5-85; Tue, 10 Jan 2023 03:38:31 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 7223F5FCC6;
 Tue, 10 Jan 2023 11:38:21 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b685::1:3c])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 2cYnPs1R4a61-hONGvmrL; Tue, 10 Jan 2023 11:38:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1673339900; bh=OxF0MC9EW3RBYxamGa/ldVVpYlGHUposwNdoEQ7nGDw=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=j+4Nm8BuaIClnkLg5zf9jfEjcPc7kkDxMpjTuwdiaK/KGceE0rBa2FopqKHY3SFfu
 PXPbDoeTtRtxKJJa77DFV9rMOyRC5fqCa/62wiNkY40MC94ykQKRbu5MZfFG9wGLMT
 XmtOfyMNbd9G83G8ROE7QMp31kdW1iqnJBGcExOU=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: vsementsov@yandex-team.ru, jsnow@redhat.com, crosa@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v4 04/11] iotests: QemuStorageDaemon: add cmd() method like in
 QEMUMachine.
Date: Tue, 10 Jan 2023 11:37:51 +0300
Message-Id: <20230110083758.161201-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110083758.161201-1-vsementsov@yandex-team.ru>
References: <20230110083758.161201-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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
2.34.1


