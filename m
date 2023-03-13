Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B3A6B7C2C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:40:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbkGY-00080M-Am; Mon, 13 Mar 2023 11:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbkGV-0007wo-0M; Mon, 13 Mar 2023 11:39:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbkGT-0004wh-CN; Mon, 13 Mar 2023 11:39:10 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DEltVn012326; Mon, 13 Mar 2023 15:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TypN67BNpupBDZ90sMQ+5EwpCgAwPcCbvFAklLq7et8=;
 b=fPMKzylWRGmBkPcvKjnll4npg5mGmO/EYJVSFqLE88mK9D/jEe6HQ1Vd1mRWcyjReMPW
 xS48Zq3t2UHs11fLfOhHitpEbkmeRxuQ24nx2mVz3mYYBsEpn6kdOdg6dLBZWDjVeZjd
 h2OEh7NtX6k+USPTNm+y/DAMry6wrfKYi0CjmIRxZylCKabIKpPBTRMkulehn/12nF+X
 QQSlcDyh7ejkvh9XHuWzu9HxJQfxWoRRNanpemrm2kqRZj9wBetSwFEy/5Yus7644y9j
 bCfgmmTniCOj7yOu9NHJM3z90lZhj1AfJY0mHqXbsLeNQMRBUlzrpEkbUHOVu6Aa/7oT UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa47s4uq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:39:06 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DEH5HB012751;
 Mon, 13 Mar 2023 15:39:06 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa47s4up7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:39:06 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DDA3ta015869;
 Mon, 13 Mar 2023 15:39:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3p8h96jrxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:39:03 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32DFd0Ee40567096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 15:39:00 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C08E20043;
 Mon, 13 Mar 2023 15:39:00 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B943F20040;
 Mon, 13 Mar 2023 15:38:59 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.87.70])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Mar 2023 15:38:59 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v2 08/12] target/s390x: Handle CLRL and CLGFRL with
 non-aligned addresses
Date: Mon, 13 Mar 2023 16:38:40 +0100
Message-Id: <20230313153844.9231-9-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313153844.9231-1-iii@linux.ibm.com>
References: <20230313153844.9231-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A0bweX7t71vsW9pSAvVpAx2FeYX8P6Bm
X-Proofpoint-ORIG-GUID: csOMyH53GT8C7qg2HzqAkKTuIcTcZ2WV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_07,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130121
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

Use MO_ALIGN and let do_unaligned_access() generate a specification
exception.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Suggested-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index ba01067fff7..a6ac7b7e136 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6007,7 +6007,8 @@ static void in2_mri2_32s(DisasContext *s, DisasOps *o)
 static void in2_mri2_32u(DisasContext *s, DisasOps *o)
 {
     o->in2 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld32u(o->in2, gen_ri2(s), get_mem_index(s));
+    tcg_gen_qemu_ld_tl(o->in2, gen_ri2(s), get_mem_index(s),
+                       MO_TEUL | MO_ALIGN);
 }
 #define SPEC_in2_mri2_32u 0
 
-- 
2.39.2


