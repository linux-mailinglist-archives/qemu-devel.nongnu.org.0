Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A144D4DA5
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:53:44 +0100 (CET)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSL6l-00051C-CM
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:53:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nSL4R-0002NT-1g; Thu, 10 Mar 2022 10:51:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nSL4P-0006ts-8s; Thu, 10 Mar 2022 10:51:18 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AEi8WF020256; 
 Thu, 10 Mar 2022 15:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QX5aDZVyQ1HsHIDhxcxGoyekaXxtsN1bLJdjKUES84g=;
 b=I3dK9DnffxjNyWI5pKJgDCYPfZwXAXw1r4ANJ2CjG/pl0iOXeFpCEJZV0ygkeSyg4qdq
 /KBW7Z1OLEdkF/rFQdjsxDssvBoCwQVwLNk0XL1IR9KPXfDT7A9bWdp2gJiLF45iYJpj
 e4OVR/vQUu93bcgm56gIjqgCycwLLQju2pw1osJ6ytLcHBDG5dkp3Y7VUrFy3rtejCue
 hNclMbW8dzcBem6wlHx7Rc6gXWjrAxZHOmTmePodLsAAjePJ1IErACIGvwXKjkgSurx3
 IMS+Vb7NAo8RZCnA9Vuac8pae3W89nBRZXAVfKYNuorPNLKJcHjo3XtzdHN50lIPIjPm 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqf3n7sqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:07 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AEJs8Z000705;
 Thu, 10 Mar 2022 15:51:06 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqf3n7sq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:06 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AFe3Yc021768;
 Thu, 10 Mar 2022 15:51:04 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3enqgnqnad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AFp2PO16580870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 15:51:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE94952051;
 Thu, 10 Mar 2022 15:51:01 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AA6415204F;
 Thu, 10 Mar 2022 15:51:01 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/3] Fix user-created PHB devices on POWER10
Date: Thu, 10 Mar 2022 16:50:58 +0100
Message-Id: <20220310155101.294568-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7v8KeLo3EjYk7MifBJ5Avrf7Iskuz_ri
X-Proofpoint-GUID: ybuy_3UNJlfGZrLIxoJBT-KAnqjFMVme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_06,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=697 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A short series to fix creating PHB devices and root ports on the newly
merged powernv10 machine.


Frederic Barrat (3):
  ppc/pnv: Introduce a pnv-phb5 device to match root port
  ppc/pnv: Fixes for user-created pnv-phb5 devices
  ppc/pnv: Fix PEC lookup function for POWER10

 hw/pci-host/pnv_phb4.c         | 12 +++++++++---
 hw/pci-host/pnv_phb4_pec.c     |  9 +++++----
 hw/ppc/pnv.c                   | 20 +++++++++++++++++---
 include/hw/pci-host/pnv_phb4.h |  5 +++++
 include/hw/ppc/pnv.h           |  1 +
 5 files changed, 37 insertions(+), 10 deletions(-)

-- 
2.35.1


