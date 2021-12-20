Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211ED47B2BD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:22:09 +0100 (CET)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNIW-0005Gy-81
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNFv-0002Gv-9Y; Mon, 20 Dec 2021 13:19:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8980
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNFt-0006hG-6y; Mon, 20 Dec 2021 13:19:26 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKHYocr005877; 
 Mon, 20 Dec 2021 18:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=RezLp08UB7yQQPwIgJoG3qhc5JJMXU2S9dDSaWabimI=;
 b=LmBdmuIs69nJWVtGj42iGrQvSk9r+jPp1IddwA7utK6QgFD3hbHPVMAtd8RRtuEtUMl/
 cL2OLlICsgLZdr2ZLjgO7B1Zx/pmVZmi40hpzBZiIJl17RTd+KIzeVnxmDN6BhldZesO
 3Uf5f+UOPYw++aIuQCnONBbHzm5cmKmzv3N57jQutGaidWJJ5IgcjjZK8V0KHVtyuyv/
 /bfwfsIZ8duDp9TWXsLM6G/tpDqWSIC6JyGOf3hkj6nt7BVtODgPVTJJxqrPgWMbd1H/
 reCpeol6m+Ra3epG8SV+P/DpHb4+Dwr5Hj9L0OqOW4Zbe7c6fAVewAPeQIQhnmkoE45A Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1s0pans9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:17 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKIJHFS024288;
 Mon, 20 Dec 2021 18:19:17 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d1s0panqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:17 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIDdBj017620;
 Mon, 20 Dec 2021 18:19:13 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 3d179ahw2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:12 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJCoU25756098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:12 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 247D2C6055;
 Mon, 20 Dec 2021 18:19:12 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA4FFC6062;
 Mon, 20 Dec 2021 18:19:10 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 00/12] target/ppc: powerpc_excp improvements
Date: Mon, 20 Dec 2021 15:18:51 -0300
Message-Id: <20211220181903.3456898-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cUVBANxfyZ4UTOyTHCTw6UIldPQ6O4Om
X-Proofpoint-ORIG-GUID: UPKcQ7sYcpzP-_GCZOgrJVICaHpSTjRG
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=493 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200101
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This changed a lot since v1, basically what remains is the idea that
we want to have some sort of array of interrupts and some sort of
separation between processors.

At the end of this series we'll have:

- One file with all interrupt implementations (interrupts.c);

- Separate files for each major group of CPUs (book3s, booke,
  32bits). Only interrupt code for now, but we could bring pieces of
  cpu_init into them;

- Four separate interrupt arrays, one for each of the above groups
  plus KVM.

- powerpc_excp calls into the individual files and from there we
  dispatch according to what is available in the interrupts array.

Please comment,

Thanks.

v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-06/msg00026.html

Fabiano Rosas (12):
  target/ppc: powerpc_excp: Set alternate SRRs directly
  target/ppc: powerpc_excp: Set vector earlier
  target/ppc: powerpc_excp: Move system call vectored code together
  target/ppc: powerpc_excp: Stop passing excp_model around
  target/ppc: powerpc_excp: Standardize arguments to interrupt code
  target/ppc: Extract interrupt routines into a new file
  target/ppc: Introduce PPCInterrupt
  target/ppc: Remove unimplemented interrupt code
  target/ppc: Use common code for Hypervisor interrupts
  target/ppc: Split powerpc_excp into book3s, booke and 32 bit
  target/ppc: Create new files for book3s, booke and ppc32 exception
    code
  target/ppc: Do not enable all interrupts when running KVM

 target/ppc/cpu.h         |   2 +
 target/ppc/excp_helper.c | 862 ++-------------------------------------
 target/ppc/interrupts.c  | 521 +++++++++++++++++++++++
 target/ppc/intr-book3s.c | 383 +++++++++++++++++
 target/ppc/intr-booke.c  | 152 +++++++
 target/ppc/intr-ppc32.c  | 159 ++++++++
 target/ppc/meson.build   |   4 +
 target/ppc/ppc_intr.h    |  62 +++
 target/ppc/tcg-stub.c    |   6 +
 9 files changed, 1323 insertions(+), 828 deletions(-)
 create mode 100644 target/ppc/interrupts.c
 create mode 100644 target/ppc/intr-book3s.c
 create mode 100644 target/ppc/intr-booke.c
 create mode 100644 target/ppc/intr-ppc32.c
 create mode 100644 target/ppc/ppc_intr.h

-- 
2.33.1


