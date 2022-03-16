Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005254DA6EC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 01:34:29 +0100 (CET)
Received: from localhost ([::1]:35290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUHcR-0006S9-K8
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 20:34:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nUHZf-000410-Ds
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 20:31:35 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:39952
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nUHZd-00009u-37
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 20:31:34 -0400
HMM_SOURCE_IP: 172.18.0.218:51032.1870135587
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.168 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 6E3832800BC;
 Wed, 16 Mar 2022 08:31:16 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 858a579f9dc149eeae5dc163f02f9d8a for
 qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:31:24 CST
X-Transaction-ID: 858a579f9dc149eeae5dc163f02f9d8a
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v19 2/9] cpus: Introduce cpu_list_generation_id
Date: Wed, 16 Mar 2022 08:30:41 +0800
Message-Id: <88bf1196a2a7ef289542f33ba010f2cd5aee5f0c.1647390160.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1647390160.git.huangy81@chinatelecom.cn>
References: <cover.1647390160.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1647390160.git.huangy81@chinatelecom.cn>
References: <cover.1647390160.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Introduce cpu_list_generation_id to track cpu list generation so
that cpu hotplug/unplug can be detected during measurement of
dirty page rate.

cpu_list_generation_id could be used to detect changes of cpu
list, which is prepared for dirty page rate measurement.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 cpus-common.c             | 8 ++++++++
 include/exec/cpu-common.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index 6e73d3e..31c6415 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -73,6 +73,12 @@ static int cpu_get_free_index(void)
 }
 
 CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
+static unsigned int cpu_list_generation_id;
+
+unsigned int cpu_list_generation_id_get(void)
+{
+    return cpu_list_generation_id;
+}
 
 void cpu_list_add(CPUState *cpu)
 {
@@ -84,6 +90,7 @@ void cpu_list_add(CPUState *cpu)
         assert(!cpu_index_auto_assigned);
     }
     QTAILQ_INSERT_TAIL_RCU(&cpus, cpu, node);
+    cpu_list_generation_id++;
 }
 
 void cpu_list_remove(CPUState *cpu)
@@ -96,6 +103,7 @@ void cpu_list_remove(CPUState *cpu)
 
     QTAILQ_REMOVE_RCU(&cpus, cpu, node);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
+    cpu_list_generation_id++;
 }
 
 CPUState *qemu_get_cpu(int index)
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 7f7b594..856b0e7 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -32,6 +32,7 @@ extern intptr_t qemu_host_page_mask;
 void qemu_init_cpu_list(void);
 void cpu_list_lock(void);
 void cpu_list_unlock(void);
+unsigned int cpu_list_generation_id_get(void);
 
 void tcg_flush_softmmu_tlb(CPUState *cs);
 
-- 
1.8.3.1


