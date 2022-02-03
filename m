Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0974A90D0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 23:47:41 +0100 (CET)
Received: from localhost ([::1]:55588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFktA-0003iL-AB
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 17:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkon-0000aH-Ib; Thu, 03 Feb 2022 17:43:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2652
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkol-0004TJ-86; Thu, 03 Feb 2022 17:43:09 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213MYfnb023191; 
 Thu, 3 Feb 2022 22:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Gzd2gTttFMD3hKytD1Ugt1BVq+DiGyZVQ5QRdjDfyQk=;
 b=hhjhJWHwQ1JTuYGmZDaxyu3vFelGJ7K78Q73h22wdyzuyefiZiMfCk4tzYcMrUkopwa+
 9ZBObDfjh42PsO8+cGx2yqH5useS/aQF5cl8WRundDJkq9SZZe/LvFTcmqLCqpFhMaov
 xOsBDEJE6CDSE5fUO8lpBS1mIF9vEa8GDRETQ8aBk2NRR8asZMIz0agnofnEH58rHQhl
 Y9jlGK37y2+uxtGAz0bgz8ghQ9EiaaWmXnTiZv+6sVfTVIf1mAgwycWI0CtT7E7MiV+p
 yhh8Pz62yh2MFCl3zOVTKbQk+wZ51xm6/bk1mOUphPQtoorozzeA7cE6C1WowKF0agxQ 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qyb847r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:42:54 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213MZU5m025627;
 Thu, 3 Feb 2022 22:42:54 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qyb847n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:42:54 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213MgYKX011964;
 Thu, 3 Feb 2022 22:42:53 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3e0r0jr2m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:42:53 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213Mgqhp14549260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 22:42:52 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA3D5BE056;
 Thu,  3 Feb 2022 22:42:52 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DED1BE04F;
 Thu,  3 Feb 2022 22:42:51 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.67.28])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 22:42:50 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] target/ppc: powerpc_excp improvements [7xx] (8/n)
Date: Thu,  3 Feb 2022 19:42:36 -0300
Message-Id: <20220203224246.1446652-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uTZJLX8p_FeZh5IMEN0oGuRsWMLVZEHd
X-Proofpoint-GUID: fGvjJuhTOQW0mmbDAqhjmMen09pyz-Bh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 phishscore=0 mlxlogscore=442 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030135
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

This series handles the 7xx family: 740, 745, 750, 750cl, 750cx,
750fx, 750gx and 755.

Fabiano Rosas (10):
  target/ppc: Merge 7x5 and 7x0 exception model IDs
  target/ppc: Introduce powerpc_excp_7xx
  target/ppc: Simplify powerpc_excp_7xx
  target/ppc: 7xx: Machine Check exception cleanup
  target/ppc: 7xx: External interrupt cleanup
  target/ppc: 7xx: Program exception cleanup
  target/ppc: 7xx: System Call exception cleanup
  target/ppc: 7xx: System Reset cleanup
  target/ppc: 7xx: Software TLB cleanup
  target/ppc: 7xx: Set SRRs directly in exception code

 target/ppc/cpu-qom.h     |   6 +-
 target/ppc/cpu_init.c    |  16 ++--
 target/ppc/excp_helper.c | 185 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 194 insertions(+), 13 deletions(-)

-- 
2.34.1


