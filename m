Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6671A6BC1EB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 00:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcazS-0005ky-7i; Wed, 15 Mar 2023 19:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcazQ-0005k8-QZ; Wed, 15 Mar 2023 19:57:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcazL-0007Fp-O2; Wed, 15 Mar 2023 19:57:04 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FNg6xL022543; Wed, 15 Mar 2023 23:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LRKbQXdw6jM6UfR9N6qUCRfMQ7pTRg8MUINwpPxc0RY=;
 b=i8oeg1cJ1f0Y2Q7V/4mhePCF768AbiOQwjlb4jenwXL1vGwvKyuNj+3Rvqwng76sYN2d
 9CagS4s3zrDVDWAtQq6Jnh+ybWfXe+ubIIgPqzCkJVYp1cJKvMwW6oN3UXtRZv8mnJ4w
 DY23QdXv4YBZW4JChSLOqm1oPVTgV7t6m0NQeVIVFS7PsumUFLStL+N+7eVVzw4vn0cA
 FyDV8o5URALvtct5Y8cwLda61IrHd5LKVLW4xNaI9grz1SwQXQxAVOCJdu+0U9JM3Zbb
 QIjEmNRI6nzVc5HaQV5hDt9OjRq7DJ4Mht7u0wp0F3X3/TVIGxHKSmKWV4Urk7qgCVnV zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbqwrr75g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:56:56 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FNsbeS027598;
 Wed, 15 Mar 2023 23:56:56 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbqwrr752-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:56:55 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32FM35kF024995;
 Wed, 15 Mar 2023 23:56:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3pbpfk82b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:56:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32FNupXu14353106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 23:56:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4180C20043;
 Wed, 15 Mar 2023 23:56:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D3F320040;
 Wed, 15 Mar 2023 23:56:50 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.19.28])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 23:56:50 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 1/2] target/s390x: Fix R[NOX]SBG with T=1
Date: Thu, 16 Mar 2023 00:56:41 +0100
Message-Id: <20230315235642.118002-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315235642.118002-1-iii@linux.ibm.com>
References: <20230315235642.118002-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vGAyNpxA4rHQG6InVZG6UXU7BRmvKxrr
X-Proofpoint-ORIG-GUID: FvNKlOS2sfpo-bjRkt75HaknWaqr5BcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303150192
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

RXSBG usage in the "filetests" test from the wasmtime testsuite makes
tcg_reg_alloc_op() attempt to temp_load() a TEMP_VAL_DEAD temporary,
causing an assertion failure:

    0x01000a70:  ec14 b040 3057  rxsbg    %r1, %r4, 0xb0, 0x40, 0x30

    OP after optimization and liveness analysis:
     ---- 0000000001000a70 0000000000000004 0000000000000006
     rotl_i64 tmp2,r4,$0x30                   dead: 1 2  pref=0xffff
     and_i64 tmp2,tmp2,$0x800000000000ffff    dead: 1  pref=0xffff
    [xor_i64 tmp3,tmp3,tmp2                   dead: 1 2  pref=0xffff]
     and_i64 cc_dst,tmp3,$0x800000000000ffff  sync: 0  dead: 0 1 2  pref=0xffff
     mov_i64 psw_addr,$0x1000a76              sync: 0  dead: 0 1  pref=0xffff
     mov_i32 cc_op,$0x6                       sync: 0  dead: 0 1  pref=0xffff
     call lookup_tb_ptr,$0x6,$1,tmp8,env      dead: 1  pref=none
     goto_ptr tmp8                            dead: 0
     set_label $L0
     exit_tb $0x7fffe809d183

    ../tcg/tcg.c:3865: tcg fatal error

The reason is that tmp3 does not have an initial value, which confuses
the register allocator. This also affects the correctness of the
results.

Fix by assigning R1 to it.

Fixes: d6c6372e186e ("target-s390: Implement R[NOX]SBG")
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 14c3896d529..6dd2f41ad08 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -3696,10 +3696,13 @@ static DisasJumpType op_rosbg(DisasContext *s, DisasOps *o)
     int i4 = get_field(s, i4);
     int i5 = get_field(s, i5);
     uint64_t mask;
+    TCGv_i64 tmp;
 
     /* If this is a test-only form, arrange to discard the result.  */
     if (i3 & 0x80) {
+        tmp = o->out;
         o->out = tcg_temp_new_i64();
+        tcg_gen_mov_i64(o->out, tmp);
     }
 
     i3 &= 63;
-- 
2.39.2


