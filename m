Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A373F5672D3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:40:20 +0200 (CEST)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kex-0000i4-QJ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8kcJ-00074K-9q; Tue, 05 Jul 2022 11:37:35 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:44432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o8kcE-0007gd-Vb; Tue, 05 Jul 2022 11:37:34 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 2435A2E1F59;
 Tue,  5 Jul 2022 18:37:20 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 cx6wEXukmr-bJJivWQ1; Tue, 05 Jul 2022 18:37:20 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657035440; bh=dQm2ei8Axzsp4mNd+fiUBRbGgNMpiLcJUOcHWP1rqow=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=dKoxUDgHAJSBRvJCH31id1hv5Qt6gsGFK7uXbnhTp797b79reDVnFVnRwrQzX9HJ4
 0K0RaIl7p9ABA3iPaJEz9vLTS04TILnsGn2h/XxEIe+OvMHi3oWt6OOD0a2C15TW0B
 XgUyFFrITlHQ+s3ILvBUIQhMS2M+epXl3u72H7EI=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6429::1:1b])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6OQ7Omrn5R-bJOOKwDe; Tue, 05 Jul 2022 18:37:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 thuth@redhat.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 richard.henderson@linaro.org
Subject: [PATCH] iotests: fix copy-before-write for macOS and FreeBSD
Date: Tue,  5 Jul 2022 18:37:08 +0300
Message-Id: <20220705153708.186418-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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

strerror() represents ETIMEDOUT a bit different in Linux and macOS /
FreeBSD. Let's support the latter too.

Fixes: 9d05a87b77 ("iotests: copy-before-write: add cases for cbw-timeout option")
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---

As John and Thomas noted, the new iotests fails for FreeBSD and maxOS.
Here is a fix. Would be great if someone can test it.

I tried to push it by

  git push --force  -o ci.variable="QEMU_CI=1"

to my block branch, I get a blocked pipeline
  https://gitlab.com/vsementsov/qemu/-/pipelines/580573238
but it doesn't have neither freebsd nor macos jobs.. How to get them?

 tests/qemu-iotests/tests/copy-before-write | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
index 16efebbf8f..56937b9dff 100755
--- a/tests/qemu-iotests/tests/copy-before-write
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -192,6 +192,11 @@ read 1048576/1048576 bytes at offset 0
 
     def test_timeout_break_guest(self):
         log = self.do_cbw_timeout('break-guest-write')
+        # macOS and FreeBSD tend to represent ETIMEDOUT as
+        # "Operation timed out", when Linux prefer
+        # "Connection timed out"
+        log = log.replace('Operation timed out',
+                          'Connection timed out')
         self.assertEqual(log, """\
 wrote 524288/524288 bytes at offset 0
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-- 
2.25.1


