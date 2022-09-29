Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D0D5EF330
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 12:15:54 +0200 (CEST)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odqa9-0002Ig-UA
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 06:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odq9s-0001bs-GF; Thu, 29 Sep 2022 05:48:46 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odq9q-0004J9-Hi; Thu, 29 Sep 2022 05:48:44 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so5407606pjs.4; 
 Thu, 29 Sep 2022 02:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8c/2JO7aXR36MrY5r0dDCGE7kIU1nzjPXj33yEUQe4g=;
 b=AbC0Y0a6sfhbe4nT6x6BSe3LYxaBOxIG76nWhKdIf1g+3nP1N8lMTtYfz0AbmpS4Kl
 j8M/aqkkDuj7JHcTVqZR2USHu9VDv/WCNg/GQJJRBlX4XgStghSpcKTG18raIUlrILUC
 wHWh4sPQ37nOoVXrDFzdOYY2j9vA+cVAdyL+wi1m/ESurKkWkbr9GUo/0sKCQqFUF0rO
 oHG4uF2f9Ydy49JIh9iPKnWf/4wjEpgnLcQ53fdtT4zGKbTNXb1j9X9r8JOOHNxe3E//
 kfeZ8NmoOf/qq+M1kP3yncZ0CiUInXD/cPl7f7zVZsCDq0Y8lic9U+yLEMstxtH7jWnV
 EoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8c/2JO7aXR36MrY5r0dDCGE7kIU1nzjPXj33yEUQe4g=;
 b=lwfjg4mkCyVc1HJwFjcwQqoL5kkTPyilVTD3uY3H/hG2NyHgd7nSPx2ffpf7ITTGSH
 2rbflt4PwrOocyDNUzhW5/jlbrekR+YNDv/IGpNYnahOc/0O5m3n0sgdsUBVGkdesPR0
 EWu4aBJNnFZmsTR6fRGCvuSR1bzIVp8e39awFat0Owyui/12pBWUf89n15EWOVHx7i74
 nKBiTswnRE9O8lYO7YPxN+E/9LHk3Q3/kRK7a/eYeo0a7MVd9fK+TujkkF0pyh06ruLc
 0DCDX6EgagCBPhU1Nu8o6TKZXNcHqy3LH/kt88ennhfKB0f21D8he+RMca32PcVCruR8
 ozsQ==
X-Gm-Message-State: ACrzQf1x5Hs5K10GGXmq311gpQgA6yF4R4bctDzINcph5QQ42ioM+mc0
 VJ6SDopjl9PU/j/Q04FHA6LkSRgrn066Zw==
X-Google-Smtp-Source: AMsMyM4BWQqoluWMqiz6dhKYgww/t1L94kZRIExXlrIG8jtdFHnfLp48l++ruRujp70tezH55Mg+Jg==
X-Received: by 2002:a17:90b:4b0d:b0:203:690d:9f7f with SMTP id
 lx13-20020a17090b4b0d00b00203690d9f7fmr15168606pjb.145.1664444920601; 
 Thu, 29 Sep 2022 02:48:40 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 f4-20020a170902ce8400b00178b06fea7asm5574515plg.148.2022.09.29.02.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 02:48:40 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, stefanha@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v2 1/2] include: update virtio_blk headers from Linux 5.19-rc2+
Date: Thu, 29 Sep 2022 17:48:20 +0800
Message-Id: <20220929094821.78596-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929094821.78596-1-faithilikerun@gmail.com>
References: <20220929094821.78596-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use scripts/update-linux-headers.sh to update virtio-blk headers
from Dmitry's "virtio-blk:add support for zoned block devices"
linux patch. There is a link for more information:
https://github.com/dmitry-fomichev/virtblk-zbd

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


