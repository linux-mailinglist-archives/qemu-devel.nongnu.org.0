Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3854ABDC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 10:35:11 +0200 (CEST)
Received: from localhost ([::1]:42634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o120z-0002Vj-US
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 04:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o11vW-0000hy-Gp; Tue, 14 Jun 2022 04:29:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o11vU-0005Jp-Hn; Tue, 14 Jun 2022 04:29:30 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E7mOCV003751;
 Tue, 14 Jun 2022 08:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=rN23jtNYk9FcTsIM8SKkYOGRqrPTQVWdDH9rID6RXdw=;
 b=WA3oMmBJWG4f73F+sISnhSxfwppbqxOEelIxuj3QjserEEcAmEMIMRe772ZXnLdxBSYp
 O6gKzm1xxx/tV3Q9bfgWQmyUOh6LNm42Uh/rL6gLKVLo0B6LKlFTjazrKQPtaoifX4sl
 P1ZtDzTDtAocbpWlUwFSppczBIHxoJME6ODT7kUPd8BkYk4oD+hxxM1Qwlro7w17EpWB
 DMgZ2jIFwx2mX7/bC8WOfkjB25jiV4dUtieQi4r3SpUWDjyHIv4tLKwnwcFtCofN4F5x
 o/4lfJTNyAfTPQyxcd+8DtAdpgDbUSQKVBi8IO1gkcIvpYHjdFVn7j9Br6N3iIv+/SqK 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpp8w0ycp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 08:29:17 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25E8D4nN029775;
 Tue, 14 Jun 2022 08:29:17 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpp8w0yc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 08:29:17 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25E8KfBr019279;
 Tue, 14 Jun 2022 08:29:15 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3gmjp8u47v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 08:29:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25E8TDxx17891826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 08:29:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BB3FA4055;
 Tue, 14 Jun 2022 08:29:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3EF9A4051;
 Tue, 14 Jun 2022 08:29:12 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.3.226])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jun 2022 08:29:12 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: cpu_init: Clean up stop state on cpu reset
Date: Tue, 14 Jun 2022 10:29:12 +0200
Message-Id: <20220614082912.378355-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lcU5p9Zhcpb3wALbwW-XLpRtaOCZcIMn
X-Proofpoint-GUID: hMZm3Fj_FIz5r13kwOZxEyVuUyeo7BXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=817
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140031
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'resume_as_sreset' attribute of a cpu can be set when a thread is
entering a stop state on ppc books. It causes the thread to be
re-routed to vector 0x100 when woken up by an exception. So it must be
cleaned on reset or a thread might be re-routed unexpectedly after a
reset, when it was not in a stop state and/or when the appropriate
exception handler isn't set up yet.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---

I didn't find an appropriate commit to add a "Fixes:". It originates
when adding support for power management states but the code looked
quite different in 2016 and it's not clear whether we were supporting
reset then.

target/ppc/cpu_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 0f891afa04..c16cb8dbe7 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7186,6 +7186,9 @@ static void ppc_cpu_reset(DeviceState *dev)
         }
         pmu_update_summaries(env);
     }
+
+    /* clean any pending stop state */
+    env->resume_as_sreset = 0;
 #endif
     hreg_compute_hflags(env);
     env->reserve_addr = (target_ulong)-1ULL;
-- 
2.35.3


