Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4B048BDF0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 05:43:59 +0100 (CET)
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7VUM-0006iI-AK
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 23:43:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VQa-0002H5-Om; Tue, 11 Jan 2022 23:40:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VQX-0003Sn-Jz; Tue, 11 Jan 2022 23:40:04 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20C3wgSk028176; 
 Wed, 12 Jan 2022 04:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=s0VKMTlyWvmnUNnobL6ZmPr4yiaR0D8xi/bnw5bqGSM=;
 b=gpkpQmoHMdjtfSzD6XjekO//ZhxCWNCrzn5ZSsMe6nqTudQohBVlb7xEBx+15ak7q8Ub
 /nqBMT9WA1F3fCXS5J+5Ew39oLNPfRTynotcqL7lQBcmgItmQdVSa2Ywo8+A+z4Hcolz
 IWYVNQqSXYmScxvWQUABZQNG+ftJ8mL990g3dJcA8IoTc3cdVF1uKxXBsROPKq3yRYsG
 3tHpnD1LFaOBgUblSw5HljjJyyfWRYXPW3LzMCOUerUJHueeC/eRZMzdPDHwurvICyfy
 dvfWKpPrlfy/zPdktpnA3TOGRcaNDxDy58YHvc2QxS/o9af58BIFk0ebL+GrLDDI5uKy gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhqj7rhc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:59 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20C4d9oe001917;
 Wed, 12 Jan 2022 04:39:59 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhqj7rhbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:58 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C4WGIO025058;
 Wed, 12 Jan 2022 04:39:57 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3df289kx77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20C4dsXO42860816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 04:39:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 105E84204C;
 Wed, 12 Jan 2022 04:39:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 884D642042;
 Wed, 12 Jan 2022 04:39:53 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 04:39:53 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 2/5] target/s390x: Fix SRDA CC calculation
Date: Wed, 12 Jan 2022 05:39:45 +0100
Message-Id: <20220112043948.224405-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112043948.224405-1-iii@linux.ibm.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mliZJh0-yUKdvYO0qJ5jYdtmjPwR-Thx
X-Proofpoint-ORIG-GUID: 1jlgMi1Ub5ULHHuL_0_PvrbsGv_jMGUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_01,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120024
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


