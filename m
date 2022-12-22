Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8D56543F9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 16:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8NBl-00017e-Ec; Thu, 22 Dec 2022 10:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1p8NBh-00017R-HR
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 10:08:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1p8NBf-00060P-Kl
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 10:08:49 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BMF8Bir009411
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 15:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ycz56TspCEbYiNvHVwk7Wc5zjSmD263s8wOAi65t2OA=;
 b=KdDf9GzGm1o1NSWNMewXI5+bNT2RX6R4RY/0lXQY8FrjykO0xKBC5/ZHoF5i+hdb8QBq
 9lSx+tYrPXGht/U0VGR0gAqpMTOW5GG827NJH1XcfXcUXLs5HehIRRuZ3Z/kDqS5A6yy
 AIrOiUCb9dcoVac5mPwtiBPqU2uuW9zB79dhWffRBh6E+vfE71eJ41ahyL0YL5MtzFQ+
 wJlq63QJ+GYESshMETWqB0ULgzdqstyAMK6k95V8AW8LtpC1X5ldhP0TMZD+ffpzaOQy
 xrmFswi/dy3Q3cU1gWpEl9/5kLb6tSLBYEXOYOJUii3x874r4vYpB3VF4cYIbMr/CLaH Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mms5p8k8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 15:08:27 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BMF8B2D009427
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 15:08:11 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mms5p8jnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 15:08:11 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BMDBjDU014025;
 Thu, 22 Dec 2022 15:04:25 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3mh6yw77ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 15:04:25 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BMF4MgW23462524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Dec 2022 15:04:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F43920043;
 Thu, 22 Dec 2022 15:04:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C58502004E;
 Thu, 22 Dec 2022 15:04:21 +0000 (GMT)
Received: from p-imbrenda.ibmuc.com (unknown [9.171.22.213])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 22 Dec 2022 15:04:21 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: david@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, seiden@linux.ibm.com
Subject: [PATCH v1 0/2] s390x/pv: Add support for asynchronous teardown for
 reboot
Date: Thu, 22 Dec 2022 16:04:19 +0100
Message-Id: <20221222150421.35839-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N2zp50Qv4vjSAtLQ9U10dx6gCK4YGTPQ
X-Proofpoint-ORIG-GUID: XNxbDUB-2yfG9SIxLtc6lThTjUnaHugv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_08,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=502 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220131
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
guests when rebooting. First the existing guest is prepared for
asynchronous teardown, the rebooted guest will be able to continue
immediately, while a background thread actually performs the necessary
cleanup.

Claudio Imbrenda (2):
  Linux header update
  s390x/pv: Add support for asynchronous teardown for reboot

 hw/s390x/pv.c              | 28 ++++++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c |  5 ++++-
 include/hw/s390x/pv.h      |  2 ++
 linux-headers/linux/kvm.h  |  3 +++
 4 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.38.1


