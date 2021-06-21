Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812CF3AEB00
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:17:50 +0200 (CEST)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKkG-00089j-Py
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1lvKhh-0006eP-Lr; Mon, 21 Jun 2021 10:15:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1lvKhf-0003yb-HR; Mon, 21 Jun 2021 10:15:09 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LE3ssC151327; Mon, 21 Jun 2021 10:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=YtMKmOdS89BAIFlXsUwWsCIruUewfQhL7J/MHE30wU0=;
 b=NNaQvqXhuE3pNuRu1Ejid3Cnpnq/syUxyQbjTaCxpAxCgArvMYvG0K7qi7l2ktSOHYAw
 BJ/vrvNt+HnjY5PbBrMpx3XZgFduUC9gJmXQ6EVttgpWu5h/NAo78SWrsK7IASSsPtI0
 kBPzg/NGGO0sAyHNGnH2C+MGIkJYg/SQw3oFPn/7cIdd467zII87zAD2B2QU1ZjzI4AT
 5vfuph/JvWh7ngNUA0EnlJqx6tXbLurmuPnY3sE0dc4c8d98VGKMphMV+rr9jtvJs/IR
 NcJH49M4/WG+baAl5VNz+bUxrrL3X6cIFe442kEY/lD1id13daS9kH6cOO4c48gBHqfP Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39auauaecx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 10:15:04 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LE41ZR151925;
 Mon, 21 Jun 2021 10:15:04 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39auauaecc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 10:15:04 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LECW2b032083;
 Mon, 21 Jun 2021 14:15:03 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 399879bpk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 14:15:03 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LEF2rY10682750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 14:15:02 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6A92112072;
 Mon, 21 Jun 2021 14:15:02 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F967112069;
 Mon, 21 Jun 2021 14:15:02 +0000 (GMT)
Received: from LAPTOP-K4LLPL5U.localdomain (unknown [9.65.229.155])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 14:15:01 +0000 (GMT)
From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] linux-user/s390x: signal with SIGFPE on compare-and-trap
Date: Mon, 21 Jun 2021 10:14:50 -0400
Message-Id: <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TvNzM0XyUCLP-KZH34g54EYG9pye_PHw
X-Proofpoint-ORIG-GUID: PLVu0xtIw9Mp0z6qBP3K42ULKSZumdkG
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_06:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=837
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106210084
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>, iii@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-s390x signals with SIGILL on compare-and-trap instructions. This
breaks OpenJDK which expects SIGFPE in its implementation of implicit
exceptions.

This patch depends on [PATCH v3 0/2] target/s390x: Fix SIGILL psw.addr
reporting.
https://lore.kernel.org/qemu-devel/20210602002210.3144559-1-iii@linux.ibm.com/

Based-on: 20210602002210.3144559-1-iii@linux.ibm.com

Jonathan Albrecht (2):
  linux-user/s390x: signal with SIGFPE on compare-and-trap
  tests/tcg: Test that compare-and-trap raises SIGFPE

 linux-user/s390x/cpu_loop.c     |  19 +++---
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/trap.c          | 100 ++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+), 9 deletions(-)
 create mode 100644 tests/tcg/s390x/trap.c

-- 
2.31.1


