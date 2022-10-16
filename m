Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01663600072
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 17:13:32 +0200 (CEST)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok5KU-0006EO-VW
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 11:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok5Ch-0005tb-Gf; Sun, 16 Oct 2022 11:05:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok5Ce-0006sB-In; Sun, 16 Oct 2022 11:05:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so8844521pjl.3; 
 Sun, 16 Oct 2022 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fo4IaB+rxXdEMmnIeISrnIaMqlWTpWLecrMpsj8TL6E=;
 b=kk8XryqHW1V9QBdY5CxW+YVVRj/SRD6a/cZQ05AvfKgbDgws/WxdYY62tsYlp06GPP
 2a5m/fRQfIlecihuWEQNq7dMVIiuWg+6tyPDXeKskZ67nE6TZ4J4RcX9+imt3P3mzMQP
 9i3ZmthE4vT2AHpiUXzOCiI4i6S2spVJzJSCQ4HvtlmwduOJKeUbbFAQoFWuyDtU3kNH
 5iHQ6Rw/k1wDp9Q0g1S0NmXhhgiZGjhnuUMG3tBsWuX6IxjUL7uQW2lVopiugZq/d1z8
 jl/IDN+n86nngMs7K8oCC5k022x2Pt/oGOsSz7zSESfAoNOO7p9Zb4F4s7Cp0f76fn53
 gbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fo4IaB+rxXdEMmnIeISrnIaMqlWTpWLecrMpsj8TL6E=;
 b=bnIsfo5io49oa8y0vtTT/gkn6UgknjmrOsLjOjOF2PQ8ue7xu28egGE2t2EmAoi4nG
 a/tmS8sV9nLZaPLDZOvJ7SNkLh/ESJqJebwJzuax1G2BFdLFCsb1ZBbBQs08x5NNXqyw
 dr8TkIIN0+VxYi4ysZ/3b244f93ueOFZvIHeanvXEicWxuCpFtEnSiipbc4nrWPA6Tww
 oRV0VWJmmytG8yO2GNXstSALRNtJKm0mD+Dw6CEiqlnrMJspSuWhTPBuZic1TdHomtvY
 iiFO03FWhrE+tGyusTF3bmNk0jDMwJokp+u6tOrHpwqR4tImJKuPCbpvj7LWtfy22/na
 n9pg==
X-Gm-Message-State: ACrzQf3tt8dH5vKKSXUMJHRVzdeiDfWupfMJZMX7UjvFgggbC4dahHje
 +O5adBaotT69c8bG8vCuYCFMNVrO0oLSbw==
X-Google-Smtp-Source: AMsMyM79J2Uq6yvI+EbvzX7agjUrMrzi7hO74wv5uiCIN/syT2CMyulV3G1Nxunl5FlImkfOIUOeVQ==
X-Received: by 2002:a17:90b:2691:b0:20c:d655:c67d with SMTP id
 pl17-20020a17090b269100b0020cd655c67dmr28494141pjb.36.1665932721781; 
 Sun, 16 Oct 2022 08:05:21 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 184-20020a6217c1000000b005623a138583sm5166707pfx.124.2022.10.16.08.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 08:05:21 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 hare@suse.de, qemu-block@nongnu.org, damien.lemoal@opensource.wdc.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v3 1/2] include: update virtio_blk headers from Linux 5.19-rc2+
Date: Sun, 16 Oct 2022 23:05:05 +0800
Message-Id: <20221016150506.172675-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016150506.172675-1-faithilikerun@gmail.com>
References: <20221016150506.172675-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1036.google.com
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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


