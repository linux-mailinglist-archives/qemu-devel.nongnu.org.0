Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89C73FDE10
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:52:33 +0200 (CEST)
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRbM-0004MN-RL
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLMEG-0003c7-5o
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:20 -0400
Received: from relay.sw.ru ([185.231.240.75]:35398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME6-0005OY-Fe
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=nPiacBrr0uQwTXUm0yfQaTlAPSncgQfKpOtV272sm0A=; b=oH71fPcD2UV1
 nK0SN3XBPYrE0+0NrAaUEB4BaP5RtyTC9PfvWY7xtDrwPedacNLvf/lmGzA33BTkX+ZOEtmw96Hdk
 RCTe5v/XPG1WsScrdD6I7073D3oeL+STo/+0mgRHT/wbAJZDhEiRYp1VmHOONKbp7GBNXz+mRP+5f
 gOa6k=;
Received: from [192.168.15.100] (helo=max-Swift-SF314-57.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME1-000RwD-5b; Wed, 01 Sep 2021 12:08:05 +0300
From: Maxim Davydov <maxim.davydov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@openvz.org, mst@redhat.com, stefanha@redhat.com, fam@euphon.net,
 amit@kernel.org, kraxel@redhat.com, berrange@redhat.com,
 Maxim Davydov <maxim.davydov@virtuozzo.com>
Subject: [PATCH v1 7/8] virtio-blk: Add tracking of the virtio guest feature
 bits
Date: Wed,  1 Sep 2021 12:08:03 +0300
Message-Id: <20210901090804.7139-8-maxim.davydov@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
References: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=maxim.davydov@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Sep 2021 10:43:12 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
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

Add tracking of the bits acknowledged by the guests

Signed-off-by: Maxim Davydov <maxim.davydov@virtuozzo.com>
---
 hw/block/virtio-blk.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7..552b86c 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1287,11 +1287,13 @@ static Property virtio_blk_properties[] = {
     DEFINE_BLOCK_ERROR_PROPERTIES(VirtIOBlock, conf.conf),
     DEFINE_BLOCK_CHS_PROPERTIES(VirtIOBlock, conf.conf),
     DEFINE_PROP_STRING("serial", VirtIOBlock, conf.serial),
-    DEFINE_PROP_BIT64("config-wce", VirtIOBlock, host_features,
-                      VIRTIO_BLK_F_CONFIG_WCE, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("config-wce", VirtIOBlock, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_BLK_F_CONFIG_WCE, true),
 #ifdef __linux__
-    DEFINE_PROP_BIT64("scsi", VirtIOBlock, host_features,
-                      VIRTIO_BLK_F_SCSI, false),
+    DEFINE_VIRTIO_FEATURE_BIT64("scsi", VirtIOBlock, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_BLK_F_SCSI, false),
 #endif
     DEFINE_PROP_BIT("request-merging", VirtIOBlock, conf.request_merging, 0,
                     true),
@@ -1301,12 +1303,14 @@ static Property virtio_blk_properties[] = {
     DEFINE_PROP_BOOL("seg-max-adjust", VirtIOBlock, conf.seg_max_adjust, true),
     DEFINE_PROP_LINK("iothread", VirtIOBlock, conf.iothread, TYPE_IOTHREAD,
                      IOThread *),
-    DEFINE_PROP_BIT64("discard", VirtIOBlock, host_features,
-                      VIRTIO_BLK_F_DISCARD, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("discard", VirtIOBlock, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_BLK_F_DISCARD, true),
     DEFINE_PROP_BOOL("report-discard-granularity", VirtIOBlock,
                      conf.report_discard_granularity, true),
-    DEFINE_PROP_BIT64("write-zeroes", VirtIOBlock, host_features,
-                      VIRTIO_BLK_F_WRITE_ZEROES, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("write-zeroes", VirtIOBlock, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_BLK_F_WRITE_ZEROES, true),
     DEFINE_PROP_UINT32("max-discard-sectors", VirtIOBlock,
                        conf.max_discard_sectors, BDRV_REQUEST_MAX_SECTORS),
     DEFINE_PROP_UINT32("max-write-zeroes-sectors", VirtIOBlock,
-- 
1.8.3.1


