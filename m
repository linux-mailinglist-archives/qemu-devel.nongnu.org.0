Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84C23B3FD1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:53:47 +0200 (CEST)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhas-0005UH-Tb
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lwhZg-00041E-KT
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:52:32 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:33150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lwhZc-0002Cr-5z
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:52:31 -0400
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id E03CF2E15C0;
 Fri, 25 Jun 2021 11:52:20 +0300 (MSK)
Received: from sas1-9d43635d01d6.qloud-c.yandex.net
 (sas1-9d43635d01d6.qloud-c.yandex.net [2a02:6b8:c08:793:0:640:9d43:635d])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 DR0ymCDW3W-qK0e4ai4; Fri, 25 Jun 2021 11:52:20 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1624611140; bh=PobhdN+YirR51iX3iNsl04ZAA1725oeM6h2YgYzFVos=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=g90zAfHFZIJwXQKAi9ydWRqFl+REbUiJubGqrf6rvYqeo7CNAO7AIKR+etPBA7DLE
 J9XdHXmz7Fdf6zIvrU7tU9e057k0MgpFrrl1gRUjPK5wPhOtS4ao8SZeZzkH22wNX/
 B0cj1HdztpZR4bl0ZPGTfhSnE0cHMATRqa963xRM=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:13::1:2d])
 by sas1-9d43635d01d6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 rUqgf9dUsm-qK6iw83j; Fri, 25 Jun 2021 11:52:20 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v0] vhost: make SET_VRING_ADDR,
 SET_[PROTOCOL_]FEATEURES send replies
Date: Fri, 25 Jun 2021 11:52:10 +0300
Message-Id: <20210625085210.236299-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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
Cc: yc-core@yandex-team.ru, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On vhost-user-blk migration, qemu normally sends a number of commands
to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
VHOST_USER_SET_FEATURES per each started ring to enable "used ring"
data logging.
The issue is that qemu doesn't wait for reply from the vhost daemon
for these commands which may result in races between qemu expectation
of logging starting and actual login starting in vhost daemon.
To resolve this issue, this patch makes qemu wait for the commands result
explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.
Also, this patch adds the reply waiting for VHOST_USER_SET_PROTOCOL_FEATURES
command to make the features setting functions work similary.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 hw/virtio/vhost-user.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ee57abe04526..e47b82adab00 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1105,10 +1105,20 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
         .hdr.size = sizeof(msg.payload.addr),
     };
 
+    bool reply_supported = virtio_has_feature(dev->protocol_features,
+                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
+    if (reply_supported) {
+        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+    }
+
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
         return -1;
     }
 
+    if (reply_supported) {
+        return process_message_reply(dev, &msg);
+    }
+
     return 0;
 }
 
@@ -1297,10 +1307,20 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
         .hdr.size = sizeof(msg.payload.u64),
     };
 
+    bool reply_supported = virtio_has_feature(dev->protocol_features,
+                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
+    if (reply_supported) {
+        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+    }
+
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
         return -1;
     }
 
+    if (reply_supported) {
+        return process_message_reply(dev, &msg);
+    }
+
     return 0;
 }
 
-- 
2.25.1


