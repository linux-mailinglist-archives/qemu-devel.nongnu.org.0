Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB3E6F01C3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:29:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prw4B-0002c2-Tz; Thu, 27 Apr 2023 03:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jiles@quicinc.com>)
 id 1prw47-0002Vr-Kr
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:29:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jiles@quicinc.com>)
 id 1prw44-0007uD-DF
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:29:18 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33R7TBPi012778; Thu, 27 Apr 2023 07:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=D/QU4nbpPqPlyL28ob9YEahlkhtqO0CknrKlfodmxj4=;
 b=IU7Df+D8EjkwozeTuLsdGleTcPUtHbLY9ZSoAyAIb4C4+BvJapvDnxAEHfRVYGio42Wb
 6cX/zoG4TOi+nJzPdM364oFkDOEZCEajTsZbIYqSN4IOQo9S/gUzP7efUli7jlMhm4VW
 uE7XMVP/953laNMDFVsZr4fIkGvNTD1R7ItG17YYS1LuzGOmKrsfsAA4Iw6cB3u0eiKm
 8o5zoZ4Syce/6GzTXn1rHQcazSJjIRsjjefF7mcc1D0IUf2DArldyekeR9/xJ5Fhi78E
 ouyQOG981p6+yKSrwXFEtNpPKwbcFScChDez3vwxcmiFtQdJsZj9v+buKoEa35vZrxqG nQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q79am18xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 07:29:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33R7TAew030782
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 07:29:10 GMT
Received: from localhost (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 27 Apr
 2023 00:29:09 -0700
From: Jamie Iles <quic_jiles@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>, <pbonzini@redhat.com>, <philmd@linaro.org>,
 <peter.maydell@linaro.org>
Subject: [PATCH v3 1/2] cpu: expose qemu_cpu_list_lock for lock-guard use
Date: Thu, 27 Apr 2023 03:09:24 +0100
Message-ID: <20230427020925.51003-2-quic_jiles@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230427020925.51003-1-quic_jiles@quicinc.com>
References: <20230427020925.51003-1-quic_jiles@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cf7OwwjTPHsoYJiIK704bzdWKPf8g79j
X-Proofpoint-ORIG-GUID: cf7OwwjTPHsoYJiIK704bzdWKPf8g79j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_05,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270063
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_jiles@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Expose qemu_cpu_list_lock globally so that we can use
WITH_QEMU_LOCK_GUARD and QEMU_LOCK_GUARD to simplify a few code paths
now and in future.

Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
---
 cpus-common.c             |  2 +-
 include/exec/cpu-common.h |  1 +
 linux-user/elfload.c      | 12 ++++++------
 migration/dirtyrate.c     | 26 +++++++++++++-------------
 trace/control-target.c    |  9 ++++-----
 5 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index b0047e456f93..82d439add5c1 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -25,7 +25,7 @@
 #include "qemu/lockable.h"
 #include "trace/trace-root.h"
 
-static QemuMutex qemu_cpu_list_lock;
+QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
 static QemuCond exclusive_resume;
 static QemuCond qemu_work_cond;
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6feaa40ca7b0..0c833d6ac9c6 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -32,6 +32,7 @@ extern intptr_t qemu_host_page_mask;
 #define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_size())
 
 /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
+extern QemuMutex qemu_cpu_list_lock;
 void qemu_init_cpu_list(void);
 void cpu_list_lock(void);
 void cpu_list_unlock(void);
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1dbc1f0f9baa..3ff16b163382 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -4238,14 +4238,14 @@ static int fill_note_info(struct elf_note_info *info,
         info->notes_size += note_size(&info->notes[i]);
 
     /* read and fill status of all threads */
-    cpu_list_lock();
-    CPU_FOREACH(cpu) {
-        if (cpu == thread_cpu) {
-            continue;
+    WITH_QEMU_LOCK_GUARD(&qemu_cpu_list_lock) {
+        CPU_FOREACH(cpu) {
+            if (cpu == thread_cpu) {
+                continue;
+            }
+            fill_thread_info(info, cpu->env_ptr);
         }
-        fill_thread_info(info, cpu->env_ptr);
     }
-    cpu_list_unlock();
 
     return (0);
 }
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 180ba38c7a80..388337a33249 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -150,25 +150,25 @@ int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
 retry:
     init_time_ms = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
 
-    cpu_list_lock();
-    gen_id = cpu_list_generation_id_get();
-    records = vcpu_dirty_stat_alloc(stat);
-    vcpu_dirty_stat_collect(stat, records, true);
-    cpu_list_unlock();
+    WITH_QEMU_LOCK_GUARD(&qemu_cpu_list_lock) {
+        gen_id = cpu_list_generation_id_get();
+        records = vcpu_dirty_stat_alloc(stat);
+        vcpu_dirty_stat_collect(stat, records, true);
+    }
 
     duration = dirty_stat_wait(calc_time_ms, init_time_ms);
 
     global_dirty_log_sync(flag, one_shot);
 
-    cpu_list_lock();
-    if (gen_id != cpu_list_generation_id_get()) {
-        g_free(records);
-        g_free(stat->rates);
-        cpu_list_unlock();
-        goto retry;
+    WITH_QEMU_LOCK_GUARD(&qemu_cpu_list_lock) {
+        if (gen_id != cpu_list_generation_id_get()) {
+            g_free(records);
+            g_free(stat->rates);
+            cpu_list_unlock();
+            goto retry;
+        }
+        vcpu_dirty_stat_collect(stat, records, false);
     }
-    vcpu_dirty_stat_collect(stat, records, false);
-    cpu_list_unlock();
 
     for (i = 0; i < stat->nvcpu; i++) {
         dirtyrate = do_calculate_dirtyrate(records[i], duration);
diff --git a/trace/control-target.c b/trace/control-target.c
index 232c97a4a183..c0c1e2310a51 100644
--- a/trace/control-target.c
+++ b/trace/control-target.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/lockable.h"
 #include "cpu.h"
 #include "trace/trace-root.h"
 #include "trace/control.h"
@@ -116,11 +117,9 @@ static bool adding_first_cpu1(void)
 
 static bool adding_first_cpu(void)
 {
-    bool res;
-    cpu_list_lock();
-    res = adding_first_cpu1();
-    cpu_list_unlock();
-    return res;
+    QEMU_LOCK_GUARD(&qemu_cpu_list_lock);
+
+    return adding_first_cpu1();
 }
 
 void trace_init_vcpu(CPUState *vcpu)
-- 
2.25.1


