Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D169465E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 13:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYKR-0004vj-V7; Mon, 13 Feb 2023 07:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRYKO-0004vB-Jn
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:53:05 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRYKM-0008WI-N3
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:53:04 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DCTrjq020507; Mon, 13 Feb 2023 12:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lNG1C7/g61qucbNXvHa8aMus9ERooUklPM9og2hfzyY=;
 b=aJe/LHqpa2Y8KUZQTS/6XSYsrdxugnRoSJwzNk1U0zS/2JMr7nPtYmBb+kFDb+GtfCRa
 eqlfSzQ5TOuZblJyax4S1HGTL/TI9UGBFoL9/afPpmpEK0uTkVRpm8dzFTSNWE3PppBe
 2tqIqpaPZNjwAgg4qHYWWnKArRcCcauiu2tGLC3uK/lOtkMhkQM1BkMcnoGBeCwdMvkt
 5KK9hkK+I7xG6iKcqoXCwR1dqzpccuWEF20xV7AEwFoMWtmAAhKqY5Z0NibqJG8cxuRM
 7osk31qWG5PG7ruLMzDqhhDyeGpWH1ReFjts9+Q+PmqAKTgBDJWo5u+AAgjPuICVLE0e 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqn8y0gmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:52:54 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DCUJP6023742;
 Mon, 13 Feb 2023 12:52:53 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqn8y0gk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:52:53 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31D2fNlD031205;
 Mon, 13 Feb 2023 12:52:51 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3np2n69yg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:52:51 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DCqlSl49807630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 12:52:47 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A58C020040;
 Mon, 13 Feb 2023 12:52:47 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 064CA2004B;
 Mon, 13 Feb 2023 12:52:47 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.19.58])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 12:52:46 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 2/4] cpus: Make {start,end}_exclusive() recursive
Date: Mon, 13 Feb 2023 13:52:35 +0100
Message-Id: <20230213125238.331881-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213125238.331881-1-iii@linux.ibm.com>
References: <20230213125238.331881-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kmUc23UtaUnDPiSy9l_5SjJjjg6skTpD
X-Proofpoint-ORIG-GUID: MJDC1cLw_bc8si60r9ewrF_B9bVpGdNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_07,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 mlxlogscore=843 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302130112
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

Currently dying to one of the core_dump_signal()s deadlocks, because
dump_core_and_abort() calls start_exclusive() two times: first via
stop_all_tasks(), and then via preexit_cleanup() ->
qemu_plugin_user_exit().

There are a number of ways to solve this: resume after dumping core;
check cpu_in_exclusive_context() in qemu_plugin_user_exit(); or make
{start,end}_exclusive() recursive. Pick the last option, since it's
the most straightforward one.

Fixes: da91c1920242 ("linux-user: Clean up when exiting due to a signal")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 cpus-common.c         | 12 ++++++++++--
 include/hw/core/cpu.h |  4 ++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index 793364dc0ed..a0c52cd187f 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -192,6 +192,11 @@ void start_exclusive(void)
     CPUState *other_cpu;
     int running_cpus;
 
+    if (current_cpu->exclusive_context_count) {
+        current_cpu->exclusive_context_count++;
+        return;
+    }
+
     qemu_mutex_lock(&qemu_cpu_list_lock);
     exclusive_idle();
 
@@ -219,13 +224,16 @@ void start_exclusive(void)
      */
     qemu_mutex_unlock(&qemu_cpu_list_lock);
 
-    current_cpu->in_exclusive_context = true;
+    current_cpu->exclusive_context_count++;
 }
 
 /* Finish an exclusive operation.  */
 void end_exclusive(void)
 {
-    current_cpu->in_exclusive_context = false;
+    current_cpu->exclusive_context_count--;
+    if (current_cpu->exclusive_context_count) {
+        return;
+    }
 
     qemu_mutex_lock(&qemu_cpu_list_lock);
     qatomic_set(&pending_cpus, 0);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2417597236b..671f041bec6 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -349,7 +349,7 @@ struct CPUState {
     bool unplug;
     bool crash_occurred;
     bool exit_request;
-    bool in_exclusive_context;
+    int exclusive_context_count;
     uint32_t cflags_next_tb;
     /* updates protected by BQL */
     uint32_t interrupt_request;
@@ -758,7 +758,7 @@ void async_safe_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data
  */
 static inline bool cpu_in_exclusive_context(const CPUState *cpu)
 {
-    return cpu->in_exclusive_context;
+    return cpu->exclusive_context_count;
 }
 
 /**
-- 
2.39.1


