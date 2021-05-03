Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F6D37113F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 07:31:24 +0200 (CEST)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldRAx-00023X-1c
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 01:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6L-0004qh-Km; Mon, 03 May 2021 01:26:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6J-00066B-7C; Mon, 03 May 2021 01:26:37 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1435FDNM068260; Mon, 3 May 2021 01:26:15 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38aav4g54f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:15 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435HGj5031104;
 Mon, 3 May 2021 05:26:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 388x8h89s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:13 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1435QAYF40632622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:26:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA9784C046;
 Mon,  3 May 2021 05:26:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74C3B4C040;
 Mon,  3 May 2021 05:26:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:10 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D37E722007C;
 Mon,  3 May 2021 07:26:09 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/18] hw/arm/aspeed: Do not sysbus-map mmio flash region
 directly, use alias
Date: Mon,  3 May 2021 07:25:47 +0200
Message-Id: <20210503052600.290483-6-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
References: <20210503052600.290483-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HrTB5ygwYxUixDM5e2eQnGPIrOyjJJJz
X-Proofpoint-GUID: HrTB5ygwYxUixDM5e2eQnGPIrOyjJJJz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501 mlxlogscore=640
 spamscore=0 malwarescore=0 clxscore=1034 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105030033
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The flash mmio region is exposed as an AddressSpace.
AddressSpaces must not be sysbus-mapped, therefore map
the region using an alias.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
[ clg : Fix DMA_FLASH_ADDR() ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210312182851.1922972-3-f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210407171637.777743-6-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 1 +
 hw/ssi/aspeed_smc.c         | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index ccd71d9b534e..6ea2871cd899 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -84,6 +84,7 @@ struct AspeedSMCState {
=20
     MemoryRegion mmio;
     MemoryRegion mmio_flash;
+    MemoryRegion mmio_flash_alias;
=20
     qemu_irq irq;
     int irqline;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 884e08aca4e2..50ea907aef74 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -179,8 +179,7 @@
  *   0x7FFFFF: 32M bytes
  */
 #define DMA_DRAM_ADDR(s, val)   ((val) & (s)->ctrl->dma_dram_mask)
-#define DMA_FLASH_ADDR(s, val)  ((s)->ctrl->flash_window_base | \
-                                ((val) & (s)->ctrl->dma_flash_mask))
+#define DMA_FLASH_ADDR(s, val)  ((val) & (s)->ctrl->dma_flash_mask)
 #define DMA_LENGTH(val)         ((val) & 0x01FFFFFC)
=20
 /* Flash opcodes. */
@@ -1385,7 +1384,9 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
     memory_region_init_io(&s->mmio_flash, OBJECT(s),
                           &aspeed_smc_flash_default_ops, s, name,
                           s->ctrl->flash_window_size);
-    sysbus_init_mmio(sbd, &s->mmio_flash);
+    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s), name,
+                             &s->mmio_flash, 0, s->ctrl->flash_window_si=
ze);
+    sysbus_init_mmio(sbd, &s->mmio_flash_alias);
=20
     s->flashes =3D g_new0(AspeedSMCFlash, s->ctrl->max_peripherals);
=20
--=20
2.26.3


