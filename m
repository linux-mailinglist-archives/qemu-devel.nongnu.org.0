Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13B83975DD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:57:26 +0200 (CEST)
Received: from localhost ([::1]:56334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5pd-0004Sm-OZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lo5oS-00039h-FH
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:56:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8396
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lo5oO-0007X2-8z
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:56:12 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151EWgdP173369; Tue, 1 Jun 2021 10:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=XagY5Ks9tAW/a+5T5HUED1gyx2t5FesYYqQQeKkfx1w=;
 b=T97PyqpWSzr13vv3QxTvtf07YLStR9Al5zHqQ+jOKVppju8IVcKyi/R3m6YI1041PiVR
 RPez3xNn6WSsuUWrvtSZmFsGRFZfEH+UmH29QerjeG77Z/0xgZ0VCFsuVxh9PH3MOJ68
 fYfbcmqqKxylvn21rD/EHpXuYC5NNNlalAar5YNBCCp2vhOrAkab63pOtaOdU3Nh5mVc
 qn2OxpiwBwdkaKMsFoLCmU6rtCMdNlHz3oB08erZCOYxKRq2mSkDjygV7uRF+P6LTDtC
 k8M7RNLaq1CpZDZ+FhvAo8cs/TLMTUZo0wwbK3U0L1vSdc78rtqPQG73S/J2Psj/BBWv HQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38wpk4150r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 10:56:06 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151ErlxO032409;
 Tue, 1 Jun 2021 14:56:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 38ud889t05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 14:56:04 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 151EtSpB35324318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 14:55:28 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 810D1AE055;
 Tue,  1 Jun 2021 14:56:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32F7BAE056;
 Tue,  1 Jun 2021 14:56:01 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 14:56:01 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 0/2] linux-user: Let sigaction query SIGKILL/SIGSTOP
Date: Tue,  1 Jun 2021 16:55:58 +0200
Message-Id: <20210601145600.3131040-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5a-g1-1qqfQJDe56LwFGya0GUgv3Eo2p
X-Proofpoint-ORIG-GUID: 5a-g1-1qqfQJDe56LwFGya0GUgv3Eo2p
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_07:2021-06-01,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=955 suspectscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

valgrind fails to start under linux-user, one of the reasons being that
it tries to query all the sigactions, which qemu (unlike the real
kernel) doesn't allow for SIGKILL/SIGSTOP.

Patch 1 lifts this restriction, patch 2 adds a test.

Ilya Leoshkevich (2):
  linux-user: Let sigaction query SIGKILL/SIGSTOP
  tests/tcg/linux-test: Check that sigaction can query SIGKILL/SIGSTOP

 linux-user/signal.c              | 6 +++++-
 tests/tcg/multiarch/linux-test.c | 9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.31.1


