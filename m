Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D044DDAF7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:53:28 +0100 (CET)
Received: from localhost ([::1]:37936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVD2l-0006jp-9i
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:53:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCf5-0008Pr-RJ; Fri, 18 Mar 2022 09:28:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37510
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCf4-00035Q-4Y; Fri, 18 Mar 2022 09:28:59 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICnrcD011562; 
 Fri, 18 Mar 2022 13:28:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3euxtr8jsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:49 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ID6Oe3018496;
 Fri, 18 Mar 2022 13:28:48 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3euxtr8js0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:48 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDP39E011297;
 Fri, 18 Mar 2022 13:28:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3erk58uk1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IDSia219792360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:28:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E831352050;
 Fri, 18 Mar 2022 13:28:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id A89CD52051;
 Fri, 18 Mar 2022 13:28:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.169])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F2CEC2201E8;
 Fri, 18 Mar 2022 14:28:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 16/17] hw/sd: Support boot area in emmc image
Date: Fri, 18 Mar 2022 14:28:23 +0100
Message-Id: <20220318132824.1134400-17-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132824.1134400-1-clg@kaod.org>
References: <20220318132824.1134400-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RZYMdcuCvAHyGmQWkOhrpDPy3Z52DCYs
X-Proofpoint-ORIG-GUID: 7qB_8XV_cpzf3Erb0P8RxTR68Yg7WkVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180074
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

This assumes a specially constructued image:

  dd if=3D/dev/zero of=3Dmmc-bootarea.img count=3D2 bs=3D1M
  dd if=3Du-boot-spl.bin of=3Dmmc-bootarea.img conv=3Dnotrunc
  dd if=3Du-boot.bin of=3Dmmc-bootarea.img conv=3Dnotrunc count=3D64 bs=3D=
1K
  cat mmc-bootarea.img obmc-phosphor-image.wic > mmc.img
  truncate --size 16GB mmc.img
  truncate --size 128MB mmc-bootarea.img

For now this still requires a mtd image to load the SPL:

  qemu-system-arm -M tacoma-bmc -nographic \
   -global driver=3Dsd-card,property=3Demmc,value=3Dtrue \
   -drive file=3Dmmc.img,if=3Dsd,index=3D2 \
   -drive file=3Dmmc-bootarea.img,if=3Dmtd,format=3Draw

Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: - changes on the definition names ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/sd/sd.h |  1 +
 hw/sd/sd.c         | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index dfe661079b8a..02cfc8cecfac 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -133,6 +133,7 @@ struct SDCardClass {
     const struct SDProto *proto;
     uint8_t spec_version;
     void (*set_csd)(SDState *sd, uint64_t size);
+    uint32_t (*bootpart_offset)(SDState *sd);
 };
=20
 #define TYPE_SD_BUS "sd-bus"
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d3bda6c2aa6b..e975fcf18512 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -839,9 +839,40 @@ void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_=
irq insert)
     qemu_set_irq(insert, sd->blk ? blk_is_inserted(sd->blk) : 0);
 }
=20
+/*
+ * This requires a disk image that has two boot partitions inserted at t=
he
+ * beginning of it. The size of the boot partitions are configured in th=
e
+ * ext_csd structure, which is hardcoded in qemu. They are currently set=
 to
+ * 1MB each.
+ */
+static uint32_t sd_emmc_bootpart_offset(SDState *sd)
+{
+    unsigned int access =3D sd->ext_csd[EXT_CSD_PART_CONFIG] &
+        EXT_CSD_PART_CONFIG_ACC_MASK;
+    unsigned int boot_capacity =3D sd->ext_csd[EXT_CSD_BOOT_MULT] << 17;
+
+    switch (access) {
+    case EXT_CSD_PART_CONFIG_ACC_DEFAULT:
+        return boot_capacity * 2;
+    case EXT_CSD_PART_CONFIG_ACC_BOOT0:
+        return 0;
+    case EXT_CSD_PART_CONFIG_ACC_BOOT0 + 1:
+        return boot_capacity * 1;
+    default:
+         g_assert_not_reached();
+    }
+}
+
+static uint32_t sd_bootpart_offset(SDState *sd)
+{
+    SDCardClass *sc =3D SD_CARD_GET_CLASS(sd);
+    return sc->bootpart_offset ? sc->bootpart_offset(sd) : 0;
+}
+
 static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_read_block(addr, len);
+    addr +=3D sd_bootpart_offset(sd);
     if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len) < 0) {
         fprintf(stderr, "sd_blk_read: read error on host side\n");
     }
@@ -850,6 +881,7 @@ static void sd_blk_read(SDState *sd, uint64_t addr, u=
int32_t len)
 static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_write_block(addr, len);
+    addr +=3D sd_bootpart_offset(sd);
     if (!sd->blk || blk_pwrite(sd->blk, addr, sd->data, len, 0) < 0) {
         fprintf(stderr, "sd_blk_write: write error on host side\n");
     }
@@ -2546,6 +2578,7 @@ static void emmc_class_init(ObjectClass *klass, voi=
d *data)
     sc->proto =3D &sd_proto_emmc;
     sc->spec_version =3D SD_PHY_SPECv3_01_VERS; /* eMMC requirement */
     sc->set_csd =3D sd_emmc_set_csd;
+    sc->bootpart_offset =3D sd_emmc_bootpart_offset;
 }
=20
 static const TypeInfo emmc_info =3D {
--=20
2.34.1


