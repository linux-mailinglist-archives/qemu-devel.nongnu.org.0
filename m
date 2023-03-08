Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4236B137F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 22:04:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa0wI-0007SP-9Z; Wed, 08 Mar 2023 16:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pa0vz-0007RB-Tr; Wed, 08 Mar 2023 16:02:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pa0vx-0004xO-Ul; Wed, 08 Mar 2023 16:02:51 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328KGgNr012137; Wed, 8 Mar 2023 21:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=eVVJdONMek5IQv0eq/DFfV1FhJO4Rl/BpeNRTsRcV9U=;
 b=IdQoypR/M3dn6rXGSBi5nS1I1M3qDwZz+b6epP2Q6Qf19f62NoZN3GjDa6C0cdIoLTms
 Gww8pvG8EX43QiEePF4rBm5jQg8jnZRc77mDn3s6hwYHIPbBfO4z3BBbSSWR7L4avNNc
 Xlj4vN5LkSws1LCDWmHe8OkbucuDmECl2tqs+i4u3t4+a8wKscjCv7A03sswBAP15y00
 yyjrlww2TVHMtSq62xy4mIMkmSQRO/Y+PsXGlV5ZQifmE81RKOCkswGQh8ktThzqEqUt
 P5kzV4pc4pkAO+e6FNm1CrUPCIY6S58R6FQV9IyP0TDUFuAWWdEKA8XzvVTOMJMc1jW5 gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6ry3pqr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 21:02:46 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 328Kr4p3032743;
 Wed, 8 Mar 2023 21:02:46 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6ry3pqky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 21:02:46 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 328IAEkT015878;
 Wed, 8 Mar 2023 21:02:31 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3p6g759039-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 21:02:31 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 328L2SbS1180272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Mar 2023 21:02:28 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00AFD20043;
 Wed,  8 Mar 2023 21:02:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB6FD20040;
 Wed,  8 Mar 2023 21:02:27 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  8 Mar 2023 21:02:27 +0000 (GMT)
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Subject: [PATCH v2 0/2] target/s390x: Fix emulation of C(G)HRL
Date: Wed,  8 Mar 2023 22:02:24 +0100
Message-Id: <20230308210226.2847503-1-nsg@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ygxzPQiDsFHlomiU2n2GuOjPMLatPXfc
X-Proofpoint-ORIG-GUID: FNFcq6hgljESQD8KSZWnSoXNRHx_Szdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxlogscore=990 priorityscore=1501 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080178
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
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

The second operand of COMPARE HALFWORD RELATIVE LONG is a signed
halfword, it does not have the same size as the first operand.
Fix this and add a tcg test for c(g)hrl.

Nina Schoetterl-Glausch (2):
  target/s390x: Fix emulation of C(G)HRL
  tests/tcg/s390x: Add C(G)HRL test

 target/s390x/tcg/insn-data.h.inc |  4 +-
 target/s390x/tcg/translate.c     |  7 +++
 tests/tcg/s390x/chrl.c           | 76 ++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |  1 +
 4 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/s390x/chrl.c

Range-diff against v1:
1:  f463507b25 ! 1:  228a1d9cfb target/s390x: Fix emulation of C(G)HRL
    @@ target/s390x/tcg/translate.c: static void in2_m2_64a(DisasContext *s, DisasOps *
      
     +static void in2_mri2_16s(DisasContext *s, DisasOps *o)
     +{
    -+    in2_ri2(s, o);
    -+    tcg_gen_qemu_ld16s(o->in2, o->in2, get_mem_index(s));
    ++    o->in2 = tcg_temp_new_i64();
    ++    tcg_gen_qemu_ld16s(o->in2, gen_ri2(s), get_mem_index(s));
     +}
     +#define SPEC_in2_mri2_16s 0
     +
      static void in2_mri2_16u(DisasContext *s, DisasOps *o)
      {
    -     in2_ri2(s, o);
    +     o->in2 = tcg_temp_new_i64();
2:  316b53ebd9 = 2:  3b1ca6b682 tests/tcg/s390x: Add C(G)HRL test

base-commit: 817fd33836e73812df2f1907612b57750fcb9491
-- 
2.37.2


