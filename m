Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9596FDC06
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:56:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwhU3-0003AM-E0; Wed, 10 May 2023 06:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pwhU0-00038z-Sp; Wed, 10 May 2023 06:55:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pwhTy-0004mo-Vm; Wed, 10 May 2023 06:55:44 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AASx13004420; Wed, 10 May 2023 10:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2b0JAhbs/n8dPXqqag2asP9vd9m2c+RfZCdaJ1zHiME=;
 b=EzDIQpbZjklH6tWq6T+CxIgjkPvIJkWdOIUibP54litj9QJ04vy5c7ViZWO3B/LmgneN
 iIqLEqOX0s58dSHITJusl+ZhFfJ/LzBzDJgeAJ2Y3z2LdOEcPJQCma2TbIEou85eNX4z
 C5AF3TXLV6ZmmTuAd+S7Y1tlDHYm//VdTzkLDWi0dj4WuHulZZPRawQIKujVvevRFo8q
 irlmlO+VpGstgJRKj6cplak50GMsSXWHWKY5F7WtAHGyb8n7G0k3bdqOWU/WqozslaEV
 EhnX6LQv1Gm2Om3FMUpmyfClcWxVOU7wZPLyHBUzcviytpjPqw1LMIWzvVd2fec4/JDJ DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg95qs7bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 10:55:38 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34AAqTuv025410;
 Wed, 10 May 2023 10:55:37 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qg95qs7b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 10:55:37 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34A1Z4xR029649;
 Wed, 10 May 2023 10:55:35 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qf896s0ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 10:55:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34AAtWSM1507894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 10:55:32 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01B122004D;
 Wed, 10 May 2023 10:55:32 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B52772004B;
 Wed, 10 May 2023 10:55:31 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 May 2023 10:55:31 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, borntraeger@de.ibm.com, nsg@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, pasic@linux.ibm.com,
 mhartmay@linux.ibm.com, thuth@redhat.com
Subject: [PATCH v2 0/1] s390x/pv: Fix spurious warning with asynchronous
 teardown
Date: Wed, 10 May 2023 12:55:30 +0200
Message-Id: <20230510105531.30623-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x9_BnhDwqCTsYJU5sAsykGmGTkhA-Doj
X-Proofpoint-ORIG-GUID: Q5nbcBEICuPBWo3ITs791iY2wq3SLFei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=752 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100083
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kernel commit 292a7d6fca33 ("KVM: s390: pv: fix asynchronous teardown
for small VMs") causes the KVM_PV_ASYNC_CLEANUP_PREPARE ioctl to fail
if the VM is not larger than 2GiB. QEMU would attempt it and fail,
print an error message, and then proceed with a normal teardown.

Avoid attempting to use asynchronous teardown altogether when the VM is
not larger than 2 GiB. This will avoid triggering the error message and
also avoid pointless overhead; normal teardown is fast enough for small
VMs.

v1->v2:
* Use 2GiB as threshold, the same as the kernel [thomas]
* Pass the machine state to s390_pv_vm_try_disable_async instead of
  using qdev_get_machine() [thomas]
* Update and improve patch description and comments

Claudio Imbrenda (1):
  s390x/pv: Fix spurious warning with asynchronous teardown

 hw/s390x/pv.c              | 10 ++++++++--
 hw/s390x/s390-virtio-ccw.c |  2 +-
 include/hw/s390x/pv.h      |  2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.40.1


