Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A367E532
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:30:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNqw-0005tN-M8; Fri, 27 Jan 2023 07:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pLNqp-0005rZ-98; Fri, 27 Jan 2023 07:29:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pLNqn-0003cc-9S; Fri, 27 Jan 2023 07:29:02 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RBEDHA013225; Fri, 27 Jan 2023 12:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lan4ipuQ3fR8bUmGAHYDEZUgOZwqyoBneiZ1Qo9jQX4=;
 b=OVw6ywCCDDfJpQC+Rx+425eJG+aaB/JG4gi4GX/UgcxGj6fEU7J+kuluSltFIRrmXkaL
 UlzYEpHrY0raqP9X8RxkUqkFKGk71g73K85ksB/aihTuxjjIvRMah6SOaKYLSfGoG0Ye
 98H1Ujy8+Q8vtSYosnxjS0H2wHIcxnhrbgqm1du19jppYQ5w0DAk3nHzZ1eTI5Nj8SnZ
 lFISmMaypLzaHVTPdIWtMUuBu+LRhFV7ZBI+/A2r98K6IXNPWVLZUhQNnRmniTqqxHnx
 ZSNmL7lQFaVUGZLtQ4aZH7jwDYZgohgs0R3aWLqmajAxN/pZMGhuMyibDnXzoLOvfoCR 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ncdj7hpgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:55 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30RCOfvt010189;
 Fri, 27 Jan 2023 12:28:54 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ncdj7hpg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:54 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30RAd9ZF029852;
 Fri, 27 Jan 2023 12:28:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3n87afdeds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30RCSoOk42467784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Jan 2023 12:28:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2ED020043;
 Fri, 27 Jan 2023 12:28:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E08020049;
 Fri, 27 Jan 2023 12:28:49 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.86.232])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 27 Jan 2023 12:28:49 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/4] ppc/pnv/pci: Cleanup PnvPHBPecState structure
Date: Fri, 27 Jan 2023 13:28:45 +0100
Message-Id: <20230127122848.550083-2-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127122848.550083-1-fbarrat@linux.ibm.com>
References: <20230127122848.550083-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h07Wj-xyapwdhL5jgbJJN0f9jWJNBZMc
X-Proofpoint-ORIG-GUID: MUZsQl1YJ3Ol4ln-2pIgmzt7qyLLpa-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_06,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 mlxlogscore=862
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Remove unused structure member 'system_memory'.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 1f3237c9d5..17aef08f91 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -173,8 +173,6 @@ struct PnvPhb4PecState {
     uint32_t index;
     uint32_t chip_id;
 
-    MemoryRegion *system_memory;
-
     /* Nest registers, excuding per-stack */
 #define PHB4_PEC_NEST_REGS_COUNT    0xf
     uint64_t nest_regs[PHB4_PEC_NEST_REGS_COUNT];
-- 
2.39.1


