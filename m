Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3C485A2A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:43:41 +0100 (CET)
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5D8G-0005FD-BF
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:43:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5V-0002dJ-Sk; Wed, 05 Jan 2022 15:40:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5T-0000LS-RB; Wed, 05 Jan 2022 15:40:49 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205KLQTj015140; 
 Wed, 5 Jan 2022 20:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=vC0dW55ikpi0vidFH5gE3AMbFxOywvKP3CXrBhKYrlE=;
 b=V5fjTYXIkdX093K6yiKyrlw8cDhel/BgQaeyb/PaSIRJPkkIiYdDeaup1JcY1nwj0Py3
 d7sZthsewTvYHIdenVnpjIRXmTpWFNqS/bnafNHS+S0IxFlB91K/1VSfP0QjmFhW0pwS
 aVRHP+kNBwy94KAw+hCr56OwzMqtr+bdE6vbgDgn7MJHBunuynyHAq6HNtmJP6TddYcg
 N9tAmr8cNbEvTtxKUGKAmBNj8UdJTkY8dMcrb0xzlV+RubW2G2FT9dGySvwEDP5VqEYT
 HWT2GdLaiN2ytJDj2wqExauRyz2TpU5zu5mffv40eVoIMSVIE+2hci0SjY5NGfFRQoOy sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp4tnmp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:40 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 205KdoXd007700;
 Wed, 5 Jan 2022 20:40:39 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp4tnmnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:39 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205KV88A032673;
 Wed, 5 Jan 2022 20:40:38 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3daekb5u1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:38 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205Keb8H33423798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 20:40:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BC9C78070;
 Wed,  5 Jan 2022 20:40:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D849B78069;
 Wed,  5 Jan 2022 20:40:35 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.200])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 20:40:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] target/ppc: powerpc_excp improvements (2/n)
Date: Wed,  5 Jan 2022 17:40:22 -0300
Message-Id: <20220105204029.4058500-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: unnK0cuVCE9udqnmdWDu31GBKgxot-gT
X-Proofpoint-GUID: t_34HazxVjMORsiLNcV5siJMVSzsq4N2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 mlxlogscore=443 lowpriorityscore=0 mlxscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050133
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is version two of the second batch of cleanups to powerpc_excp. I
have started using powerpc_excp_name for the unimplemented messages,
solved the POWERPC_EXCP_970 conundrum by ignoring it and left AIL and
ILE separated because that can be done in the Book3S series where it
will make more sense.

- patch 1,2: unchanged;

- patch 3: group unimplemented messages and use powerpc_excp_name;

- patch 4: add HV support to ppc_interrupts_little_endian but now
           check has_hv_mode in case anyone passes hv=true by mistake;

- patch 5: add MSR_ILE support to ppc_interrupts_little_endian, this
           avoids having to check excp_model in the next patch;

- patch 6: use ppc_interrupts_little_endian in powerpc_excp but this
           time not only for >= 970, but for all CPUs;

- patch 7: unchanged.

this series v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2022-01/msg00054.html

RFC v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-06/msg00026.html

RFC v2:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-12/msg00542.html

Cleanups 1/n [already merged]:
https://mail.gnu.org/archive/html/qemu-ppc/2021-12/msg00696.html

Fabiano Rosas (7):
  target/ppc: powerpc_excp: Extract software TLB logging into a function
  target/ppc: powerpc_excp: Keep 60x soft MMU logs active
  target/ppc: powerpc_excp: Group unimplemented exceptions
  target/ppc: Add HV support to ppc_interrupts_little_endian
  target/ppc: Add MSR_ILE support to ppc_interrupts_little_endian
  target/ppc: Use ppc_interrupts_little_endian in powerpc_excp
  target/ppc: Introduce a wrapper for powerpc_excp

 target/ppc/arch_dump.c   |   2 +-
 target/ppc/cpu.h         |  25 ++++--
 target/ppc/excp_helper.c | 184 ++++++++++++---------------------------
 3 files changed, 74 insertions(+), 137 deletions(-)

-- 
2.33.1


