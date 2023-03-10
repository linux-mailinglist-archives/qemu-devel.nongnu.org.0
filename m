Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1AB6B4F47
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:44:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagld-0007ZF-Pl; Fri, 10 Mar 2023 12:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paglZ-0007R4-TG; Fri, 10 Mar 2023 12:42:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paglY-000836-D1; Fri, 10 Mar 2023 12:42:53 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32AGGQKw023803; Fri, 10 Mar 2023 17:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MYgVUIDP6sY61k9lOwUh8CxGXh5QZMy4zOyOZ51K/14=;
 b=KF2ePdDAfFeVNaN5P/hgfgcj6Ey1+PgHi3N+zVwie+41vRSaJAPeuMxxeoA79XCW+YRp
 dNXM5DbUSkJ7I2GKKTJG4stxEvuLVeJ5xAqIUUun7oae/1T3w36Ye+gM+xY4FH3ncgjp
 fi8nE3jgftcy7SpDsJsVRzJ1uSqpTcpsjFy6GdVm4QqWel1OAqX0HlSW0nNXl0Gx5iOx
 R5L6pCc4efjXXvuZ/koPRu+5NflyzNxxlM9Tt5Lu0KBRXanw2QFRPfVr8gVMdZYt6oFL
 CPa6Prl8Z7N9KS0SOkk4V6mssmSOoUkPUoS0NcxDb1ht5V5pGc1L0Fj/sQRgODGjwykJ Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p87x59xnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:49 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32AGk5SB006064;
 Fri, 10 Mar 2023 17:42:49 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p87x59xmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:49 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32A7jmiF003378;
 Fri, 10 Mar 2023 17:42:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3p6g0jk4xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32AHgh8847841708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 17:42:43 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B3B520040;
 Fri, 10 Mar 2023 17:42:43 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBCD720043;
 Fri, 10 Mar 2023 17:42:42 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.22.18])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Mar 2023 17:42:42 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH 07/12] target/s390x: Handle CGRL and CLGRL with non-aligned
 addresses
Date: Fri, 10 Mar 2023 18:42:18 +0100
Message-Id: <20230310174223.944843-8-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310174223.944843-1-iii@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CtzQRfCXEccdQBFftHnoGzZkG37ZtpZh
X-Proofpoint-ORIG-GUID: 8ezwh6eQ4RrtEyT5Qj-VgNwLmh1bFRcr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_08,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100139
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

Use MO_ALIGN_8 and let do_unaligned_access() generate a specification
exception.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Suggested-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index d5e64d168f2..02c415bdbd6 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6014,7 +6014,8 @@ static void in2_mri2_32u(DisasContext *s, DisasOps *o)
 static void in2_mri2_64(DisasContext *s, DisasOps *o)
 {
     o->in2 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld64(o->in2, gen_ri2(s), get_mem_index(s));
+    tcg_gen_qemu_ld_i64(o->in2, gen_ri2(s), get_mem_index(s),
+                        MO_TEUQ | MO_ALIGN_8);
 }
 #define SPEC_in2_mri2_64 0
 
-- 
2.39.2


