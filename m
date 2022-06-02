Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9253BCE5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 18:54:43 +0200 (CEST)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwo5q-000688-59
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 12:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nwo4Y-0005I3-Pg; Thu, 02 Jun 2022 12:53:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nwo4W-0001mG-RR; Thu, 02 Jun 2022 12:53:22 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252EMIxL006140;
 Thu, 2 Jun 2022 16:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=LhjQVkx/Yu+rNW5qoJfrjwTz6VSAlg1jm/npQmeLLLM=;
 b=cvoVEkCK+Ln9lIzL3DUycQnw5pQZJ9acwTAlpD7dSgj0Hv7ZSHbE6A7oNsHsCLDfHYv+
 s00/6RzKwJ5z1vl+gkF9BZ6vgNEDqLdfSuERxnbOyFXgQyPtnJ9arEryPcGI02w6aWTj
 NSIeprpytvEUHxUt03jbgT74djgK2PuErXP0kESC/W1CQE8rjXtGUPP44agbfHwN6+SL
 msmY/yeqVd1a/2c14bYZRFcwmbSNCBS3//F3/AAOQH1CyXKfHp/qWh62NZQeonCiMIvG
 QoLFX390JoPvVar6DE5c8pJS2tUkV4Pp5H+kWXfC0aZSlm49Yj4itgFz9/a3EiQ1boTD Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gevdkp899-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:53:16 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252Fa4aw017048;
 Thu, 2 Jun 2022 16:53:15 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gevdkp88u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:53:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252GqL19013587;
 Thu, 2 Jun 2022 16:53:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3gdnettyj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:53:13 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 252GrBuO36635042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jun 2022 16:53:11 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7747442041;
 Thu,  2 Jun 2022 16:53:11 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CC9C4203F;
 Thu,  2 Jun 2022 16:53:11 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.101.4.17])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Jun 2022 16:53:11 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] pnv/xive2: Access direct mapped thread contexts from all chips
Date: Thu,  2 Jun 2022 18:53:10 +0200
Message-Id: <20220602165310.558810-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vhUWKCuq8T3OORHYAc9muWvWQ-D_zm4v
X-Proofpoint-GUID: vvs80UCidP9AvUFxh5C9dqz_50pd7hO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_05,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206020068
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

When accessing a thread context through the IC BAR, the offset of the
page in the BAR identifies the CPU. From that offset, we can compute
the PIR (processor ID register) of the CPU to do the data structure
lookup. On P10, the current code assumes an access for node 0 when
computing the PIR. Everything is almost in place to allow access for
other nodes though. So this patch reworks how the PIR value is
computed so that we can access all thread contexts through the IC BAR.

The PIR is already correct on P9, so no need to modify anything there.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/intc/pnv_xive2.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index a39e070e82..f31c53c28d 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -1574,6 +1574,12 @@ static const MemoryRegionOps pnv_xive2_ic_sync_ops = {
  * When the TM direct pages of the IC controller are accessed, the
  * target HW thread is deduced from the page offset.
  */
+static uint32_t pnv_xive2_ic_tm_get_pir(PnvXive2 *xive, hwaddr offset)
+{
+    /* On P10, the node ID shift in the PIR register is 8 bits */
+    return xive->chip->chip_id << 8 | offset >> xive->ic_shift;
+}
+
 static XiveTCTX *pnv_xive2_get_indirect_tctx(PnvXive2 *xive, uint32_t pir)
 {
     PnvChip *chip = xive->chip;
@@ -1596,10 +1602,12 @@ static uint64_t pnv_xive2_ic_tm_indirect_read(void *opaque, hwaddr offset,
                                               unsigned size)
 {
     PnvXive2 *xive = PNV_XIVE2(opaque);
-    uint32_t pir = offset >> xive->ic_shift;
-    XiveTCTX *tctx = pnv_xive2_get_indirect_tctx(xive, pir);
+    uint32_t pir;
+    XiveTCTX *tctx;
     uint64_t val = -1;
 
+    pir = pnv_xive2_ic_tm_get_pir(xive, offset);
+    tctx = pnv_xive2_get_indirect_tctx(xive, pir);
     if (tctx) {
         val = xive_tctx_tm_read(NULL, tctx, offset, size);
     }
@@ -1611,9 +1619,11 @@ static void pnv_xive2_ic_tm_indirect_write(void *opaque, hwaddr offset,
                                            uint64_t val, unsigned size)
 {
     PnvXive2 *xive = PNV_XIVE2(opaque);
-    uint32_t pir = offset >> xive->ic_shift;
-    XiveTCTX *tctx = pnv_xive2_get_indirect_tctx(xive, pir);
+    uint32_t pir;
+    XiveTCTX *tctx;
 
+    pir = pnv_xive2_ic_tm_get_pir(xive, offset);
+    tctx = pnv_xive2_get_indirect_tctx(xive, pir);
     if (tctx) {
         xive_tctx_tm_write(NULL, tctx, offset, val, size);
     }
-- 
2.35.3


