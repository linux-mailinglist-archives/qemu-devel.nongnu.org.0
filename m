Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46636969B4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:33:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD1-0006ZG-I1; Tue, 14 Feb 2023 11:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pRyCe-0006N5-7p; Tue, 14 Feb 2023 11:30:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pRyCc-0001xi-EN; Tue, 14 Feb 2023 11:30:47 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EFERbU008628; Tue, 14 Feb 2023 16:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=rAVHmuADHZAd2WG2wtZGbBWpWp4mrqf5KDJSeF3z7h4=;
 b=GXg07sHMnupWJlSwxdtOOE8lFsAfKR8WCVHjtD5rVUeRmOYbvg9L0TKNtchbTN9iNAZZ
 ZmTj/o26gm3a51/kqpZmLBLhG5YYrTSbqON1NXnXhQMQFKIdOrlcIqdKtWbJ3ujtsubX
 Lt3yivyOJQMLgzZ8m6yL4hZbM+3ExJCcb2yohX4Khz1KkyRgmgpIg3Bx90iubnnC3kEN
 iIO8Cv3SD5In4eTHjPA8CfsluGV3PJbcE+hsZFxU51sLpGTpJJfZkS3ROvt5OIGmYNdM
 smm8x4NLju4uN3z8sdXWupfAqqb58nVLIvuQ7hXnuFYBmXiM22OzhQ+VuIPW/VAOO0Xz Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrb2ne975-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 16:30:42 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EEqeM0027777;
 Tue, 14 Feb 2023 16:30:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrb2ne95k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 16:30:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31E9Esfs012366;
 Tue, 14 Feb 2023 16:30:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3np2n6k53b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 16:30:39 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31EGUanx44106224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 16:30:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DCDF20049;
 Tue, 14 Feb 2023 16:30:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3B1020043;
 Tue, 14 Feb 2023 16:30:35 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Feb 2023 16:30:35 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, pasic@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, seiden@linux.ibm.com
Subject: [PATCH v3 0/2] s390x/pv: Add support for asynchronous teardown for
 reboot
Date: Tue, 14 Feb 2023 17:30:33 +0100
Message-Id: <20230214163035.44104-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5ZgAOivWe58YHVri_Pq2nrnge5RWbIGQ
X-Proofpoint-ORIG-GUID: OPrzSy2fc-clqemrO_QCgUgvoCLYnJsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_11,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 mlxlogscore=780 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302140137
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

The first patch is just a minimal header update to compile the second
patch; it can be safely discarded once the Linux headers are updated to
6.2.

The second patch adds support for asynchronous teardown of protected
guests when rebooting. The existing guest is prepared for asynchronous
teardown, the rebooted guest will be able to continue immediately, while a
background thread actually performs the necessary cleanup.

v2->v3:
* improve description of header updates
* allocate the QemuThread on the stack to avoid leak, and explain why

v1->v2:
* remove useless snprintf and pass the name of the thread directly
* make the name of the thread more understandable

Claudio Imbrenda (2):
  Linux header update
  s390x/pv: Add support for asynchronous teardown for reboot

 hw/s390x/pv.c              | 28 ++++++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c |  5 ++++-
 include/hw/s390x/pv.h      |  2 ++
 linux-headers/linux/kvm.h  |  3 +++
 4 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.39.1


