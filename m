Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E6461690
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:34:55 +0100 (CET)
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgo1-0001iV-Nc
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1mrgdk-0007Bl-HX
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:24:16 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:37860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1mrgdh-0006fc-SJ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:24:16 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id DD62A2E147E;
 Mon, 29 Nov 2021 16:24:05 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 GJbeNasLhs-O4tuaVD3; Mon, 29 Nov 2021 16:24:05 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1638192245; bh=6OmpbKX+eS0kW9PNJsXp2Iw4xyXJ6oG23/lsqMqhjBk=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=tYMSQId6w8F6aaXBbk/oD/RO0Q0dTod0KmnajJSQ07jQXJrXgP6sP01sScF6TLg2C
 dC58lc8swczTXfeNvHFWIdH6JCUdG+FWAQg4WCsaaDe8PxpW1Ml67JvVK8t+DoI/0M
 biKOeHEeHUmEo29ebNaRgo0phDo3b86H+EeeIjCg=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from d-tatianin-nix.yandex-team.ru (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1216::1:11])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 sxz6WOJRLW-O42aG0qK; Mon, 29 Nov 2021 16:24:04 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] hw/scsi/vhost-scsi: don't leak vqs on error
Date: Mon, 29 Nov 2021 16:23:57 +0300
Message-Id: <20211129132358.1110372-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, pbonzini@redhat.com, yc-core@yandex-team.ru, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost_dev_init calls vhost_dev_cleanup in case of an error during
initialization, which zeroes out the entire vsc->dev as well as the
vsc->dev.vqs pointer. This prevents us from properly freeing it in free_vqs.
Keep a local copy of the pointer so we can free it later.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 hw/scsi/vhost-scsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 039caf2614..efb3e14d9e 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -170,6 +170,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     int vhostfd = -1;
     int ret;
+    struct vhost_virtqueue *vqs = NULL;
 
     if (!vs->conf.wwpn) {
         error_setg(errp, "vhost-scsi: missing wwpn");
@@ -213,7 +214,8 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     }
 
     vsc->dev.nvqs = VHOST_SCSI_VQ_NUM_FIXED + vs->conf.num_queues;
-    vsc->dev.vqs = g_new0(struct vhost_virtqueue, vsc->dev.nvqs);
+    vqs = g_new0(struct vhost_virtqueue, vsc->dev.nvqs);
+    vsc->dev.vqs = vqs;
     vsc->dev.vq_index = 0;
     vsc->dev.backend_features = 0;
 
@@ -232,7 +234,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     return;
 
  free_vqs:
-    g_free(vsc->dev.vqs);
+    g_free(vqs);
     if (!vsc->migratable) {
         migrate_del_blocker(vsc->migration_blocker);
     }
-- 
2.25.1


