Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37C6111C7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:44:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOhU-0001sD-ER; Fri, 28 Oct 2022 08:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ooOhH-0001fj-Js
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:42:51 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ooOhD-00064l-4W
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:42:50 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SCVu3Z037179;
 Fri, 28 Oct 2022 12:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=APjp4q6dQZxZ3Ea3tysFhW2CetwEOH94gYqfg94Ugsw=;
 b=JHqqn5ConHOe02hYzG7JInWSbktdH4VJ4JtZF/rD9kgOvVCag82zpscXpgzcykz4B77D
 Hutz782a3DMrILJ9loyJaMXgFwQaLUx5wLgiKUI1n0S5agfW7BCLJ8ypDZw3OYHGVYDA
 RNt9+rKjQpxExTnBNJUtgb4PvAH7mtbWRTqM0KNAv+t9OB8bmtxwLz5J1LMX3vqgdJN0
 1SciMaqunMZgTeg5xMNLq9ITQTaNVnW/8aZ4JogE8Ca/Z/Zzn9gCelJ5dKAzV4gBJS14
 cpl3NHpCLWD1TxcihIE25+heLWe/GOiU4B1Y5Wy6fjTu0GWXNtyzJlJyFVtYZz0ONMGp GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgf5r0em4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 12:42:40 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SCYWw2006992;
 Fri, 28 Oct 2022 12:42:39 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgf5r0ejr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 12:42:39 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SCZ1cD026295;
 Fri, 28 Oct 2022 12:42:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3kfaht2me2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 12:42:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29SCgZcs57606540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 12:42:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EC93A4053;
 Fri, 28 Oct 2022 12:42:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A25DA404D;
 Fri, 28 Oct 2022 12:42:35 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 12:42:35 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 1/2] accel/tcg: Fix concurrent pthread_create() and munmap()
Date: Fri, 28 Oct 2022 14:42:26 +0200
Message-Id: <20221028124227.2354792-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221028124227.2354792-1-iii@linux.ibm.com>
References: <20221028124227.2354792-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EvuyQIxoZg12pqXmHM4H6dWi4bVWSakj
X-Proofpoint-ORIG-GUID: ArUPimZoDNu7cOPcPLsf1Hyo-jYaWhtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_06,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280077
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

munmap() flushes jump cache on all CPUs if the unmapped range contains
a translation block. This currently includes new CPUs (i.e. qemu-user
threads), for which there is no jump cache yet, which leads to a null
pointer dereference.

Fix by skipping new CPUs.

Fixes: a976a99a2975 ("include/hw/core: Create struct CPUJumpCache")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/tb-maint.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index c8e921089df..2a063f91aa6 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -241,6 +241,11 @@ static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
         CPU_FOREACH(cpu) {
             CPUJumpCache *jc = cpu->tb_jmp_cache;
 
+            if (unlikely(!jc)) {
+                /* This is a new CPU that is not initialized yet. */
+                continue;
+            }
+
             if (qatomic_read(&jc->array[h].tb) == tb) {
                 qatomic_set(&jc->array[h].tb, NULL);
             }
-- 
2.37.2


