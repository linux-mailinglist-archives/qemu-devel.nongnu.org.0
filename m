Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7163048C8E0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:54:47 +0100 (CET)
Received: from localhost ([::1]:51324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gta-00087B-ID
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:54:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7gpp-0004rv-4A; Wed, 12 Jan 2022 11:50:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7gpf-0001AQ-1r; Wed, 12 Jan 2022 11:50:52 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CEMK3v018386; 
 Wed, 12 Jan 2022 16:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CFyKUPAcSeohB+zdtMh2E4nUr7Nx3VLc3sek5BoJZVo=;
 b=A99HgJegmhX6WnjPjFPtxU2OuH9xRXwONGxD24X8V9ZdrLGMoJrsDPwDr6KUXW+w3Z0j
 l0AJvKaXANseM+HquiZDjivAteqHUgBedAAjTA3lGL3eY7HgS6w0j7Hwzy5C30FRKHJX
 wJfmzDeijIqUqB3cdR8162DQwLduyl8yn8bOFRxpyA0M2LmE4A8to+/Hh/h1jjmASVMv
 lhHWjwsdEcPhv5nIIGmL4bE6wt+UUNtR5sHu32VGZmuLXFJm06OgRG2Ws4uD50fYsNIL
 9b5IUYh3V8YNPsuZInyOiY/K+RKf+JaEO2aTj1krCkREYR2KRotifF3TfXHtCmIZDZSo 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj0pnk5k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:50:27 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CFnmql005980;
 Wed, 12 Jan 2022 16:50:27 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj0pnk5je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:50:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CGm7le032699;
 Wed, 12 Jan 2022 16:50:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vjdu97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:50:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CGoLi936307340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 16:50:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59C34AE04D;
 Wed, 12 Jan 2022 16:50:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D21B8AE056;
 Wed, 12 Jan 2022 16:50:20 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 16:50:20 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 3/5] target/s390x: Fix cc_calc_sla_64() missing overflows
Date: Wed, 12 Jan 2022 17:50:14 +0100
Message-Id: <20220112165016.226996-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112165016.226996-1-iii@linux.ibm.com>
References: <20220112165016.226996-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OsasUFPchUWJOkcjfV5yZtecMfMDuJp1
X-Proofpoint-ORIG-GUID: mHARFDYS1qWzeLUWxNRk18SNTxCeJyOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120104
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An overflow occurs for SLAG when at least one shifted bit is not equal
to sign bit. Therefore, we need to check that `shift + 1` bits are
neither all 0s nor all 1s. The current code checks only `shift` bits,
missing some overflows.

Fixes: cbe24bfa91d2 ("target-s390: Convert SHIFT, ROTATE SINGLE")
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/cc_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
index c2c96c3a3c..c9b7b0e8c6 100644
--- a/target/s390x/tcg/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -297,7 +297,7 @@ static uint32_t cc_calc_sla_32(uint32_t src, int shift)
 
 static uint32_t cc_calc_sla_64(uint64_t src, int shift)
 {
-    uint64_t mask = ((1ULL << shift) - 1ULL) << (64 - shift);
+    uint64_t mask = -1ULL << (63 - shift);
     uint64_t sign = 1ULL << 63;
     uint64_t match;
     int64_t r;
-- 
2.31.1


