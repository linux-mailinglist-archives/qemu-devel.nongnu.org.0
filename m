Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74044A8DD7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:33:58 +0100 (CET)
Received: from localhost ([::1]:32860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFinl-0003eL-H4
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:33:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFiQw-0000NL-HJ; Thu, 03 Feb 2022 15:10:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26610
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFiQu-0005i4-5u; Thu, 03 Feb 2022 15:10:22 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213I3T08018203; 
 Thu, 3 Feb 2022 20:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=1z4UGzAmxxEocZHbDx3CG/3UhFbppNhLemXSdu2ZDFQ=;
 b=pXP23S6yHqP/fdhq3NMre1EQzFXhFoQcYCgcbz7zyxOgyTR1MSQL6DNVP5ZzOs5qZ1fN
 cDduX6HC/LmiSjXNiX+YKGWJksJY0VvVnOZYxCdV2FSD6aPEYpnMkZCx2/NbbbYtM0zn
 EHkzeuo2PDHYp07KaPstDWkz+UphPE3gHThyrea7zHvHB+g0f+cftyy04fPL6zHbUBPj
 2mGOroKGNQC+8bEPHzQzZ2BHejTbK9amsexmx/f+srTptOpSmbdkdYM5pY+Dmt4uUpdn
 S0CWJvNMT0N7IvCH1d+JV6mK9tSzHWRLxQ8hseo3oR7OZlal+4MksXG9BVHYLh1N/dIr Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0k3gun39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:07 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213Jdeqk000337;
 Thu, 3 Feb 2022 20:10:06 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0k3gun30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:06 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213K8uKc008291;
 Thu, 3 Feb 2022 20:10:05 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3dvw7dcuc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:05 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213KA4PZ16056724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 20:10:04 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62C10BE065;
 Thu,  3 Feb 2022 20:10:04 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D60D1BE059;
 Thu,  3 Feb 2022 20:10:02 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.67.28])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 20:10:02 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] target/ppc: powerpc_excp improvements [6xx] (7/n)
Date: Thu,  3 Feb 2022 17:09:46 -0300
Message-Id: <20220203200957.1434641-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XtXsVdUQWk7hexUmArwvIWF9ZwXtHF2n
X-Proofpoint-ORIG-GUID: mbAjON593CL2AhT14xuqxHezfmPm3Vjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 spamscore=0 phishscore=0 mlxlogscore=509 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030120
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

This series handles the 6xx family: 603, 604, G2, G2LE, MPC5xx and
MPC8xx.

There is a patch upfront to move them all into the same
POWERPC_EXCP_6xx, but otherwise the rest of the series is pretty much
the same as I have done for the other CPUs.

This was tested with the 604 only. But I'm not too worried because
these 32 bit CPUs are quite similar to one another.

Fabiano Rosas (11):
  target/ppc: Merge exception model IDs for 6xx CPUs
  target/ppc: Introduce powerpc_excp_6xx
  target/ppc: Simplify powerpc_excp_6xx
  target/ppc: 6xx: Critical exception cleanup
  target/ppc: 6xx: Machine Check exception cleanup
  target/ppc: 6xx: External interrupt cleanup
  target/ppc: 6xx: Program exception cleanup
  target/ppc: 6xx: System Call exception cleanup
  target/ppc: 6xx: System Reset interrupt cleanup
  target/ppc: 6xx: Software TLB exceptions cleanup
  target/ppc: 6xx: Set SRRs directly in exception code

 target/ppc/cpu-qom.h     |   8 +-
 target/ppc/cpu_init.c    |  18 ++--
 target/ppc/excp_helper.c | 200 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 208 insertions(+), 18 deletions(-)

-- 
2.34.1


