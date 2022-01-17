Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B749109F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:23:10 +0100 (CET)
Received: from localhost ([::1]:42224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Xav-0005Zh-CH
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:23:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n9XXV-0003GN-En; Mon, 17 Jan 2022 14:19:37 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34572
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n9XXT-00028B-RC; Mon, 17 Jan 2022 14:19:37 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HIurqv029333; 
 Mon, 17 Jan 2022 19:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lNjktyj90lrjoCC270xDkUSLeGb8znAiVOGYMdOjkTk=;
 b=POZywfhab+8bXZcwk47WIawScUXXv1Hcdid5hZBEX531Kq9yb/OaaqL+GLYLhyUDum9s
 +35uFX8RSP57cD7tAtxR42TfTdcgo831Zu9mfGakd1tRg2fON7ZXumGrxiDtHDGyJKm/
 KcO+ihVvGfXJjGcawbgIrn6JIMZqHu2MC6UmyOYJYIoYNJgeK+Ic6TiS1N3dUZdOfnXc
 qS9QEnw+WCPhDCJarUG10RYm9nEuOJmv5klmS8AanQFi9Ssge9rf+lWN2SIHk5+K/vnN
 R856BZFMhA+mAB6gasifz0BMidDq07IQKyDSiEyTtzf3jv+c8FwQSG9Z6DhfJ/BclLgZ tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dne6c8asy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:31 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HJJVUS029384;
 Mon, 17 Jan 2022 19:19:31 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dne6c8ass-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:31 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HJD0mb003858;
 Mon, 17 Jan 2022 19:19:30 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3dknwbc220-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HJJTcJ8061412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 19:19:29 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5912D78067;
 Mon, 17 Jan 2022 19:19:29 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFFBF78060;
 Mon, 17 Jan 2022 19:19:27 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.75.63])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 19:19:27 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 0/3] rSTify ppc-spapr-uv-hcalls.txt.
Date: Mon, 17 Jan 2022 16:19:16 -0300
Message-Id: <cover.1642446868.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0VNcLEPMBYWRv98lKcFOSzUlyVQQ7075
X-Proofpoint-ORIG-GUID: 26ImZKPhMeBxx0r43tvGJqK73CNyi6Yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_07,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=644 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170119
Received-SPF: pass client-ip=148.163.158.5;
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Leonardo Garcia (3):
  rSTify ppc-spapr-uv-hcalls.txt.
  Rename ppc-spapr-uv-hcalls.txt to ppc-spapr-uv-hcalls.rst.
  Link new ppc-spapr-uv-hcalls.rst to pseries.rst.

 docs/specs/ppc-spapr-uv-hcalls.rst | 89 ++++++++++++++++++++++++++++++
 docs/specs/ppc-spapr-uv-hcalls.txt | 76 -------------------------
 docs/system/ppc/pseries.rst        |  6 +-
 3 files changed, 90 insertions(+), 81 deletions(-)
 create mode 100644 docs/specs/ppc-spapr-uv-hcalls.rst
 delete mode 100644 docs/specs/ppc-spapr-uv-hcalls.txt

-- 
2.34.1


