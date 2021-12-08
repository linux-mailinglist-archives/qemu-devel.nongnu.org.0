Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACCC46D938
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 18:06:28 +0100 (CET)
Received: from localhost ([::1]:50344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0Oh-0005h5-PA
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 12:06:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mv0In-0005on-H7; Wed, 08 Dec 2021 12:00:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mv0Ig-0001tS-U7; Wed, 08 Dec 2021 12:00:17 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8Gqu0s027617; 
 Wed, 8 Dec 2021 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=0PnNtQtF46XxJSnGI46PDucFqF6Kqv1xWtvnnHmpZh8=;
 b=f2sEKxdPfbEZwDbZBWCFUn0aA9WB+4rSDbTw4sPm6DzrxYEexdtRf6Lzg4mjEI1aGgEF
 a9oMws9cZPeSGhwmxN+QFEpzH9K5oyAsCrdWWp905FraAzSA3TmIZQgSofal+Dsy81IQ
 /ti+ioaCGZdha6KRm+YTpUUz/MQnF57L6KuvjAWbqqMoAy35eQRr1QhY4hxguKdl6LSm
 xFlAwLUZN3zCewt9wl1/osFX7qXSjWJsD7ZZdX5HBM3j7I/Mcq1YOGNf5ugTz2ZviLJb
 v1Au/Z+hurk0qpec0uBSqVf/IfzjgtfbLIQaRf8VqGJnLy+cgRCPFJSQV1Elnpi/70qt OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu0m983en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:05 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8GvPMt003426;
 Wed, 8 Dec 2021 17:00:05 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu0m983dm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:05 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8GwuIl029463;
 Wed, 8 Dec 2021 17:00:03 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3cqyyb6ec0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8H02Oi19661068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 17:00:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B50B9C6062;
 Wed,  8 Dec 2021 17:00:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C892C6073;
 Wed,  8 Dec 2021 17:00:01 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.76.184])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 17:00:00 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 0/3] docs: rSTify ppc-spapr-hcalls.txt
Date: Wed,  8 Dec 2021 13:59:15 -0300
Message-Id: <cover.1638982480.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3H1ASzqwi1Gt_6OBillHpleq43GVud07
X-Proofpoint-ORIG-GUID: NJbUktYHJsd7EXZkDVSFMlNb_BFxHrna
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=618
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080097
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: danielhb413@gmail.com, groug@kaod.org, qemu-devel@nongnu.org, clg@kaod.org,
 Leonardo Garcia <lagarcia@br.ibm.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Along with this change, hook the new rst file into the pseries
documentation.

Leonardo Garcia (3):
  docs: rSTify ppc-spapr-hcalls.txt
  docs: Rename ppc-spapr-hcalls.txt to ppc-spapr-hcalls.rst.
  Link new ppc-spapr-hcalls.rst file to pseries.rst.

 docs/specs/ppc-spapr-hcalls.rst | 100 ++++++++++++++++++++++++++++++++
 docs/specs/ppc-spapr-hcalls.txt |  78 -------------------------
 docs/system/ppc/pseries.rst     |   2 +-
 3 files changed, 101 insertions(+), 79 deletions(-)
 create mode 100644 docs/specs/ppc-spapr-hcalls.rst
 delete mode 100644 docs/specs/ppc-spapr-hcalls.txt

-- 
2.33.1


