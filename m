Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C7E4DDAF2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:52:15 +0100 (CET)
Received: from localhost ([::1]:33154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVD1b-0003T8-1W
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:52:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCf0-00085W-Js; Fri, 18 Mar 2022 09:28:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCex-00031w-Ol; Fri, 18 Mar 2022 09:28:54 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICntMJ003690; 
 Fri, 18 Mar 2022 13:28:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2s54bnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:45 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22IDNg4X010980;
 Fri, 18 Mar 2022 13:28:45 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2s54bmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:45 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDP3ke015317;
 Fri, 18 Mar 2022 13:28:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3euc6r544h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:42 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IDSevd42074600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:28:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A4104203F;
 Fri, 18 Mar 2022 13:28:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEE7542045;
 Fri, 18 Mar 2022 13:28:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Mar 2022 13:28:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.169])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 12308220338;
 Fri, 18 Mar 2022 14:28:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 11/17] hw/sd: Add eMMC support
Date: Fri, 18 Mar 2022 14:28:18 +0100
Message-Id: <20220318132824.1134400-12-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132824.1134400-1-clg@kaod.org>
References: <20220318132824.1134400-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vu1l-nHMRgqdTUitY0v7rNgkM5yJP6wF
X-Proofpoint-GUID: tqbAd_l9L05Ra70_Rp6po0bufcv3xGje
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 clxscore=1034 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180074
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Vincent Palatin <vpalatin@chromium.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The initial eMMC support from Vincent Palatin was largely reworked to
match the current SD framework. The parameters mimick a real 4GB eMMC,
but it can be set to various sizes.

This adds a new QOM object class for EMMC devices.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
Link: https://lore.kernel.org/r/1311635951-11047-5-git-send-email-vpalatin@=
chromium.org
[ jms: - Forward ported to QEMU 5.2 ]
Signed-off-by: Joel Stanley <joel@jms.id.au>
[ clg: - ported on aspeed-7.0 patchset
       - HPI activation ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/sd/sdmmc-internal.h |  97 +++++++++++++++++++
 include/hw/sd/sd.h     |   9 ++
 hw/sd/sd.c             | 205 ++++++++++++++++++++++++++++++++++++++++-
 hw/sd/sdmmc-internal.c |   2 +-
 4 files changed, 311 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdmmc-internal.h b/hw/sd/sdmmc-internal.h
index d8bf17d204fc..2b98f117cd8f 100644
--- a/hw/sd/sdmmc-internal.h
+++ b/hw/sd/sdmmc-internal.h
@@ -37,4 +37,101 @@ const char *sd_cmd_name(uint8_t cmd);
  */
 const char *sd_acmd_name(uint8_t cmd);
=20
+/*
+ * EXT_CSD fields
+ */
+
+#define EXT_CSD_CMDQ_MODE_EN            15      /* R/W */
+#define EXT_CSD_FLUSH_CACHE             32      /* W */
+#define EXT_CSD_CACHE_CTRL              33      /* R/W */
+#define EXT_CSD_POWER_OFF_NOTIFICATION  34      /* R/W */
+#define EXT_CSD_PACKED_FAILURE_INDEX    35      /* RO */
+#define EXT_CSD_PACKED_CMD_STATUS       36      /* RO */
+#define EXT_CSD_EXP_EVENTS_STATUS       54      /* RO, 2 bytes */
+#define EXT_CSD_EXP_EVENTS_CTRL         56      /* R/W, 2 bytes */
+#define EXT_CSD_DATA_SECTOR_SIZE        61      /* R */
+#define EXT_CSD_GP_SIZE_MULT            143     /* R/W */
+#define EXT_CSD_PARTITION_SETTING_COMPLETED 155 /* R/W */
+#define EXT_CSD_PARTITION_ATTRIBUTE     156     /* R/W */
+#define EXT_CSD_PARTITION_SUPPORT       160     /* RO */
+#define EXT_CSD_HPI_MGMT                161     /* R/W */
+#define EXT_CSD_RST_N_FUNCTION          162     /* R/W */
+#define EXT_CSD_BKOPS_EN                163     /* R/W */
+#define EXT_CSD_BKOPS_START             164     /* W */
+#define EXT_CSD_SANITIZE_START          165     /* W */
+#define EXT_CSD_WR_REL_PARAM            166     /* RO */
+#define EXT_CSD_RPMB_MULT               168     /* RO */
+#define EXT_CSD_FW_CONFIG               169     /* R/W */
+#define EXT_CSD_BOOT_WP                 173     /* R/W */
+#define EXT_CSD_ERASE_GROUP_DEF         175     /* R/W */
+#define EXT_CSD_PART_CONFIG             179     /* R/W */
+#define EXT_CSD_ERASED_MEM_CONT         181     /* RO */
+#define EXT_CSD_BUS_WIDTH               183     /* R/W */
+#define EXT_CSD_STROBE_SUPPORT          184     /* RO */
+#define EXT_CSD_HS_TIMING               185     /* R/W */
+#define EXT_CSD_POWER_CLASS             187     /* R/W */
+#define EXT_CSD_REV                     192     /* RO */
+#define EXT_CSD_STRUCTURE               194     /* RO */
+#define EXT_CSD_CARD_TYPE               196     /* RO */
+#define EXT_CSD_DRIVER_STRENGTH         197     /* RO */
+#define EXT_CSD_OUT_OF_INTERRUPT_TIME   198     /* RO */
+#define EXT_CSD_PART_SWITCH_TIME        199     /* RO */
+#define EXT_CSD_PWR_CL_52_195           200     /* RO */
+#define EXT_CSD_PWR_CL_26_195           201     /* RO */
+#define EXT_CSD_PWR_CL_52_360           202     /* RO */
+#define EXT_CSD_PWR_CL_26_360           203     /* RO */
+#define EXT_CSD_SEC_CNT                 212     /* RO, 4 bytes */
+#define EXT_CSD_S_A_TIMEOUT             217     /* RO */
+#define EXT_CSD_S_C_VCCQ                219     /* RO */
+#define EXT_CSD_S_C_VCC                 220     /* RO */
+#define EXT_CSD_REL_WR_SEC_C            222     /* RO */
+#define EXT_CSD_HC_WP_GRP_SIZE          221     /* RO */
+#define EXT_CSD_ERASE_TIMEOUT_MULT      223     /* RO */
+#define EXT_CSD_HC_ERASE_GRP_SIZE       224     /* RO */
+#define EXT_CSD_ACC_SIZE                225     /* RO */
+#define EXT_CSD_BOOT_MULT               226     /* RO */
+#define EXT_CSD_BOOT_INFO               228     /* RO */
+#define EXT_CSD_SEC_TRIM_MULT           229     /* RO */
+#define EXT_CSD_SEC_ERASE_MULT          230     /* RO */
+#define EXT_CSD_SEC_FEATURE_SUPPORT     231     /* RO */
+#define EXT_CSD_TRIM_MULT               232     /* RO */
+#define EXT_CSD_PWR_CL_200_195          236     /* RO */
+#define EXT_CSD_PWR_CL_200_360          237     /* RO */
+#define EXT_CSD_PWR_CL_DDR_52_195       238     /* RO */
+#define EXT_CSD_PWR_CL_DDR_52_360       239     /* RO */
+#define EXT_CSD_BKOPS_STATUS            246     /* RO */
+#define EXT_CSD_POWER_OFF_LONG_TIME     247     /* RO */
+#define EXT_CSD_GENERIC_CMD6_TIME       248     /* RO */
+#define EXT_CSD_CACHE_SIZE              249     /* RO, 4 bytes */
+#define EXT_CSD_PWR_CL_DDR_200_360      253     /* RO */
+#define EXT_CSD_FIRMWARE_VERSION        254     /* RO, 8 bytes */
+#define EXT_CSD_PRE_EOL_INFO            267     /* RO */
+#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_A      268     /* RO */
+#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_B      269     /* RO */
+#define EXT_CSD_CMDQ_DEPTH              307     /* RO */
+#define EXT_CSD_CMDQ_SUPPORT            308     /* RO */
+#define EXT_CSD_SUPPORTED_MODE          493     /* RO */
+#define EXT_CSD_TAG_UNIT_SIZE           498     /* RO */
+#define EXT_CSD_DATA_TAG_SUPPORT        499     /* RO */
+#define EXT_CSD_MAX_PACKED_WRITES       500     /* RO */
+#define EXT_CSD_MAX_PACKED_READS        501     /* RO */
+#define EXT_CSD_BKOPS_SUPPORT           502     /* RO */
+#define EXT_CSD_HPI_FEATURES            503     /* RO */
+#define EXT_CSD_S_CMD_SET               504     /* RO */
+
+/*
+ * EXT_CSD field definitions
+ */
+
+#define EXT_CSD_WR_REL_PARAM_EN         (1 << 2)
+#define EXT_CSD_WR_REL_PARAM_EN_RPMB_REL_WR     (1 << 4)
+
+#define EXT_CSD_PART_CONFIG_ACC_MASK    (0x7)
+#define EXT_CSD_PART_CONFIG_ACC_DEFAULT (0x0)
+#define EXT_CSD_PART_CONFIG_ACC_BOOT0   (0x1)
+
+#define EXT_CSD_PART_CONFIG_EN_MASK     (0x7 << 3)
+#define EXT_CSD_PART_CONFIG_EN_BOOT0    (0x1 << 3)
+#define EXT_CSD_PART_CONFIG_EN_USER     (0x7 << 3)
+
 #endif
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 47360ba4ee98..dfe661079b8a 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -93,6 +93,11 @@ typedef struct {
 #define TYPE_SD_CARD "sd-card"
 OBJECT_DECLARE_TYPE(SDState, SDCardClass, SD_CARD)
=20
+#define TYPE_EMMC "emmc"
+DECLARE_INSTANCE_CHECKER(SDState, EMMC, TYPE_EMMC)
+
+struct SDProto;
+
 struct SDCardClass {
     /*< private >*/
     DeviceClass parent_class;
@@ -124,6 +129,10 @@ struct SDCardClass {
     void (*enable)(SDState *sd, bool enable);
     bool (*get_inserted)(SDState *sd);
     bool (*get_readonly)(SDState *sd);
+
+    const struct SDProto *proto;
+    uint8_t spec_version;
+    void (*set_csd)(SDState *sd, uint64_t size);
 };
=20
 #define TYPE_SD_BUS "sd-bus"
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 602ed6eb0701..5d7f04adf5a4 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -144,6 +144,7 @@ struct SDState {
     uint64_t data_start;
     uint32_t data_offset;
     uint8_t data[512];
+    uint8_t ext_csd[512];
     qemu_irq readonly_cb;
     qemu_irq inserted_cb;
     QEMUTimer *ocr_power_timer;
@@ -390,8 +391,85 @@ static const uint8_t sd_csd_rw_mask[16] =3D {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
 };
=20
+static void mmc_set_ext_csd(SDState *sd, uint64_t size)
+{
+    uint32_t sectcount =3D size >> HWBLOCK_SHIFT;
+
+    memset(sd->ext_csd, 0, sizeof(sd->ext_csd));
+
+    sd->ext_csd[EXT_CSD_S_CMD_SET] =3D 0x1; /* supported command sets */
+    sd->ext_csd[EXT_CSD_HPI_FEATURES] =3D 0x3; /* HPI features  */
+    sd->ext_csd[EXT_CSD_BKOPS_SUPPORT] =3D 0x1; /* Background operations */
+    sd->ext_csd[241] =3D 0xA; /* 1st initialization time after partitionin=
g */
+    sd->ext_csd[EXT_CSD_TRIM_MULT] =3D 0x1; /* Trim multiplier */
+    sd->ext_csd[EXT_CSD_SEC_FEATURE_SUPPORT] =3D 0x15; /* Secure feature */
+    sd->ext_csd[EXT_CSD_SEC_ERASE_MULT] =3D 0x96; /* Secure erase support =
*/
+    sd->ext_csd[EXT_CSD_SEC_TRIM_MULT] =3D 0x96; /* Secure TRIM multiplier=
 */
+    sd->ext_csd[EXT_CSD_BOOT_INFO] =3D 0x7; /* Boot information */
+    sd->ext_csd[EXT_CSD_BOOT_MULT] =3D 0x8; /* Boot partition size. 128KB =
unit */
+    sd->ext_csd[EXT_CSD_ACC_SIZE] =3D 0x6; /* Access size */
+    sd->ext_csd[EXT_CSD_HC_ERASE_GRP_SIZE] =3D 0x4; /* HC Erase unit size =
*/
+    sd->ext_csd[EXT_CSD_ERASE_TIMEOUT_MULT] =3D 0x1; /* HC erase timeout */
+    sd->ext_csd[EXT_CSD_REL_WR_SEC_C] =3D 0x1; /* Reliable write sector co=
unt */
+    sd->ext_csd[EXT_CSD_HC_WP_GRP_SIZE] =3D 0x4; /* HC write protect group=
 size */
+    sd->ext_csd[EXT_CSD_S_C_VCC] =3D 0x8; /* Sleep current VCC  */
+    sd->ext_csd[EXT_CSD_S_C_VCCQ] =3D 0x7; /* Sleep current VCCQ */
+    sd->ext_csd[EXT_CSD_S_A_TIMEOUT] =3D 0x11; /* Sleep/Awake timeout */
+    sd->ext_csd[215] =3D (sectcount >> 24) & 0xff; /* Sector count */
+    sd->ext_csd[214] =3D (sectcount >> 16) & 0xff; /* ... */
+    sd->ext_csd[213] =3D (sectcount >> 8) & 0xff;  /* ... */
+    sd->ext_csd[EXT_CSD_SEC_CNT] =3D (sectcount & 0xff);       /* ... */
+    sd->ext_csd[210] =3D 0xa; /* Min write perf for 8bit@52Mhz */
+    sd->ext_csd[209] =3D 0xa; /* Min read perf for 8bit@52Mhz  */
+    sd->ext_csd[208] =3D 0xa; /* Min write perf for 4bit@52Mhz */
+    sd->ext_csd[207] =3D 0xa; /* Min read perf for 4bit@52Mhz */
+    sd->ext_csd[206] =3D 0xa; /* Min write perf for 4bit@26Mhz */
+    sd->ext_csd[205] =3D 0xa; /* Min read perf for 4bit@26Mhz */
+    sd->ext_csd[EXT_CSD_PART_SWITCH_TIME] =3D 0x1;
+    sd->ext_csd[EXT_CSD_OUT_OF_INTERRUPT_TIME] =3D 0x1;
+    sd->ext_csd[EXT_CSD_CARD_TYPE] =3D 0x7;
+    sd->ext_csd[EXT_CSD_STRUCTURE] =3D 0x2;
+    sd->ext_csd[EXT_CSD_REV] =3D 0x5;
+    sd->ext_csd[EXT_CSD_RPMB_MULT] =3D 0x1; /* RPMB size */
+    sd->ext_csd[EXT_CSD_PARTITION_SUPPORT] =3D 0x3;
+    sd->ext_csd[159] =3D 0x00; /* Max enhanced area size */
+    sd->ext_csd[158] =3D 0x00; /* ... */
+    sd->ext_csd[157] =3D 0xEC; /* ... */
+}
+
+static void sd_emmc_set_csd(SDState *sd, uint64_t size)
+{
+    sd->csd[0] =3D 0xd0;
+    sd->csd[1] =3D 0x0f;
+    sd->csd[2] =3D 0x00;
+    sd->csd[3] =3D 0x32;
+    sd->csd[4] =3D 0x0f;
+    if (size <=3D 2 * GiB) {
+        /* use 1k blocks */
+        uint32_t csize1k =3D (size >> (CMULT_SHIFT + 10)) - 1;
+        sd->csd[5] =3D 0x5a;
+        sd->csd[6] =3D 0x80 | ((csize1k >> 10) & 0xf);
+        sd->csd[7] =3D (csize1k >> 2) & 0xff;
+    } else { /* >=3D 2GB : size stored in ext CSD, block addressing */
+        sd->csd[5] =3D 0x59;
+        sd->csd[6] =3D 0x8f;
+        sd->csd[7] =3D 0xff;
+        sd->ocr =3D FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
+    }
+    sd->csd[8] =3D 0xff;
+    sd->csd[9] =3D 0xff;
+    sd->csd[10] =3D 0xf7;
+    sd->csd[11] =3D 0xfe;
+    sd->csd[12] =3D 0x49;
+    sd->csd[13] =3D 0x10;
+    sd->csd[14] =3D 0x00;
+    sd->csd[15] =3D (sd_crc7(sd->csd, 15) << 1) | 1;
+    mmc_set_ext_csd(sd, size);
+}
+
 static void sd_set_csd(SDState *sd, uint64_t size)
 {
+    SDCardClass *sc =3D SD_CARD_GET_CLASS(sd);
     int hwblock_shift =3D HWBLOCK_SHIFT;
     uint32_t csize;
     uint32_t sectsize =3D (1 << (SECTOR_SHIFT + 1)) - 1;
@@ -403,7 +481,9 @@ static void sd_set_csd(SDState *sd, uint64_t size)
     }
     csize =3D (size >> (CMULT_SHIFT + hwblock_shift)) - 1;
=20
-    if (size <=3D SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
+    if (sc->set_csd) {
+        sc->set_csd(sd, size);
+    } else if (size <=3D SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
         sd->csd[0] =3D 0x00;	/* CSD structure */
         sd->csd[1] =3D 0x26;	/* Data read access-time-1 */
         sd->csd[2] =3D 0x00;	/* Data read access-time-2 */
@@ -1028,6 +1108,25 @@ static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd=
, SDRequest req)
     return sd_r2_i;
 }
=20
+static void sd_emmc_set_rca(SDState *sd, uint16_t value)
+{
+    sd->rca =3D value;
+}
+
+static sd_rsp_type_t sd_emmc_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest=
 req)
+{
+    switch (sd->state) {
+    case sd_identification_state:
+    case sd_standby_state:
+        sd->state =3D sd_standby_state;
+        sd_emmc_set_rca(sd, req.arg >> 16);
+        return sd_r1;
+
+    default:
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+}
+
 static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
 {
     switch (sd->state) {
@@ -2003,6 +2102,14 @@ uint8_t sd_read_byte(SDState *sd)
             sd->state =3D sd_transfer_state;
         break;
=20
+    case 8:     /* CMD8: SEND_EXT_CSD on MMC */
+        ret =3D sd->data[sd->data_offset++];
+
+        if (sd->data_offset >=3D sizeof(sd->ext_csd)) {
+            sd->state =3D sd_transfer_state;
+        }
+        break;
+
     case 9:	/* CMD9:   SEND_CSD */
     case 10:	/* CMD10:  SEND_CID */
         ret =3D sd->data[sd->data_offset ++];
@@ -2144,6 +2251,75 @@ static const SDProto sd_proto_sd =3D {
     },
 };
=20
+static sd_rsp_type_t sd_emmc_cmd_SEND_OP_CMD(SDState *sd, SDRequest req)
+{
+    sd->state =3D sd_ready_state;
+    return sd_r3;
+}
+
+static sd_rsp_type_t sd_emmc_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
+{
+    if (sd->state !=3D sd_ready_state && sd->state !=3D sd_idle_state) {
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+
+    sd->state =3D sd_identification_state;
+
+    return sd_r2_i;
+}
+
+static sd_rsp_type_t sd_emmc_cmd_SEND_EXT_CSD(SDState *sd, SDRequest req)
+{
+    uint64_t addr =3D (sd->ocr & (1 << 30)) ? (uint64_t) req.arg << 9 : re=
q.arg;
+
+    switch (sd->state) {
+    case sd_transfer_state:
+        /* MMC : Sends the EXT_CSD register as a Block of data */
+        sd->state =3D sd_sendingdata_state;
+        memcpy(sd->data, sd->ext_csd, sizeof(sd->ext_csd));
+        sd->data_start =3D addr;
+        sd->data_offset =3D 0;
+        return sd_r1;
+    default:
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+}
+
+static sd_rsp_type_t sd_emmc_cmd_APP_CMD(SDState *sd, SDRequest req)
+{
+    return sd_r0;
+}
+
+static sd_rsp_type_t sd_emmc_cmd_SEND_TUNING_BLOCK(SDState *sd, SDRequest =
req)
+{
+    if (sd->state !=3D sd_transfer_state) {
+        sd_invalid_state_for_cmd(sd, req);
+    }
+
+    sd->state =3D sd_sendingdata_state;
+    sd->data_offset =3D 0;
+    return sd_r1;
+}
+
+static const SDProto sd_proto_emmc =3D {
+    .name =3D "eMMC",
+    .cmd =3D {
+        [0]         =3D sd_cmd_GO_IDLE_STATE,
+        [1]         =3D sd_emmc_cmd_SEND_OP_CMD,
+        [2]         =3D sd_emmc_cmd_ALL_SEND_CID,
+        [3]         =3D sd_emmc_cmd_SEND_RELATIVE_ADDR,
+        [5]         =3D sd_cmd_illegal,
+        [8]         =3D sd_emmc_cmd_SEND_EXT_CSD,
+        [19]        =3D sd_cmd_SEND_TUNING_BLOCK,
+        [21]        =3D sd_emmc_cmd_SEND_TUNING_BLOCK,
+        [41]        =3D sd_cmd_illegal,
+        [52 ... 54] =3D sd_cmd_illegal,
+        [55]        =3D sd_emmc_cmd_APP_CMD,
+        [58]        =3D sd_cmd_illegal,
+        [59]        =3D sd_cmd_illegal,
+    },
+};
+
 static void sd_instance_init(Object *obj)
 {
     SDState *sd =3D SD_CARD(obj);
@@ -2162,10 +2338,19 @@ static void sd_instance_finalize(Object *obj)
 static void sd_realize(DeviceState *dev, Error **errp)
 {
     SDState *sd =3D SD_CARD(dev);
+    SDCardClass *sc =3D SD_CARD_GET_CLASS(sd);
     int ret;
=20
     sd->proto =3D sd->spi ? &sd_proto_spi : &sd_proto_sd;
=20
+    if (sc->proto) {
+        sd->proto =3D sc->proto;
+    }
+
+    if (sc->spec_version) {
+        sd->spec_version =3D sc->spec_version;
+    }
+
     switch (sd->spec_version) {
     case SD_PHY_SPECv1_10_VERS
      ... SD_PHY_SPECv3_01_VERS:
@@ -2261,9 +2446,27 @@ static const TypeInfo sd_info =3D {
     .instance_finalize =3D sd_instance_finalize,
 };
=20
+static void emmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    SDCardClass *sc =3D SD_CARD_CLASS(klass);
+
+    dc->desc =3D "eMMC";
+    sc->proto =3D &sd_proto_emmc;
+    sc->spec_version =3D SD_PHY_SPECv3_01_VERS; /* eMMC requirement */
+    sc->set_csd =3D sd_emmc_set_csd;
+}
+
+static const TypeInfo emmc_info =3D {
+    .name =3D TYPE_EMMC,
+    .parent =3D TYPE_SD_CARD,
+    .class_init =3D emmc_class_init,
+ };
+
 static void sd_register_types(void)
 {
     type_register_static(&sd_info);
+    type_register_static(&emmc_info);
 }
=20
 type_init(sd_register_types)
diff --git a/hw/sd/sdmmc-internal.c b/hw/sd/sdmmc-internal.c
index 2053def3f10b..8648a7808dcc 100644
--- a/hw/sd/sdmmc-internal.c
+++ b/hw/sd/sdmmc-internal.c
@@ -14,7 +14,7 @@
 const char *sd_cmd_name(uint8_t cmd)
 {
     static const char *cmd_abbrev[SDMMC_CMD_MAX] =3D {
-         [0]    =3D "GO_IDLE_STATE",
+         [0]    =3D "GO_IDLE_STATE",           [1]    =3D "SEND_OP_CMD",
          [2]    =3D "ALL_SEND_CID",            [3]    =3D "SEND_RELATIVE_A=
DDR",
          [4]    =3D "SET_DSR",                 [5]    =3D "IO_SEND_OP_COND=
",
          [6]    =3D "SWITCH_FUNC",             [7]    =3D "SELECT/DESELECT=
_CARD",
--=20
2.34.1


