Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB6132ABD2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:51:09 +0100 (CET)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHBz2-00039a-Kb
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwc-0001NS-5J
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwa-00085E-Ez
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:37 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KhIIr124566; Tue, 2 Mar 2021 15:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8ZOaX8pUhxLDYxV8GkmhAwqnKTZb51Fhp3sOw/Kv6v0=;
 b=eECjofdEJ9dmBtpre2h2C13AJKObi2Iy8hQG1RkQMjGWtECa2YCI3Jzqp653Z1/jTNeH
 FzzKSYr9nihpbB0FqzYd46dEANATAb+Qrp0h0c41lZSwrLWAIHRV1qeSYtEvrX7Ej6kX
 BD4zaNhyORLYhI4fjtI0KN7CfA7H233q7TEYFsiICIwLuvJF/+eh4m3CiXLRV9dS4VDy
 5qaRJawDhhOpV8UkZXXugiy/FA/jVDDzAWuUa2mhUQw0BsUv29oOvBEXSjFhwFmCd76X
 gL7HqVpxbS3FJG8hJtZnJb+qywlp7WTw53D8M4mb8465V+tlpGaMb1v6Mz2Q3Os03zdu Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn7r7cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:33 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KiJl2138163;
 Tue, 2 Mar 2021 15:48:32 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn7r7cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:32 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KhNUC016036;
 Tue, 2 Mar 2021 20:48:32 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 37128ga1vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:32 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmV0t18022732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:31 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4227E2805A;
 Tue,  2 Mar 2021 20:48:31 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2095F28066;
 Tue,  2 Mar 2021 20:48:31 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:31 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/26] softmmu: Add pause_all_vcpus_except_aux
Date: Tue,  2 Mar 2021 15:48:07 -0500
Message-Id: <20210302204822.81901-12-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>, Jon Grimm <jon.grimm@amd.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>

Introduce a function to pause all CPUs except the auxiliary CPUs.  This
will be used during migration when a migration handler is running on the
auxiliary CPU.

Co-Author: Dov Murik <dovmurik@linux.vnet.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
Signed-off-by: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
---
 include/sysemu/cpus.h |  1 +
 softmmu/cpus.c        | 53 +++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index dc24e38254..e668570053 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -34,6 +34,7 @@ bool qemu_in_vcpu_thread(void);
 void qemu_init_cpu_loop(void);
 void resume_all_vcpus(void);
 void pause_all_vcpus(void);
+void pause_all_vcpus_except_aux(void);
 void cpu_stop_current(void);
 
 extern int icount_align_option;
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 68fa4639a7..3028b5d0d4 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -550,6 +550,19 @@ static bool all_vcpus_paused(void)
     return true;
 }
 
+static bool all_vcpus_except_aux_paused(void)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        if (!cpu->aux && !cpu->stopped) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
 void pause_all_vcpus(void)
 {
     CPUState *cpu;
@@ -564,15 +577,51 @@ void pause_all_vcpus(void)
         }
     }
 
+    /*
+     * Drop the replay_lock so any vCPU threads woken up can finish their
+     * replay tasks
+     */
+    replay_mutex_unlock();
+
+    while (!all_vcpus_paused()) {
+        qemu_cond_wait(&qemu_pause_cond, &qemu_global_mutex);
+        CPU_FOREACH(cpu) {
+            qemu_cpu_kick(cpu);
+        }
+    }
+
+    qemu_mutex_unlock_iothread();
+    replay_mutex_lock();
+    qemu_mutex_lock_iothread();
+}
+
+void pause_all_vcpus_except_aux(void)
+{
+    CPUState *cpu;
+
+    qemu_clock_enable(QEMU_CLOCK_VIRTUAL, false);
+    CPU_FOREACH(cpu) {
+        if (!cpu->aux) {
+            if (qemu_cpu_is_self(cpu)) {
+                qemu_cpu_stop(cpu, true);
+            } else {
+                cpu->stop = true;
+                qemu_cpu_kick(cpu);
+            }
+        }
+    }
+
     /* We need to drop the replay_lock so any vCPU threads woken up
      * can finish their replay tasks
      */
     replay_mutex_unlock();
 
-    while (!all_vcpus_paused()) {
+    while (!all_vcpus_except_aux_paused()) {
         qemu_cond_wait(&qemu_pause_cond, &qemu_global_mutex);
         CPU_FOREACH(cpu) {
-            qemu_cpu_kick(cpu);
+            if (!cpu->aux) {
+                qemu_cpu_kick(cpu);
+            }
         }
     }
 
-- 
2.20.1


