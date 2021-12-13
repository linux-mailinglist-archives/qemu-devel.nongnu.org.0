Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151AB47366F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 22:12:57 +0100 (CET)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwscx-0003wQ-QL
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 16:12:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mwsZh-0002DV-3m; Mon, 13 Dec 2021 16:09:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mwsZe-00072Y-Km; Mon, 13 Dec 2021 16:09:32 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BDKEanL006208; 
 Mon, 13 Dec 2021 21:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NC5WyxT++MnvHJzBtX73jR/wgi/1XVtS0wO7SVOciEA=;
 b=LzzB3HsOTl0ul6R+Nf9e3IR6MPBEXLTSY11qBYlSPgJ3vQNRc20mU1XwKmlz7KcJT6zj
 RSAiInzWldVVgd7QY+rR2rXTzIaXqXozNjnjeQfF5RiRWm3ycKrVYhdTldAArwxyHZNE
 R25zCkmMGmKJqCpY+/QzGa6r6kLRx2Ru+zoOPop+CF8al80qpYKZEiGvKIlSXLTAxImJ
 fBubdaahZ2GGOCnHbju7ScNFms3DX/1+oQLBaSqVBkprITF9Q7fY658YreQ93mIe35wu
 omYlMCaekmpEjrnsaQwd1RcHIS0h2LfB2NioJXMYicZ6TXIF6jFSt4v2tO9xdWSIPfe1 Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx9r6erxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 21:09:26 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BDL9Pue004340;
 Mon, 13 Dec 2021 21:09:25 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx9r6erx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 21:09:25 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BDL8EBa000588;
 Mon, 13 Dec 2021 21:09:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3cvkm97stp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 21:09:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BDL9KLm38994334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 21:09:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FDBDAE045;
 Mon, 13 Dec 2021 21:09:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E649AE053;
 Mon, 13 Dec 2021 21:09:20 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Dec 2021 21:09:20 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 3E729E032B; Mon, 13 Dec 2021 22:09:20 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v5 1/1] s390x: sigp: Reorder the SIGP STOP code
Date: Mon, 13 Dec 2021 22:09:19 +0100
Message-Id: <20211213210919.856693-2-farman@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213210919.856693-1-farman@linux.ibm.com>
References: <20211213210919.856693-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EuZ3ykZ2ZsD4FLoPWMoBIAOex3daXhCP
X-Proofpoint-ORIG-GUID: tbKn9mg3gkwK17_5nXkM9OdqhGhXUhuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-13_10,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxlogscore=888 malwarescore=0
 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112130125
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's wait to mark the VCPU STOPPED until the possible
STORE STATUS operation is completed, so that we know the
CPU is fully stopped and done doing anything. (When we
also clear the possible sigp_order field for STOP orders.)

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 target/s390x/sigp.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 51c727834c..9dd977349a 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -139,7 +139,7 @@ static void sigp_stop_and_store_status(CPUState *cs, run_on_cpu_data arg)
     case S390_CPU_STATE_OPERATING:
         cpu->env.sigp_order = SIGP_STOP_STORE_STATUS;
         cpu_inject_stop(cpu);
-        /* store will be performed in do_stop_interrup() */
+        /* store will be performed in do_stop_interrupt() */
         break;
     case S390_CPU_STATE_STOPPED:
         /* already stopped, just store the status */
@@ -479,13 +479,17 @@ void do_stop_interrupt(CPUS390XState *env)
 {
     S390CPU *cpu = env_archcpu(env);
 
-    if (s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu) == 0) {
-        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
-    }
+    /*
+     * Complete the STOP operation before exposing the CPU as
+     * STOPPED to the system.
+     */
     if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
         s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
     }
     env->sigp_order = 0;
+    if (s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu) == 0) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
     env->pending_int &= ~INTERRUPT_STOP;
 }
 
-- 
2.32.0


