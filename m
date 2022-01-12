Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3695548C5CE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:17:46 +0100 (CET)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eRd-0001rk-AZ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:17:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7dVt-0003z0-Bl; Wed, 12 Jan 2022 08:18:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7dVr-0003sf-6M; Wed, 12 Jan 2022 08:18:04 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CCvJbo031228; 
 Wed, 12 Jan 2022 13:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hVKtWc3Xk2fgXK1ygVVQne3YOxql/vtbWI9vY/ofeEw=;
 b=OPsx8CvXenYyohrDCFMfhQ6VqkoywWi2rSyRdKZLdjTlRByKssh8oJlPG1w6J6ZGuD1I
 nTn+jhpAbMOzPbm1w9APMK23KI9GRaoOmegc0vQJ8FLS50DmqaNQpDFHV5sNM5WjvTL/
 PzhH+B1iCdMWZtbKNFYw3d6m7FV1Kf7ZhsbSwKu0uboP6QKDLqgaitzKgWpCWPlVAkTh
 zVlTLP6kuiLDrtvmtWlZKi85TkO/w8tkgNoZa8W4v/v9W4LTUQw9tJZbm8BV5CmWxWZu
 PPsLNqos/aIANQwu9lwT0f0VBiP6R87ax7heShiU58sMWE2eO/+gkgBLheUuNUJGPcW7 QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhyetgdjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:18:00 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CDC9wo032691;
 Wed, 12 Jan 2022 13:18:00 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhyetgdhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:17:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CDC0uj009297;
 Wed, 12 Jan 2022 13:17:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vjc4n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:17:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CDHscQ36897078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 13:17:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D4B7AE045;
 Wed, 12 Jan 2022 13:17:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1967AE04D;
 Wed, 12 Jan 2022 13:17:53 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 13:17:53 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 2/5] target/s390x: Fix SRDA CC calculation
Date: Wed, 12 Jan 2022 14:17:48 +0100
Message-Id: <20220112131751.226011-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112131751.226011-1-iii@linux.ibm.com>
References: <20220112131751.226011-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Uaq_d7xeqi4vVLdwfqoMvHy09BqSDMWn
X-Proofpoint-GUID: 5jAuU1eyUFntP-XPHr0i2JC4Dn0oymJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120086
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

SRDA uses r1_D32 for binding the first operand and s64 for setting CC.
cout_s64() relies on o->out being the shift result, however,
wout_r1_D32() clobbers it.

Fix by using a temporary.

Fixes: a79ba3398a0a ("target-s390: Convert SHIFT DOUBLE")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/translate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f180853e7a..68ca7e476a 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5420,9 +5420,10 @@ static void wout_r1_P32(DisasContext *s, DisasOps *o)
 static void wout_r1_D32(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, r1);
+    TCGv_i64 t = tcg_temp_new_i64();
     store_reg32_i64(r1 + 1, o->out);
-    tcg_gen_shri_i64(o->out, o->out, 32);
-    store_reg32_i64(r1, o->out);
+    tcg_gen_shri_i64(t, o->out, 32);
+    store_reg32_i64(r1, t);
 }
 #define SPEC_wout_r1_D32 SPEC_r1_even
 
-- 
2.31.1


