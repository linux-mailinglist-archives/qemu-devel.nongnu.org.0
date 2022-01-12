Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9058E48C8FE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:02:10 +0100 (CET)
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7h0i-0007Tt-4G
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:02:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7gpr-0004xp-3Y; Wed, 12 Jan 2022 11:50:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7gpn-0001AA-Rs; Wed, 12 Jan 2022 11:50:54 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CFMbQb006470; 
 Wed, 12 Jan 2022 16:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ABnypSnyXu0/mvPeXBiej3iniS6jtv4WdN0SuRNr5zw=;
 b=VJh+QMU4pzP+/aqgiizeA6Brr74hAaWbOgZIoJk2rvzlrGsL/nDg6Ci7GZbfZSiv9ii8
 VDgZPEyQQEWLTr7/lsYd7GJbbwhnenttkwaUPqPEmP4fpx4teGYaU3cUOmkSQQblcnMz
 Smy8ieVAZuOVSH0mVv4DUjxCmzxeo76dGVRJ0FfjcZ9uP2AQJa4JXixzNcNLpQW+Sd+1
 YeD+aXxXUwT3pbriY3tXqthc065YTcO168qtiA8GEkwnZuQTRKroh3TpRjuI+JjQYlgD
 zkPGjtxEBW6uFL5mQtHYv6PxxkI4xIrCu9BZ0Nh20UVkk86LMsuovxPukaa3Um1btMP8 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj1jvstfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:50:26 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CGe7ZU014359;
 Wed, 12 Jan 2022 16:50:25 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj1jvstf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:50:25 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CGm3QQ003724;
 Wed, 12 Jan 2022 16:50:23 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3df289wptp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:50:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CGoKjV43254144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 16:50:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 736BBAE059;
 Wed, 12 Jan 2022 16:50:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7B12AE04D;
 Wed, 12 Jan 2022 16:50:19 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 16:50:19 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 2/5] target/s390x: Fix SRDA CC calculation
Date: Wed, 12 Jan 2022 17:50:13 +0100
Message-Id: <20220112165016.226996-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112165016.226996-1-iii@linux.ibm.com>
References: <20220112165016.226996-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TDbCxWNPWNevsDyI1ECOkuawaEYF5ohF
X-Proofpoint-ORIG-GUID: 0bpyW-19ngY4lI1eFZxof3tY_RLe8CkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

SRDA uses r1_D32 for binding the first operand and s64 for setting CC.
cout_s64() relies on o->out being the shift result, however,
wout_r1_D32() clobbers it.

Fix by using a temporary.

Fixes: a79ba3398a0a ("target-s390: Convert SHIFT DOUBLE")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f180853e7a..766b4c87b2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5420,9 +5420,11 @@ static void wout_r1_P32(DisasContext *s, DisasOps *o)
 static void wout_r1_D32(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, r1);
+    TCGv_i64 t = tcg_temp_new_i64();
     store_reg32_i64(r1 + 1, o->out);
-    tcg_gen_shri_i64(o->out, o->out, 32);
-    store_reg32_i64(r1, o->out);
+    tcg_gen_shri_i64(t, o->out, 32);
+    store_reg32_i64(r1, t);
+    tcg_temp_free_i64(t);
 }
 #define SPEC_wout_r1_D32 SPEC_r1_even
 
-- 
2.31.1


