Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9482D44D94E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:41:35 +0100 (CET)
Received: from localhost ([::1]:47714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCCk-0001aK-Nx
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:41:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5f-0004W1-BS; Thu, 11 Nov 2021 10:34:15 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:41130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5d-00044D-Nc; Thu, 11 Nov 2021 10:34:15 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 27FDC2E1ECA;
 Thu, 11 Nov 2021 18:34:07 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 PgaVOhDupi-Y6s0fXvd; Thu, 11 Nov 2021 18:34:07 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636644847; bh=V2otWg/70+7qyFipVze5b6V3vBGMcgAw22e28y5/TeY=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=JH0l5QSdJhqzKR/yOOh0P0qj7qZVbMVmvm4S+cAVg/5c5R4sty6EMHkSISOnEMlCf
 WNQ19y++pYdG1h/EJMMqxjZLE8Y8WFYQj6V0+ASFMHubzHP+XZ4D2V3/CWQvBhdM2o
 +1x0ncSqAnpPmQTV46RLb6G3c74dS/LAJNHNuS9M=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8830::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 WgGv8YbvMJ-Y6wCHvlc; Thu, 11 Nov 2021 18:34:06 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] vhost-user-blk: propagate error return from generic
 vhost
Date: Thu, 11 Nov 2021 18:33:54 +0300
Message-Id: <20211111153354.18807-11-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111153354.18807-1-rvkagan@yandex-team.ru>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the only callsite that doesn't propagate the error code from the
generic vhost code.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 hw/block/vhost-user-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index f9b17f6813..ab11ce8252 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -100,7 +100,7 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
                                &local_err);
     if (ret < 0) {
         error_report_err(local_err);
-        return -1;
+        return ret;
     }
 
     /* valid for resize only */
-- 
2.33.1


