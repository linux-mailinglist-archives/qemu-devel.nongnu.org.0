Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DCF6F54E4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:37:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8ur-00064g-Eg; Wed, 03 May 2023 05:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pu8up-00064I-OP; Wed, 03 May 2023 05:36:51 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pu8uo-0008D1-AR; Wed, 03 May 2023 05:36:51 -0400
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3439SN5i014215; Wed, 3 May 2023 09:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nhrjBwiHPdDuszXaN8fc4YDQ001n7YFaPYVXhsWHv70=;
 b=azwzuFpL2Wi4vxp3VB8w09SO2TIkDhFGGUKwNqtMl/VnNqeS5GBVrgQe/SaoqnowYwc4
 cuHwsBanFJ6/YOALFmGTPU5kRcG+beRNHAjc8So8WNL86oTW+l2UeP8kox7MqOIgfFMY
 VP48WnokjdybIoo7k6Zr1kvv8g0YbVa2+x4pA+5rvDF3W5EOUJwufDeWyMSR9ATWFUqb
 pN0y+knoTMOr5ZMTG0NtCpteIE/fSyZ7AhtyIcIk9kl97i3ZsBNC6omRpvIkEXlhGkoO
 KkhjEXPwv9OX86iXY+q8rtEz/UZCQClm6vtACF9LpNMdj4TAxkyIeDMmL7eVmFNfTqGM 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qbn0jg7sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 09:36:48 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3439XuD4004533;
 Wed, 3 May 2023 09:36:42 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qbn0jg7ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 09:36:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3433Gj2p004357;
 Wed, 3 May 2023 09:36:32 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3q8tv6t3v8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 09:36:32 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3439aUO17733836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 May 2023 09:36:30 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DECD2004F;
 Wed,  3 May 2023 09:36:30 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0A1020043;
 Wed,  3 May 2023 09:36:28 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.in.ibm.com (unknown
 [9.109.242.129])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  3 May 2023 09:36:28 +0000 (GMT)
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, npiggin@gmail.com,
 danielhb413@gmail.com
Subject: [PATCH v3 0/2] Cleanup ppc cr get/set with helper routines
Date: Wed,  3 May 2023 15:06:17 +0530
Message-Id: <20230503093619.2530487-1-harshpb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2yZHJGgXz-LqExdrhgvxlcp0XLxqV95i
X-Proofpoint-ORIG-GUID: _j2NXbbwysC-rNH4S1H4HsWkj4lHeuKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_05,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=489 impostorscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030075
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset introduces helper routines to get/set cr reg for better code
readability / maintenance. No functional changes intended with this patchset.

Changelog:

changes from v2:
 - addressed Nick's review comments
 - holding changes from 2/4, 3/4 for future
changes from v1:
 - addressed Fabiano's review comments
 - folding Reviewed-by tags in patch 1/4, 4/4


*** BLURB HERE ***

Harsh Prateek Bora (2):
  ppc: spapr: cleanup cr get/set with helpers.
  MAINTAINERS: Adding myself in the list for ppc/spapr

 MAINTAINERS               |  1 +
 hw/ppc/spapr_hcall.c      | 18 ++----------------
 linux-user/elfload.c      |  4 +---
 linux-user/ppc/signal.c   |  9 ++-------
 target/ppc/cpu.c          | 17 +++++++++++++++++
 target/ppc/cpu.h          |  2 ++
 target/ppc/gdbstub.c      | 22 ++++------------------
 target/ppc/kvm.c          | 13 ++-----------
 target/ppc/ppc-qmp-cmds.c |  6 +-----
 9 files changed, 32 insertions(+), 60 deletions(-)

-- 
2.31.1


