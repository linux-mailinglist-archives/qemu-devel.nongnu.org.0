Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB82681A7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 00:20:43 +0200 (CEST)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHaMU-0008Nw-Ap
	for lists+qemu-devel@lfdr.de; Sun, 13 Sep 2020 18:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=518fa018e=dmitry.fomichev@wdc.com>)
 id 1kHaGu-0008Ai-Vm; Sun, 13 Sep 2020 18:14:57 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:42005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=518fa018e=dmitry.fomichev@wdc.com>)
 id 1kHaGs-00016w-Tv; Sun, 13 Sep 2020 18:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600035294; x=1631571294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2oLHRnibop+I5Gl3pRqjcltaMzR53KAvQqxeRCbBeqo=;
 b=INhioX0JZlFrBg/Rt1NWqFG1yBeKr7QgLHygHif4zWJXqFJ9fMtzGNPF
 xPrMIRgpxMxxT7tsVjpoq9LMCQRP8XGgBk9YS5rBNy+5GTDKhQf+TJSh2
 4Lh/onAiEEWO4EoI96ZsPCLiy4STiPW9xHIFu3/1I7cpqH9aXq3oAFUSd
 vyljHzM63LIorJk4stI920tMLat+vkuqUGxzXXq+smFqmDF5bmMDYbP6T
 A5gLypGG0B9a2cYaiHi0RAPM+iAyA+0phQkmEedL8V0YXar2Swk9RLIbq
 uIVYr9wpfEfN7oJrY8bwL6p9I3ot4rmihvQNT1LlrjMuhya82gUSplB5f g==;
IronPort-SDR: AYL2stKa677Zei+Wbdu1HCznO4z4KA7ADfNisZaCw+RWD6TQue36HpRjWrrA6FGqYQIySxu9u+
 Rg3DKU4otQxMkSKH+mBQhCcZ+b4X+fTabINnq3i8sUmxDJlTcAnjpqoOEzH2WeSxkILLm9JMdW
 W8DAmwNJUaBw1KZlG4Vj6j4dpi0HqMz9bAGF3cI057/5ygQfC5K0J2RX1kodTjhdDdqe9bfW9i
 dJJGE2Gx9Swx6fymc2kWDeKNEl2uNk+mnKDpMC+iRNPTdLiTQxsG3QUIdTKoHMrw72vMibzYrR
 Ai4=
X-IronPort-AV: E=Sophos;i="5.76,423,1592841600"; d="scan'208";a="147179051"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Sep 2020 06:14:52 +0800
IronPort-SDR: dDVleL1uzQ6j9ZQA1T0gjcGuowJOOn3hsAieDKztVFTnLsUHvKcWTFFgrkHXCBulqmyk+wkDEM
 rlhIk6JliVeA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 15:02:05 -0700
IronPort-SDR: U2Xv+q+7typw7yoO6RXiolOXEaozjTZUZTuqgk6aXXbisl5NqMVxp3P810PLFwT1cGQWlC+XJm
 lU7O8IdWJPAQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Sep 2020 15:14:51 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v3 04/15] hw/block/nvme: Introduce the Namespace Types
 definitions
Date: Mon, 14 Sep 2020 07:14:25 +0900
Message-Id: <20200913221436.22844-5-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200913221436.22844-1-dmitry.fomichev@wdc.com>
References: <20200913221436.22844-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=518fa018e=dmitry.fomichev@wdc.com; helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/13 18:14:44
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Niklas Cassel <niklas.cassel@wdc.com>

Define the structures and constants required to implement
Namespace Types support.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c      |  2 +-
 hw/block/nvme.h      |  3 ++
 include/block/nvme.h | 74 +++++++++++++++++++++++++++++++++++---------
 3 files changed, 64 insertions(+), 15 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 39c2d5b0b4..4bd88f4046 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1259,7 +1259,7 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
      * here.
      */
     ns_descrs->uuid.hdr.nidt = NVME_NIDT_UUID;
-    ns_descrs->uuid.hdr.nidl = NVME_NIDT_UUID_LEN;
+    ns_descrs->uuid.hdr.nidl = NVME_NIDL_UUID;
     stl_be_p(&ns_descrs->uuid.v, nsid);
 
     return nvme_dma_prp(n, list, NVME_IDENTIFY_DATA_SIZE, prp1, prp2,
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 190c974b6c..252e2d5921 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -64,6 +64,9 @@ typedef struct NvmeCQueue {
 
 typedef struct NvmeNamespace {
     NvmeIdNs        id_ns;
+    uint32_t        nsid;
+    uint8_t         csi;
+    QemuUUID        uuid;
 } NvmeNamespace;
 
 static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 62136a906f..f2cff5aa6b 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -51,6 +51,11 @@ enum NvmeCapMask {
     CAP_PMR_MASK       = 0x1,
 };
 
+enum NvmeCapCssBits {
+    CAP_CSS_NVM        = 0x01,
+    CAP_CSS_CSI_SUPP   = 0x40,
+};
+
 #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
 #define NVME_CAP_CQR(cap)   (((cap) >> CAP_CQR_SHIFT)    & CAP_CQR_MASK)
 #define NVME_CAP_AMS(cap)   (((cap) >> CAP_AMS_SHIFT)    & CAP_AMS_MASK)
@@ -102,6 +107,12 @@ enum NvmeCcMask {
     CC_IOCQES_MASK  = 0xf,
 };
 
+enum NvmeCcCss {
+    CSS_NVM_ONLY        = 0,
+    CSS_CSI             = 6,
+    CSS_ADMIN_ONLY      = 7,
+};
+
 #define NVME_CC_EN(cc)     ((cc >> CC_EN_SHIFT)     & CC_EN_MASK)
 #define NVME_CC_CSS(cc)    ((cc >> CC_CSS_SHIFT)    & CC_CSS_MASK)
 #define NVME_CC_MPS(cc)    ((cc >> CC_MPS_SHIFT)    & CC_MPS_MASK)
@@ -110,6 +121,21 @@ enum NvmeCcMask {
 #define NVME_CC_IOSQES(cc) ((cc >> CC_IOSQES_SHIFT) & CC_IOSQES_MASK)
 #define NVME_CC_IOCQES(cc) ((cc >> CC_IOCQES_SHIFT) & CC_IOCQES_MASK)
 
+#define NVME_SET_CC_EN(cc, val)     \
+    (cc |= (uint32_t)((val) & CC_EN_MASK) << CC_EN_SHIFT)
+#define NVME_SET_CC_CSS(cc, val)    \
+    (cc |= (uint32_t)((val) & CC_CSS_MASK) << CC_CSS_SHIFT)
+#define NVME_SET_CC_MPS(cc, val)    \
+    (cc |= (uint32_t)((val) & CC_MPS_MASK) << CC_MPS_SHIFT)
+#define NVME_SET_CC_AMS(cc, val)    \
+    (cc |= (uint32_t)((val) & CC_AMS_MASK) << CC_AMS_SHIFT)
+#define NVME_SET_CC_SHN(cc, val)    \
+    (cc |= (uint32_t)((val) & CC_SHN_MASK) << CC_SHN_SHIFT)
+#define NVME_SET_CC_IOSQES(cc, val) \
+    (cc |= (uint32_t)((val) & CC_IOSQES_MASK) << CC_IOSQES_SHIFT)
+#define NVME_SET_CC_IOCQES(cc, val) \
+    (cc |= (uint32_t)((val) & CC_IOCQES_MASK) << CC_IOCQES_SHIFT)
+
 enum NvmeCstsShift {
     CSTS_RDY_SHIFT      = 0,
     CSTS_CFS_SHIFT      = 1,
@@ -524,8 +550,13 @@ typedef struct QEMU_PACKED NvmeIdentify {
     uint64_t    rsvd2[2];
     uint64_t    prp1;
     uint64_t    prp2;
-    uint32_t    cns;
-    uint32_t    rsvd11[5];
+    uint8_t     cns;
+    uint8_t     rsvd10;
+    uint16_t    ctrlid;
+    uint16_t    nvmsetid;
+    uint8_t     rsvd11;
+    uint8_t     csi;
+    uint32_t    rsvd12[4];
 } NvmeIdentify;
 
 typedef struct QEMU_PACKED NvmeRwCmd {
@@ -647,6 +678,7 @@ enum NvmeStatusCodes {
     NVME_MD_SGL_LEN_INVALID     = 0x0010,
     NVME_SGL_DESCR_TYPE_INVALID = 0x0011,
     NVME_INVALID_USE_OF_CMB     = 0x0012,
+    NVME_CMD_SET_CMB_REJECTED   = 0x002b,
     NVME_LBA_RANGE              = 0x0080,
     NVME_CAP_EXCEEDED           = 0x0081,
     NVME_NS_NOT_READY           = 0x0082,
@@ -773,11 +805,15 @@ typedef struct QEMU_PACKED NvmePSD {
 
 #define NVME_IDENTIFY_DATA_SIZE 4096
 
-enum {
-    NVME_ID_CNS_NS             = 0x0,
-    NVME_ID_CNS_CTRL           = 0x1,
-    NVME_ID_CNS_NS_ACTIVE_LIST = 0x2,
-    NVME_ID_CNS_NS_DESCR_LIST  = 0x3,
+enum NvmeIdCns {
+    NVME_ID_CNS_NS                = 0x00,
+    NVME_ID_CNS_CTRL              = 0x01,
+    NVME_ID_CNS_NS_ACTIVE_LIST    = 0x02,
+    NVME_ID_CNS_NS_DESCR_LIST     = 0x03,
+    NVME_ID_CNS_CS_NS             = 0x05,
+    NVME_ID_CNS_CS_CTRL           = 0x06,
+    NVME_ID_CNS_CS_NS_ACTIVE_LIST = 0x07,
+    NVME_ID_CNS_IO_COMMAND_SET    = 0x1c,
 };
 
 typedef struct QEMU_PACKED NvmeIdCtrl {
@@ -924,6 +960,7 @@ enum NvmeFeatureIds {
     NVME_WRITE_ATOMICITY            = 0xa,
     NVME_ASYNCHRONOUS_EVENT_CONF    = 0xb,
     NVME_TIMESTAMP                  = 0xe,
+    NVME_COMMAND_SET_PROFILE        = 0x19,
     NVME_SOFTWARE_PROGRESS_MARKER   = 0x80,
     NVME_FID_MAX                    = 0x100,
 };
@@ -1008,18 +1045,26 @@ typedef struct QEMU_PACKED NvmeIdNsDescr {
     uint8_t rsvd2[2];
 } NvmeIdNsDescr;
 
-enum {
-    NVME_NIDT_EUI64_LEN =  8,
-    NVME_NIDT_NGUID_LEN = 16,
-    NVME_NIDT_UUID_LEN  = 16,
+enum NvmeNsIdentifierLength {
+    NVME_NIDL_EUI64             = 8,
+    NVME_NIDL_NGUID             = 16,
+    NVME_NIDL_UUID              = 16,
+    NVME_NIDL_CSI               = 1,
 };
 
 enum NvmeNsIdentifierType {
-    NVME_NIDT_EUI64 = 0x1,
-    NVME_NIDT_NGUID = 0x2,
-    NVME_NIDT_UUID  = 0x3,
+    NVME_NIDT_EUI64             = 0x01,
+    NVME_NIDT_NGUID             = 0x02,
+    NVME_NIDT_UUID              = 0x03,
+    NVME_NIDT_CSI               = 0x04,
 };
 
+enum NvmeCsi {
+    NVME_CSI_NVM                = 0x00,
+};
+
+#define NVME_SET_CSI(vec, csi) (vec |= (uint8_t)(1 << (csi)))
+
 /*Deallocate Logical Block Features*/
 #define NVME_ID_NS_DLFEAT_GUARD_CRC(dlfeat)       ((dlfeat) & 0x10)
 #define NVME_ID_NS_DLFEAT_WRITE_ZEROES(dlfeat)    ((dlfeat) & 0x08)
@@ -1070,6 +1115,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
-- 
2.21.0


