Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B624838B3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:09:53 +0100 (CET)
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4VWZ-0006t0-Fo
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VUt-0004P3-2s; Mon, 03 Jan 2022 17:08:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26100
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VUr-0001zv-8U; Mon, 03 Jan 2022 17:08:06 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203JCmor001928; 
 Mon, 3 Jan 2022 22:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=oEt8uj+W+hZH/watIh86+SR7v+hQOleGIrDBuvdgjF8=;
 b=pA7uDMK4J2suLU4Ow3ohr9vTil52vkgXJkeIRbx2e//CCKF04VxMgGh+hXMqczd8UROt
 4UpuIvDmM6gbaDaXrf6zjUzb8TeeYbS5mIVrpD2Uqok0RFRysiiYh2+mKQg0tJfDspeP
 /5NJlxjY12Eihf44ha6Ao/pNxrMl3WC3ONAAVrZectwigo8dw8ixSnWhp+uLtF7i++65
 094tNL376wWanRABXQioOlQ+RHkVSeIZj40FoF/bd2nKi8FDOtmCS2F9P/GugM/FwySo
 sIItVUsPicGIJ6qW3tGWj/it1ASpRC/0X/GDEnn95YvskFcfAGkYFKlX/3CR2pnZQ8sm Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dc73tt2eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:07:55 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203M3Y7R016207;
 Mon, 3 Jan 2022 22:07:55 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dc73tt2ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:07:55 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203LvtVe030603;
 Mon, 3 Jan 2022 22:07:54 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 3daek9r96j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:07:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203M7raS14811484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 22:07:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A77C7805E;
 Mon,  3 Jan 2022 22:07:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E177878064;
 Mon,  3 Jan 2022 22:07:51 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.145.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 22:07:51 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] target/ppc: powerpc_excp improvements (2/n)
Date: Mon,  3 Jan 2022 19:07:37 -0300
Message-Id: <20220103220746.3916246-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JWSxIPdLzIMdCKuuwCCIJqHt5Aen7jpY
X-Proofpoint-ORIG-GUID: qTo-tjqC1qHpGqu4pG4IoN7f9EEyCqik
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_09,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=732 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030147
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are the follow up cleanups from the RFC that touch the top level
of powerpc_excp. Applies on top of the 1/n series.

Patches 1-2: extract software TLB debug into a function;

Patch 3: group the "unimplemented" messages;

Patches 4-8: move ILE code into a separate function and put ILE and
             AIL under a BookS conditional;

Patch 9: the powerpc_excp_legacy wrapper. Subsequent patch series will
         be dedicated to splitting one "cpu family" each. I have 40x
         ready and I'm working on 60x.

RFC v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-06/msg00026.html

RFC v2:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-12/msg00542.html

Cleanups 1/n:
https://mail.gnu.org/archive/html/qemu-ppc/2021-12/msg00696.html

Fabiano Rosas (9):
  target/ppc: powerpc_excp: Extract software TLB logging into a function
  target/ppc: powerpc_excp: Keep 60x soft MMU logs active
  target/ppc: powerpc_excp: Group unimplemented exceptions
  target/ppc: Add HV support to ppc_interrupts_little_endian
  target/ppc: Use ppc_interrupts_little_endian in powerpc_excp
  target/ppc: powerpc_excp: Preserve MSR_LE bit
  target/ppc: powerpc_excp: Move ILE setting into a function
  target/ppc: powerpc_excp: Move AIL under a Book3s block
  target/ppc: Introduce a wrapper for powerpc_excp

 target/ppc/arch_dump.c   |   2 +-
 target/ppc/cpu.h         |  21 ++--
 target/ppc/excp_helper.c | 218 ++++++++++++++-------------------------
 3 files changed, 92 insertions(+), 149 deletions(-)

-- 
2.33.1


