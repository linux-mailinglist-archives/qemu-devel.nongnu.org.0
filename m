Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65D6D17E1
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 08:55:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi8eC-0004M5-RF; Fri, 31 Mar 2023 02:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pi8e9-0004LC-GN; Fri, 31 Mar 2023 02:54:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pi8e7-0007YY-Rf; Fri, 31 Mar 2023 02:54:01 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32V5wYum004545; Fri, 31 Mar 2023 06:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jAKtPrR6qEorUNIzJlAFVAnjsLyuZFj+ARqjS+ny0eY=;
 b=CWOGCU9PLCbDHyzH4NM4yRh49djpiFoWDKh3wKrshWblr2w75psYmcyC3Gtq1QjU9all
 1xyfj0tKAVGSFliRZufyj/VhMLNONdPFt+2d8ecohburwMg5Ph0MKeCvK4KpA1Qjiie9
 axXYPWs9TYFdRjJgjm3KvE1rFcuD+BJbXgUrd16BcKAb2MQ6nAw08oWzTpGj0APN/Xtz
 Q2rYdWjsUyWZNHE9mdo5J7Pt1dTYjd445vD/pjYgw+NKl+e6ckRUEUB9H6frFw7ubAYl
 zNBqQ2t+7HzldtGzOFBrNaOFRsXteQIfJE17zs8wAq2f40pcdZjCUrcsILGfd7AyVAKa iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnkvryx70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:53:56 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32V6jObh029144;
 Fri, 31 Mar 2023 06:53:55 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnkvryx6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:53:55 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32V1I3Ic013053;
 Fri, 31 Mar 2023 06:53:53 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3phr7fph6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 06:53:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32V6rp0d36438420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Mar 2023 06:53:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F00420040;
 Fri, 31 Mar 2023 06:53:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0A172004B;
 Fri, 31 Mar 2023 06:53:49 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com.com (unknown
 [9.43.10.55]) by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 31 Mar 2023 06:53:49 +0000 (GMT)
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
Subject: [PATCH 0/5] Cleanup [h_enter|spapr_exit]_nested routines
Date: Fri, 31 Mar 2023 12:23:39 +0530
Message-Id: <20230331065344.112341-1-harshpb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A7-quwqldQXqPa20h0OuNNRvr0iqPXWV
X-Proofpoint-ORIG-GUID: wJiTT0V_WtzRQImyFdJ-o3HS-4ZnNybF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_02,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 impostorscore=0
 mlxlogscore=304 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303310053
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset introduces helper routines to enable (and does) cleaning
up of h_enter_nested() and spapr_exit_nested() routines in existing api
for nested virtualization on Power/SPAPR for better code readability / 
maintenance. No functional changes intended with this patchset.

Harsh Prateek Bora (5):
  ppc: spapr: cleanup cr get/store with helper routines.
  ppc: spapr: cleanup h_enter_nested() with helper routines.
  ppc: spapr: assert early rather late in h_enter_nested()
  ppc: spapr: cleanup spapr_exit_nested() with helper routines.
  MAINTAINERS: Adding myself in the list for ppc/spapr

 MAINTAINERS          |   1 +
 hw/ppc/spapr_hcall.c | 251 ++++++++++++++++++++++++-------------------
 target/ppc/cpu.c     |  17 +++
 target/ppc/cpu.h     |   2 +
 4 files changed, 161 insertions(+), 110 deletions(-)

-- 
2.31.1


