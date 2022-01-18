Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84368492E7A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:28:49 +0100 (CET)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9u9v-0003ix-70
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:28:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9tTy-0005jd-AW; Tue, 18 Jan 2022 13:45:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9tTu-0002z3-AT; Tue, 18 Jan 2022 13:45:24 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IITXwo020041; 
 Tue, 18 Jan 2022 18:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=IC1exdChWWOB8KLwPTSv3s4eFPu5o3RBQv36mDQeaMc=;
 b=dhiaWmErsfiIAW5O94X32KZ6KzDKWbFAe/KgRhB4778Gh0+6FvFI849o4mcl8V8NUmlj
 pwCeaaMJhEMeBWc4xLHqqjc6aLaLP802jW0bPPTqcQpaJHqyIQH5j8cbXc50y0/vI3G5
 P3S94RikwkwqUzDIphX+dSMrpryidvE38YX/G7J8lx9na6FWYYC4iD78b6FMI3G0zLR1
 lWcdjltmqLj5QcurQEFbHW5W8cA+SJF+EttYUTNtvZyRXSxT18NiRH9i1I4/nnkL1r6B
 PGMnrrtV5R3JNeiNS88pJ52EV7xkHodbgA1Lu+MOOH7LY0MRxvWzpIJ0k9zK8wWXfBvB tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dp2vc0gcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:44:59 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20IIixVd016412;
 Tue, 18 Jan 2022 18:44:59 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dp2vc0gc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:44:59 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20IIbt83000930;
 Tue, 18 Jan 2022 18:44:58 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3dknwaqry3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:44:57 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20IIiu2U28836348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 18:44:56 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA798AE06D;
 Tue, 18 Jan 2022 18:44:56 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F34CAE05F;
 Tue, 18 Jan 2022 18:44:54 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.109.91])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jan 2022 18:44:53 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/14] target/ppc: powerpc_excp improvements [40x] (3/n)
Date: Tue, 18 Jan 2022 15:44:34 -0300
Message-Id: <20220118184448.852996-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: heKVozQNJiTAdo_nFaAN9bP8lcEJ0nGB
X-Proofpoint-ORIG-GUID: hgX0uhv_sySdrYZLP2sorx1ml5LimS3M
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_05,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=728
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

changes from v1:

- New patch that renames MSR_POW to MSR_WE for the 405.

- New patch that adds just MSR_ME to the msr_mask.

- New patches to cleanup exceptions I missed the first time around.

- Dropped the patch that added all the missing MSR bits. We have an
  issue when two different MSR bits share the same number in different
  CPUs. Described in v1 here:

  https://lists.nongnu.org/archive/html/qemu-ppc/2022-01/msg00503.html

- Dropped the patch that adds missing exception vectors because Linux
  clearly cannot handle them. And I don't have access to real hardware
  to confirm some of the questions raised, so let's keep things as they
  are.

- Kept the split in two patches. One that copies powerpc_excp_legacy
  and other that does the changes.

Based on legoater/ppc-7.0

With only the fixes from the above branch, the ref405ep machine boots
until the shell. This series doesn't change that.

v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2022-01/msg00300.html

Fabiano Rosas (14):
  target/ppc: 405: Rename MSR_POW to MSR_WE
  target/ppc: 405: Add missing MSR_ME bit
  target/ppc: Introduce powerpc_excp_40x
  target/ppc: Simplify powerpc_excp_40x
  target/ppc: 405: Critical exceptions cleanup
  target/ppc: 405: Machine check exception cleanup
  target/ppc: 405: External exception cleanup
  target/ppc: 405: System call exception cleanup
  target/ppc: 405: Alignment exception cleanup
  target/ppc: 405: Debug exception cleanup
  target/ppc: 405: Data Storage exception cleanup
  target/ppc: 405: Instruction storage interrupt cleanup
  target/ppc: 405: Program exception cleanup
  target/ppc: 405: Watchdog timer exception cleanup

 target/ppc/cpu.h         |   1 +
 target/ppc/cpu_init.c    |   3 +-
 target/ppc/excp_helper.c | 159 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 161 insertions(+), 2 deletions(-)

-- 
2.33.1


