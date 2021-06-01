Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65273975E1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:58:25 +0200 (CEST)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5qb-0006hQ-1t
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lo5oU-0003Az-Ki
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:56:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lo5oQ-0007Y4-8u
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:56:14 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151EWr8p021007; Tue, 1 Jun 2021 10:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FlrWpJ4/4fZzldaQhM4Ow6outkdAeeCA+U7OaKMHJVk=;
 b=Lp3pz1HyR5ITEUcK1/jQ54ybkFSPeaVb1z7UbLCkTVIwLqgzJi7/sYs621qOSZeDjTHV
 fRfuBE5n9HTe8UFpnnhQd0S0o8SAbylV4U/P6jRYWWe+uM1DkR/QizTRmSVTMRU4mg4X
 TsrWhQw0q3p/XQzTFYrHgIERZacnGCMtFTFoEoWT41nyUCtAkFSVXBe8jPWqdM3G4hR3
 qJqnAvQOVZqIafX/i2VNPIPuDB8oHKi8TI3b0AJ7ZMjrLbkRDLFFD4zqvoyz2rSW1FcO
 b7okSnX1xXyO9yFAJ9WWmV9yx4bZqyrNyKyhVVn345ZV3vS+BR6ck0T2pveiDj2FLdeA /g== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38wmj6ddsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 10:56:08 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151Es3tk010689;
 Tue, 1 Jun 2021 14:56:06 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 38ud87s01h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 14:56:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 151Eu3XO12190198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 14:56:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F800AE04D;
 Tue,  1 Jun 2021 14:56:03 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D64ABAE051;
 Tue,  1 Jun 2021 14:56:02 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 14:56:02 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/2] tests/tcg/linux-test: Check that sigaction can query
 SIGKILL/SIGSTOP
Date: Tue,  1 Jun 2021 16:56:00 +0200
Message-Id: <20210601145600.3131040-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601145600.3131040-1-iii@linux.ibm.com>
References: <20210601145600.3131040-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DUUqS-xihRm6zYg-Sc2PCLZ8-9DznBRu
X-Proofpoint-GUID: DUUqS-xihRm6zYg-Sc2PCLZ8-9DznBRu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_07:2021-06-01,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Verify that querying is allowed, but making changes isn't.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/multiarch/linux-test.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux-test.c
index ce033c21c7..cd9d8159bc 100644
--- a/tests/tcg/multiarch/linux-test.c
+++ b/tests/tcg/multiarch/linux-test.c
@@ -496,6 +496,15 @@ static void test_signal(void)
     sigemptyset(&act.sa_mask);
     act.sa_flags = 0;
     chk_error(sigaction(SIGSEGV, &act, NULL));
+
+    if (sigaction(SIGKILL, &act, NULL) == 0) {
+        error("sigaction(SIGKILL, &act, NULL) must not succeed");
+    }
+    if (sigaction(SIGSTOP, &act, NULL) == 0) {
+        error("sigaction(SIGSTOP, &act, NULL) must not succeed");
+    }
+    chk_error(sigaction(SIGKILL, NULL, &act));
+    chk_error(sigaction(SIGSTOP, NULL, &act));
 }
 
 #define SHM_SIZE 32768
-- 
2.31.1


