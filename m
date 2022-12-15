Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DEE64E02D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 19:03:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5sYq-0001o1-FF; Thu, 15 Dec 2022 13:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5sYn-0001mv-6H
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 13:02:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p5sYj-0000PX-V7
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 13:02:20 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFHTKNw017039
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 18:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=9/lhQtndSudJjmGe4WQpI0N4QveU4zFyU3wOHa1AaHY=;
 b=E6DN5yQSK91c1mw5BqK8Q034oDj4CDOTqxtOKoRlERe5NNZfefJYFqK2x5SR3qXlldIv
 8VUQBIhRYZHPqV21W9ztes3+MeJDE3OHJGEoFrlg7gFEH10mNm49eTvqqRXENYVlrKJF
 IlQUI8FKUW0uIWWqJLWBMNNx7FKAqfUZbqDlHMD+GT6+4+QnEXGBIJgmsjtofhkUDR17
 tcvw7iZtpYlzRzDUXpyyf3uXeo2d01kjAvyWikxAf7iP34V5wFBIiU+v/kuLJcs69lbZ
 1drtcfeqOxQeWUmDFhuBLJ6jRAULszNnud/fKeLy5b3kO5caXdzLvTbgOePySC4YnD4n 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg8118p9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 18:02:13 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BFHUEG0019991
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 18:02:13 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg8118p8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 18:02:12 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFGvOdi005800;
 Thu, 15 Dec 2022 18:02:11 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3mf00wvnyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 18:02:11 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BFI2ALR44433862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Dec 2022 18:02:11 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C897658060;
 Thu, 15 Dec 2022 18:02:10 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 213B05805E;
 Thu, 15 Dec 2022 18:02:10 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.9.130])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 15 Dec 2022 18:02:09 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 0/2] tpm: add mssim backend
Date: Thu, 15 Dec 2022 13:01:23 -0500
Message-Id: <20221215180125.24632-1-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 47JItx0jzif_5idAPZFLdWbPUg8oWtDn
X-Proofpoint-ORIG-GUID: tJziwhe40z228OLH16xGb7i6-XpJeY92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_10,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxlogscore=494 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150149
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: James Bottomley <James.Bottomley@HansenPartnership.com>

The requested feedback was to convert the tpmdev handler to being json
based, which requires rethreading all the backends.  The good news is
this reduced quite a bit of code (especially as I converted it to
error_fatal handling as well, which removes the return status
threading).  The bad news is I can't test any of the conversions.
swtpm still isn't building on opensuse and, apparently, passthrough
doesn't like my native TPM because it doesn't allow cancellation.

James

---

James Bottomley (2):
  tpm: convert tpmdev options processing to new visitor format
  tpm: add backend for mssim

 MAINTAINERS                    |   5 +
 backends/tpm/Kconfig           |   5 +
 backends/tpm/meson.build       |   1 +
 backends/tpm/tpm_emulator.c    |  35 ++---
 backends/tpm/tpm_mssim.c       | 251 +++++++++++++++++++++++++++++++++
 backends/tpm/tpm_mssim.h       |  43 ++++++
 backends/tpm/tpm_passthrough.c |  37 ++---
 include/sysemu/tpm.h           |   2 +-
 include/sysemu/tpm_backend.h   |   2 +-
 monitor/hmp-cmds.c             |  11 +-
 qapi/tpm.json                  |  37 ++---
 softmmu/tpm.c                  |  84 +++++------
 softmmu/vl.c                   |   4 +-
 13 files changed, 398 insertions(+), 119 deletions(-)
 create mode 100644 backends/tpm/tpm_mssim.c
 create mode 100644 backends/tpm/tpm_mssim.h

-- 
2.35.3


