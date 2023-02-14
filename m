Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA86965F9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:09:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvzZ-0002tk-Kr; Tue, 14 Feb 2023 09:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRvzQ-0002qM-97
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:09:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRvzO-0002rL-OG
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:09:00 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EDC1Bj018425; Tue, 14 Feb 2023 14:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=T9ylNlqmX7/aYO8mBrMusySnQ78yX++7wgIA7Fv1xE0=;
 b=n75BpUbr9Qbjea6diBSuKXDJQDW28VTifaqO8Ibd0WOKCJigKjLZbM8gnihiYvhkh5cS
 i03CljgKKEUgg5TMwUgv1SDcf8o3Sjozfnj4jk05ODW/8stWQC3gKgJhI8lOo14OFZcD
 1/whDuvLoAJtu367qjj7PyruUD53Eab6VmpkNByS4GEOrSTrTRB1wFcthHoQqt4vH1Fw
 KT75efwERWFLxF+GJq09tcSFcPOJPNDN1FWGA+zRDtN1M1gyLEdoDWmlfQ4gKmofc0S5
 YtwT9UKLQl5Qh3fMyDkIGT2ALo8h9HON46iAeC0iNQmpOS2zE2OFjCOVUz7MXYQs4YfY /w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrayfa3np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 14:08:45 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EDDnCp029386;
 Tue, 14 Feb 2023 14:08:45 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrayfa3m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 14:08:45 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DMhLvj028203;
 Tue, 14 Feb 2023 14:08:43 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3np2n6b151-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 14:08:42 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31EE8dU745547926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 14:08:39 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5992620040;
 Tue, 14 Feb 2023 14:08:39 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC26B20043;
 Tue, 14 Feb 2023 14:08:38 +0000 (GMT)
Received: from heavy.boa-de.ibmmobiledemo.com (unknown [9.171.76.115])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Feb 2023 14:08:38 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 2/4] cpus: Make {start,end}_exclusive() recursive
Date: Tue, 14 Feb 2023 15:08:27 +0100
Message-Id: <20230214140829.45392-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214140829.45392-1-iii@linux.ibm.com>
References: <20230214140829.45392-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WXj9lWSsKnBlBOQXoXOCw30qLNtFLOwL
X-Proofpoint-ORIG-GUID: 9xCFuN_XbeTNWmjZR9IfZwsFCGu98Ov_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_07,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=972 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140120
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 cpus-common.c         | 12 ++++++++++--
 include/hw/core/cpu.h |  4 ++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index 793364dc0ed..39f355de989 100644
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
+    current_cpu->exclusive_context_count = 1;
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


