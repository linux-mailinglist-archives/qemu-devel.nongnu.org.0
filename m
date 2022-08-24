Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83F59F672
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:38:01 +0200 (CEST)
Received: from localhost ([::1]:49588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmpk-0006ad-5n
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQmgf-0007vG-MQ; Wed, 24 Aug 2022 05:28:47 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:35784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQmgX-0007ti-9I; Wed, 24 Aug 2022 05:28:32 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 175CA2E1EEB;
 Wed, 24 Aug 2022 12:18:52 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b4bd::1:34])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YDoXMhagzp-IoOabGgq; Wed, 24 Aug 2022 12:18:51 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661332731; bh=D3vQptUo8YHFFkPdXKmW88H6BNbQAdOBJ6ZPz17P2Pg=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=1etlH5+pezB+pKjx6qVc5bHIF7PPRBFmb2FX775Ccq7quwvaFU8qF3uiOtL6ZYold
 x3Y+OpL/LumnUc8K8S4k3jyCUDu3lZXj2vyoERUPJDd3ZEabuhleRvJnuSchQs8I/Q
 uDtK40r64ZVik98ayP8AEbJkhBrKZVXHV3sk4Sco=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, stefanha@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru, d-tatianin@yandex-team.ru
Subject: [PATCH v1 4/5] vhost-user-blk: make 'config_wce' part of
 'host_features'
Date: Wed, 24 Aug 2022 12:18:36 +0300
Message-Id: <20220824091837.301708-5-d-tatianin@yandex-team.ru>
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

No reason to have this be a separate field. This also makes it more akin
to what the virtio-blk device does.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 hw/block/vhost-user-blk.c          | 6 ++----
 include/hw/virtio/vhost-user-blk.h | 1 -
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index e89164c358..64f3457373 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -262,9 +262,6 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
     virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
     virtio_add_feature(&features, VIRTIO_BLK_F_RO);
 
-    if (s->config_wce) {
-        virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
-    }
     if (s->num_queues > 1) {
         virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
     }
@@ -591,7 +588,8 @@ static Property vhost_user_blk_properties[] = {
     DEFINE_PROP_UINT16("num-queues", VHostUserBlk, num_queues,
                        VHOST_USER_BLK_AUTO_NUM_QUEUES),
     DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
-    DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
+    DEFINE_PROP_BIT64("config-wce", VHostUserBlk, host_features,
+                      VIRTIO_BLK_F_CONFIG_WCE, true),
     DEFINE_PROP_BIT64("discard", VHostUserBlk, host_features,
                       VIRTIO_BLK_F_DISCARD, true),
     DEFINE_PROP_BIT64("write-zeroes", VHostUserBlk, host_features,
diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
index 20573dd586..6252095c45 100644
--- a/include/hw/virtio/vhost-user-blk.h
+++ b/include/hw/virtio/vhost-user-blk.h
@@ -34,7 +34,6 @@ struct VHostUserBlk {
     struct virtio_blk_config blkcfg;
     uint16_t num_queues;
     uint32_t queue_size;
-    uint32_t config_wce;
     struct vhost_dev dev;
     struct vhost_inflight *inflight;
     VhostUserState vhost_user;
-- 
2.25.1


