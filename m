Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7CF59F6E7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:54:03 +0200 (CEST)
Received: from localhost ([::1]:45294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQn5G-0005w3-HZ
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQmgf-0007vK-IT; Wed, 24 Aug 2022 05:28:47 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:36556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQmgd-0007uT-UH; Wed, 24 Aug 2022 05:28:37 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 2D3392E217B;
 Wed, 24 Aug 2022 12:18:47 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b4bd::1:34])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YDoXMhagzp-IjOaYkPH; Wed, 24 Aug 2022 12:18:46 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661332726; bh=S8xRNNtrItW89TnZMw5hOuJA+1TOPP1JJGpG/Vkw+aU=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=B9f7n8kukpIY/0JFXhGdNRvV9LQPCjtybj3s9n9xSM5dWXKEjN/MoW5tD0kSTaZyy
 XRwAHTUq1QRqKpVluLW/Y/wS67UkCeetoelGDo3BarfOQCO8R5d3xUOA/Z8ifSbfSU
 88g57RoOg0WBPtyO9vRn5tioHTTCwuX2MqkK6MLM=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, stefanha@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru, d-tatianin@yandex-team.ru
Subject: [PATCH v1 1/5] virtio-blk: decouple config size determination code
 from VirtIOBlock
Date: Wed, 24 Aug 2022 12:18:33 +0300
Message-Id: <20220824091837.301708-2-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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

Make it more stand-alone so that we can reuse it for other virtio-blk
devices that are not VirtIOBlock in the future commits.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 hw/block/virtio-blk.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e9ba752f6b..a4162dbbf2 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -49,12 +49,13 @@ static const VirtIOFeature feature_sizes[] = {
     {}
 };
 
-static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_features)
+static size_t virtio_blk_common_get_config_size(uint64_t host_features)
 {
-    s->config_size = MAX(VIRTIO_BLK_CFG_SIZE,
+    size_t config_size = MAX(VIRTIO_BLK_CFG_SIZE,
         virtio_feature_get_config_size(feature_sizes, host_features));
 
-    assert(s->config_size <= sizeof(struct virtio_blk_config));
+    assert(config_size <= sizeof(struct virtio_blk_config));
+    return config_size;
 }
 
 static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
@@ -1204,7 +1205,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_blk_set_config_size(s, s->host_features);
+    s->config_size = virtio_blk_common_get_config_size(s->host_features);
 
     virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
-- 
2.25.1


