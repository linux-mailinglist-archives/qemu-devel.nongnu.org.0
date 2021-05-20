Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84A938B2E1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:19:00 +0200 (CEST)
Received: from localhost ([::1]:40790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkRv-0004yy-SZ
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damtev@yandex-team.ru>)
 id 1ljir0-0002Xt-Fw; Thu, 20 May 2021 09:36:46 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:39240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damtev@yandex-team.ru>)
 id 1ljiqx-00020L-1R; Thu, 20 May 2021 09:36:46 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 342912E15E6;
 Thu, 20 May 2021 16:36:39 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Ju0w0JwSwS-ac1aOHQW; Thu, 20 May 2021 16:36:39 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1621517799; bh=stVBQY4hJB2iiCmgxMuZdIaAMy0ue6JbCGAwSIRQA1Y=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=W8fGqgPhUMN5j+cHTgX7ZjdlCmnUFT/TSaLGGZHkdvgvW7LHGH+aRQdy2T+zErrvp
 etWCb5BADDUmwMrqrdfTuD02kF4Zv5nLxZiTVS2AxhBeFSK/yRI3QZK/AYhvMfVwhU
 cWjADv0DLcvjgO2sNJEn7uIDVLWB4lSnTS7dyPLI=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from 172.31.109.104-vpn.dhcp.yndx.net
 (172.31.109.104-vpn.dhcp.yndx.net [172.31.109.104])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 5DcqKhAZFA-acpSVONF; Thu, 20 May 2021 16:36:38 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
From: Yury Kamenev <damtev@yandex-team.ru>
To: mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/1] virtio: disable partitions scanning for no partitions
 block
Date: Thu, 20 May 2021 16:36:08 +0300
Message-Id: <20210520133608.98785-2-damtev@yandex-team.ru>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210520133608.98785-1-damtev@yandex-team.ru>
References: <20210520133608.98785-1-damtev@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=damtev@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 May 2021 11:10:43 -0400
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
Cc: Yury Kamenev <damtev@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yury Kamenev <damtev@yandex-team.ru>
---
 hw/block/virtio-blk.c                       | 4 ++++
 include/hw/virtio/virtio-blk.h              | 1 +
 include/standard-headers/linux/virtio_blk.h | 1 +
 3 files changed, 6 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7cc9..abf375b490 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1031,6 +1031,9 @@ static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
     if (s->conf.num_queues > 1) {
         virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
     }
+    if (!s->conf.scan_parts) {
+        virtio_add_feature(&features, VIRTIO_BLK_F_NO_PS);
+    }
 
     return features;
 }
@@ -1295,6 +1298,7 @@ static Property virtio_blk_properties[] = {
 #endif
     DEFINE_PROP_BIT("request-merging", VirtIOBlock, conf.request_merging, 0,
                     true),
+    DEFINE_PROP_BOOL("scan-parts", VirtIOBlock, conf.scan_parts, true),
     DEFINE_PROP_UINT16("num-queues", VirtIOBlock, conf.num_queues,
                        VIRTIO_BLK_AUTO_NUM_QUEUES),
     DEFINE_PROP_UINT16("queue-size", VirtIOBlock, conf.queue_size, 256),
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 29655a406d..706a789ad5 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -41,6 +41,7 @@ struct VirtIOBlkConf
     uint16_t num_queues;
     uint16_t queue_size;
     bool seg_max_adjust;
+    bool scan_parts;
     bool report_discard_granularity;
     uint32_t max_discard_sectors;
     uint32_t max_write_zeroes_sectors;
diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standard-headers/linux/virtio_blk.h
index 2dcc90826a..6b7b2db29c 100644
--- a/include/standard-headers/linux/virtio_blk.h
+++ b/include/standard-headers/linux/virtio_blk.h
@@ -40,6 +40,7 @@
 #define VIRTIO_BLK_F_MQ		12	/* support more than one vq */
 #define VIRTIO_BLK_F_DISCARD	13	/* DISCARD is supported */
 #define VIRTIO_BLK_F_WRITE_ZEROES	14	/* WRITE ZEROES is supported */
+#define VIRTIO_BLK_F_NO_PS      16      /* Disable partitions scanning */
 
 /* Legacy feature bits */
 #ifndef VIRTIO_BLK_NO_LEGACY
-- 
2.24.3 (Apple Git-128)


