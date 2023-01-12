Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519846679EC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:53:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFzVp-00033Z-08; Thu, 12 Jan 2023 10:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1pFzVQ-0002mE-HE
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:28:41 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1pFzVO-00040J-Mc
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:28:40 -0500
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 30F7F5FD0E;
 Thu, 12 Jan 2023 18:28:33 +0300 (MSK)
Received: from davydov-max-nux.yandex-team.ru (unknown
 [2a02:6b8:b081:b685::1:34])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 AShxC80QhKo1-58rqTmfg; Thu, 12 Jan 2023 18:28:32 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1673537312; bh=bQiLu4iPOPZQtc5YzMt+YWtl/aUSXlVvOepNpSxpz3E=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=WZS8m0Usyx+0IELSTWeboHbcIc/W6C4HODksU8QNIigvgdTx2NiKLlfDdk+ozUgWH
 rMrMMfTCK9gokw5Su1pNPBxg0g07at8soI6ewFCt67WIEcv6IqnLLpYfR65wIbOY9Q
 wDrEfo9pH3UN+tHOdR3BL854shaaV89LEBu03aJw=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: vsementsov@yandex-team.ru, jsnow@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 crosa@redhat.com, bleal@redhat.com, eblake@redhat.com, armbru@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao.Li@outlook.com, lvivier@redhat.com
Subject: [PATCH v5 2/4] python/qmp: increase read buffer size
Date: Thu, 12 Jan 2023 18:28:03 +0300
Message-Id: <20230112152805.33109-3-davydov-max@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112152805.33109-1-davydov-max@yandex-team.ru>
References: <20230112152805.33109-1-davydov-max@yandex-team.ru>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Current 256KB is not enough for some real cases. As a possible solution
limit can be chosen to be the same as libvirt (10MB)

Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/qmp_client.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
index 5dcda04a75..b5772e7f32 100644
--- a/python/qemu/qmp/qmp_client.py
+++ b/python/qemu/qmp/qmp_client.py
@@ -197,8 +197,8 @@ async def run(self, address='/tmp/qemu.socket'):
     #: Logger object used for debugging messages.
     logger = logging.getLogger(__name__)
 
-    # Read buffer limit; large enough to accept query-qmp-schema
-    _limit = (256 * 1024)
+    # Read buffer limit; 10MB like libvirt default
+    _limit = (10 * 1024 * 1024)
 
     # Type alias for pending execute() result items
     _PendingT = Union[Message, ExecInterruptedError]
-- 
2.25.1


