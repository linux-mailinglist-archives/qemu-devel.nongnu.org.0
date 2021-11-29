Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BC74616C0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:38:02 +0100 (CET)
Received: from localhost ([::1]:46340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgr3-0006Bj-7A
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:38:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1mrgdj-00072R-M1
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:24:15 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1mrgdf-0006eq-D3
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:24:13 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id B02EA2E1484;
 Mon, 29 Nov 2021 16:24:08 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 LzgLgjrHjV-O6ta0nIj; Mon, 29 Nov 2021 16:24:08 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1638192248; bh=tGkkLH5hmzKUyt2ct/i0XmqP2NrLLoSXslHnNet+UBA=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=TVdZ1DmYCanFbcwq7BfKsAwPIjOdfSCQuMTbCVnPn71eR5emLcngN2LpUuPLCST1F
 e1QHF2l+rRLyd1LuIgKHoxYz6wmCM0Y2718xYcBLRberJSn8L/GK9YE+8DvRUgdx5C
 N78GVqhhlYscAhLT0LQQD38guUfMDufCkvfm5AFk=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from d-tatianin-nix.yandex-team.ru (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1216::1:11])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 sxz6WOJRLW-O52a9ief; Mon, 29 Nov 2021 16:24:05 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] hw/scsi/vhost-scsi: don't double close vhostfd on error
Date: Mon, 29 Nov 2021 16:23:58 +0300
Message-Id: <20211129132358.1110372-2-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129132358.1110372-1-d-tatianin@yandex-team.ru>
References: <20211129132358.1110372-1-d-tatianin@yandex-team.ru>
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

vhost_dev_init calls vhost_dev_cleanup on error, which closes vhostfd,
don't double close it.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 hw/scsi/vhost-scsi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index efb3e14d9e..778f43e4c1 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -222,6 +222,11 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     ret = vhost_dev_init(&vsc->dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
     if (ret < 0) {
+        /*
+         * vhost_dev_init calls vhost_dev_cleanup on error, which closes
+         * vhostfd, don't double close it.
+         */
+        vhostfd = -1;
         goto free_vqs;
     }
 
@@ -242,7 +247,9 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     error_free(vsc->migration_blocker);
     virtio_scsi_common_unrealize(dev);
  close_fd:
-    close(vhostfd);
+    if (vhostfd >= 0) {
+        close(vhostfd);
+    }
     return;
 }
 
-- 
2.25.1


