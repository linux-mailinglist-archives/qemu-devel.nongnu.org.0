Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E9D42726C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 22:40:05 +0200 (CEST)
Received: from localhost ([::1]:39164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYwey-0003ea-T6
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 16:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mYwdN-0002CF-K5; Fri, 08 Oct 2021 16:38:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60894
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mYwdK-0002Sm-OL; Fri, 08 Oct 2021 16:38:25 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 198KRTLT019991; 
 Fri, 8 Oct 2021 16:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0/vZN5Yg2NJiRX/iHwZTZyvlpNLftAXCl8FvryhERGg=;
 b=I0+deBlxluPw4RnEAI8teR13Ksr/UDBTzEQCBYfxMWxRV96S50oEwWdzeK7qweTLw0Iw
 GpYFtNTrrib8HTLfgY/mU4yCf1MN+oJjtwlrnmsBWFfQHt0hY0SILa0vly8YsSuJiqQx
 NzQhbhmVVQ2NBrwpSL3bEHB3HFbZKfdyVllPj6xMjVoQCtp7xueCIcZ76l5E/CLk140O
 V6NCP54o7z9hPco3VY4s3QfkR6m1m2lOGUbFIzLV6movisst0nFAdTinSnu+tZubXmPx
 FUGveZvT1HGMKxhMXIgW7cxEcMxTu363oWP60APA9xYKvvSrqELdoIVMdjGaOzB9pisy nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bjueatb64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 16:38:18 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 198KRsxW021108;
 Fri, 8 Oct 2021 16:38:18 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bjueatb5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 16:38:18 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 198KMXqA014268;
 Fri, 8 Oct 2021 20:38:16 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3bef2b5jug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 20:38:16 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 198KcCHJ40173850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Oct 2021 20:38:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C956511C04A;
 Fri,  8 Oct 2021 20:38:12 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B50AD11C04C;
 Fri,  8 Oct 2021 20:38:12 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  8 Oct 2021 20:38:12 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 45E80E0287; Fri,  8 Oct 2021 22:38:12 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v1 1/2] s390x: sigp: Force Set Architecture to return
 Invalid Parameter
Date: Fri,  8 Oct 2021 22:38:10 +0200
Message-Id: <20211008203811.1980478-2-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008203811.1980478-1-farman@linux.ibm.com>
References: <20211008203811.1980478-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p5SKtyRhTwKGOqPRcik_nDJzaoSS8zOX
X-Proofpoint-ORIG-GUID: nk4F3l-s1b_q0PyQE7sDtQdLzSzQuEdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_06,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Farman <farman@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the Principles of Operation, the SIGP Set Architecture
order will return Incorrect State if some CPUs are not stopped, but
only if the CZAM facility is not present. If it is, the order will
return Invalid Parameter because the architecture mode cannot be
changed.

Since CZAM always exists when S390_FEAT_ZARCH exists, which in turn
exists for every defined CPU model, we can simplify this code.

Fixes: 075e52b81664 ("s390x/cpumodel: we are always in zarchitecture mode")
Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
---
 target/s390x/sigp.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index d57427ced8..51c727834c 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -428,26 +428,10 @@ static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
 static int sigp_set_architecture(S390CPU *cpu, uint32_t param,
                                  uint64_t *status_reg)
 {
-    CPUState *cur_cs;
-    S390CPU *cur_cpu;
-    bool all_stopped = true;
-
-    CPU_FOREACH(cur_cs) {
-        cur_cpu = S390_CPU(cur_cs);
-
-        if (cur_cpu == cpu) {
-            continue;
-        }
-        if (s390_cpu_get_state(cur_cpu) != S390_CPU_STATE_STOPPED) {
-            all_stopped = false;
-        }
-    }
-
     *status_reg &= 0xffffffff00000000ULL;
 
     /* Reject set arch order, with czam we're always in z/Arch mode. */
-    *status_reg |= (all_stopped ? SIGP_STAT_INVALID_PARAMETER :
-                    SIGP_STAT_INCORRECT_STATE);
+    *status_reg |= SIGP_STAT_INVALID_PARAMETER;
     return SIGP_CC_STATUS_STORED;
 }
 
-- 
2.25.1


