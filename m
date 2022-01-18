Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8226492E33
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:12:28 +0100 (CET)
Received: from localhost ([::1]:33866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9tu5-0006ca-VP
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:12:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9tTy-0005jf-A5; Tue, 18 Jan 2022 13:45:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9tTu-0002zD-OD; Tue, 18 Jan 2022 13:45:24 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IGtNPF002038; 
 Tue, 18 Jan 2022 18:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2VNdW0w9bk0spuzpWfXFzuL9FW0UCJuCoVTjmjQ4Naw=;
 b=kVoi/r0oo4Jaqh5/72bFQUZNYCGMtnjncfPD7fdEi5mtbxNvZj6StIwzpSgBJz4El4+h
 CgCQ/moH3yKC1MXy/OkgGwS7ccB8fqjKYlMJhEsswGf0ZQtRtkiSqZ8HOksgXEZMj8oV
 mu15/+1a1RG/nz9Z6V+ne/3rESgywNpQVsW50neIhTx/bEilb+gToojBj2hQ/I06g7Ny
 qmHr9y2Pl+hE2bHKj1AZqc+cgp2/5xqMtdmDyvFkjP8Yzd6rA65xA1MSrlS+nKhiBaZf
 HvXJs52QfbTdWtOH5xOo2Oqk46FAZKWBLqWG6FSc7hMdCCG7yUcxvshJ8qOJRaxKna0a KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnxf18bmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:02 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20IHsbVC029988;
 Tue, 18 Jan 2022 18:45:02 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnxf18bm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:02 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20IIbvra026604;
 Tue, 18 Jan 2022 18:45:01 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3dknwaqrae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:01 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20IIj0Tv43057580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 18:45:00 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F04AEAE062;
 Tue, 18 Jan 2022 18:44:59 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64D73AE05C;
 Tue, 18 Jan 2022 18:44:57 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.109.91])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jan 2022 18:44:57 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/14] target/ppc: 405: Rename MSR_POW to MSR_WE
Date: Tue, 18 Jan 2022 15:44:35 -0300
Message-Id: <20220118184448.852996-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220118184448.852996-1-farosas@linux.ibm.com>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IYeQairi2StfEzJr-rQfiWNRYmjU_AKg
X-Proofpoint-ORIG-GUID: UC4iFuUaYzNN1CUynqpm9KaVNDXWhJ-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_05,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=764
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bit 13 is the Wait State Enable bit. Give it its proper name.

As far as I can see we don't do anything with MSR_POW for the 405, so
this change has no effect.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h      | 1 +
 target/ppc/cpu_init.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2560b70c5f..66e13075c3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -327,6 +327,7 @@ typedef enum {
 #define MSR_S    22 /* Secure state                                          */
 #define MSR_KEY  19 /* key bit on 603e                                       */
 #define MSR_POW  18 /* Power management                                      */
+#define MSR_WE   18 /* Wait State Enable on 405                              */
 #define MSR_TGPR 17 /* TGPR usage on 602/603                        x        */
 #define MSR_CE   17 /* Critical interrupt enable on embedded PowerPC x       */
 #define MSR_ILE  16 /* Interrupt little-endian mode                          */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index e30e86fe9d..e63705b1c6 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2535,7 +2535,7 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
                        PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
-    pcc->msr_mask = (1ull << MSR_POW) |
+    pcc->msr_mask = (1ull << MSR_WE) |
                     (1ull << MSR_CE) |
                     (1ull << MSR_EE) |
                     (1ull << MSR_PR) |
-- 
2.33.1


