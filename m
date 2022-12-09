Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA9647DA6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 07:15:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3WeO-0006yh-Np; Fri, 09 Dec 2022 01:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1p3WeI-0006xy-Af; Fri, 09 Dec 2022 01:14:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1p3WeC-0005E9-Mw; Fri, 09 Dec 2022 01:14:16 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B94teMl024827; Fri, 9 Dec 2022 06:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=NFD0pSgCx8UWnsBBlQRbDE9Ifqn/Wb/H6nBH5oUH2uU=;
 b=TxvkBs3P78LoNliSeIlZOan/zYvVut9MV9mwXbaAoblACKi+C/3XYk/N7SkQwFfA5MCb
 1hdsFOCWALiAcotlXolUy5grkjLrad9hf8PF7Pn8zgT/5duYATuoCuOhCbaqNl+pXHQW
 s2HiamNv+WCcjqe66r9K5gagGs+b+wxLNGXjP9mNFlBEpf/FZe2ZcIQzqvR2vlZNKWTU
 SOGOuurW9zsuFFGPaL1cgMKgrkSZzOfkaJDUb03lH1dqX7zPLbIet3CL599hNQ5KHXTk
 /7e4VpamZA6xghNxkpe0VFDy3oa+UzCGk4rJsUXoXpd5a7pTAHEcqggBzsU60b9tbXcI LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mbxe2hg5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Dec 2022 06:13:45 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B95vJAW005483;
 Fri, 9 Dec 2022 06:13:45 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mbxe2hg5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Dec 2022 06:13:45 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B8D4t5F018446;
 Fri, 9 Dec 2022 06:13:42 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3m9m7rc0w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Dec 2022 06:13:42 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B96DekV18743958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Dec 2022 06:13:40 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4919A20049;
 Fri,  9 Dec 2022 06:13:40 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C09BD20040;
 Fri,  9 Dec 2022 06:13:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  9 Dec 2022 06:13:39 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 493456010C;
 Fri,  9 Dec 2022 17:13:36 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org,
 victor.colombo@eldorado.org.br, mikey@neuling.org,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>
Subject: [PATCH v2 0/2] target/ppc: Implement Dynamic Execution Control
 Registers
Date: Fri,  9 Dec 2022 06:13:06 +0000
Message-Id: <20221209061308.1735802-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: riunDSpao83WEqLqxftGLHBzlbnK8R8H
X-Proofpoint-GUID: JLeOLb6Pk2ufrmJxm82o5o56WoRIcnI9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_02,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=305 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 mlxscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212090052
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=nicholas@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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


