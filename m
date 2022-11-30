Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3AE63DC6A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 18:48:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0RAl-0002ib-5F; Wed, 30 Nov 2022 12:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0RAi-0002gU-FB; Wed, 30 Nov 2022 12:47:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0RAf-0004Hx-NP; Wed, 30 Nov 2022 12:46:59 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AUGIHCr009517; Wed, 30 Nov 2022 17:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=a8QwC2UB13p/LxC9FibGgzztr6azE3G5JCXpyhWeFD0=;
 b=d2nq//MtLyGH5len/6PuIKK/lSuWcgKBOBn3Z9qRBmGm2zlCSY9xqI6fqiSuqRlJqrGs
 dtkP/f1wgORMC5icSaLqFJ2cYmVHJLZk/DsdU+AIv+JeqkGqF90+fbcL3ArIsUAXX0T3
 WGDeoDqWOI6bK4eV+C6QfhbUpxe/al+uILep74uSyPbAedxQ16ttHN128omuZGezOelc
 OCyAzjp3yxGPhnbuNh/z0lKEdLjzcfAopfXOJ4lKS9OZ+YFzdT6qw7N/yBDRpd6i4ny2
 YsogzAu1RrUKlwlpSV8VjQ+ySasOZj3W4sv5KYaEyU2Qu2SQK/rm5Tqq3kLAFIgPJJq6 lQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6ajpjj2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 17:46:55 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AUHaWES004593;
 Wed, 30 Nov 2022 17:46:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3m3a2hx79v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 17:46:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AUHlYiu60162488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Nov 2022 17:47:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 280D7A405B;
 Wed, 30 Nov 2022 17:46:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3892A4054;
 Wed, 30 Nov 2022 17:46:50 +0000 (GMT)
Received: from heavy.boa-de.ibmmobiledemo.com (unknown [9.171.36.196])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Nov 2022 17:46:50 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 1/2] target/s390x: Fix successful-branch PER events
Date: Wed, 30 Nov 2022 18:46:09 +0100
Message-Id: <20221130174610.434590-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130173325.v5u6xnzcxir4ntrc@heavy>
References: <20221130173325.v5u6xnzcxir4ntrc@heavy>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fyXbd8-klIJEpaRwAIIuhaFbJQ5U7nBJ
X-Proofpoint-ORIG-GUID: fyXbd8-klIJEpaRwAIIuhaFbJQ5U7nBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211300122
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

The branching code sets per_perc_atmid, but afterwards it does
goto_tb/exit_tb, so per_check_exception() added by translate_one() is
not reached.

Fix by raising PER exception in per_branch().

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/misc_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 71388a71197..b7220cef44b 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -619,6 +619,7 @@ void HELPER(per_branch)(CPUS390XState *env, uint64_t from, uint64_t to)
             || get_per_in_range(env, to)) {
             env->per_address = from;
             env->per_perc_atmid = PER_CODE_EVENT_BRANCH | get_per_atmid(env);
+            tcg_s390_program_interrupt(env, PGM_PER, GETPC());
         }
     }
 }
-- 
2.38.1


