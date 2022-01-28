Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A514A03DE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 23:44:47 +0100 (CET)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDZz4-00021Y-Co
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 17:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDZvD-0007WK-2U; Fri, 28 Jan 2022 17:40:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDZvB-0003TB-82; Fri, 28 Jan 2022 17:40:46 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SMcfv9024198; 
 Fri, 28 Jan 2022 22:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8A6BOqWmmWlkC27AJVDEQ4bHmpqeBioikwtdIwH+6Ug=;
 b=FpP5sKl6QsZ6e82cJV6a4YES4xH/WfxaLRlUMRh8KcgF1Zl0p5h0Nq1vStWQgSab65hp
 CqzE7tJOcPk1VYvf9WRf7Ku4A5ltcqb5qdgQJ0X6219Shf/653SSR4Pc9bwrMY1nU0CT
 g0qSlwXzqFuIOsWvW4BipdupiLJ/JcoXdbdE9I2jGRRBgDkTWgni7qP53xi1Qof9pDVA
 RZdBywJpCF4jEilZbeuadVisXAm76HbrEI2yHv3IuzusZaSnqcVj3hYa2+B2MEDECsnU
 TnA2wrnaP89BuFFXeGzTBRuQD+Rf+0m+LzURFrtctB3nlM+1NxbclfJY9PQCHrDxBXq9 LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvs3h09ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:28 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SMeRBX028150;
 Fri, 28 Jan 2022 22:40:27 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvs3h09e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:27 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SMbJGp030125;
 Fri, 28 Jan 2022 22:40:26 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3dt1xccp6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:26 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SMePEO33816856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 22:40:25 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9882478060;
 Fri, 28 Jan 2022 22:40:25 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C63A7805C;
 Fri, 28 Jan 2022 22:40:23 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.66.85])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 22:40:23 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] target/ppc: powerpc_excp improvements [BookE] (6/n)
Date: Fri, 28 Jan 2022 19:40:07 -0300
Message-Id: <20220128224018.1228062-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gXnDFLXUtihl2gHaMlsUgB35GYbrj4HZ
X-Proofpoint-GUID: VMSHQjpNJ54Uod_4Rg0_cK87YS6OtMus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxlogscore=488
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280125
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This series handles the BookE exception code.

Tested the following machines/CPUs:

== bamboo ==
440ep, 460ex, 440-xilinx-w-dfpu

== sam460ex ==
440ep, 460ex, 440-xilinx-w-dfpu

== mpc8544ds ==
e500v1, e500v2

== ppce500 ==
e500mc, e5500, e6500

About the remaining CPUs:

- The 440x4 have been partially removed in the past. I sent a separate
  patch removing what's left of it.

- The 440x5 (440-xilinx) boots with the bamboo machine but it
  segfaults in userspace (also in master).

- The e200 is broken in master due to an assert in _spr_register (the
  DSRR0/1 registers are being registered twice). After fixing that
  QEMU crashes due to lack of IRQ controller (there's a TODO in the
  init_proc_e200).

Fabiano Rosas (11):
  target/ppc: Introduce powerpc_excp_booke
  target/ppc: Simplify powerpc_excp_booke
  target/ppc: booke: Critical exception cleanup
  target/ppc: booke: Machine Check cleanups
  target/ppc: booke: Data Storage exception cleanup
  target/ppc: booke: Instruction storage exception cleanup
  target/ppc: booke: External interrupt cleanup
  target/ppc: booke: Alignment interrupt cleanup
  target/ppc: booke: System Call exception cleanup
  target/ppc: booke: Watchdog Timer interrupt
  target/ppc: booke: System Reset exception cleanup

 target/ppc/excp_helper.c | 228 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 228 insertions(+)

-- 
2.34.1


