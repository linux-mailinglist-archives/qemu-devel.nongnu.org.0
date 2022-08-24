Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85B59F676
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:38:39 +0200 (CEST)
Received: from localhost ([::1]:50500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmqM-0007KZ-WB
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQmhk-0000gC-RP; Wed, 24 Aug 2022 05:29:44 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:42358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQmhf-00083U-IV; Wed, 24 Aug 2022 05:29:44 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 224AA2E15BA;
 Wed, 24 Aug 2022 12:18:50 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b4bd::1:34])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YDoXMhagzp-ImOaTS2I; Wed, 24 Aug 2022 12:18:49 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661332729; bh=s6OUV6tSLZUzS4tMAJMp6QEfm6lhaMjVOwAjGV1hW6g=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=K17FLd2PFBybNGmSghvHnyjgZkNE+6e5BADPLiEYIJrNdfn/YiiOZwvJK5ufOGIlJ
 LXy47q8ClLYiLPC3EYViYBsba0+lUk7h3d/FkyEpmEYIZ36soc1uJcicxq+jMpGUiF
 1kZ+z/RsSm562DFHZwe5Hk7T6/yYfrCFn3T0Lb+s=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, stefanha@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru, d-tatianin@yandex-team.ru
Subject: [PATCH v1 3/5] vhost-user-blk: make it possible to disable
 write-zeroes/discard
Date: Wed, 24 Aug 2022 12:18:35 +0300
Message-Id: <20220824091837.301708-4-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
References: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
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
---
 hw/block/vhost-user-blk.c          | 8 ++++++--
 include/hw/virtio/vhost-user-blk.h | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 9117222456..e89164c358 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -251,6 +251,8 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
 
+    features |= s->host_features;
+
     /* Turn on pre-defined features */
     virtio_add_feature(&features, VIRTIO_BLK_F_SIZE_MAX);
     virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
@@ -259,8 +261,6 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
     virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
     virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
     virtio_add_feature(&features, VIRTIO_BLK_F_RO);
-    virtio_add_feature(&features, VIRTIO_BLK_F_DISCARD);
-    virtio_add_feature(&features, VIRTIO_BLK_F_WRITE_ZEROES);
 
     if (s->config_wce) {
         virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
@@ -592,6 +592,10 @@ static Property vhost_user_blk_properties[] = {
                        VHOST_USER_BLK_AUTO_NUM_QUEUES),
     DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
     DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
+    DEFINE_PROP_BIT64("discard", VHostUserBlk, host_features,
+                      VIRTIO_BLK_F_DISCARD, true),
+    DEFINE_PROP_BIT64("write-zeroes", VHostUserBlk, host_features,
+                      VIRTIO_BLK_F_WRITE_ZEROES, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
index 7c91f15040..20573dd586 100644
--- a/include/hw/virtio/vhost-user-blk.h
+++ b/include/hw/virtio/vhost-user-blk.h
@@ -51,6 +51,8 @@ struct VHostUserBlk {
     bool connected;
     /* vhost_user_blk_start/vhost_user_blk_stop */
     bool started_vu;
+
+    uint64_t host_features;
 };
 
 #endif
-- 
2.25.1


