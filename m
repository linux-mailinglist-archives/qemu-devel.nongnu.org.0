Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D186BD6F4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 18:23:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcrJ2-0002Ur-PX; Thu, 16 Mar 2023 13:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcrIw-0002Tn-Af; Thu, 16 Mar 2023 13:22:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcrIu-0001yc-Cx; Thu, 16 Mar 2023 13:22:18 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GH0xKE023458; Thu, 16 Mar 2023 17:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wU1P/C37KhtDGYXGBJQ6qKzCPhptN/aHJ1Tpdec1bak=;
 b=COuTo9/o9FcCd4aeiU+8IeJNpJlqGTnS8Yj/PATIEQl5MeXAeI5HRxJJ8KlbLyN1FnLv
 sE6X/t8MFAoR4HlvQVYZXsHt5OUImSD+wvOdeosZthkHaTbislsLR1Pr/CB6lDEJ0arR
 NhxiYmVOo37NhHeUqAvs2y/Mvu3D2Q4YAuxQo/+w3wMXa5QI+l0y+UiFefs6aD7Q2GIv
 9VUTL7JLTzu4ml/ungtVbeBnWi1wc7OBQ/ZV0JOOFsd7P4WCMu/sK3ySz5iOaROiZFXj
 09Cn3eUNJBCpI9iDlFdP7aJg05uyV+3OJ0O4RiwnhCOQOBN77yqdi86FxWCi99iIoWuJ sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpwck373-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:22:13 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GGov4m001566;
 Thu, 16 Mar 2023 17:22:13 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpwck361-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:22:13 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32G1r078008193;
 Thu, 16 Mar 2023 17:22:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pbsu7gtuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:22:10 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GHM8RR46924224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 17:22:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3576020040;
 Thu, 16 Mar 2023 17:22:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B21D720043;
 Thu, 16 Mar 2023 17:22:07 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.2.157])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 17:22:07 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 1/2] target/s390x: Fix R[NOX]SBG with T=1
Date: Thu, 16 Mar 2023 18:22:04 +0100
Message-Id: <20230316172205.281369-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316172205.281369-1-iii@linux.ibm.com>
References: <20230316172205.281369-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Kb2LPdQAWberSjIZp_G9ztcnsswlG7yv
X-Proofpoint-GUID: Vov72zmES2AAXjVczD756G8ISejWvaN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160133
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

Exposed by commit e2e641fa3d5 ("tcg: Change default temp lifetime to
TEMP_TB").

Fixes: d6c6372e186e ("target-s390: Implement R[NOX]SBG")
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 14c3896d529..0fb36e04be8 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -3695,11 +3695,15 @@ static DisasJumpType op_rosbg(DisasContext *s, DisasOps *o)
     int i3 = get_field(s, i3);
     int i4 = get_field(s, i4);
     int i5 = get_field(s, i5);
+    TCGv_i64 orig_out;
     uint64_t mask;
 
     /* If this is a test-only form, arrange to discard the result.  */
     if (i3 & 0x80) {
+        tcg_debug_assert(o->out != NULL);
+        orig_out = o->out;
         o->out = tcg_temp_new_i64();
+        tcg_gen_mov_i64(o->out, orig_out);
     }
 
     i3 &= 63;
-- 
2.39.2


