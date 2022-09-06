Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A195AE15A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:40:43 +0200 (CEST)
Received: from localhost ([::1]:47966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTCM-0003ZB-Ec
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oVT3Y-0003Iq-MM; Tue, 06 Sep 2022 03:31:36 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:49704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oVT3U-0002xU-6u; Tue, 06 Sep 2022 03:31:35 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id E4A5C2E0B44;
 Tue,  6 Sep 2022 10:31:19 +0300 (MSK)
Received: from d-tatianin-nix.yandex.net (unknown
 [2a02:6b8:0:419:d8d0:8d85:2aad:ab5b])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 WefwVQnsrp-VJXiuDjk; Tue, 06 Sep 2022 10:31:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662449479; bh=CSW1A7UJsUY4+uHeXma7o5wMMCuBXH41Ny7gH8yaeGs=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=uB0iiSMGmjpA2xEzve//WUrUGhmK+w6/ewUSvRR9Sh7V8ZLNcrh47pSOoOxiKr/8v
 SBgCRk1s/v72Q7+wD0crQwC7YFbNjnTiPfOnNILr5URBK2992N+iDoYu6pnb4/SNg/
 3ErAdDZqsvTQTOO2sc5GdpXggKdOQXBqh/4ok47s=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com, d-tatianin@yandex-team.ru
Subject: [PATCH v3 3/5] vhost-user-blk: make it possible to disable
 write-zeroes/discard
Date: Tue,  6 Sep 2022 10:31:09 +0300
Message-Id: <20220906073111.353245-4-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
References: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is useful to have the ability to disable these features for
compatibility with older VMs that don't have these implemented.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/block/vhost-user-blk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 9117222456..4c9727e08c 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -259,8 +259,6 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
     virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
     virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
     virtio_add_feature(&features, VIRTIO_BLK_F_RO);
-    virtio_add_feature(&features, VIRTIO_BLK_F_DISCARD);
-    virtio_add_feature(&features, VIRTIO_BLK_F_WRITE_ZEROES);
 
     if (s->config_wce) {
         virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
@@ -592,6 +590,10 @@ static Property vhost_user_blk_properties[] = {
                        VHOST_USER_BLK_AUTO_NUM_QUEUES),
     DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
     DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
+    DEFINE_PROP_BIT64("discard", VHostUserBlk, parent_obj.host_features,
+                      VIRTIO_BLK_F_DISCARD, true),
+    DEFINE_PROP_BIT64("write-zeroes", VHostUserBlk, parent_obj.host_features,
+                      VIRTIO_BLK_F_WRITE_ZEROES, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.25.1


