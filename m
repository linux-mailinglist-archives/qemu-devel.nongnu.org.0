Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E174641ED
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 00:04:13 +0100 (CET)
Received: from localhost ([::1]:39892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msCAU-0003hK-O0
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 18:04:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1msC8X-00012K-0S; Tue, 30 Nov 2021 18:02:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1msC8U-0000LS-No; Tue, 30 Nov 2021 18:02:08 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AUMHE7v022956; 
 Tue, 30 Nov 2021 23:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=LWMHC3xWOzRtyeHKNeo6rv9O0SHotib7IpZiokyEAPE=;
 b=EYRK6aOQJB373oxVRjWG2c0Iec45i9xKI2CHbiPUJInIA9AhHlqXz29vLqqgDmi42yfX
 7nBTeYPD/+bVkPfo289JV10QHv4N+WdUkvWX4jvdmsmd6/JgWdP6mpDqIklBocifBarU
 idotv7tqbmW6DtXqDDSuA+XMUmvPs94/LfHNSey2aoStIMZXdI/60hyQFONx3/9BEBf+
 d8gsuxvSOrDYAEgmDs/pGGBXxrxV4RBlkz+Tgk1lY6kqSXTrCWaaxLcgY0oIBefOGaCy
 wU9hNks+QZMj4qvZP67P2yPn2DC5L1DhpnHhti6r0RNyMcBHCqDdukbwAT4BpTvyT4hE gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnvm9ruxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:37 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AUMK7VY031818;
 Tue, 30 Nov 2021 23:01:36 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnvm9ruxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:36 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AUMmbZH001059;
 Tue, 30 Nov 2021 23:01:35 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3ckcac1chs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:35 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AUN1W2j57541080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 23:01:32 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E5A7BE053;
 Tue, 30 Nov 2021 23:01:32 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01A26BE051;
 Tue, 30 Nov 2021 23:01:29 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.34.87])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Nov 2021 23:01:29 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/4] QEMU/openbios: PPC Software TLB support in the G4
 family
Date: Tue, 30 Nov 2021 20:01:19 -0300
Message-Id: <20211130230123.781844-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 83sh47A7njXSleU8UpktXrc2x0i4eOoE
X-Proofpoint-GUID: zScXhcl0JzTGHS-501G4KM17ZeMFR45Y
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=570 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111300112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, clg@kaod.org,
 openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

Recap:

- QEMU enables 7450 SW TLB search by default;
- OpenBIOS does not know about SW TLB (vectors 0x1000, 0x1100, 0x1200);
- OpenBIOS does not know about 7450s PVRs.

Proposed solutions:

a) find another firmware/guest OS code that supports the feature;

b) implement the switching of the feature in QEMU and have the guest
code enable it only when supported. That would take some fiddling with
the MMU code to: merge POWERPC_MMU_SOFT_74xx into POWERPC_MMU_32B,
check the HID0[STEN] bit, figure out how to switch from HW TLB miss to
SW TLB miss on demand, block access to the TLBMISS register (and
others) when the feature is off, and so on;

c) leave the feature enabled in QEMU and implement the software TLB
miss handlers in openbios. The UM provides sample code, so this is
easy;

d) remove support for software TLB search for the 7450 family and
switch the cpus to the POWERPC_MMU_32B model. This is by far the
easiest solution, but could cause problems for any (which?) guest OS
code that actually uses the feature. All of the existing code for the
POWERPC_MMU_SOFT_74xx MMU model would probably be removed since it
would be dead code then;

v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00289.html

v2:

This series corresponds to option d) above.

- patch 1 moves all of the 7450 CPUs* into the POWERPC_MMU_32B MMU
  model, which does the same as the POWERPC_MMU_SOFT_74xx minus the
  software TLB handling. It also removes the instructions (tlbld, tlbli)
  and SPRs (TLBMISS, PTEHI, PTELO) from the 7450s as these facilities
  are only used along with the software TLB.

  *- except for 7448, which is seen by QEMU as a 7400.

- patch 2 removes the instructions and SPRs just like above, but from
  the e600 CPU. The e600 already uses the POWERPC_MMU_32B MMU model,
  so it already has software TLB disabled.

- patch 3 removes all of the now dead code for the 74xx software
  TLB. I left a note in the code with keywords to help with grep in
  case people search for the feature in the future.

- patch 4 adds smoke tests for all of the 74xx CPUs. These are broken
  pending the OpenBIOS patch.

For OpenBIOS:

We'd need to merge the patch 2/2 from the previous series:

https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00290.html
Message ID: 20211119134431.406753-3-farosas@linux.ibm.com

this is just for the new PVRs. There is no need to add the handlers.

Thanks!

Fabiano Rosas (4):
  target/ppc: Disable software TLB for the 7450 family
  target/ppc: Disable unused facilities in the e600 CPU
  target/ppc: Remove the software TLB model of 7450 CPUs
  tests/avocado: ppc: Add smoke tests for MPC7400 and MPC7450 families

 target/ppc/cpu-qom.h      |   6 +-
 target/ppc/cpu.h          |   4 +-
 target/ppc/cpu_init.c     |  57 ++++--------------
 target/ppc/excp_helper.c  |  29 ---------
 target/ppc/helper.h       |   2 -
 target/ppc/mmu_common.c   |  19 ------
 target/ppc/mmu_helper.c   |  31 ----------
 target/ppc/translate.c    |  26 --------
 tests/avocado/ppc_74xx.py | 123 ++++++++++++++++++++++++++++++++++++++
 9 files changed, 140 insertions(+), 157 deletions(-)
 create mode 100644 tests/avocado/ppc_74xx.py

-- 
2.33.1


