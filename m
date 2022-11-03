Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F3A617AF5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 11:39:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqXcl-0003qW-4E; Thu, 03 Nov 2022 06:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oqXci-0003pG-CO
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:39:00 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oqXce-0005P0-HY
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 06:39:00 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 9EE185FF72;
 Thu,  3 Nov 2022 13:28:08 +0300 (MSK)
Received: from davydov-max-nux.yandex-team.ru (unknown
 [2a02:6b8:b081:b685::1:2c])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3zS6WKEiGd-S7NGGaE8; Thu, 03 Nov 2022 13:28:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667471288; bh=OYeiWRd2PeTtBWfHgsi6/ymkA79L1SXo5pYvkeFy1nw=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=A3cWCN2Wst1VB1vL3qGwhLa3EZx7UqA3N/cLVNyO8XoBIXEbBOnOJmw6Xx5OmRS7B
 TqZcpreznBwecgPfwDz8BobuJZ9EjX8wuHe4GfLkyRcvtcXzvPkn+MUVDg2W9q/nze
 wCZ2hvOxn/a+V7n1As8xIwsFBoN5bbrbfWqL4GqQ=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: davydov-max@yandex-team.ru, vsementsov@yandex-team.ru, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, eblake@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, berrange@redhat.com, alxndr@bu.edu,
 bsd@redhat.com, stefanha@redhat.com, thuth@redhat.com,
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, lvivier@redhat.com
Subject: [PATCH v3 2/4] python/qmp: increase read buffer size
Date: Thu,  3 Nov 2022 13:27:38 +0300
Message-Id: <20221103102741.11201-3-davydov-max@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221103102741.11201-1-davydov-max@yandex-team.ru>
References: <20221103102741.11201-1-davydov-max@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

After modification of "query-machines" command the buffer size should be
more than 452kB to contain output with compat-props.

Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 python/qemu/qmp/qmp_client.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
index 5dcda04a75..659fe4d98c 100644
--- a/python/qemu/qmp/qmp_client.py
+++ b/python/qemu/qmp/qmp_client.py
@@ -197,8 +197,8 @@ async def run(self, address='/tmp/qemu.socket'):
     #: Logger object used for debugging messages.
     logger = logging.getLogger(__name__)
 
-    # Read buffer limit; large enough to accept query-qmp-schema
-    _limit = (256 * 1024)
+    # Read buffer limit; large enough to accept query-machines
+    _limit = (512 * 1024)
 
     # Type alias for pending execute() result items
     _PendingT = Union[Message, ExecInterruptedError]
-- 
2.25.1


