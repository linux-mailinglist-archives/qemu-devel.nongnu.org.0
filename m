Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BC46BA398
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 00:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcEAs-0003EE-Fr; Tue, 14 Mar 2023 19:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcEAn-0003Cc-LF; Tue, 14 Mar 2023 19:35:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcEAl-0002NN-LO; Tue, 14 Mar 2023 19:35:17 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ENY5fN006519; Tue, 14 Mar 2023 23:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dBVOEEQBg9V/F/xtCkkie8iO4JJLYFQjomNWYPAxErc=;
 b=EUpPSgEY+Mx6G4qFV6THweVw/574AU23bcmC6jBR/GwO+yQCMPMu86AZTsyEK1WnV0hv
 /6QRYiAIA6+/pkOmoNcBpzksjCsiTlRfwsal9iBvbgKTAjmq4SWFvstDIuUHUlirtfUn
 lleDBdBJgE+4BU5BMUvg98yQem1LujA9Fp9a/BWSuYgMG5ONBFu2J8RZbX68QHHhqpV9
 WUVVu0T8uY4FppbV4v+b+BMhDj24g8p8jV+tWy9hNKQbUwP5V+iwAJLsDr8pMGdIATTG
 deRWFRbuUguu3a3oQrJdHsxy/aUwlG4Z6kbvhN3WybANuRA4dBBhUu+4syNpEYEDem+N yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb2q980pw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 23:35:12 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ENZBLD009230;
 Tue, 14 Mar 2023 23:35:11 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb2q980pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 23:35:11 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN65t8032370;
 Tue, 14 Mar 2023 23:35:09 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pb29u80ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 23:35:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32ENZ7Xl24773324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Mar 2023 23:35:07 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37E722004F;
 Tue, 14 Mar 2023 23:35:07 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC84220040;
 Tue, 14 Mar 2023 23:35:06 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.45.154])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Mar 2023 23:35:06 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 1/2] target/s390x: Fix R[NOX]SBG with T=1
Date: Wed, 15 Mar 2023 00:34:42 +0100
Message-Id: <20230314233443.324727-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314233443.324727-1-iii@linux.ibm.com>
References: <20230314233443.324727-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -h8UDvE7K6upg7P-sNBU8HnsX44mmYVO
X-Proofpoint-GUID: STrzKoPIeV1vJpZ3wdvQ_CMmnDdG5cYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2302240000
 definitions=main-2303140189
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


