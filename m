Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BA3322A35
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 13:11:28 +0100 (CET)
Received: from localhost ([::1]:34324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEWXH-0006Pg-Mo
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 07:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEWVn-0005tA-9k; Tue, 23 Feb 2021 07:09:55 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEWVl-0007HN-PO; Tue, 23 Feb 2021 07:09:55 -0500
Received: by mail-pf1-x42c.google.com with SMTP id j12so8635208pfj.12;
 Tue, 23 Feb 2021 04:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IaQ05cOxm7bzJmbHRJlA0lMej7I2sZkQ2xKwsmQVK9U=;
 b=pnX/yuYyrg0XB/tuN3MMqg/NJemgngwb3J8FYHGV1nof7B3z1tOdJdREesIbLyuPGY
 Ijh6JZ2aeKD7IVSC6UFPhMzIHSKBdPOnH4bFToEBE3hH1trCNHorGphDNG0lD37s/Wlk
 WDF5tUyZGgn3f0syWPszpXnNwZKSxoQB02fJr8w8ocNZbPxY8EjRlJVH6afTOX29OXK2
 O0nz47ffm6crtM0+isOrx95TIR8Hfr6xR75mOjlXP7laqaa9tFkA98LJ8OouxICr5wG2
 sOwwp4flyLHQ8sQKX+yif/juun2xF9urjNR7nhWsWi6VNlF3JFUxwTaUj11r+Swi1Rlg
 4J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IaQ05cOxm7bzJmbHRJlA0lMej7I2sZkQ2xKwsmQVK9U=;
 b=i/mAsjCM7/dNfmbJ0DP0z4d9CJq4zu3J1te9tCAnMTugF6uVDPxUunG2cVLbgizXSL
 RBfWq56rBsc8aMM3cSkRvp1vnVY0jsSnOSZ91Y5a+bDBBI+M/32h32j2NwUtXAlwJJRa
 zYOSK8w7BaZc7PH4dVY4rK9GeJWWNnX1yEck/a2yf8m7rB2L8OkkX1jKWKR/OM50J1Ne
 fDSzkH5q6B5kPcnJ1REUz4YHueEfq/EonWPa8zF82iKIgKT7mZRzEYXqUPJm1rbaDzJr
 F8c/eJeAVzJ7jVMVx/SCrnZTyBlUxNqc/jBH0bm5NPPKnNhDMNpPEVIolUU33r2TeZE+
 edLw==
X-Gm-Message-State: AOAM532MQdcH6F9K4V0VhHuhj4EQnmeMHaBCcYoq/k5BuJZCNS2rmXzJ
 URJTuDGEV3Dvzabr/++JyXopiVNoU0FCyg==
X-Google-Smtp-Source: ABdhPJwdpqV6fXZBGZSOR+HQ9PRfTBz125h9CzUhgL4WdxtqvrAF6Ei2ocXhuZ1fPyeTfvj9vRoCoQ==
X-Received: by 2002:a62:60c6:0:b029:1ed:55f8:f35 with SMTP id
 u189-20020a6260c60000b02901ed55f80f35mr1976952pfb.37.1614082191858; 
 Tue, 23 Feb 2021 04:09:51 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ddae:5d18:94c8:4549])
 by smtp.gmail.com with ESMTPSA id g3sm20233702pfo.90.2021.02.23.04.09.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Feb 2021 04:09:51 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3] virtio-blk: Respect discard granularity
Date: Tue, 23 Feb 2021 21:09:40 +0900
Message-Id: <20210223120940.89227-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210223112406.cqbujfkt7pq4zyg6@steredhat>
References: <20210223112406.cqbujfkt7pq4zyg6@steredhat>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/block/virtio-blk.c          | 8 +++++++-
 hw/core/machine.c              | 4 +++-
 include/hw/virtio/virtio-blk.h | 1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index bac2d6fa2b2..f4378e61182 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -962,10 +962,14 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
     blkcfg.wce = blk_enable_write_cache(s->blk);
     virtio_stw_p(vdev, &blkcfg.num_queues, s->conf.num_queues);
     if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD)) {
+        uint32_t discard_granularity = conf->discard_granularity;
+        if (discard_granularity == -1 || !s->conf.report_discard_granularity) {
+            discard_granularity = blk_size;
+        }
         virtio_stl_p(vdev, &blkcfg.max_discard_sectors,
                      s->conf.max_discard_sectors);
         virtio_stl_p(vdev, &blkcfg.discard_sector_alignment,
-                     blk_size >> BDRV_SECTOR_BITS);
+                     discard_granularity >> BDRV_SECTOR_BITS);
         /*
          * We support only one segment per request since multiple segments
          * are not widely used and there are no userspace APIs that allow
@@ -1299,6 +1303,8 @@ static Property virtio_blk_properties[] = {
                      IOThread *),
     DEFINE_PROP_BIT64("discard", VirtIOBlock, host_features,
                       VIRTIO_BLK_F_DISCARD, true),
+    DEFINE_PROP_BOOL("report-discard-granularity", VirtIOBlock,
+                     conf.report_discard_granularity, true),
     DEFINE_PROP_BIT64("write-zeroes", VirtIOBlock, host_features,
                       VIRTIO_BLK_F_WRITE_ZEROES, true),
     DEFINE_PROP_UINT32("max-discard-sectors", VirtIOBlock,
diff --git a/hw/core/machine.c b/hw/core/machine.c
index de3b8f1b318..e4df5797e72 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -33,7 +33,9 @@
 #include "migration/global_state.h"
 #include "migration/vmstate.h"
 
-GlobalProperty hw_compat_5_2[] = {};
+GlobalProperty hw_compat_5_2[] = {
+    { "virtio-blk-device", "report-discard-granularity", "off" },
+};
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
 GlobalProperty hw_compat_5_1[] = {
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 214ab748229..29655a406dd 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -41,6 +41,7 @@ struct VirtIOBlkConf
     uint16_t num_queues;
     uint16_t queue_size;
     bool seg_max_adjust;
+    bool report_discard_granularity;
     uint32_t max_discard_sectors;
     uint32_t max_write_zeroes_sectors;
     bool x_enable_wce_if_config_wce;
-- 
2.24.3 (Apple Git-128)


