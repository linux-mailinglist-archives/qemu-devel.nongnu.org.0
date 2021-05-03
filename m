Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB71371136
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 07:28:29 +0200 (CEST)
Received: from localhost ([::1]:39848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldR88-0006cZ-5h
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 01:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6J-0004q1-11; Mon, 03 May 2021 01:26:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29348
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6F-0005ym-G4; Mon, 03 May 2021 01:26:34 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14353eSi120475; Mon, 3 May 2021 01:26:12 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38aahu0gwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:12 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435H4jk022045;
 Mon, 3 May 2021 05:26:10 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 388xm8rh6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:10 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1435Q8m619661108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:26:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40CA8A404D;
 Mon,  3 May 2021 05:26:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A320A4040;
 Mon,  3 May 2021 05:26:08 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:07 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5AE2722007C;
 Mon,  3 May 2021 07:26:07 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/18] aspeed/smc: Use the RAM memory region for DMAs
Date: Mon,  3 May 2021 07:25:43 +0200
Message-Id: <20210503052600.290483-2-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
References: <20210503052600.290483-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cP6Rsj7fc653UgWBm4JLynzeO-dTmraj
X-Proofpoint-ORIG-GUID: cP6Rsj7fc653UgWBm4JLynzeO-dTmraj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=539 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1034
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030033
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of passing the memory address space region, simply use the RAM
memory region instead. This simplifies RAM accesses.

This patch breaks migration compatibility.

Fixes: c4e1f0b48322 ("aspeed/smc: Add support for DMAs")
Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210407171637.777743-2-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c     | 2 +-
 hw/ssi/aspeed_smc.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a17b75f4940a..1cf5a15c8098 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -327,7 +327,7 @@ static void aspeed_machine_init(MachineState *machine=
)
     object_property_set_int(OBJECT(&bmc->soc), "num-cs", amc->num_cs,
                             &error_abort);
     object_property_set_link(OBJECT(&bmc->soc), "dram",
-                             OBJECT(&bmc->ram_container), &error_abort);
+                             OBJECT(machine->ram), &error_abort);
     if (machine->kernel_filename) {
         /*
          * When booting with a -kernel command line there is no u-boot
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 16addee4dc8d..6f72fb028e59 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -178,8 +178,7 @@
  *   0: 4 bytes
  *   0x7FFFFF: 32M bytes
  */
-#define DMA_DRAM_ADDR(s, val)   ((s)->sdram_base | \
-                                 ((val) & (s)->ctrl->dma_dram_mask))
+#define DMA_DRAM_ADDR(s, val)   ((val) & (s)->ctrl->dma_dram_mask)
 #define DMA_FLASH_ADDR(s, val)  ((s)->ctrl->flash_window_base | \
                                 ((val) & (s)->ctrl->dma_flash_mask))
 #define DMA_LENGTH(val)         ((val) & 0x01FFFFFC)
--=20
2.26.3


