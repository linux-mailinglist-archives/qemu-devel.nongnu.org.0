Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04D922A0F8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 22:54:35 +0200 (CEST)
Received: from localhost ([::1]:47686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyLl4-0002kF-VZ
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 16:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1jyLkB-0002JT-JA
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 16:53:39 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:40018
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1jyLk9-0000og-GH
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 16:53:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 32E13DB3558;
 Wed, 22 Jul 2020 22:53:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id Ygq7KbjMbSkh; Wed, 22 Jul 2020 22:53:26 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id AFF12DB3556;
 Wed, 22 Jul 2020 22:53:26 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 80B78460019; Wed, 22 Jul 2020 22:53:26 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.1] libvhost-user: Add missing GCC_FMT_ATTR and fix
 format errors
Date: Wed, 22 Jul 2020 22:53:16 +0200
Message-Id: <20200722205316.1405667-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 16:41:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 contrib/libvhost-user/libvhost-user.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index d315db1396..6e659aff37 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -151,7 +151,7 @@ vu_request_to_string(unsigned int req)
     }
 }
 
-static void
+static void GCC_FMT_ATTR(2, 3)
 vu_panic(VuDev *dev, const char *msg, ...)
 {
     char *buf = NULL;
@@ -2074,7 +2074,7 @@ virtqueue_get_head(VuDev *dev, VuVirtq *vq,
 
     /* If their number is silly, that's a fatal mistake. */
     if (*head >= vq->vring.num) {
-        vu_panic(dev, "Guest says index %u is available", head);
+        vu_panic(dev, "Guest says index %u is available", *head);
         return false;
     }
 
@@ -2133,7 +2133,7 @@ virtqueue_read_next_desc(VuDev *dev, struct vring_desc *desc,
     smp_wmb();
 
     if (*next >= max) {
-        vu_panic(dev, "Desc next is %u", next);
+        vu_panic(dev, "Desc next is %u", *next);
         return VIRTQUEUE_READ_DESC_ERROR;
     }
 
-- 
2.27.0

