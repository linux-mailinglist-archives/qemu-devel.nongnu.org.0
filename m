Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319FC2FC1D5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:08:05 +0100 (CET)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yEO-0006OI-6w
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrj-0002Rz-UL; Tue, 19 Jan 2021 15:44:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrf-0002Of-MU; Tue, 19 Jan 2021 15:44:39 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JKXSxn131358; Tue, 19 Jan 2021 15:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=CNCe6wz/AFpDceHi3l0ebH43H7M7cR1vJ545z8oK0hE=;
 b=fzg9ix7GzKB/aQuwy1OQCPi9XiCstx1o7p9iaKdA9v2BczxFd7eQgZWpEaUKihayKkzW
 HDJLfFYOYbTsMCRss1TJqkpoDFgRoeEmaPTz+mMHdUnIw5ArHEZeUnd0qpwqFhBkWElx
 4w/JvG/91qrl8l0YJHqI/a/7+u6rVaw+gOK7PEPBvscCTiO/RMNIm0//UK7AZh9mGieO
 jb0ujK/lIhIgt/X2Mrnr6lkjVCJAqGFDnSmkuKAFavAwrhVFaFDM4lQVEYxv/9PzTWiQ
 JjEwMUtPWzYIeW6ow33lkG3BMg/7icvlEheaFilbI1Y+ivNkazwpHqnPp3KNYBZS9m9B KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665y31c4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:28 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10JKXd6b132086;
 Tue, 19 Jan 2021 15:44:28 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665y31c45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:28 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JKabSY008499;
 Tue, 19 Jan 2021 20:44:27 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 363qs90xdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 20:44:26 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JKiPqw16515436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:44:25 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D442136051;
 Tue, 19 Jan 2021 20:44:25 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBE26136053;
 Tue, 19 Jan 2021 20:44:23 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.56.144])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 20:44:23 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH 1/8] linux-headers: update against 5.11-rc4
Date: Tue, 19 Jan 2021 15:44:12 -0500
Message-Id: <1611089059-6468-2-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_09:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190114
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pmorel@linux.ibm.com, david@redhat.com, schnelle@linux.ibm.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Placeholder commit to pull in changes from "vfio-pci/zdev: Pass the relaxed
alignment flag" and "vfio-pci/zdev: Introduce the PCISTB vfio region"

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h        |   2 +-
 include/standard-headers/drm/drm_fourcc.h          | 175 ++++++++++++++++++++-
 include/standard-headers/linux/ethtool.h           |   2 +-
 include/standard-headers/linux/fuse.h              |  30 +++-
 include/standard-headers/linux/kernel.h            |   9 +-
 include/standard-headers/linux/pci_regs.h          |  16 ++
 include/standard-headers/linux/vhost_types.h       |   9 ++
 include/standard-headers/linux/virtio_gpu.h        |  82 ++++++++++
 include/standard-headers/linux/virtio_ids.h        |  44 +++---
 linux-headers/asm-arm64/kvm.h                      |   3 -
 linux-headers/asm-generic/unistd.h                 |   6 +-
 linux-headers/asm-mips/unistd_n32.h                |   1 +
 linux-headers/asm-mips/unistd_n64.h                |   1 +
 linux-headers/asm-mips/unistd_o32.h                |   1 +
 linux-headers/asm-powerpc/unistd_32.h              |   1 +
 linux-headers/asm-powerpc/unistd_64.h              |   1 +
 linux-headers/asm-s390/unistd_32.h                 |   1 +
 linux-headers/asm-s390/unistd_64.h                 |   1 +
 linux-headers/asm-x86/kvm.h                        |   1 +
 linux-headers/asm-x86/unistd_32.h                  |   1 +
 linux-headers/asm-x86/unistd_64.h                  |   1 +
 linux-headers/asm-x86/unistd_x32.h                 |   1 +
 linux-headers/linux/kvm.h                          |  58 ++++++-
 linux-headers/linux/userfaultfd.h                  |   9 ++
 linux-headers/linux/vfio.h                         |   5 +
 linux-headers/linux/vfio_zdev.h                    |  34 ++++
 linux-headers/linux/vhost.h                        |   4 +
 27 files changed, 458 insertions(+), 41 deletions(-)

diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h
index 0a8c7c9..1677208 100644
--- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h
+++ b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h
@@ -176,7 +176,7 @@ struct pvrdma_port_attr {
 	uint8_t			subnet_timeout;
 	uint8_t			init_type_reply;
 	uint8_t			active_width;
-	uint16_t			active_speed;
+	uint8_t			active_speed;
 	uint8_t			phys_state;
 	uint8_t			reserved[2];
 };
diff --git a/include/standard-headers/drm/drm_fourcc.h b/include/standard-headers/drm/drm_fourcc.h
index 0de1a55..c47e198 100644
--- a/include/standard-headers/drm/drm_fourcc.h
+++ b/include/standard-headers/drm/drm_fourcc.h
@@ -57,6 +57,30 @@ extern "C" {
  * may preserve meaning - such as number of planes - from the fourcc code,
  * whereas others may not.
  *
+ * Modifiers must uniquely encode buffer layout. In other words, a buffer must
+ * match only a single modifier. A modifier must not be a subset of layouts of
+ * another modifier. For instance, it's incorrect to encode pitch alignment in
+ * a modifier: a buffer may match a 64-pixel aligned modifier and a 32-pixel
+ * aligned modifier. That said, modifiers can have implicit minimal
+ * requirements.
+ *
+ * For modifiers where the combination of fourcc code and modifier can alias,
+ * a canonical pair needs to be defined and used by all drivers. Preferred
+ * combinations are also encouraged where all combinations might lead to
+ * confusion and unnecessarily reduced interoperability. An example for the
+ * latter is AFBC, where the ABGR layouts are preferred over ARGB layouts.
+ *
+ * There are two kinds of modifier users:
+ *
+ * - Kernel and user-space drivers: for drivers it's important that modifiers
+ *   don't alias, otherwise two drivers might support the same format but use
+ *   different aliases, preventing them from sharing buffers in an efficient
+ *   format.
+ * - Higher-level programs interfacing with KMS/GBM/EGL/Vulkan/etc: these users
+ *   see modifiers as opaque tokens they can check for equality and intersect.
+ *   These users musn't need to know to reason about the modifier value
+ *   (i.e. they are not expected to extract information out of the modifier).
+ *
  * Vendors should document their modifier usage in as much detail as
  * possible, to ensure maximum compatibility across devices, drivers and
  * applications.
@@ -154,6 +178,12 @@ extern "C" {
 #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
+/*
+ * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
+ * of unused padding per component:
+ */
+#define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0') /* [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian */
+
 /* packed YCbCr */
 #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
 #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
@@ -319,7 +349,6 @@ extern "C" {
  */
 
 /* Vendor Ids: */
-#define DRM_FORMAT_MOD_NONE           0
 #define DRM_FORMAT_MOD_VENDOR_NONE    0
 #define DRM_FORMAT_MOD_VENDOR_INTEL   0x01
 #define DRM_FORMAT_MOD_VENDOR_AMD     0x02
@@ -391,6 +420,16 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_LINEAR	fourcc_mod_code(NONE, 0)
 
+/*
+ * Deprecated: use DRM_FORMAT_MOD_LINEAR instead
+ *
+ * The "none" format modifier doesn't actually mean that the modifier is
+ * implicit, instead it means that the layout is linear. Whether modifiers are
+ * used is out-of-band information carried in an API-specific way (e.g. in a
+ * flag for drm_mode_fb_cmd2).
+ */
+#define DRM_FORMAT_MOD_NONE	0
+
 /* Intel framebuffer modifiers */
 
 /*
@@ -1055,6 +1094,140 @@ drm_fourcc_canonicalize_nvidia_format_mod(uint64_t modifier)
  */
 #define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)
 
+/*
+ * AMD modifiers
+ *
+ * Memory layout:
+ *
+ * without DCC:
+ *   - main surface
+ *
+ * with DCC & without DCC_RETILE:
+ *   - main surface in plane 0
+ *   - DCC surface in plane 1 (RB-aligned, pipe-aligned if DCC_PIPE_ALIGN is set)
+ *
+ * with DCC & DCC_RETILE:
+ *   - main surface in plane 0
+ *   - displayable DCC surface in plane 1 (not RB-aligned & not pipe-aligned)
+ *   - pipe-aligned DCC surface in plane 2 (RB-aligned & pipe-aligned)
+ *
+ * For multi-plane formats the above surfaces get merged into one plane for
+ * each format plane, based on the required alignment only.
+ *
+ * Bits  Parameter                Notes
+ * ----- ------------------------ ---------------------------------------------
+ *
+ *   7:0 TILE_VERSION             Values are AMD_FMT_MOD_TILE_VER_*
+ *  12:8 TILE                     Values are AMD_FMT_MOD_TILE_<version>_*
+ *    13 DCC
+ *    14 DCC_RETILE
+ *    15 DCC_PIPE_ALIGN
+ *    16 DCC_INDEPENDENT_64B
+ *    17 DCC_INDEPENDENT_128B
+ * 19:18 DCC_MAX_COMPRESSED_BLOCK Values are AMD_FMT_MOD_DCC_BLOCK_*
+ *    20 DCC_CONSTANT_ENCODE
+ * 23:21 PIPE_XOR_BITS            Only for some chips
+ * 26:24 BANK_XOR_BITS            Only for some chips
+ * 29:27 PACKERS                  Only for some chips
+ * 32:30 RB                       Only for some chips
+ * 35:33 PIPE                     Only for some chips
+ * 55:36 -                        Reserved for future use, must be zero
+ */
+#define AMD_FMT_MOD fourcc_mod_code(AMD, 0)
+
+#define IS_AMD_FMT_MOD(val) (((val) >> 56) == DRM_FORMAT_MOD_VENDOR_AMD)
+
+/* Reserve 0 for GFX8 and older */
+#define AMD_FMT_MOD_TILE_VER_GFX9 1
+#define AMD_FMT_MOD_TILE_VER_GFX10 2
+#define AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS 3
+
+/*
+ * 64K_S is the same for GFX9/GFX10/GFX10_RBPLUS and hence has GFX9 as canonical
+ * version.
+ */
+#define AMD_FMT_MOD_TILE_GFX9_64K_S 9
+
+/*
+ * 64K_D for non-32 bpp is the same for GFX9/GFX10/GFX10_RBPLUS and hence has
+ * GFX9 as canonical version.
+ */
+#define AMD_FMT_MOD_TILE_GFX9_64K_D 10
+#define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
+#define AMD_FMT_MOD_TILE_GFX9_64K_D_X 26
+#define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
+
+#define AMD_FMT_MOD_DCC_BLOCK_64B 0
+#define AMD_FMT_MOD_DCC_BLOCK_128B 1
+#define AMD_FMT_MOD_DCC_BLOCK_256B 2
+
+#define AMD_FMT_MOD_TILE_VERSION_SHIFT 0
+#define AMD_FMT_MOD_TILE_VERSION_MASK 0xFF
+#define AMD_FMT_MOD_TILE_SHIFT 8
+#define AMD_FMT_MOD_TILE_MASK 0x1F
+
+/* Whether DCC compression is enabled. */
+#define AMD_FMT_MOD_DCC_SHIFT 13
+#define AMD_FMT_MOD_DCC_MASK 0x1
+
+/*
+ * Whether to include two DCC surfaces, one which is rb & pipe aligned, and
+ * one which is not-aligned.
+ */
+#define AMD_FMT_MOD_DCC_RETILE_SHIFT 14
+#define AMD_FMT_MOD_DCC_RETILE_MASK 0x1
+
+/* Only set if DCC_RETILE = false */
+#define AMD_FMT_MOD_DCC_PIPE_ALIGN_SHIFT 15
+#define AMD_FMT_MOD_DCC_PIPE_ALIGN_MASK 0x1
+
+#define AMD_FMT_MOD_DCC_INDEPENDENT_64B_SHIFT 16
+#define AMD_FMT_MOD_DCC_INDEPENDENT_64B_MASK 0x1
+#define AMD_FMT_MOD_DCC_INDEPENDENT_128B_SHIFT 17
+#define AMD_FMT_MOD_DCC_INDEPENDENT_128B_MASK 0x1
+#define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_SHIFT 18
+#define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_MASK 0x3
+
+/*
+ * DCC supports embedding some clear colors directly in the DCC surface.
+ * However, on older GPUs the rendering HW ignores the embedded clear color
+ * and prefers the driver provided color. This necessitates doing a fastclear
+ * eliminate operation before a process transfers control.
+ *
+ * If this bit is set that means the fastclear eliminate is not needed for these
+ * embeddable colors.
+ */
+#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_SHIFT 20
+#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_MASK 0x1
+
+/*
+ * The below fields are for accounting for per GPU differences. These are only
+ * relevant for GFX9 and later and if the tile field is *_X/_T.
+ *
+ * PIPE_XOR_BITS = always needed
+ * BANK_XOR_BITS = only for TILE_VER_GFX9
+ * PACKERS = only for TILE_VER_GFX10_RBPLUS
+ * RB = only for TILE_VER_GFX9 & DCC
+ * PIPE = only for TILE_VER_GFX9 & DCC & (DCC_RETILE | DCC_PIPE_ALIGN)
+ */
+#define AMD_FMT_MOD_PIPE_XOR_BITS_SHIFT 21
+#define AMD_FMT_MOD_PIPE_XOR_BITS_MASK 0x7
+#define AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 24
+#define AMD_FMT_MOD_BANK_XOR_BITS_MASK 0x7
+#define AMD_FMT_MOD_PACKERS_SHIFT 27
+#define AMD_FMT_MOD_PACKERS_MASK 0x7
+#define AMD_FMT_MOD_RB_SHIFT 30
+#define AMD_FMT_MOD_RB_MASK 0x7
+#define AMD_FMT_MOD_PIPE_SHIFT 33
+#define AMD_FMT_MOD_PIPE_MASK 0x7
+
+#define AMD_FMT_MOD_SET(field, value) \
+	((uint64_t)(value) << AMD_FMT_MOD_##field##_SHIFT)
+#define AMD_FMT_MOD_GET(field, value) \
+	(((value) >> AMD_FMT_MOD_##field##_SHIFT) & AMD_FMT_MOD_##field##_MASK)
+#define AMD_FMT_MOD_CLEAR(field) \
+	(~((uint64_t)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/standard-headers/linux/ethtool.h b/include/standard-headers/linux/ethtool.h
index 0df22f7..8bfd01d 100644
--- a/include/standard-headers/linux/ethtool.h
+++ b/include/standard-headers/linux/ethtool.h
@@ -16,7 +16,7 @@
 
 #include "net/eth.h"
 
-#include "standard-headers/linux/kernel.h"
+#include "standard-headers/linux/const.h"
 #include "standard-headers/linux/types.h"
 #include "standard-headers/linux/if_ether.h"
 
diff --git a/include/standard-headers/linux/fuse.h b/include/standard-headers/linux/fuse.h
index 82c0a38..950d7ed 100644
--- a/include/standard-headers/linux/fuse.h
+++ b/include/standard-headers/linux/fuse.h
@@ -175,6 +175,10 @@
  *
  *  7.32
  *  - add flags to fuse_attr, add FUSE_ATTR_SUBMOUNT, add FUSE_SUBMOUNTS
+ *
+ *  7.33
+ *  - add FUSE_HANDLE_KILLPRIV_V2, FUSE_WRITE_KILL_SUIDGID, FATTR_KILL_SUIDGID
+ *  - add FUSE_OPEN_KILL_SUIDGID
  */
 
 #ifndef _LINUX_FUSE_H
@@ -206,7 +210,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 32
+#define FUSE_KERNEL_MINOR_VERSION 33
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -267,6 +271,7 @@ struct fuse_file_lock {
 #define FATTR_MTIME_NOW	(1 << 8)
 #define FATTR_LOCKOWNER	(1 << 9)
 #define FATTR_CTIME	(1 << 10)
+#define FATTR_KILL_SUIDGID	(1 << 11)
 
 /**
  * Flags returned by the OPEN request
@@ -316,6 +321,11 @@ struct fuse_file_lock {
  *		       foffset and moffset fields in struct
  *		       fuse_setupmapping_out and fuse_removemapping_one.
  * FUSE_SUBMOUNTS: kernel supports auto-mounting directory submounts
+ * FUSE_HANDLE_KILLPRIV_V2: fs kills suid/sgid/cap on write/chown/trunc.
+ *			Upon write/truncate suid/sgid is only killed if caller
+ *			does not have CAP_FSETID. Additionally upon
+ *			write/truncate sgid is killed only if file has group
+ *			execute permission. (Same as Linux VFS behavior).
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -345,6 +355,7 @@ struct fuse_file_lock {
 #define FUSE_EXPLICIT_INVAL_DATA (1 << 25)
 #define FUSE_MAP_ALIGNMENT	(1 << 26)
 #define FUSE_SUBMOUNTS		(1 << 27)
+#define FUSE_HANDLE_KILLPRIV_V2	(1 << 28)
 
 /**
  * CUSE INIT request/reply flags
@@ -374,11 +385,14 @@ struct fuse_file_lock {
  *
  * FUSE_WRITE_CACHE: delayed write from page cache, file handle is guessed
  * FUSE_WRITE_LOCKOWNER: lock_owner field is valid
- * FUSE_WRITE_KILL_PRIV: kill suid and sgid bits
+ * FUSE_WRITE_KILL_SUIDGID: kill suid and sgid bits
  */
 #define FUSE_WRITE_CACHE	(1 << 0)
 #define FUSE_WRITE_LOCKOWNER	(1 << 1)
-#define FUSE_WRITE_KILL_PRIV	(1 << 2)
+#define FUSE_WRITE_KILL_SUIDGID (1 << 2)
+
+/* Obsolete alias; this flag implies killing suid/sgid only. */
+#define FUSE_WRITE_KILL_PRIV	FUSE_WRITE_KILL_SUIDGID
 
 /**
  * Read flags
@@ -427,6 +441,12 @@ struct fuse_file_lock {
  */
 #define FUSE_ATTR_SUBMOUNT      (1 << 0)
 
+/**
+ * Open flags
+ * FUSE_OPEN_KILL_SUIDGID: Kill suid and sgid if executable
+ */
+#define FUSE_OPEN_KILL_SUIDGID	(1 << 0)
+
 enum fuse_opcode {
 	FUSE_LOOKUP		= 1,
 	FUSE_FORGET		= 2,  /* no reply */
@@ -588,14 +608,14 @@ struct fuse_setattr_in {
 
 struct fuse_open_in {
 	uint32_t	flags;
-	uint32_t	unused;
+	uint32_t	open_flags;	/* FUSE_OPEN_... */
 };
 
 struct fuse_create_in {
 	uint32_t	flags;
 	uint32_t	mode;
 	uint32_t	umask;
-	uint32_t	padding;
+	uint32_t	open_flags;	/* FUSE_OPEN_... */
 };
 
 struct fuse_open_out {
diff --git a/include/standard-headers/linux/kernel.h b/include/standard-headers/linux/kernel.h
index 1eeba2e..7848c5a 100644
--- a/include/standard-headers/linux/kernel.h
+++ b/include/standard-headers/linux/kernel.h
@@ -3,13 +3,6 @@
 #define _LINUX_KERNEL_H
 
 #include "standard-headers/linux/sysinfo.h"
-
-/*
- * 'kernel.h' contains some often-used function prototypes etc
- */
-#define __ALIGN_KERNEL(x, a)		__ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
-#define __ALIGN_KERNEL_MASK(x, mask)	(((x) + (mask)) & ~(mask))
-
-#define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
+#include "standard-headers/linux/const.h"
 
 #endif /* _LINUX_KERNEL_H */
diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard-headers/linux/pci_regs.h
index a95d55f..e709ae8 100644
--- a/include/standard-headers/linux/pci_regs.h
+++ b/include/standard-headers/linux/pci_regs.h
@@ -531,6 +531,7 @@
 #define  PCI_EXP_LNKCAP_SLS_8_0GB 0x00000003 /* LNKCAP2 SLS Vector bit 2 */
 #define  PCI_EXP_LNKCAP_SLS_16_0GB 0x00000004 /* LNKCAP2 SLS Vector bit 3 */
 #define  PCI_EXP_LNKCAP_SLS_32_0GB 0x00000005 /* LNKCAP2 SLS Vector bit 4 */
+#define  PCI_EXP_LNKCAP_SLS_64_0GB 0x00000006 /* LNKCAP2 SLS Vector bit 5 */
 #define  PCI_EXP_LNKCAP_MLW	0x000003f0 /* Maximum Link Width */
 #define  PCI_EXP_LNKCAP_ASPMS	0x00000c00 /* ASPM Support */
 #define  PCI_EXP_LNKCAP_ASPM_L0S 0x00000400 /* ASPM L0s Support */
@@ -562,6 +563,7 @@
 #define  PCI_EXP_LNKSTA_CLS_8_0GB 0x0003 /* Current Link Speed 8.0GT/s */
 #define  PCI_EXP_LNKSTA_CLS_16_0GB 0x0004 /* Current Link Speed 16.0GT/s */
 #define  PCI_EXP_LNKSTA_CLS_32_0GB 0x0005 /* Current Link Speed 32.0GT/s */
+#define  PCI_EXP_LNKSTA_CLS_64_0GB 0x0006 /* Current Link Speed 64.0GT/s */
 #define  PCI_EXP_LNKSTA_NLW	0x03f0	/* Negotiated Link Width */
 #define  PCI_EXP_LNKSTA_NLW_X1	0x0010	/* Current Link Width x1 */
 #define  PCI_EXP_LNKSTA_NLW_X2	0x0020	/* Current Link Width x2 */
@@ -670,6 +672,7 @@
 #define  PCI_EXP_LNKCAP2_SLS_8_0GB	0x00000008 /* Supported Speed 8GT/s */
 #define  PCI_EXP_LNKCAP2_SLS_16_0GB	0x00000010 /* Supported Speed 16GT/s */
 #define  PCI_EXP_LNKCAP2_SLS_32_0GB	0x00000020 /* Supported Speed 32GT/s */
+#define  PCI_EXP_LNKCAP2_SLS_64_0GB	0x00000040 /* Supported Speed 64GT/s */
 #define  PCI_EXP_LNKCAP2_CROSSLINK	0x00000100 /* Crosslink supported */
 #define PCI_EXP_LNKCTL2		48	/* Link Control 2 */
 #define  PCI_EXP_LNKCTL2_TLS		0x000f
@@ -678,6 +681,7 @@
 #define  PCI_EXP_LNKCTL2_TLS_8_0GT	0x0003 /* Supported Speed 8GT/s */
 #define  PCI_EXP_LNKCTL2_TLS_16_0GT	0x0004 /* Supported Speed 16GT/s */
 #define  PCI_EXP_LNKCTL2_TLS_32_0GT	0x0005 /* Supported Speed 32GT/s */
+#define  PCI_EXP_LNKCTL2_TLS_64_0GT	0x0006 /* Supported Speed 64GT/s */
 #define  PCI_EXP_LNKCTL2_ENTER_COMP	0x0010 /* Enter Compliance */
 #define  PCI_EXP_LNKCTL2_TX_MARGIN	0x0380 /* Transmit Margin */
 #define  PCI_EXP_LNKCTL2_HASD		0x0020 /* HW Autonomous Speed Disable */
@@ -723,6 +727,7 @@
 #define PCI_EXT_CAP_ID_DPC	0x1D	/* Downstream Port Containment */
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
+#define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_16GT
@@ -831,6 +836,13 @@
 #define  PCI_PWR_CAP_BUDGET(x)	((x) & 1)	/* Included in system budget */
 #define PCI_EXT_CAP_PWR_SIZEOF	16
 
+/* Root Complex Event Collector Endpoint Association  */
+#define PCI_RCEC_RCIEP_BITMAP	4	/* Associated Bitmap for RCiEPs */
+#define PCI_RCEC_BUSN		8	/* RCEC Associated Bus Numbers */
+#define  PCI_RCEC_BUSN_REG_VER	0x02	/* Least version with BUSN present */
+#define  PCI_RCEC_BUSN_NEXT(x)	(((x) >> 8) & 0xff)
+#define  PCI_RCEC_BUSN_LAST(x)	(((x) >> 16) & 0xff)
+
 /* Vendor-Specific (VSEC, PCI_EXT_CAP_ID_VNDR) */
 #define PCI_VNDR_HEADER		4	/* Vendor-Specific Header */
 #define  PCI_VNDR_HEADER_ID(x)	((x) & 0xffff)
@@ -1066,6 +1078,10 @@
 #define  PCI_L1SS_CTL1_LTR_L12_TH_SCALE	0xe0000000  /* LTR_L1.2_THRESHOLD_Scale */
 #define PCI_L1SS_CTL2		0x0c	/* Control 2 Register */
 
+/* Designated Vendor-Specific (DVSEC, PCI_EXT_CAP_ID_DVSEC) */
+#define PCI_DVSEC_HEADER1		0x4 /* Designated Vendor-Specific Header1 */
+#define PCI_DVSEC_HEADER2		0x8 /* Designated Vendor-Specific Header2 */
+
 /* Data Link Feature */
 #define PCI_DLF_CAP		0x04	/* Capabilities Register */
 #define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
diff --git a/include/standard-headers/linux/vhost_types.h b/include/standard-headers/linux/vhost_types.h
index 486630b..0bd2684 100644
--- a/include/standard-headers/linux/vhost_types.h
+++ b/include/standard-headers/linux/vhost_types.h
@@ -138,6 +138,15 @@ struct vhost_vdpa_config {
 	uint8_t buf[0];
 };
 
+/* vhost vdpa IOVA range
+ * @first: First address that can be mapped by vhost-vDPA
+ * @last: Last address that can be mapped by vhost-vDPA
+ */
+struct vhost_vdpa_iova_range {
+	uint64_t first;
+	uint64_t last;
+};
+
 /* Feature bits */
 /* Log all write descriptors. Can be changed while device is active. */
 #define VHOST_F_LOG_ALL 26
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index 4183cdc..1357e47 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -55,6 +55,11 @@
  */
 #define VIRTIO_GPU_F_RESOURCE_UUID       2
 
+/*
+ * VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB
+ */
+#define VIRTIO_GPU_F_RESOURCE_BLOB       3
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -71,6 +76,8 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_GET_CAPSET,
 	VIRTIO_GPU_CMD_GET_EDID,
 	VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
+	VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
+	VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
 
 	/* 3d commands */
 	VIRTIO_GPU_CMD_CTX_CREATE = 0x0200,
@@ -81,6 +88,8 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D,
 	VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D,
 	VIRTIO_GPU_CMD_SUBMIT_3D,
+	VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
+	VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
 
 	/* cursor commands */
 	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
@@ -93,6 +102,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_CAPSET,
 	VIRTIO_GPU_RESP_OK_EDID,
 	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
+	VIRTIO_GPU_RESP_OK_MAP_INFO,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -103,6 +113,15 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER,
 };
 
+enum virtio_gpu_shm_id {
+	VIRTIO_GPU_SHM_ID_UNDEFINED = 0,
+	/*
+	 * VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB
+	 * VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB
+	 */
+	VIRTIO_GPU_SHM_ID_HOST_VISIBLE = 1
+};
+
 #define VIRTIO_GPU_FLAG_FENCE (1 << 0)
 
 struct virtio_gpu_ctrl_hdr {
@@ -359,4 +378,67 @@ struct virtio_gpu_resp_resource_uuid {
 	uint8_t uuid[16];
 };
 
+/* VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB */
+struct virtio_gpu_resource_create_blob {
+	struct virtio_gpu_ctrl_hdr hdr;
+	uint32_t resource_id;
+#define VIRTIO_GPU_BLOB_MEM_GUEST             0x0001
+#define VIRTIO_GPU_BLOB_MEM_HOST3D            0x0002
+#define VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST      0x0003
+
+#define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
+#define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
+#define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+	/* zero is invalid blob mem */
+	uint32_t blob_mem;
+	uint32_t blob_flags;
+	uint32_t nr_entries;
+	uint64_t blob_id;
+	uint64_t size;
+	/*
+	 * sizeof(nr_entries * virtio_gpu_mem_entry) bytes follow
+	 */
+};
+
+/* VIRTIO_GPU_CMD_SET_SCANOUT_BLOB */
+struct virtio_gpu_set_scanout_blob {
+	struct virtio_gpu_ctrl_hdr hdr;
+	struct virtio_gpu_rect r;
+	uint32_t scanout_id;
+	uint32_t resource_id;
+	uint32_t width;
+	uint32_t height;
+	uint32_t format;
+	uint32_t padding;
+	uint32_t strides[4];
+	uint32_t offsets[4];
+};
+
+/* VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB */
+struct virtio_gpu_resource_map_blob {
+	struct virtio_gpu_ctrl_hdr hdr;
+	uint32_t resource_id;
+	uint32_t padding;
+	uint64_t offset;
+};
+
+/* VIRTIO_GPU_RESP_OK_MAP_INFO */
+#define VIRTIO_GPU_MAP_CACHE_MASK     0x0f
+#define VIRTIO_GPU_MAP_CACHE_NONE     0x00
+#define VIRTIO_GPU_MAP_CACHE_CACHED   0x01
+#define VIRTIO_GPU_MAP_CACHE_UNCACHED 0x02
+#define VIRTIO_GPU_MAP_CACHE_WC       0x03
+struct virtio_gpu_resp_map_info {
+	struct virtio_gpu_ctrl_hdr hdr;
+	uint32_t map_info;
+	uint32_t padding;
+};
+
+/* VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB */
+struct virtio_gpu_resource_unmap_blob {
+	struct virtio_gpu_ctrl_hdr hdr;
+	uint32_t resource_id;
+	uint32_t padding;
+};
+
 #endif
diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index b052355..bc1c062 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -29,24 +29,30 @@
  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  * SUCH DAMAGE. */
 
-#define VIRTIO_ID_NET		1 /* virtio net */
-#define VIRTIO_ID_BLOCK		2 /* virtio block */
-#define VIRTIO_ID_CONSOLE	3 /* virtio console */
-#define VIRTIO_ID_RNG		4 /* virtio rng */
-#define VIRTIO_ID_BALLOON	5 /* virtio balloon */
-#define VIRTIO_ID_RPMSG		7 /* virtio remote processor messaging */
-#define VIRTIO_ID_SCSI		8 /* virtio scsi */
-#define VIRTIO_ID_9P		9 /* 9p virtio console */
-#define VIRTIO_ID_RPROC_SERIAL 11 /* virtio remoteproc serial link */
-#define VIRTIO_ID_CAIF	       12 /* Virtio caif */
-#define VIRTIO_ID_GPU          16 /* virtio GPU */
-#define VIRTIO_ID_INPUT        18 /* virtio input */
-#define VIRTIO_ID_VSOCK        19 /* virtio vsock transport */
-#define VIRTIO_ID_CRYPTO       20 /* virtio crypto */
-#define VIRTIO_ID_IOMMU        23 /* virtio IOMMU */
-#define VIRTIO_ID_MEM          24 /* virtio mem */
-#define VIRTIO_ID_FS           26 /* virtio filesystem */
-#define VIRTIO_ID_PMEM         27 /* virtio pmem */
-#define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_NET			1 /* virtio net */
+#define VIRTIO_ID_BLOCK			2 /* virtio block */
+#define VIRTIO_ID_CONSOLE		3 /* virtio console */
+#define VIRTIO_ID_RNG			4 /* virtio rng */
+#define VIRTIO_ID_BALLOON		5 /* virtio balloon */
+#define VIRTIO_ID_IOMEM			6 /* virtio ioMemory */
+#define VIRTIO_ID_RPMSG			7 /* virtio remote processor messaging */
+#define VIRTIO_ID_SCSI			8 /* virtio scsi */
+#define VIRTIO_ID_9P			9 /* 9p virtio console */
+#define VIRTIO_ID_MAC80211_WLAN		10 /* virtio WLAN MAC */
+#define VIRTIO_ID_RPROC_SERIAL		11 /* virtio remoteproc serial link */
+#define VIRTIO_ID_CAIF			12 /* Virtio caif */
+#define VIRTIO_ID_MEMORY_BALLOON	13 /* virtio memory balloon */
+#define VIRTIO_ID_GPU			16 /* virtio GPU */
+#define VIRTIO_ID_CLOCK			17 /* virtio clock/timer */
+#define VIRTIO_ID_INPUT			18 /* virtio input */
+#define VIRTIO_ID_VSOCK			19 /* virtio vsock transport */
+#define VIRTIO_ID_CRYPTO		20 /* virtio crypto */
+#define VIRTIO_ID_SIGNAL_DIST		21 /* virtio signal distribution device */
+#define VIRTIO_ID_PSTORE		22 /* virtio pstore device */
+#define VIRTIO_ID_IOMMU			23 /* virtio IOMMU */
+#define VIRTIO_ID_MEM			24 /* virtio mem */
+#define VIRTIO_ID_FS			26 /* virtio filesystem */
+#define VIRTIO_ID_PMEM			27 /* virtio pmem */
+#define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index a72de1a..b6a0eaa 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -156,9 +156,6 @@ struct kvm_sync_regs {
 	__u64 device_irq_level;
 };
 
-struct kvm_arch_memory_slot {
-};
-
 /*
  * PMU filter structure. Describe a range of events with a particular
  * action. To be used with KVM_ARM_VCPU_PMU_V3_FILTER.
diff --git a/linux-headers/asm-generic/unistd.h b/linux-headers/asm-generic/unistd.h
index 2056318..7287529 100644
--- a/linux-headers/asm-generic/unistd.h
+++ b/linux-headers/asm-generic/unistd.h
@@ -517,7 +517,7 @@ __SC_COMP(__NR_settimeofday, sys_settimeofday, compat_sys_settimeofday)
 __SC_3264(__NR_adjtimex, sys_adjtimex_time32, sys_adjtimex)
 #endif
 
-/* kernel/timer.c */
+/* kernel/sys.c */
 #define __NR_getpid 172
 __SYSCALL(__NR_getpid, sys_getpid)
 #define __NR_getppid 173
@@ -859,9 +859,11 @@ __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
 __SYSCALL(__NR_faccessat2, sys_faccessat2)
 #define __NR_process_madvise 440
 __SYSCALL(__NR_process_madvise, sys_process_madvise)
+#define __NR_epoll_pwait2 441
+__SC_COMP(__NR_epoll_pwait2, sys_epoll_pwait2, compat_sys_epoll_pwait2)
 
 #undef __NR_syscalls
-#define __NR_syscalls 441
+#define __NR_syscalls 442
 
 /*
  * 32 bit systems traditionally used different
diff --git a/linux-headers/asm-mips/unistd_n32.h b/linux-headers/asm-mips/unistd_n32.h
index aba284d..59e53b6 100644
--- a/linux-headers/asm-mips/unistd_n32.h
+++ b/linux-headers/asm-mips/unistd_n32.h
@@ -370,6 +370,7 @@
 #define __NR_pidfd_getfd	(__NR_Linux + 438)
 #define __NR_faccessat2	(__NR_Linux + 439)
 #define __NR_process_madvise	(__NR_Linux + 440)
+#define __NR_epoll_pwait2	(__NR_Linux + 441)
 
 
 #endif /* _ASM_MIPS_UNISTD_N32_H */
diff --git a/linux-headers/asm-mips/unistd_n64.h b/linux-headers/asm-mips/unistd_n64.h
index 0465ab9..683558a 100644
--- a/linux-headers/asm-mips/unistd_n64.h
+++ b/linux-headers/asm-mips/unistd_n64.h
@@ -346,6 +346,7 @@
 #define __NR_pidfd_getfd	(__NR_Linux + 438)
 #define __NR_faccessat2	(__NR_Linux + 439)
 #define __NR_process_madvise	(__NR_Linux + 440)
+#define __NR_epoll_pwait2	(__NR_Linux + 441)
 
 
 #endif /* _ASM_MIPS_UNISTD_N64_H */
diff --git a/linux-headers/asm-mips/unistd_o32.h b/linux-headers/asm-mips/unistd_o32.h
index 5222a0d..ca6a7e5 100644
--- a/linux-headers/asm-mips/unistd_o32.h
+++ b/linux-headers/asm-mips/unistd_o32.h
@@ -416,6 +416,7 @@
 #define __NR_pidfd_getfd	(__NR_Linux + 438)
 #define __NR_faccessat2	(__NR_Linux + 439)
 #define __NR_process_madvise	(__NR_Linux + 440)
+#define __NR_epoll_pwait2	(__NR_Linux + 441)
 
 
 #endif /* _ASM_MIPS_UNISTD_O32_H */
diff --git a/linux-headers/asm-powerpc/unistd_32.h b/linux-headers/asm-powerpc/unistd_32.h
index 21066a3..4624c90 100644
--- a/linux-headers/asm-powerpc/unistd_32.h
+++ b/linux-headers/asm-powerpc/unistd_32.h
@@ -423,6 +423,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2	439
 #define __NR_process_madvise	440
+#define __NR_epoll_pwait2	441
 
 
 #endif /* _ASM_POWERPC_UNISTD_32_H */
diff --git a/linux-headers/asm-powerpc/unistd_64.h b/linux-headers/asm-powerpc/unistd_64.h
index c153da2..7e851b3 100644
--- a/linux-headers/asm-powerpc/unistd_64.h
+++ b/linux-headers/asm-powerpc/unistd_64.h
@@ -395,6 +395,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2	439
 #define __NR_process_madvise	440
+#define __NR_epoll_pwait2	441
 
 
 #endif /* _ASM_POWERPC_UNISTD_64_H */
diff --git a/linux-headers/asm-s390/unistd_32.h b/linux-headers/asm-s390/unistd_32.h
index 3b4f2dd..c94d2c3 100644
--- a/linux-headers/asm-s390/unistd_32.h
+++ b/linux-headers/asm-s390/unistd_32.h
@@ -413,5 +413,6 @@
 #define __NR_pidfd_getfd 438
 #define __NR_faccessat2 439
 #define __NR_process_madvise 440
+#define __NR_epoll_pwait2 441
 
 #endif /* _ASM_S390_UNISTD_32_H */
diff --git a/linux-headers/asm-s390/unistd_64.h b/linux-headers/asm-s390/unistd_64.h
index 030a51f..984a06b 100644
--- a/linux-headers/asm-s390/unistd_64.h
+++ b/linux-headers/asm-s390/unistd_64.h
@@ -361,5 +361,6 @@
 #define __NR_pidfd_getfd 438
 #define __NR_faccessat2 439
 #define __NR_process_madvise 440
+#define __NR_epoll_pwait2 441
 
 #endif /* _ASM_S390_UNISTD_64_H */
diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 89e5f3d..8e76d37 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -12,6 +12,7 @@
 
 #define KVM_PIO_PAGE_OFFSET 1
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 2
+#define KVM_DIRTY_LOG_PAGE_OFFSET 64
 
 #define DE_VECTOR 0
 #define DB_VECTOR 1
diff --git a/linux-headers/asm-x86/unistd_32.h b/linux-headers/asm-x86/unistd_32.h
index cfba368..18fb99d 100644
--- a/linux-headers/asm-x86/unistd_32.h
+++ b/linux-headers/asm-x86/unistd_32.h
@@ -431,6 +431,7 @@
 #define __NR_pidfd_getfd 438
 #define __NR_faccessat2 439
 #define __NR_process_madvise 440
+#define __NR_epoll_pwait2 441
 
 
 #endif /* _ASM_X86_UNISTD_32_H */
diff --git a/linux-headers/asm-x86/unistd_64.h b/linux-headers/asm-x86/unistd_64.h
index 61af725..bde9593 100644
--- a/linux-headers/asm-x86/unistd_64.h
+++ b/linux-headers/asm-x86/unistd_64.h
@@ -353,6 +353,7 @@
 #define __NR_pidfd_getfd 438
 #define __NR_faccessat2 439
 #define __NR_process_madvise 440
+#define __NR_epoll_pwait2 441
 
 
 #endif /* _ASM_X86_UNISTD_64_H */
diff --git a/linux-headers/asm-x86/unistd_x32.h b/linux-headers/asm-x86/unistd_x32.h
index a6890cb..4ff6b17 100644
--- a/linux-headers/asm-x86/unistd_x32.h
+++ b/linux-headers/asm-x86/unistd_x32.h
@@ -306,6 +306,7 @@
 #define __NR_pidfd_getfd (__X32_SYSCALL_BIT + 438)
 #define __NR_faccessat2 (__X32_SYSCALL_BIT + 439)
 #define __NR_process_madvise (__X32_SYSCALL_BIT + 440)
+#define __NR_epoll_pwait2 (__X32_SYSCALL_BIT + 441)
 #define __NR_rt_sigaction (__X32_SYSCALL_BIT + 512)
 #define __NR_rt_sigreturn (__X32_SYSCALL_BIT + 513)
 #define __NR_ioctl (__X32_SYSCALL_BIT + 514)
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 56ce14a..220db26 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -250,6 +250,8 @@ struct kvm_hyperv_exit {
 #define KVM_EXIT_ARM_NISV         28
 #define KVM_EXIT_X86_RDMSR        29
 #define KVM_EXIT_X86_WRMSR        30
+#define KVM_EXIT_DIRTY_RING_FULL  31
+#define KVM_EXIT_AP_RESET_HOLD    32
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -572,6 +574,7 @@ struct kvm_vapic_addr {
 #define KVM_MP_STATE_CHECK_STOP        6
 #define KVM_MP_STATE_OPERATING         7
 #define KVM_MP_STATE_LOAD              8
+#define KVM_MP_STATE_AP_RESET_HOLD     9
 
 struct kvm_mp_state {
 	__u32 mp_state;
@@ -1053,6 +1056,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_X86_USER_SPACE_MSR 188
 #define KVM_CAP_X86_MSR_FILTER 189
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
+#define KVM_CAP_SYS_HYPERV_CPUID 191
+#define KVM_CAP_DIRTY_LOG_RING 192
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1511,7 +1516,7 @@ struct kvm_enc_region {
 /* Available with KVM_CAP_MANUAL_DIRTY_LOG_PROTECT_2 */
 #define KVM_CLEAR_DIRTY_LOG          _IOWR(KVMIO, 0xc0, struct kvm_clear_dirty_log)
 
-/* Available with KVM_CAP_HYPERV_CPUID */
+/* Available with KVM_CAP_HYPERV_CPUID (vcpu) / KVM_CAP_SYS_HYPERV_CPUID (system) */
 #define KVM_GET_SUPPORTED_HV_CPUID _IOWR(KVMIO, 0xc1, struct kvm_cpuid2)
 
 /* Available with KVM_CAP_ARM_SVE */
@@ -1557,6 +1562,9 @@ struct kvm_pv_cmd {
 /* Available with KVM_CAP_X86_MSR_FILTER */
 #define KVM_X86_SET_MSR_FILTER	_IOW(KVMIO,  0xc6, struct kvm_msr_filter)
 
+/* Available with KVM_CAP_DIRTY_LOG_RING */
+#define KVM_RESET_DIRTY_RINGS		_IO(KVMIO, 0xc7)
+
 /* Secure Encrypted Virtualization command */
 enum sev_cmd_id {
 	/* Guest initialization commands */
@@ -1710,4 +1718,52 @@ struct kvm_hyperv_eventfd {
 #define KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE    (1 << 0)
 #define KVM_DIRTY_LOG_INITIALLY_SET            (1 << 1)
 
+/*
+ * Arch needs to define the macro after implementing the dirty ring
+ * feature.  KVM_DIRTY_LOG_PAGE_OFFSET should be defined as the
+ * starting page offset of the dirty ring structures.
+ */
+#ifndef KVM_DIRTY_LOG_PAGE_OFFSET
+#define KVM_DIRTY_LOG_PAGE_OFFSET 0
+#endif
+
+/*
+ * KVM dirty GFN flags, defined as:
+ *
+ * |---------------+---------------+--------------|
+ * | bit 1 (reset) | bit 0 (dirty) | Status       |
+ * |---------------+---------------+--------------|
+ * |             0 |             0 | Invalid GFN  |
+ * |             0 |             1 | Dirty GFN    |
+ * |             1 |             X | GFN to reset |
+ * |---------------+---------------+--------------|
+ *
+ * Lifecycle of a dirty GFN goes like:
+ *
+ *      dirtied         harvested        reset
+ * 00 -----------> 01 -------------> 1X -------+
+ *  ^                                          |
+ *  |                                          |
+ *  +------------------------------------------+
+ *
+ * The userspace program is only responsible for the 01->1X state
+ * conversion after harvesting an entry.  Also, it must not skip any
+ * dirty bits, so that dirty bits are always harvested in sequence.
+ */
+#define KVM_DIRTY_GFN_F_DIRTY           BIT(0)
+#define KVM_DIRTY_GFN_F_RESET           BIT(1)
+#define KVM_DIRTY_GFN_F_MASK            0x3
+
+/*
+ * KVM dirty rings should be mapped at KVM_DIRTY_LOG_PAGE_OFFSET of
+ * per-vcpu mmaped regions as an array of struct kvm_dirty_gfn.  The
+ * size of the gfn buffer is decided by the first argument when
+ * enabling KVM_CAP_DIRTY_LOG_RING.
+ */
+struct kvm_dirty_gfn {
+	__u32 flags;
+	__u32 slot;
+	__u64 offset;
+};
+
 #endif /* __LINUX_KVM_H */
diff --git a/linux-headers/linux/userfaultfd.h b/linux-headers/linux/userfaultfd.h
index 8d3996e..1ba9a9f 100644
--- a/linux-headers/linux/userfaultfd.h
+++ b/linux-headers/linux/userfaultfd.h
@@ -257,4 +257,13 @@ struct uffdio_writeprotect {
 	__u64 mode;
 };
 
+/*
+ * Flags for the userfaultfd(2) system call itself.
+ */
+
+/*
+ * Create a userfaultfd that can handle page faults only in user mode.
+ */
+#define UFFD_USER_MODE_ONLY 1
+
 #endif /* _LINUX_USERFAULTFD_H */
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index b92dcc4..f14e46c 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -338,6 +338,10 @@ struct vfio_region_info_cap_type {
  * to do TLB invalidation on a GPU.
  */
 #define VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD	(1)
+/*
+ * IBM zPCI I/O region
+ */
+#define VFIO_REGION_SUBTYPE_IBM_ZPCI_IO		(2)
 
 /* sub-types for VFIO_REGION_TYPE_GFX */
 #define VFIO_REGION_SUBTYPE_GFX_EDID            (1)
@@ -820,6 +824,7 @@ enum {
 enum {
 	VFIO_CCW_IO_IRQ_INDEX,
 	VFIO_CCW_CRW_IRQ_INDEX,
+	VFIO_CCW_REQ_IRQ_INDEX,
 	VFIO_CCW_NUM_IRQS
 };
 
diff --git a/linux-headers/linux/vfio_zdev.h b/linux-headers/linux/vfio_zdev.h
index b430939..830acca 100644
--- a/linux-headers/linux/vfio_zdev.h
+++ b/linux-headers/linux/vfio_zdev.h
@@ -43,6 +43,7 @@ struct vfio_device_info_cap_zpci_group {
 	__u64 msi_addr;		/* MSI address */
 	__u64 flags;
 #define VFIO_DEVICE_INFO_ZPCI_FLAG_REFRESH 1 /* Program-specified TLB refresh */
+#define VFIO_DEVICE_INFO_ZPCI_FLAG_RELAXED 2 /* Relaxed Length and Alignment */
 	__u16 mui;		/* Measurement Block Update Interval */
 	__u16 noi;		/* Maximum number of MSIs */
 	__u16 maxstbl;		/* Maximum Store Block Length */
@@ -75,4 +76,37 @@ struct vfio_device_info_cap_zpci_pfip {
 	__u8 pfip[];
 };
 
+/**
+ * VFIO_REGION_SUBTYPE_IBM_ZPCI_IO - VFIO zPCI PCI Direct I/O Region
+ *
+ * This region is used to transfer I/O operations from the guest directly
+ * to the host zPCI I/O layer.  The same instruction requested by the guest
+ * (e.g. PCISTB) will always be used, even if the MIO variant is available.
+ *
+ * The _hdr area is user-readable and is used to provide setup information.
+ * The _req area is user-writable and is used to provide the I/O operation.
+ */
+struct vfio_zpci_io_hdr {
+	__u64 flags;
+	__u16 max;		/* Max block operation size allowed */
+	__u16 reserved;
+	__u32 reserved2;
+};
+
+struct vfio_zpci_io_req {
+	__u64 flags;
+#define VFIO_ZPCI_IO_FLAG_READ (1 << 0) /* Read Operation Specified */
+#define VFIO_ZPCI_IO_FLAG_BLOCKW (1 << 1) /* Block Write Operation Specified */
+	__u64 gaddr;		/* Address of guest data */
+	__u64 offset;		/* Offset into target PCI Address Space */
+	__u32 reserved;
+	__u16 len;		/* Length of guest operation */
+	__u8 pcias;		/* Target PCI Address Space */
+	__u8 reserved2;
+};
+
+struct vfio_region_zpci_io {
+	struct vfio_zpci_io_hdr hdr;
+	struct vfio_zpci_io_req req;
+};
 #endif
diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index 7523218..c998860 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -146,4 +146,8 @@
 
 /* Set event fd for config interrupt*/
 #define VHOST_VDPA_SET_CONFIG_CALL	_IOW(VHOST_VIRTIO, 0x77, int)
+
+/* Get the valid iova range */
+#define VHOST_VDPA_GET_IOVA_RANGE	_IOR(VHOST_VIRTIO, 0x78, \
+					     struct vhost_vdpa_iova_range)
 #endif
-- 
1.8.3.1


