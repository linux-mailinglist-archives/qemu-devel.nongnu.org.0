Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E7A55A21E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 21:55:49 +0200 (CEST)
Received: from localhost ([::1]:37618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4pPA-0001W9-2f
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 15:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4pMs-0000Px-Np; Fri, 24 Jun 2022 15:53:26 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:34472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4pMo-0007DI-FZ; Fri, 24 Jun 2022 15:53:25 -0400
Received: from iva4-7f38d418d11a.qloud-c.yandex.net
 (iva4-7f38d418d11a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:740d:0:640:7f38:d418])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 828DC2E1F85;
 Fri, 24 Jun 2022 22:53:08 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva4-7f38d418d11a.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 eDE5g1OQXI-r7JCio2o; Fri, 24 Jun 2022 22:53:08 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656100388; bh=gmrylsIe6Y2OXUqGCDuymMyV2zo5LJqIaKIY+GijZO8=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=h+HGHx5Bx03KQXLHAkgi0bjQwM06RNMzJihz5VtAK1DZEz/v9tLfG7fp0szrQxRmt
 8AbittPEwz/kaJbz1xp/5MQqV2DnwJms8xSfodemOoXq7E0Ut2Dv61SzLEXNXYn33b
 WZ4gTmcwGo7WdS7QpnbNL1vaL+sgvD9gI0gmOJiM=
Authentication-Results: iva4-7f38d418d11a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 8YzikxTZdK-r7NuNT71; Fri, 24 Jun 2022 22:53:07 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, bleal@redhat.com, crosa@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH] python: QEMUMachine: enable qmp accept timeout by default
Date: Fri, 24 Jun 2022 22:52:52 +0300
Message-Id: <20220624195252.175249-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
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

I've spent much time trying to debug hanging pipeline in gitlab. I
started from and idea that I have problem in code in my series (which
has some timeouts). Finally I found that the problem is that I've used
QEMUMachine class directly to avoid qtest, and didn't add necessary
arguments. Qemu fails and we wait for qmp accept endlessly. In gitlab
it's just stopped by timeout (one hour) with no sign of what's going
wrong.

With timeout enabled, gitlab don't wait for an hour and prints all
needed information.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---

Hi all!

Just compare this
  https://gitlab.com/vsementsov/qemu/-/pipelines/572232557
and this
  https://gitlab.com/vsementsov/qemu/-/pipelines/572526252

and you'll see that the latter is much better.

 python/qemu/machine/machine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 37191f433b..01a12f6f73 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -131,7 +131,7 @@ def __init__(self,
                  drain_console: bool = False,
                  console_log: Optional[str] = None,
                  log_dir: Optional[str] = None,
-                 qmp_timer: Optional[float] = None):
+                 qmp_timer: float = 30):
         '''
         Initialize a QEMUMachine
 
-- 
2.25.1


