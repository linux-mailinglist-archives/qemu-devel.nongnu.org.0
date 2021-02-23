Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D29322570
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 06:37:30 +0100 (CET)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEQO1-0002YO-IY
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 00:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEQMz-00022M-Hs; Tue, 23 Feb 2021 00:36:25 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEQMx-00014u-Pm; Tue, 23 Feb 2021 00:36:25 -0500
Received: by mail-pj1-x1034.google.com with SMTP id t5so1066198pjd.0;
 Mon, 22 Feb 2021 21:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPW7Kl4dGhlQZymHlEpFbbGZwHzy3AprkgH6A7yq2Xc=;
 b=B5f+qCkkFvguHem7/kyWaYp9QV2QdAcmVQx/0OnPtpkU7HHi48TiWdsLdsX+TZPVY0
 egk+5f2hzneImwi74ZAACFa1UCGwY96Y9mIQiAorQv782NajERHIJ1VGgni8TcuvmUGs
 oLG5nX0x6ZhsSbdnqVuXdUfWltRBTF5wcCoHt7zsZ9zrkJA4zdC9EQPteLtXXlBniM4m
 4jkKWAst9Ai+TFTfvyHSA/XNC14Niye8BECUvWjQqzHRdQ7mYJS3CZ9ily1PPb8ijFot
 ArpVvyLkd7pTQ2kXvkANQQj43uuhaNFHf1IDUrW+tbVPbWsU9GOOL6GObwjVXx7WDbnE
 1NtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPW7Kl4dGhlQZymHlEpFbbGZwHzy3AprkgH6A7yq2Xc=;
 b=WYE2MKrWly2o7DPfyDiJvFUTSfJ1Uk7Dn3SYeSL5/QLlIPn67bFc+v6RcBmi+gYPmC
 08zlcXyMJD0cGxzVVq3wDMR3q1Wkdcp9u5r4U/o6YpXa9fwvH2N2z9ABmyoEnWK2DG+p
 +oLsvxsoZeZQFkynvz7IqCXpay6X1gT2rsBsUVpstlvaEqKQR1nfoPdlQpzhuroM8acQ
 w3M++Qa5XF2wWZ3QEi66QxmHQUMcmxvLhSwDKw3RvuyYpI5mwRydj8O2+PMZcB0Y2S5D
 kN29/2HBs9dEiuurATJj3Eb/h77mYn+6DtIBcWMpOyPzkU7sV1l0vZa+jZiI493VXAl0
 i0vg==
X-Gm-Message-State: AOAM531qANc9RKLRGSMdRnN2hTSWV3rLeDdoY3oKs+klfmQD77L9ltUp
 dVuh4OcYASDdr5EyYtrnmCjHm4mnY+f0JQ==
X-Google-Smtp-Source: ABdhPJw3AnRr5raSOrqGvSWOCDy2YO5rBhZmnqXzAwWXYLCAjE2lJq08ykwNsQftn7vnBvSici0Yfg==
X-Received: by 2002:a17:90a:4611:: with SMTP id
 w17mr28503337pjg.122.1614058581717; 
 Mon, 22 Feb 2021 21:36:21 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ddae:5d18:94c8:4549])
 by smtp.gmail.com with ESMTPSA id w6sm8053368pfj.190.2021.02.22.21.36.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 21:36:21 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] virtio-blk: Respect discard granularity
Date: Tue, 23 Feb 2021 14:36:16 +0900
Message-Id: <20210223053616.68503-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <YDPgfPiXQ9fNmGlq@stefanha-x1.localdomain>
References: <YDPgfPiXQ9fNmGlq@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1034.google.com
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
 hw/core/machine.c              | 9 ++++++++-
 include/hw/virtio/virtio-blk.h | 1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

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
index de3b8f1b318..3ba976e5bbc 100644
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
@@ -41,6 +43,7 @@ GlobalProperty hw_compat_5_1[] = {
     { "vhost-user-blk", "num-queues", "1"},
     { "vhost-user-scsi", "num_queues", "1"},
     { "virtio-blk-device", "num-queues", "1"},
+    { "virtio-blk-device", "report-discard-granularity", "off" },
     { "virtio-scsi-device", "num_queues", "1"},
     { "nvme", "use-intel-id", "on"},
     { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
@@ -50,6 +53,7 @@ const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
 GlobalProperty hw_compat_5_0[] = {
     { "pci-host-bridge", "x-config-reg-migration-enabled", "off" },
     { "virtio-balloon-device", "page-poison", "false" },
+    { "virtio-blk-device", "report-discard-granularity", "off" },
     { "vmport", "x-read-set-eax", "off" },
     { "vmport", "x-signal-unsupported-cmd", "off" },
     { "vmport", "x-report-vmx-type", "off" },
@@ -59,6 +63,7 @@ GlobalProperty hw_compat_5_0[] = {
 const size_t hw_compat_5_0_len = G_N_ELEMENTS(hw_compat_5_0);
 
 GlobalProperty hw_compat_4_2[] = {
+    { "virtio-blk-device", "report-discard-granularity", "off" },
     { "virtio-blk-device", "queue-size", "128"},
     { "virtio-scsi-device", "virtqueue_size", "128"},
     { "virtio-blk-device", "x-enable-wce-if-config-wce", "off" },
@@ -74,6 +79,7 @@ GlobalProperty hw_compat_4_2[] = {
 const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
 
 GlobalProperty hw_compat_4_1[] = {
+    { "virtio-blk-device", "report-discard-granularity", "off" },
     { "virtio-pci", "x-pcie-flr-init", "off" },
     { "virtio-device", "use-disabled-flag", "false" },
 };
@@ -83,6 +89,7 @@ GlobalProperty hw_compat_4_0[] = {
     { "VGA",            "edid", "false" },
     { "secondary-vga",  "edid", "false" },
     { "bochs-display",  "edid", "false" },
+    { "virtio-blk-device", "report-discard-granularity", "off" },
     { "virtio-vga",     "edid", "false" },
     { "virtio-gpu-device", "edid", "false" },
     { "virtio-device", "use-started", "false" },
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


