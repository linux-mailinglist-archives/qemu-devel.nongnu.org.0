Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86D571039
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:31:34 +0200 (CEST)
Received: from localhost ([::1]:42318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5gS-0006wQ-Ch
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Pu-0001KI-BI; Mon, 11 Jul 2022 22:14:26 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5Ps-000824-Eg; Mon, 11 Jul 2022 22:14:25 -0400
Received: by mail-pf1-x42c.google.com with SMTP id a15so6255170pfv.13;
 Mon, 11 Jul 2022 19:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0ag3gAZoGkVBeV73+KkTy7HnO0SGfyVP1akGZ5l3w0=;
 b=Vi8BnugVqzUywBqlu1jwi2KIENaoyfO85IAeER+hVm99TJfIhdmqNzza6qTDH0e4t+
 Q2e8yjCu5ogZfn940FuxBUzoBgqVCQx36/8dBIeRoAfgRAjkhaZfDYWHwg+eG8rrS7bb
 F1VOR6axG12d6l6HCoWX3lDcI4bmPbjTnQ2ad3OV53g3DR8rj6M3U8+CVNGYY0QnfysD
 z8jHLx5sErq7efmSl3l3tM/UGGq/Zm5a+X8d4X2ryCv8UCCVqqbF3GhcDqjKViIOMeDA
 G1RZztibsELIyIFRYKHWKE89JHHgAeqor9XtvPUWGeuOLJU9nTB27RLepk4lFYMau9f/
 wAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A0ag3gAZoGkVBeV73+KkTy7HnO0SGfyVP1akGZ5l3w0=;
 b=Nwm2lsj9cdU99NjTZL9qYRep2ngg4T56jesCUHmZ0SCuHaDKtNLShBPIMvoWzctWZz
 iX1FDdWTkH7LUhk8wyEBkzmKklDgLBZ28Y0me7v+LV/C6jzjzxl1UPxEALHVEwJDook0
 d254sFM9ZjBBzcFUX50vu/KE9JFBHeYSaq6BsaLgE0UWP2bKREYwEafyGV9MvD3+3bER
 1tri7CDxXaZOLmgoqmqb9htHDqyXOjdF7h6C11255OVZ8H1+9Z2T4l5cvhoqOPPbeNFB
 sdNA8H2pXeW6czCFGBiAYiYe2M+HLVDH1qYwLJ+f7JpOPAmkmDV0vtuET2EKtvYkMcH/
 IaxQ==
X-Gm-Message-State: AJIora/4B7yU0LlB4omhOXUm+3+VPY3XPfK1jjtv/O3x5sETHOHzWoxF
 J8lPNBllC6fTwqH7/qDrzAJgN5HxBH/0lBtK
X-Google-Smtp-Source: AGRyM1sN5t1+mweD9QOFJII5qtmfKYSKxC+KGQOlwAsMPxtwBW2aRmz3h4qAZ5EmZCibTC67lynEmg==
X-Received: by 2002:a63:5f4e:0:b0:417:ba9d:c513 with SMTP id
 t75-20020a635f4e000000b00417ba9dc513mr2329952pgb.434.1657592062587; 
 Mon, 11 Jul 2022 19:14:22 -0700 (PDT)
Received: from roots.. ([106.84.131.214]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa79736000000b00528f9597fb3sm5430251pfg.197.2022.07.11.19.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 19:14:22 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 8/9] include: add support for zoned block devices
Date: Tue, 12 Jul 2022 10:13:44 +0800
Message-Id: <20220712021345.8530-9-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42c.google.com
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

This is the virtio_blk.h header file from Dmitry's "virtio-blk: add
support for zoned block devices" patch. It introduces
virtio_blk_zoned_characteristics struct from Dmitry's virtio-blk zoned
storage spec.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 include/standard-headers/linux/virtio_blk.h | 157 ++++++++++++++++++--
 1 file changed, 141 insertions(+), 16 deletions(-)

diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standard-headers/linux/virtio_blk.h
index 2dcc90826a..f07fbe1b9b 100644
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
@@ -40,6 +40,7 @@
 #define VIRTIO_BLK_F_MQ		12	/* support more than one vq */
 #define VIRTIO_BLK_F_DISCARD	13	/* DISCARD is supported */
 #define VIRTIO_BLK_F_WRITE_ZEROES	14	/* WRITE ZEROES is supported */
+#define VIRTIO_BLK_F_ZONED		17	/* Zoned block device */
 
 /* Legacy feature bits */
 #ifndef VIRTIO_BLK_NO_LEGACY
@@ -47,8 +48,10 @@
 #define VIRTIO_BLK_F_SCSI	7	/* Supports scsi command passthru */
 #define VIRTIO_BLK_F_FLUSH	9	/* Flush command supported */
 #define VIRTIO_BLK_F_CONFIG_WCE	11	/* Writeback mode available in config */
+#ifndef __KERNEL__
 /* Old (deprecated) name for VIRTIO_BLK_F_FLUSH. */
 #define VIRTIO_BLK_F_WCE VIRTIO_BLK_F_FLUSH
+#endif
 #endif /* !VIRTIO_BLK_NO_LEGACY */
 
 #define VIRTIO_BLK_ID_BYTES	20	/* ID string length */
@@ -63,8 +66,8 @@ struct virtio_blk_config {
 	/* geometry of the device (if VIRTIO_BLK_F_GEOMETRY) */
 	struct virtio_blk_geometry {
 		__virtio16 cylinders;
-		uint8_t heads;
-		uint8_t sectors;
+		__u8 heads;
+		__u8 sectors;
 	} geometry;
 
 	/* block size of device (if VIRTIO_BLK_F_BLK_SIZE) */
@@ -72,17 +75,17 @@ struct virtio_blk_config {
 
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
@@ -116,10 +119,24 @@ struct virtio_blk_config {
 	 * Set if a VIRTIO_BLK_T_WRITE_ZEROES request may result in the
 	 * deallocation of one or more of the sectors.
 	 */
-	uint8_t write_zeroes_may_unmap;
+	__u8 write_zeroes_may_unmap;
 
-	uint8_t unused1[3];
-} QEMU_PACKED;
+	__u8 unused1[3];
+
+	/* Secure erase fields that are defined in the virtio spec */
+	__u8 sec_erase[12];
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
@@ -153,6 +170,24 @@ struct virtio_blk_config {
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
 #ifndef VIRTIO_BLK_NO_LEGACY
 /* Barrier before this op. */
 #define VIRTIO_BLK_T_BARRIER	0x80000000
@@ -172,17 +207,100 @@ struct virtio_blk_outhdr {
 	__virtio64 sector;
 };
 
+/*
+ * Supported zoned device models.
+ */
+
+/* Host-managed zoned device */
+#define VIRTIO_BLK_Z_HM        1
+/* Host-aware zoned device */
+#define VIRTIO_BLK_Z_HA        2
+
+/* ZBD Management Out ALL flag */
+#define VIRTIO_BLK_ZONED_FLAG_ALL	(1 << 0)
+
+/*
+ * Request header for zoned devices.
+ * The first three fields are identical in layout to
+ * struct virtio_blk_outhdr.
+ */
+struct virtio_blk_zoned_outhdr {
+	/* VIRTIO_BLK_T* */
+	__virtio32 type;
+	/* io priority. */
+	__virtio32 ioprio;
+	/* Sector (ie. 512 byte offset) */
+	__virtio64 sector;
+	/* Zoned request flags */
+	__virtio32 flags;
+};
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
@@ -198,4 +316,11 @@ struct virtio_scsi_inhdr {
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
2.36.1


