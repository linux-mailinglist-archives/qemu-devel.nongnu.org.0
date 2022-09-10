Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0875B44D5
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 08:55:42 +0200 (CEST)
Received: from localhost ([::1]:42620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWuOx-0002xe-Qp
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 02:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWuLn-0007Cz-FH; Sat, 10 Sep 2022 02:52:24 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWuLl-0000TB-8D; Sat, 10 Sep 2022 02:52:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id u22so3717853plq.12;
 Fri, 09 Sep 2022 23:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=YaD9i0+g6KwlLlZV1P1LTtMAYcL1xxgm/5cVycLxRGY=;
 b=YXxnbCNvax7aJjAaRU2cNhjKL3ELcRFFMIvbHUw8lAC4Q4k+Vxuirq63sNCIpdNhLa
 99rUgwnmSaaviIvL5YMcX32HYa/qm/4kJ8siVJHnyhdD5tH4acpAkrwf3FyDKdts6CUN
 ZpktTL4OkuG5DoI+o1WYVNtwAOQl4mKXEG5dHoiHYhLbP7ip6+oZg9nPOsqyTFUPUvd9
 k4SSq15R5f5ElpVkHiAmBtEK7Ck3AXnCeYHEH9lKGThKZLNLbDYMfN7IN63NnQArOJxI
 EScFxEevNaKlMahYKPrWQyri2bZy1Pp+M8thaE+1fYuESGjlsD/8JlOPt5a8zY53P1Hn
 a29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=YaD9i0+g6KwlLlZV1P1LTtMAYcL1xxgm/5cVycLxRGY=;
 b=59+U7BQ82vQ9EtZYIvcYELtZT1yAJseDJKQFlFotk0YM+5FZrRz9t0kIvMPRDZQOaW
 1kYz4Rn3Ge2seXz4DlE8Elpl6BkreNIZfBfklLi76dvMxhn/v3jltuF3EIVwB5LDcgkx
 2MQA9qHwEdrcsEdXvZtGIyTA7S0OCfpm6ufl4dXS95I+0gubKDUOVRDTpMFRQT2d9mQv
 zMAIMrQ9a69o3cH1eIAEc2Gyz9sylPUKi4oJac4fgu2Qx7vihd1gaof0quLtFYxdsedV
 WMaMqZIDQA1N4y7kiJ3Quj/yTzxrPCx6zsYoxSIaoCx8TZdTa3Arx4HJMinlk9k50Jsa
 5Lyg==
X-Gm-Message-State: ACgBeo3mBakzkrE+7OKgUwOqa3XPmJLicoWotZvUc0buYKTHitt1PaQh
 N3ue8vI6XeHfdTfiInvdWx1aBWuo1prGIA==
X-Google-Smtp-Source: AA6agR4e+Eq0kCUs7N8s5RL41RAKhYp/ncT+Jf0SHtkvLf84DnCMEXiC3pj/xr7mVE3+mmvUxIex+g==
X-Received: by 2002:a17:902:f546:b0:177:ed6b:4696 with SMTP id
 h6-20020a170902f54600b00177ed6b4696mr12791503plf.171.1662792739195; 
 Fri, 09 Sep 2022 23:52:19 -0700 (PDT)
Received: from roots.. ([183.221.93.83]) by smtp.gmail.com with ESMTPSA id
 l62-20020a622541000000b0053e6b092294sm890908pfl.212.2022.09.09.23.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 23:52:18 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH 1/2] include: import virtio_blk headers from linux with zoned
 device support
Date: Sat, 10 Sep 2022 14:50:56 +0800
Message-Id: <20220910065057.35017-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add file from Dmitry's "virtio-blk:add support for zoned block devices"
linux patch using scripts/update-linux-headers.sh. There is a link for
more information: https://github.com/dmitry-fomichev/virtblk-zbd

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 include/standard-headers/linux/virtio_blk.h | 109 ++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standard-headers/linux/virtio_blk.h
index 2dcc90826a..490bd21c76 100644
--- a/include/standard-headers/linux/virtio_blk.h
+++ b/include/standard-headers/linux/virtio_blk.h
@@ -40,6 +40,7 @@
 #define VIRTIO_BLK_F_MQ		12	/* support more than one vq */
 #define VIRTIO_BLK_F_DISCARD	13	/* DISCARD is supported */
 #define VIRTIO_BLK_F_WRITE_ZEROES	14	/* WRITE ZEROES is supported */
+#define VIRTIO_BLK_F_ZONED		17	/* Zoned block device */
 
 /* Legacy feature bits */
 #ifndef VIRTIO_BLK_NO_LEGACY
@@ -119,6 +120,20 @@ struct virtio_blk_config {
 	uint8_t write_zeroes_may_unmap;
 
 	uint8_t unused1[3];
+
+	/* Secure erase fields that are defined in the virtio spec */
+	uint8_t sec_erase[12];
+
+	/* Zoned block device characteristics (if VIRTIO_BLK_F_ZONED) */
+	struct virtio_blk_zoned_characteristics {
+		__virtio32 zone_sectors;
+		__virtio32 max_open_zones;
+		__virtio32 max_active_zones;
+		__virtio32 max_append_sectors;
+		__virtio32 write_granularity;
+		uint8_t model;
+		uint8_t unused2[3];
+	} zoned;
 } QEMU_PACKED;
 
 /*
@@ -153,6 +168,27 @@ struct virtio_blk_config {
 /* Write zeroes command */
 #define VIRTIO_BLK_T_WRITE_ZEROES	13
 
+/* Zone append command */
+#define VIRTIO_BLK_T_ZONE_APPEND    15
+
+/* Report zones command */
+#define VIRTIO_BLK_T_ZONE_REPORT    16
+
+/* Open zone command */
+#define VIRTIO_BLK_T_ZONE_OPEN      18
+
+/* Close zone command */
+#define VIRTIO_BLK_T_ZONE_CLOSE     20
+
+/* Finish zone command */
+#define VIRTIO_BLK_T_ZONE_FINISH    22
+
+/* Reset zone command */
+#define VIRTIO_BLK_T_ZONE_RESET     24
+
+/* Reset All zones command */
+#define VIRTIO_BLK_T_ZONE_RESET_ALL 26
+
 #ifndef VIRTIO_BLK_NO_LEGACY
 /* Barrier before this op. */
 #define VIRTIO_BLK_T_BARRIER	0x80000000
@@ -172,6 +208,72 @@ struct virtio_blk_outhdr {
 	__virtio64 sector;
 };
 
+/*
+ * Supported zoned device models.
+ */
+
+/* Regular block device */
+#define VIRTIO_BLK_Z_NONE      0
+/* Host-managed zoned device */
+#define VIRTIO_BLK_Z_HM        1
+/* Host-aware zoned device */
+#define VIRTIO_BLK_Z_HA        2
+
+/*
+ * Zone descriptor. A part of VIRTIO_BLK_T_ZONE_REPORT command reply.
+ */
+struct virtio_blk_zone_descriptor {
+	/* Zone capacity */
+	__virtio64 z_cap;
+	/* The starting sector of the zone */
+	__virtio64 z_start;
+	/* Zone write pointer position in sectors */
+	__virtio64 z_wp;
+	/* Zone type */
+	uint8_t z_type;
+	/* Zone state */
+	uint8_t z_state;
+	uint8_t reserved[38];
+};
+
+struct virtio_blk_zone_report {
+	__virtio64 nr_zones;
+	uint8_t reserved[56];
+	struct virtio_blk_zone_descriptor zones[];
+};
+
+/*
+ * Supported zone types.
+ */
+
+/* Conventional zone */
+#define VIRTIO_BLK_ZT_CONV         1
+/* Sequential Write Required zone */
+#define VIRTIO_BLK_ZT_SWR          2
+/* Sequential Write Preferred zone */
+#define VIRTIO_BLK_ZT_SWP          3
+
+/*
+ * Zone states that are available for zones of all types.
+ */
+
+/* Not a write pointer (conventional zones only) */
+#define VIRTIO_BLK_ZS_NOT_WP       0
+/* Empty */
+#define VIRTIO_BLK_ZS_EMPTY        1
+/* Implicitly Open */
+#define VIRTIO_BLK_ZS_IOPEN        2
+/* Explicitly Open */
+#define VIRTIO_BLK_ZS_EOPEN        3
+/* Closed */
+#define VIRTIO_BLK_ZS_CLOSED       4
+/* Read-Only */
+#define VIRTIO_BLK_ZS_RDONLY       13
+/* Full */
+#define VIRTIO_BLK_ZS_FULL         14
+/* Offline */
+#define VIRTIO_BLK_ZS_OFFLINE      15
+
 /* Unmap this range (only valid for write zeroes command) */
 #define VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP	0x00000001
 
@@ -198,4 +300,11 @@ struct virtio_scsi_inhdr {
 #define VIRTIO_BLK_S_OK		0
 #define VIRTIO_BLK_S_IOERR	1
 #define VIRTIO_BLK_S_UNSUPP	2
+
+/* Error codes that are specific to zoned block devices */
+#define VIRTIO_BLK_S_ZONE_INVALID_CMD     3
+#define VIRTIO_BLK_S_ZONE_UNALIGNED_WP    4
+#define VIRTIO_BLK_S_ZONE_OPEN_RESOURCE   5
+#define VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE 6
+
 #endif /* _LINUX_VIRTIO_BLK_H */
-- 
2.37.3


