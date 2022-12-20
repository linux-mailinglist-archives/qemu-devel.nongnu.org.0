Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A326519F6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 05:25:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7UAl-0000dX-7G; Mon, 19 Dec 2022 23:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1p7UAh-0000cn-P7; Mon, 19 Dec 2022 23:24:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1p7UAf-0002hk-QF; Mon, 19 Dec 2022 23:24:07 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BK4DWjZ022272; Tue, 20 Dec 2022 04:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=kIEH62DZBiGMCv1SgVaFje3UY0YXnfUzvQ8MeyHswrc=;
 b=BxPSLyDCBgRMIuHomW7A2230nuNrE+JewunYKlOB05DltTAz61V7vtdXwOCWUFNP60dr
 hEVU4eemU3d7bStX5hfgLdQ1Jkoe64izWg9lP8erPMm2yxJshDKbb67iUm/1rMUZqQ1S
 sxHqzilvy0oxJutVtsBU4Zj39OUMEfYX6R2qKP3qiIq9bTKfRj60C7uoGd2t9c5CZXlv
 yU5CNHYeluFBq0mTXxEB57PiRz6JUY67GmBZ7+uxCicNGJ7mDsIi/Yh0X8OQ3JTgc284
 ow6IYgtQj8Eue+YDuyv8beWuLFmYWAjSJSk7LhySMZbb57zYVmj6racGbvDzDlhFUCYv hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mk5u7g66w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 04:23:48 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BK4Drus023552;
 Tue, 20 Dec 2022 04:23:48 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mk5u7g66g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 04:23:48 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJLc7Am018987;
 Tue, 20 Dec 2022 04:23:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mh6ywkdy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 04:23:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BK4NiRY49152488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Dec 2022 04:23:44 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F47720040;
 Tue, 20 Dec 2022 04:23:44 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9788C20043;
 Tue, 20 Dec 2022 04:23:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 20 Dec 2022 04:23:43 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 14B33604A5;
 Tue, 20 Dec 2022 15:23:39 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org,
 victor.colombo@eldorado.org.br,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>
Subject: [PATCH v3 0/2] target/ppc: Implement Dynamic Execution Control
 Registers
Date: Tue, 20 Dec 2022 04:23:28 +0000
Message-Id: <20221220042330.2387944-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4MaWu_I_PtO2MAuS2XtjLgpVhKKqmi3-
X-Proofpoint-ORIG-GUID: i08S-YMJVsZn7A4G9C-YbTT4MYiZbrcO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_05,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=485 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212200034
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=nicholas@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Implements the Dynamic Execution Control Register (DEXCR) and the
Hypervisor Dynamic Execution Control Register (HDEXCR) in TCG as
defined in Power ISA 3.1B. Only aspects 5 (Non-privileged hash instruction
enable) and 6 (Privileged hash instruction enable) have architectural
effects. Other aspects can be manipulated but have no effect on execution.

Adds checks to these registers in the hashst and hashchk instructions so
that they are executed as nops when not enabled.

There is currently an RFC for the kernel interface for the DEXCR on the 
Linux PPC mailing list:
https://lore.kernel.org/linuxppc-dev/20221128024458.46121-1-bgray@linux.ibm.com/

v3:
 - Fix typos

v2:
 - Clearing of upper 32 bits of userspace registers is now performed on 
   register read rather than register write. 

Nicholas Miehlbradt (2):
  target/ppc: Implement the DEXCR and HDEXCR
  target/ppc: Check DEXCR on hash{st, chk} instructions

 target/ppc/cpu.h         | 19 +++++++++++++
 target/ppc/cpu_init.c    | 25 +++++++++++++++++
 target/ppc/excp_helper.c | 58 +++++++++++++++++++++++++++++-----------
 target/ppc/spr_common.h  |  1 +
 target/ppc/translate.c   | 19 +++++++++++++
 5 files changed, 107 insertions(+), 15 deletions(-)

-- 
2.34.1


