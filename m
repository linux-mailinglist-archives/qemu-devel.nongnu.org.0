Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3740865087C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 09:19:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7BKs-0001sY-M4; Mon, 19 Dec 2022 03:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7BKk-0001rB-4G; Mon, 19 Dec 2022 03:17:14 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7BKi-0002s0-2L; Mon, 19 Dec 2022 03:17:13 -0500
Received: by mail-pl1-x62d.google.com with SMTP id m4so8296390pls.4;
 Mon, 19 Dec 2022 00:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wuWrzcyOarkyOpTUC6Ui2WY9KWls5fEE4N4lW+GvR70=;
 b=QyEskILusU9hneEgP7cHD8X3fbrQc7Gv2i7pUagwbdmtw7FZuyo3EbIKx0MawHgrog
 CGvTed8CcCKMCf+VNHi/66t2LYiZGqhOebxMJYGyDs3DQFA6a0PqyfdrkiTeYGfN6bPE
 RgOJzheTlHC7yrZRsEPnsCz2JMQRSPwDy7oEmRvM5vAOMRu5V7Y+vM6QtYsCnSHlYPas
 3MPvwkmtskiMnXU+VQI8aeoyoyAGKzSaVPjCKAAQi935mPMiwzoE89SVxDbnbhxaxJR8
 o9X+GyCj+aQOucpCqml85PAoIM3m1nq6a0lkVB2/UccxjDu4202IoErOZYieKx6eBW7Q
 0x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wuWrzcyOarkyOpTUC6Ui2WY9KWls5fEE4N4lW+GvR70=;
 b=2wbesrPzCslFL/YiMtf+OVwX4AL+1rdktNQPguQOe3HEitLdeUwHCWpY/iAMGLcib5
 Oz5ncG45rsnRGevJQBEUEDNdRywSm52hryuP4Z/gStt59MdcFBcaV8GwL5EpzYe7x/qc
 9O25j1s/1ERbMAm9pyg8+w8KEa0jeMm9/X+xMUOtWytCk3jGwvRF+7uAN7q2x6io/66C
 50V6htvx0OJl5Jyj+mqjINT0tu30sPkI/W4j/kg7BKqEL4E8gvddGkpf2y0EGe/Gkwi7
 cbLu2xirl/kVyu6/gJapH1tIx6745g7Cce1Nj6hr4SGp2w6yCEGeXBKHXujKA8i5F491
 /rQQ==
X-Gm-Message-State: AFqh2krkcXJmW0/n6kFvLMEEkiV/1hh6wGR8d5WjZXKB8VCr9FU5GtFE
 FivenE/GTqIZhNSn1D1KvvZuSeGIzUft7Vvz
X-Google-Smtp-Source: AMrXdXtvbqiwS65KrcFN7SvQAdM4+5k3bSXVwjWAe7FW+SZoNEJQhO4kofdIUGrrk7yO+oRNaNecYw==
X-Received: by 2002:a17:902:e383:b0:190:ee85:ada3 with SMTP id
 g3-20020a170902e38300b00190ee85ada3mr19119075ple.25.1671437829282; 
 Mon, 19 Dec 2022 00:17:09 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170903234a00b00177fb862a87sm6434337plh.20.2022.12.19.00.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 00:17:09 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 hare@suse.de, qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, dmitry.fomichev@wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 1/3] include: update virtio_blk headers
Date: Mon, 19 Dec 2022 16:16:42 +0800
Message-Id: <20221219081644.11790-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219081644.11790-1-faithilikerun@gmail.com>
References: <20221219081644.11790-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use scripts/update-linux-headers.sh to update virtio-blk headers
from Dmitry's "virtio-blk:add support for zoned block devices"
Linux patches.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 include/standard-headers/linux/virtio_blk.h | 158 ++++++++++++++++++--
 1 file changed, 142 insertions(+), 16 deletions(-)

diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standard-headers/linux/virtio_blk.h
index 2dcc90826a..3744e4da1b 100644
--- a/include/standard-headers/linux/virtio_blk.h
+++ b/include/standard-headers/linux/virtio_blk.h
@@ -25,10 +25,10 @@
  * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  * SUCH DAMAGE. */
-#include "standard-headers/linux/types.h"
-#include "standard-headers/linux/virtio_ids.h"
-#include "standard-headers/linux/virtio_config.h"
-#include "standard-headers/linux/virtio_types.h"
+#include <linux/types.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_types.h>
 
 /* Feature bits */
 #define VIRTIO_BLK_F_SIZE_MAX	1	/* Indicates maximum segment size */
@@ -40,6 +40,8 @@
 #define VIRTIO_BLK_F_MQ		12	/* support more than one vq */
 #define VIRTIO_BLK_F_DISCARD	13	/* DISCARD is supported */
 #define VIRTIO_BLK_F_WRITE_ZEROES	14	/* WRITE ZEROES is supported */
+#define VIRTIO_BLK_F_SECURE_ERASE	16 /* Secure Erase is supported */
+#define VIRTIO_BLK_F_ZONED		17	/* Zoned block device */
 
 /* Legacy feature bits */
 #ifndef VIRTIO_BLK_NO_LEGACY
@@ -47,8 +49,10 @@
 #define VIRTIO_BLK_F_SCSI	7	/* Supports scsi command passthru */
 #define VIRTIO_BLK_F_FLUSH	9	/* Flush command supported */
 #define VIRTIO_BLK_F_CONFIG_WCE	11	/* Writeback mode available in config */
+#ifndef __KERNEL__
 /* Old (deprecated) name for VIRTIO_BLK_F_FLUSH. */
 #define VIRTIO_BLK_F_WCE VIRTIO_BLK_F_FLUSH
+#endif
 #endif /* !VIRTIO_BLK_NO_LEGACY */
 
 #define VIRTIO_BLK_ID_BYTES	20	/* ID string length */
@@ -63,8 +67,8 @@ struct virtio_blk_config {
 	/* geometry of the device (if VIRTIO_BLK_F_GEOMETRY) */
 	struct virtio_blk_geometry {
 		__virtio16 cylinders;
-		uint8_t heads;
-		uint8_t sectors;
+		__u8 heads;
+		__u8 sectors;
 	} geometry;
 
 	/* block size of device (if VIRTIO_BLK_F_BLK_SIZE) */
@@ -72,17 +76,17 @@ struct virtio_blk_config {
 
 	/* the next 4 entries are guarded by VIRTIO_BLK_F_TOPOLOGY  */
 	/* exponent for physical block per logical block. */
-	uint8_t physical_block_exp;
+	__u8 physical_block_exp;
 	/* alignment offset in logical blocks. */
-	uint8_t alignment_offset;
+	__u8 alignment_offset;
 	/* minimum I/O size without performance penalty in logical blocks. */
 	__virtio16 min_io_size;
 	/* optimal sustained I/O size in logical blocks. */
 	__virtio32 opt_io_size;
 
 	/* writeback mode (if VIRTIO_BLK_F_CONFIG_WCE) */
-	uint8_t wce;
-	uint8_t unused;
+	__u8 wce;
+	__u8 unused;
 
 	/* number of vqs, only available when VIRTIO_BLK_F_MQ is set */
 	__virtio16 num_queues;
@@ -116,10 +120,35 @@ struct virtio_blk_config {
 	 * Set if a VIRTIO_BLK_T_WRITE_ZEROES request may result in the
 	 * deallocation of one or more of the sectors.
 	 */
-	uint8_t write_zeroes_may_unmap;
+	__u8 write_zeroes_may_unmap;
 
-	uint8_t unused1[3];
-} QEMU_PACKED;
+	__u8 unused1[3];
+
+	/* the next 3 entries are guarded by VIRTIO_BLK_F_SECURE_ERASE */
+	/*
+	 * The maximum secure erase sectors (in 512-byte sectors) for
+	 * one segment.
+	 */
+	__virtio32 max_secure_erase_sectors;
+	/*
+	 * The maximum number of secure erase segments in a
+	 * secure erase command.
+	 */
+	__virtio32 max_secure_erase_seg;
+	/* Secure erase commands must be aligned to this number of sectors. */
+	__virtio32 secure_erase_sector_alignment;
+
+	/* Zoned block device characteristics (if VIRTIO_BLK_F_ZONED) */
+	struct virtio_blk_zoned_characteristics {
+		__virtio32 zone_sectors;
+		__virtio32 max_open_zones;
+		__virtio32 max_active_zones;
+		__virtio32 max_append_sectors;
+		__virtio32 write_granularity;
+		__u8 model;
+		__u8 unused2[3];
+	} zoned;
+} __attribute__((packed));
 
 /*
  * Command types
@@ -153,6 +182,30 @@ struct virtio_blk_config {
 /* Write zeroes command */
 #define VIRTIO_BLK_T_WRITE_ZEROES	13
 
+/* Secure erase command */
+#define VIRTIO_BLK_T_SECURE_ERASE	14
+
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
@@ -172,17 +225,83 @@ struct virtio_blk_outhdr {
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
+	__u8 z_type;
+	/* Zone state */
+	__u8 z_state;
+	__u8 reserved[38];
+};
+
+struct virtio_blk_zone_report {
+	__virtio64 nr_zones;
+	__u8 reserved[56];
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
 
 /* Discard/write zeroes range for each request. */
 struct virtio_blk_discard_write_zeroes {
 	/* discard/write zeroes start sector */
-	uint64_t sector;
+	__le64 sector;
 	/* number of discard/write zeroes sectors */
-	uint32_t num_sectors;
+	__le32 num_sectors;
 	/* flags for this range */
-	uint32_t flags;
+	__le32 flags;
 };
 
 #ifndef VIRTIO_BLK_NO_LEGACY
@@ -198,4 +317,11 @@ struct virtio_scsi_inhdr {
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
2.38.1


