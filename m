Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D827A24F51B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 10:44:42 +0200 (CEST)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kA85p-0000Zj-Uh
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 04:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1kA81w-0001kz-DI; Mon, 24 Aug 2020 04:40:40 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:34920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1kA81u-0004x2-Hd; Mon, 24 Aug 2020 04:40:40 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id B41D72E1574;
 Mon, 24 Aug 2020 11:40:36 +0300 (MSK)
Received: from myt4-18a966dbd9be.qloud-c.yandex.net
 (myt4-18a966dbd9be.qloud-c.yandex.net [2a02:6b8:c00:12ad:0:640:18a9:66db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 dNFJqYsUSN-eZvKLQrm; Mon, 24 Aug 2020 11:40:36 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1598258436; bh=UciJc8X9njWrEUHJFothSUSQxAE9xsIR5v3e7XbMiqU=;
 h=In-Reply-To:In-Reply-To:Message-Id:References:References:Date:
 Subject:To:From:Cc;
 b=Cft4n1cd6vWPuuLHdZf+zrVEgDYzoWkPHuLU9qPv09EQW7G4WIg13oR3+McKqeQZQ
 /YOCSHDcnkxV0W6NJVymumuILz2B22qwk/PSpqzRu6OKQRtvpfj1JVNPgkilqx7ppb
 RZkZMW8jEI1yeWjOJmwtbD4R6bcRWVHV1Kn3L3P8=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:6622::1:7])
 by myt4-18a966dbd9be.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 B7dErHoRhW-eYl4VDah; Mon, 24 Aug 2020 11:40:35 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Dima Stepanov <dimastep@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] tests/qtest/libqos/virtio-blk: add support for
 vhost-user-blk
Date: Mon, 24 Aug 2020 11:39:29 +0300
Message-Id: <45fd6995a5e226eaf179b99d6bf3b1cde5e4c309.1598257838.git.dimastep@yandex-team.ru>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1598257838.git.dimastep@yandex-team.ru>
References: <cover.1598257838.git.dimastep@yandex-team.ru>
In-Reply-To: <cover.1598257838.git.dimastep@yandex-team.ru>
References: <cover.1598257838.git.dimastep@yandex-team.ru>
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=dimastep@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 dgilbert@redhat.com, mreitz@redhat.com, fengli@smartx.com,
 yc-core@yandex-team.ru, pbonzini@redhat.com, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for the vhost-user-blk-pci device. This node can be used by
the vhost-user-blk tests. Tests for the vhost-user-blk device are added
in the following patches.

Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
---
 tests/qtest/libqos/virtio-blk.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/libqos/virtio-blk.c b/tests/qtest/libqos/virtio-blk.c
index 5da0259..959c5dc 100644
--- a/tests/qtest/libqos/virtio-blk.c
+++ b/tests/qtest/libqos/virtio-blk.c
@@ -36,6 +36,9 @@ static void *qvirtio_blk_get_driver(QVirtioBlk *v_blk,
     if (!g_strcmp0(interface, "virtio")) {
         return v_blk->vdev;
     }
+    if (!g_strcmp0(interface, "vhost-user-blk")) {
+        return v_blk;
+    }
 
     fprintf(stderr, "%s not present in virtio-blk-device\n", interface);
     g_assert_not_reached();
@@ -120,6 +123,17 @@ static void virtio_blk_register_nodes(void)
     qos_node_produces("virtio-blk-pci", "virtio-blk");
 
     g_free(arg);
+
+    /* vhost-user-blk-pci */
+    arg = g_strdup_printf("id=drv0,chardev=chdev0,addr=%x.%x",
+                                PCI_SLOT, PCI_FN);
+    opts.extra_device_opts = arg;
+    add_qpci_address(&opts, &addr);
+    qos_node_create_driver("vhost-user-blk-pci", virtio_blk_pci_create);
+    qos_node_consumes("vhost-user-blk-pci", "pci-bus", &opts);
+    qos_node_produces("vhost-user-blk-pci", "vhost-user-blk");
+
+    g_free(arg);
 }
 
 libqos_init(virtio_blk_register_nodes);
-- 
2.7.4


