Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF72F67E52F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:30:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNqv-0005rw-Qu; Fri, 27 Jan 2023 07:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pLNqp-0005ra-81; Fri, 27 Jan 2023 07:29:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pLNqn-0003cm-AV; Fri, 27 Jan 2023 07:29:02 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RC6vtH007631; Fri, 27 Jan 2023 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1U4J6lt9dxUsjO+bTnaHGwSR2/41oi88KSAM4YsosLc=;
 b=oNHqcziH+LGXzq9wuQUJYwJCoGo7Yg5a/I3H6AcXnFuDAxBlQX9S5cU8dkf7VyYQNPQR
 tBsxzwsRqP0ly43jC3FQAgImr9zuWkX0KGSouYjUng4skq3iq09jEogyTTmij1SeEKgH
 GQbEQHh14MeioTwde4cc9HUkirEgnj549aFmV2mmBFbbZ6PwNmItW7Y2boVTCBlB+4si
 Z8WgBM9c6P2gdVd52gnisGsNjGpmg/lw8iJQgV/9puA0gTjpR8MuGyzmpqR+zI74UBpJ
 xqo6i0b1HlyAfb3+VRd9hOoxJB0Tr1ehpXyFJX5HFrzD12iduVl/zhcKzKNyY/LxjyQ6 yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nceb80gjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:55 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30RCMsB8010399;
 Fri, 27 Jan 2023 12:28:55 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nceb80ghp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:55 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30R1liqR029924;
 Fri, 27 Jan 2023 12:28:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3n87p6ddng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30RCSoWb38338926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Jan 2023 12:28:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D52A220040;
 Fri, 27 Jan 2023 12:28:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8010220043;
 Fri, 27 Jan 2023 12:28:50 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.86.232])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 27 Jan 2023 12:28:50 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 3/4] ppc/pnv/pci: Update PHB5 version register
Date: Fri, 27 Jan 2023 13:28:47 +0100
Message-Id: <20230127122848.550083-4-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127122848.550083-1-fbarrat@linux.ibm.com>
References: <20230127122848.550083-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dzjkNO6Ow9e-k1n9MYha6iaYKUo7_z6B
X-Proofpoint-ORIG-GUID: hoSMD33oe6Nr6ZO071jo4p4H7Udg0E0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_06,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=990 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270113
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Update register value per its P10 DD2 definition.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 761525686e..28d61b96c7 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -214,7 +214,7 @@ struct PnvPhb4PecClass {
 #define PNV_PHB5(obj) \
     OBJECT_CHECK(PnvPhb4, (obj), TYPE_PNV_PHB5)
 
-#define PNV_PHB5_VERSION           0x000000a500000001ull
+#define PNV_PHB5_VERSION           0x000000a500000002ull
 
 #define TYPE_PNV_PHB5_PEC "pnv-phb5-pec"
 #define PNV_PHB5_PEC(obj) \
-- 
2.39.1


