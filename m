Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376894A9E4F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:49:06 +0100 (CET)
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2hk-0004OD-C2
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:49:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG2UW-0000jR-5S; Fri, 04 Feb 2022 12:35:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG2US-00015k-R0; Fri, 04 Feb 2022 12:35:23 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 214G3Dub014069; 
 Fri, 4 Feb 2022 17:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=55DjkahpQd0/bodEeUVZoOpkvbL/32u7+KV4oyb7YgE=;
 b=LvFCf0Y5HyhKGPW7VAs3gKWZq0EcYAQjFdoLLvAhGNKMe3d0xopFWm+X/nuyFEsm65MG
 nMwr4xNagXsKHP3RLTyzLetRqg6mJzQwq+BWDis+S8I0v2Chrkrht40tG8jJdudXOqHH
 /ZEnhVaMEYZ7ONCQGdzauTNMEDWYocaxAfVliKTZKZ0mFOYtRa9yzqu7EwtO6V34c5nj
 ThgwBK27yPJh3+BNCydzRMEZ36V9budNuIlFslpl5Q8imsqd6n7+ZGPgUTr+E/hnUQMn
 l7ETDLScHBT9AqfSND22F9GBwARW1aA8yKKHVA2CZWHI9l1B5HagZxOvVeuiSjlo3HtW 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx2t449-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:43 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 214GUe0I027649;
 Fri, 4 Feb 2022 17:34:42 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx2t443-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:42 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214HSqHb005189;
 Fri, 4 Feb 2022 17:34:41 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 3e0r0pu3v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:41 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214HYe4e31916494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 17:34:40 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F870AE060;
 Fri,  4 Feb 2022 17:34:40 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73D64AE071;
 Fri,  4 Feb 2022 17:34:38 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.79.16])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Feb 2022 17:34:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/10] target/ppc: powerpc_excp improvements [7xx] (8/n)
Date: Fri,  4 Feb 2022 14:34:20 -0300
Message-Id: <20220204173430.1457358-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Td7bnR_6DX99Lc-RmsG2zZMkC6lIQR8p
X-Proofpoint-GUID: nmw38djr7IZXbnYod5iauWq3xpWZayXA
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxlogscore=593 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040097
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series handles the 7xx family: 740, 745, 750, 750cl, 750cx,
750fx, 750gx and 755.

changes from v1:

- add back sc 1 support for pegasos2. I have opened an issue to track
  this: https://gitlab.com/qemu-project/qemu/-/issues/859

v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2022-02/msg00043.html

Fabiano Rosas (10):
  target/ppc: Merge 7x5 and 7x0 exception model IDs
  target/ppc: Introduce powerpc_excp_7xx
  target/ppc: Simplify powerpc_excp_7xx
  target/ppc: 7xx: Machine Check exception cleanup
  target/ppc: 7xx: External interrupt cleanup
  target/ppc: 7xx: Program exception cleanup
  target/ppc: 7xx: System Call exception cleanup
  target/ppc: 7xx: System Reset cleanup
  target/ppc: 7xx: Software TLB cleanup
  target/ppc: 7xx: Set SRRs directly in exception code

 target/ppc/cpu-qom.h     |   6 +-
 target/ppc/cpu_init.c    |  16 +--
 target/ppc/excp_helper.c | 207 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 216 insertions(+), 13 deletions(-)

-- 
2.34.1


