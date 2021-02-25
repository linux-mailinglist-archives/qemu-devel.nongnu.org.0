Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57803247CB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 01:14:17 +0100 (CET)
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF4IK-0006tx-EZ
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 19:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF4Gu-00060n-PN; Wed, 24 Feb 2021 19:12:48 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF4Gt-0001JY-1J; Wed, 24 Feb 2021 19:12:48 -0500
Received: by mail-pg1-x52b.google.com with SMTP id a4so2593296pgc.11;
 Wed, 24 Feb 2021 16:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qBZqo/B7GnD9Q5mbrZ5lBnPUvstah8sjBVxT8m97Ivg=;
 b=XUNceIFiKNi4xeN393vOqqcoCQ9dWMN/iQ/eWd4bS+XANGetXHkO7fOqAyEUJytqwp
 45VB+iFLfcfdPMV7EWgk0yeQ1NtXFbe1W8FynCyO9V68unHwNEJClAwwBYxXZABl3wck
 n7j3TK6UHFGLW6hvqjqup6Po9GsYBOWjL9GAsKlStOJr04rgqgSy77Zr6+oxx2mx6BsJ
 GReDYKQu7jokOkS1jnCxziW4DTSEF7gGARgB9GHuh86lrl3vw7uHXApckzhysaiZlKwH
 pP7ChjCh4Yc+tnvcVXptEIXo/KYFVkkSmE/PpzTO0ouKYd0LPHLRq8gaowCFVY3aP8zn
 GXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qBZqo/B7GnD9Q5mbrZ5lBnPUvstah8sjBVxT8m97Ivg=;
 b=r+JnGaLtXv53bM53MsZCVeQGBF9CE8KBGXKEPj84XJtAFbIZQWKkRv6XqQAwng8ceR
 iKUHzUk9qYeLdQnKieV16sX4nSyIbmMzUeB3vAoi9QwWxUo5pcbBJbqoWsCp/EKMvPyo
 X+Mew6QFOKp95wZPVirZQhuCssVbkN+dTdX1cXbBebPK7u2yAk660sO3nYYB4nL8luJj
 18td5VC2QanjbDXhBlmhDer2dIPbK7HkaQlrvRyypGrO/GdXBxrPTOpZXi4GMNIcGHv0
 yzhwlRgR7h+kk+qTi0jLAfijbkKjC07gImCB+yQ6B9QN6GXm3aCqIvWC8chIpndYui0C
 kf2A==
X-Gm-Message-State: AOAM533WLi4J6ZcfhpO5LV0X/kMGZExlMwAfNAPiqPjnY7DIZ+z6GWTD
 v3WPOQ7FUg6ZhwsjyL0Ayz2CCb1VHY3xuw==
X-Google-Smtp-Source: ABdhPJyK3DJ8OxV9kBHdgGyQz+qECKULi0AqS0q/TP2cqgVeslJxcJAtXxdI4qeFGrThlvQb3pz1XA==
X-Received: by 2002:aa7:848b:0:b029:1ed:5cb9:9e61 with SMTP id
 u11-20020aa7848b0000b02901ed5cb99e61mr499846pfn.41.1614211964926; 
 Wed, 24 Feb 2021 16:12:44 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:29a8:515b:7b7:9008])
 by smtp.gmail.com with ESMTPSA id u128sm4301534pfc.192.2021.02.24.16.12.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Feb 2021 16:12:44 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v4] virtio-blk: Respect discard granularity
Date: Thu, 25 Feb 2021 09:12:39 +0900
Message-Id: <20210225001239.47046-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210224101747.hmgou6z7qzmk62ft@steredhat>
References: <20210224101747.hmgou6z7qzmk62ft@steredhat>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Report the configured granularity for discard operation to the
guest. If this is not set use the block size.

Since until now we have ignored the configured discard granularity
and always reported the block size, let's add
'report-discard-granularity' property and disable it for older
machine types to avoid migration issues.

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


