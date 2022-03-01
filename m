Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0133E4C8D54
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:08:26 +0100 (CET)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Av-0004Zh-2W
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zq-00066q-AL; Tue, 01 Mar 2022 08:56:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zm-00024W-Qb; Tue, 01 Mar 2022 08:56:57 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221CHOCx019258; 
 Tue, 1 Mar 2022 13:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SC44WGDgEBd+Ke9HzuDNUzlS/puduvghWm/om/7ac7w=;
 b=fCFhb1+3dkLyrFSJTB454Hu1izcpCXpTXFbn1HcOMJI2lgC8hyCJN+9bRieg/wmEQPDX
 fmHmrVzW+vsV+gPqLSmugjW1YFg7k4ikssJlCEVhG3YBZvZ9TqT5xemOCfPIz6dVNWps
 AGVz2EECq6IuRDggewKvMXrsqAhVWHJnefBJEXRH2BUt8CDhNidhi7ou9Pz26oCkpo71
 vqvG95kBulxlSUyNSW8g5z7+Z27EyWjS9zzRmpJoM2i1vYf9fFFUhu2waEcdGcAzEVkm
 4tqEK3nRMm4OwsdhUln9fOvr81EMhRFSq0HzpQ1QGcuHYfeHTjU+aIFC5okqHjS77e5x 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehfrufnyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:49 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DaMx3019532;
 Tue, 1 Mar 2022 13:56:48 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehfrufnxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:48 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtjCI030087;
 Tue, 1 Mar 2022 13:56:47 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3efbu9w0vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:47 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DukDS18743624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:46 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E89C5BE058;
 Tue,  1 Mar 2022 13:56:45 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 696D8BE054;
 Tue,  1 Mar 2022 13:56:44 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:44 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/17] target/ppc: Remove leftover comments from cpu_init
Date: Tue,  1 Mar 2022 10:56:12 -0300
Message-Id: <20220301135620.2411952-10-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xoteiXXT3jnuslSNaW61191p6in_lBi9
X-Proofpoint-GUID: _UEDQ5XCOxZ8S2nAYMCrR4ybJkbwFZKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The defines are not in use and the comment seems to have lost its
purpose, whatever it was.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index f1ddd5a739..7753dfecd3 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -46,40 +46,6 @@
 #include "spr_common.h"
 #include "power8-pmu.h"
 
-/* #define PPC_DEBUG_SPR */
-/* #define USE_APPLE_GDB */
-
-/*
- * AMR     => SPR 29 (Power 2.04)
- * CTRL    => SPR 136 (Power 2.04)
- * CTRL    => SPR 152 (Power 2.04)
- * SCOMC   => SPR 276 (64 bits ?)
- * SCOMD   => SPR 277 (64 bits ?)
- * TBU40   => SPR 286 (Power 2.04 hypv)
- * HSPRG0  => SPR 304 (Power 2.04 hypv)
- * HSPRG1  => SPR 305 (Power 2.04 hypv)
- * HDSISR  => SPR 306 (Power 2.04 hypv)
- * HDAR    => SPR 307 (Power 2.04 hypv)
- * PURR    => SPR 309 (Power 2.04 hypv)
- * HDEC    => SPR 310 (Power 2.04 hypv)
- * HIOR    => SPR 311 (hypv)
- * RMOR    => SPR 312 (970)
- * HRMOR   => SPR 313 (Power 2.04 hypv)
- * HSRR0   => SPR 314 (Power 2.04 hypv)
- * HSRR1   => SPR 315 (Power 2.04 hypv)
- * LPIDR   => SPR 317 (970)
- * EPR     => SPR 702 (Power 2.04 emb)
- * perf    => 768-783 (Power 2.04)
- * perf    => 784-799 (Power 2.04)
- * PPR     => SPR 896 (Power 2.04)
- * DABRX   => 1015    (Power 2.04 hypv)
- * FPECR   => SPR 1022 (?)
- * ... and more (thermal management, performance counters, ...)
- */
-
-/*****************************************************************************/
-/* Exception vectors models                                                  */
-
 #if !defined(CONFIG_USER_ONLY)
 void cpu_ppc_set_vhyp(PowerPCCPU *cpu, PPCVirtualHypervisor *vhyp)
 {
-- 
2.34.1


