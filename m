Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36197308697
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 08:43:52 +0100 (CET)
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ORb-0002Uv-9Q
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 02:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5ON0-0007MC-Mc; Fri, 29 Jan 2021 02:39:06 -0500
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:37032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5OMy-0004M5-G0; Fri, 29 Jan 2021 02:39:06 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id B005C2E23DC;
 Fri, 29 Jan 2021 10:39:02 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 o1Wtf9HWua-d2wq1vFn; Fri, 29 Jan 2021 10:39:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1611905942; bh=gzy55dftt9Amp91HbZtNUUPI6Lgxpk4o7F6uPERRcNs=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=07o23AUabzkuntZGTMk6WU1U8alK38yPsown6EUWfFk9l3Z943+VeTE87rkJ/Z0vH
 hUEyt7sqnXnnx434hOhHkCP6rrUw8kDbxE66oBIN4JNv5/3pyg1FZ3GWlDw78aIKBs
 mcsqmNbvCOeDbAW8ooDsdukjXvN9DTCP+nuJl5NM=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 jIpaBE76QG-d2mWB5CA; Fri, 29 Jan 2021 10:39:02 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] nbd: make nbd_read* return -EIO on error
Date: Fri, 29 Jan 2021 10:38:59 +0300
Message-Id: <20210129073859.683063-4-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129073859.683063-1-rvkagan@yandex-team.ru>
References: <20210129073859.683063-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
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
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NBD reconnect logic considers the error code from the functions that
read NBD messages to tell if reconnect should be attempted or not: it is
attempted on -EIO, otherwise the client transitions to NBD_CLIENT_QUIT
state (see nbd_channel_error).  This error code is propagated from the
primitives like nbd_read.

The problem, however, is that nbd_read itself turns every error into -1
rather than -EIO.  As a result, if the NBD server happens to die while
sending the message, the client in QEMU receives less data than it
expects, considers it as a fatal error, and wouldn't attempt
reestablishing the connection.

Fix it by turning every negative return from qio_channel_read_all into
-EIO returned from nbd_read.  Apparently that was the original behavior,
but got broken later.  Also adjust nbd_readXX to follow.

Fixes: e6798f06a6 ("nbd: generalize usage of nbd_read")
Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/nbd.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 4a52a43ef5..5f34d23bb0 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -364,7 +364,7 @@ static inline int nbd_read(QIOChannel *ioc, void *buffer, size_t size,
         if (desc) {
             error_prepend(errp, "Failed to read %s: ", desc);
         }
-        return -1;
+        return ret;
     }
 
     return 0;
@@ -375,8 +375,9 @@ static inline int nbd_read##bits(QIOChannel *ioc,                       \
                                  uint##bits##_t *val,                   \
                                  const char *desc, Error **errp)        \
 {                                                                       \
-    if (nbd_read(ioc, val, sizeof(*val), desc, errp) < 0) {             \
-        return -1;                                                      \
+    int ret = nbd_read(ioc, val, sizeof(*val), desc, errp);             \
+    if (ret < 0) {                                                      \
+        return ret;                                                     \
     }                                                                   \
     *val = be##bits##_to_cpu(*val);                                     \
     return 0;                                                           \
-- 
2.29.2


