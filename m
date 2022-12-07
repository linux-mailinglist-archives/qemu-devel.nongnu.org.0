Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED47C645A8B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:17:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uGn-0005mh-HB; Wed, 07 Dec 2022 08:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p2uGN-0005hK-Fo; Wed, 07 Dec 2022 08:15:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p2uGL-0004Zn-6c; Wed, 07 Dec 2022 08:15:03 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7CRxNk026554; Wed, 7 Dec 2022 13:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Uj1EtG+lE0ijqGMw8RhT1Zv2L7ejG7d9mJmt2yrJzhU=;
 b=sh6GXPBarjaJ3bPMZNfs88nVyA+ue3MVcpxtuidtEPDiosPSfLj1Pn8AcG3sNuWwecgj
 mBQfZklO61XX5qPlRTpLeCbOSepZolJ1E9bPbVoz+8nIQqEz0GXm6wVu3grVNPF7nAmv
 AzlaPiAFc0VD+yqKNkQ/vAE50V6gnPNx6qOO51utBgq6WBV0jrCLz3xb2qTNgJc+QT0W
 89z0O5DCiNob4YgS/FMUYX5OZF97ajBoBTKYn/O/fO0t4co1UP0fGM+f5H39UImU1/Q1
 VSIAja/yU55yjReiUQbaNY8nAIOU+mu4DhHJmYifdPBNSL967TD9R/QHxj7KujNLntUe 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mar0nnq7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 13:14:58 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B7C8b1N008012;
 Wed, 7 Dec 2022 13:14:58 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mar0nnq6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 13:14:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7BrFFX010349;
 Wed, 7 Dec 2022 13:14:56 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3m9ks4303w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 13:14:56 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B7DEr7m41615782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Dec 2022 13:14:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFDFC20043;
 Wed,  7 Dec 2022 13:14:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51BE120040;
 Wed,  7 Dec 2022 13:14:53 +0000 (GMT)
Received: from m83lp52.lnxne.boe (unknown [9.152.108.100])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  7 Dec 2022 13:14:53 +0000 (GMT)
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: qemu-devel <qemu-devel@nongnu.org>, hreitz@redhat.com
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, kwolf@redhat.com,
 qemu-block@nongnu.org
Subject: [PATCH 1/1] qemu-iotests/stream-under-throttle: do not shutdown QEMU
Date: Wed,  7 Dec 2022 14:14:52 +0100
Message-Id: <20221207131452.8455-1-borntraeger@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zWsDyujj4WBU3D1PtxGeJUQ-NnIDXu0d
X-Proofpoint-ORIG-GUID: FdCoRdMvnELoFu_CXaqgOF9uPDLIHBeS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_05,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=857
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070112
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

Without a kernel or boot disk a QEMU on s390 will exit (usually with a
disabled wait state). This breaks the stream-under-throttle test case.
Do not exit qemu if on s390.

Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
---
 tests/qemu-iotests/tests/stream-under-throttle | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/tests/stream-under-throttle b/tests/qemu-iotests/tests/stream-under-throttle
index 8d2d9e16840d..c24dfbcaa2f2 100755
--- a/tests/qemu-iotests/tests/stream-under-throttle
+++ b/tests/qemu-iotests/tests/stream-under-throttle
@@ -88,6 +88,8 @@ class TestStreamWithThrottle(iotests.QMPTestCase):
                            'x-iops-total=10000,x-bps-total=104857600')
         self.vm.add_blockdev(self.vm.qmp_to_opts(blockdev))
         self.vm.add_device('virtio-blk,iothread=iothr0,drive=throttled-node')
+        if iotests.qemu_default_machine == 's390-ccw-virtio':
+            self.vm.add_args('-no-shutdown')
         self.vm.launch()
 
     def tearDown(self) -> None:
-- 
2.38.1


