Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD6B65F08A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 16:51:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSWm-0007jQ-9t; Thu, 05 Jan 2023 10:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pDSWf-0007dU-Vq
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:51:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pDSWe-0004ts-D9
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:51:29 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305F75xn017379
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 15:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=rT9v1HQX5pZKaMAHn1MYyE8vxs/fCzMt25QK4T7l/h4=;
 b=oL9S6xRRkpWUaMg71Xl3XaajDEJ/goFzA+UtuLw5+rktq1yJEE9Z+Q9VQrbn2N1UvOUi
 n5K4hxuQJPL7CUFE7Ojc97FRCWUoTRopfELo2gvSL0mfd8FK5ShjHtEt1yrK5r0yWhSE
 1tvn+P8RGyaWmt89Vp2ne82X04XgSYTWjW3DkO9yG9HuWOYja4bTDMgaVXbHgJXax9aZ
 gjmW/sE7VDMzeVgeFxcrcqEaNhr7PvuT27yQFB/VwDvPYQ7f9o/IKr08iahUqEJmTi1h
 2QdufrG1Uff4Lp+JyNsFjLA/FlC3SLVU2/7G7F0B7LL5PjlPMeNtfxQ2RRg46WKECrsJ cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwye83k6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 15:51:26 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305FlJmg028253
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 15:51:26 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwye83k5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 15:51:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3054nt1r020244;
 Thu, 5 Jan 2023 15:50:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mtcq6eyhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 15:50:25 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305FoLkV42402254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 15:50:21 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2743B20043;
 Thu,  5 Jan 2023 15:50:21 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A30F2004D;
 Thu,  5 Jan 2023 15:50:20 +0000 (GMT)
Received: from p-imbrenda.ibmuc.com (unknown [9.171.26.82])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  5 Jan 2023 15:50:20 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: david@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, seiden@linux.ibm.com
Subject: [PATCH v2 0/2] s390x/pv: Add support for asynchronous teardown for
 reboot
Date: Thu,  5 Jan 2023 16:50:17 +0100
Message-Id: <20230105155019.72200-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UhGmSfS2H38_M4a5p5exfsITnGwQweLy
X-Proofpoint-GUID: 7ies0IOb_8ZX3EBrmh8BStGYIktDofJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_06,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 mlxlogscore=536
 phishscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050122
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

v1->v2:
* remove useless snprintf and pass the name of the thread directly
* make the name of the thread more understandable

Claudio Imbrenda (2):
  Linux header update
  s390x/pv: Add support for asynchronous teardown for reboot

 hw/s390x/pv.c              | 25 +++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c |  5 ++++-
 include/hw/s390x/pv.h      |  2 ++
 linux-headers/linux/kvm.h  |  3 +++
 4 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.39.0


