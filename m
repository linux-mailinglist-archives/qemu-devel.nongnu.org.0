Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD26489F1A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:22:26 +0100 (CET)
Received: from localhost ([::1]:55722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zJI-0002fr-VT
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:22:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n6zDH-0000Z6-CX; Mon, 10 Jan 2022 13:16:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1526
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n6zDF-0002WA-Lf; Mon, 10 Jan 2022 13:16:11 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AHVMlm018552; 
 Mon, 10 Jan 2022 18:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Pv8BEv0TmTcppR9ANn4XdDGvQM4qCACMS7VAj6OitUc=;
 b=lOm669JN6YnmmFYPwb04CmCZiqhd25VkCJZ2l1l+fS4M4LEku1b5skm/5/+OwPBnb5rn
 pgQ4S+Xd/joF4La8tYKzMdxWuuloHS6xlDMONM8yOylzFCcYWz22mxeiWfeyt418bVyL
 dl10BOrBbNU6Dla9YlakhMgP/ttircSI3cczfDDYvtICqNLvrge0/PdeQbnA92WJd9t2
 f88iCyU15XSzR9Be4i7RQg2gkxUgR+wYOCfei2bPDTU4sR2tSczoy1DTKEcUNK+8RMy9
 E5+K7/IDjEfPqWyaa2cnetweOoBJD4fu+f4kjux8elaLkl3+ei3QQ7oaamH26tSWcfeB yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dfm04sw1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:15:56 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AI0DEP021022;
 Mon, 10 Jan 2022 18:15:55 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dfm04sw1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:15:55 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AI7tgq027844;
 Mon, 10 Jan 2022 18:15:55 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3df289u04d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:15:55 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20AIFr5x12190122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 18:15:54 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E326C7806E;
 Mon, 10 Jan 2022 18:15:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3453478068;
 Mon, 10 Jan 2022 18:15:52 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.79.41])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jan 2022 18:15:51 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] target/ppc: powerpc_excp improvements [40x] (3/n)
Date: Mon, 10 Jan 2022 15:15:38 -0300
Message-Id: <20220110181546.4131853-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: npX2Qo6JP-myUkC7X4v7Wqt3T2s5D8bA
X-Proofpoint-ORIG-GUID: P1rVIhHEOCMHufoysFNll9HXxmiRP7XQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_07,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=811 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100124
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the first series of the exception model-specific changes. I
intend to keep this same structure for the rest of the exception
models.

== preparation ==

First few patches are cleanups specific to this model. This comes
first because I'm using some of these changes to help validate what
should be removed in the subsequent patches.

== new powerpc_excp function ==

One patch copies the powerpc_excp function as is and renames it to the
exception model in question. Doing this first facilitates spotting
what changed from the _legacy version.

The following patch changes everything that needs to be changed at the
top level (MSR mask, SF, ILE, AIL, SRRs, etc.) and removes exceptions
that are not used by this processor family.

== exceptions cleanup ==

After the new powerpc_excp function has been made specific to that one
exception model, go through every exception removing anything that
does not apply to this model.

Based on legoater/ppc-7.0

Cleanups 2/n [in ppc-7.0]:
https://lists.nongnu.org/archive/html/qemu-ppc/2022-01/msg00252.html

Cleanups 1/n [already merged]:
https://mail.gnu.org/archive/html/qemu-ppc/2021-12/msg00696.html

RFC v2:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-12/msg00542.html

RFC v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-06/msg00026.html

Fabiano Rosas (8):
  target/ppc: 405: Add missing MSR bits to msr_mask
  target/ppc: 405: Add missing exception handlers
  target/ppc: Introduce powerpc_excp_40x
  squash target/ppc: Introduce powerpc_excp_40x
  target/ppc: 405: Critical exceptions cleanup
  target/ppc: 405: Machine check exception cleanup
  target/ppc: 405: External exception cleanup
  target/ppc: 405: System call exception cleanup

 target/ppc/cpu_init.c    |   8 +-
 target/ppc/excp_helper.c | 246 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 253 insertions(+), 1 deletion(-)

-- 
2.33.1


