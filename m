Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F284033AB81
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:14:35 +0100 (CET)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgUt-0001bI-1d
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMw-000155-0G; Mon, 15 Mar 2021 02:06:22 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:50852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMs-0004bv-C7; Mon, 15 Mar 2021 02:06:20 -0400
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id B932E2E14B4;
 Mon, 15 Mar 2021 09:06:13 +0300 (MSK)
Received: from sas1-24e978739efd.qloud-c.yandex.net
 (sas1-24e978739efd.qloud-c.yandex.net [2a02:6b8:c14:3088:0:640:24e9:7873])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 0I2FtcBroh-6DCOrseb; Mon, 15 Mar 2021 09:06:13 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615788373; bh=mIy54WIgKT/b/2NM+qYbxSn6vKp+ZnYdfYoMcvdPhbs=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=LRdpfr4rj7wK64ZNW3d8T9n+4nztWlEfDrcmXaFO5BImbYLE6gYDyAEG4/tu/KILY
 4cS6ojVhMn/Xi+rt95y806E6C+ig8yQzslbMiuzxb/FmatQ89iOvTvxkGE5A/PB7h6
 ZDMTWZmxMAk2Ei1nIep7gEtI97VpBBbyUXXCMs2s=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:23::1:15])
 by sas1-24e978739efd.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FoAWGMWkZt-6Dn0hUl0; Mon, 15 Mar 2021 09:06:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] block/nbd: avoid touching freed connect_thread
Date: Mon, 15 Mar 2021 09:06:05 +0300
Message-Id: <20210315060611.2989049-2-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the NBD connection is being torn down, the connection thread gets
canceled and "detached", meaning it is about to get freed.

If this happens while the connection coroutine yielded waiting for the
connection thread to complete, when it resumes it may access the
invalidated connection thread data.

To prevent this, revalidate the ->connect_thread pointer in
nbd_co_establish_connection_cancel before using after the the yield.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index c26dc5a54f..447d176b76 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -486,6 +486,15 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     s->wait_connect = true;
     qemu_coroutine_yield();
 
+    /*
+     * If nbd_co_establish_connection_cancel had a chance to run it may have
+     * invalidated ->connect_thread.
+     */
+    thr = s->connect_thread;
+    if (!thr) {
+        return -ECONNABORTED;
+    }
+
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
-- 
2.30.2


