Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A2A531194
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:24:18 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9ur-0003QM-Sr
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nt9px-0005fg-BY; Mon, 23 May 2022 11:19:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nt9pu-0001sa-Vm; Mon, 23 May 2022 11:19:12 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NEDnZO000646;
 Mon, 23 May 2022 15:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Z/QnyGJE/Jt4VwRjgxFUuA9Vilv8WYux9KEpfURHGL4=;
 b=dDYtNwQi7nmwYa0Xp3tBgizb1erG3kEqcz1C/oD3MJNxh1+Q4C6tFSJsNN2ed5YuG696
 Hu75yRa2b7Z1PMKtPKkZRvbEsPKX+/lTCcCXnGYVAcPyQmRT5y34/o7n7mk+T6Gi5NUs
 5YzbPopLWpeFXOKHAkTngquBvY6ITJN4D1Ebd3ifj3OwyQb6/by54/CfAgUTX1daHq/V
 pcNSE0fOd9aRBfTkyYi5WuppPs4xehttBLO5QNodGtcFtbRbtR9wl5ooJ5C5FzcqPUzO
 e3OMdwf09K3Ri2Gx/1Mbl9HTC+1+kzkC+jI5KWLuMyWN1isilL7Pg0sobRkE2LDSd7ni OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8bun9bk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 15:19:05 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24NEuns2016902;
 Mon, 23 May 2022 15:19:04 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8bun9bj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 15:19:04 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24NF8WD5011864;
 Mon, 23 May 2022 15:19:02 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3g6qq931nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 15:19:02 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24NFJ0cM47251888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 15:19:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E99724203F;
 Mon, 23 May 2022 15:18:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6D1542041;
 Mon, 23 May 2022 15:18:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.89.174])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 May 2022 15:18:59 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] pnv/xive2: Don't overwrite PC registers when writing TCTXT
 registers
Date: Mon, 23 May 2022 17:18:59 +0200
Message-Id: <20220523151859.72283-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TeiqcP7uIYL-15ZqRhtkG0tio1IM3A2w
X-Proofpoint-GUID: G5G64sSH1zmXtSO62AeOBxVmboty5GAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_06,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxlogscore=959 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205230085
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

When writing a register from the TCTXT memory region (4th page within
the IC BAR), we were overwriting the Presentation Controller (PC)
register at the same offset. It looks like a silly cut and paste
error.

We were somehow lucky: the TCTXT registers being touched are
TCTXT_ENx/_SET/_RESET to enable physical threads and the PC registers
at the same offset are either not used by our model or the update was
harmless.

Found through code inspection.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/intc/pnv_xive2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 87303b4064..a39e070e82 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -1295,7 +1295,6 @@ static void pnv_xive2_ic_tctxt_write(void *opaque, hwaddr offset,
                                      uint64_t val, unsigned size)
 {
     PnvXive2 *xive = PNV_XIVE2(opaque);
-    uint32_t reg = offset >> 3;
 
     switch (offset) {
     /*
@@ -1322,8 +1321,6 @@ static void pnv_xive2_ic_tctxt_write(void *opaque, hwaddr offset,
         xive2_error(xive, "TCTXT: invalid write @%"HWADDR_PRIx, offset);
         return;
     }
-
-    xive->pc_regs[reg] = val;
 }
 
 static const MemoryRegionOps pnv_xive2_ic_tctxt_ops = {
-- 
2.35.3


