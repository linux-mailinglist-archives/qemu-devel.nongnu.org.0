Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6B5A2AE9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:17:24 +0200 (CEST)
Received: from localhost ([::1]:35242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRb5H-0003ei-Rq
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oRaOh-0004G4-Dv; Fri, 26 Aug 2022 10:33:24 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:58386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oRaOe-0007BF-Lr; Fri, 26 Aug 2022 10:33:23 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 4A0B52E13C1;
 Fri, 26 Aug 2022 17:33:11 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b581::1:d])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7Ht2PirWaX-XAOqJVhG; Fri, 26 Aug 2022 17:33:10 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661524390; bh=UfF0SlZ2uflOiSGtmz6bl9fTTDawEch2xls/WNtKPI4=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=qy+W6bksT1+7a0nTAR3M5xVT/KhG6hSHyUX49B2Pbtdznc9D4qB+JKWySMNlERdb5
 7Yqt0q4z+zTzLHxUOsLsMwqliadOhePD1mEN6mRtgb+56FbDr2qMP8Ggw7oWkZ0f28
 92xZJCs4behDrep/bE0tJlJF1jx2W3Uwj+8BPYPw=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com, d-tatianin@yandex-team.ru
Subject: [PATCH v2 6/8] vhost-user-blk: make it possible to disable
 write-zeroes/discard
Date: Fri, 26 Aug 2022 17:32:46 +0300
Message-Id: <20220826143248.580939-7-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


