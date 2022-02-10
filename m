Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6204B0CC2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:49:49 +0100 (CET)
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7xM-0006yd-Hr
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:49:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7tx-0004Bt-Sx
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:46:19 -0500
Received: from [2a02:6b8:0:1472:2741:0:8b6:217] (port=35018
 helo=forwardcorp1p.mail.yandex.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7tv-0007mX-Q9
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:46:17 -0500
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id B7F912E0DD2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 14:46:13 +0300 (MSK)
Received: from sas1-9d43635d01d6.qloud-c.yandex.net
 (sas1-9d43635d01d6.qloud-c.yandex.net [2a02:6b8:c08:793:0:640:9d43:635d])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 qXYB6muesv-kDGiINQc; Thu, 10 Feb 2022 14:46:13 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1644493573; bh=j1Ljrjr0ik1QATN/Y3THnLMOS5eTrugr7KxJr8y/mFY=;
 h=Date:To:From:Subject:Message-ID:Cc;
 b=TSJXDdo44zsJSjzNEYJNJkCNGloWMGJMFPNbZ9oB0ZWLaBB0MaAdXaxygUKYgNgep
 r3m/LKS3nzG3XnPWA+vJIWWixShFW+M+1tMSKgGZI5UQtPaBP5yNyVrZ8hdZAyolSq
 U9dWVeoHNF0cezZcata0sOzUucWxSgX/dcQKdIuU=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (dynamic-vpn.dhcp.yndx.net [2a02:6b8:b081:8101::1:28])
 by sas1-9d43635d01d6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 meyFs8hOZq-kDIi0tKO; Thu, 10 Feb 2022 14:46:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PATCH 1/2] vhost-user-blk: handle errors in vhost_user_blk_connect
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Date: Thu, 10 Feb 2022 14:46:12 +0300
Message-ID: <164449357269.2210307.9274525043180414283.stgit@dynamic-vpn.dhcp.yndx.net>
User-Agent: StGit/1.4.dev11+gd5bef96
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2a02:6b8:0:1472:2741:0:8b6:217 (failed)
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleanup vhost device and update connection state when initialization fails.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 hw/block/vhost-user-blk.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 1a42ae9187..35ac188ca4 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -340,18 +340,24 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
     ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
                          errp);
     if (ret < 0) {
-        return ret;
+        goto err_init;
     }
 
     /* restore vhost state */
     if (virtio_device_started(vdev, vdev->status)) {
         ret = vhost_user_blk_start(vdev, errp);
         if (ret < 0) {
-            return ret;
+            goto err_start;
         }
     }
 
     return 0;
+
+err_start:
+    vhost_dev_cleanup(&s->dev);
+err_init:
+    s->connected = false;
+    return ret;
 }
 
 static void vhost_user_blk_disconnect(DeviceState *dev)


