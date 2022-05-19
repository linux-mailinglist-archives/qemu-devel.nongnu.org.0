Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C532C52CA72
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 05:40:08 +0200 (CEST)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrX1D-00022r-TM
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 23:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nrWyI-0006n6-Mv
 for qemu-devel@nongnu.org; Wed, 18 May 2022 23:37:06 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:53986
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nrWyH-0008Nq-2A
 for qemu-devel@nongnu.org; Wed, 18 May 2022 23:37:06 -0400
HMM_SOURCE_IP: 172.18.0.188:58888.87199194
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.84 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id BCB44280106;
 Thu, 19 May 2022 11:36:56 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 887ea5c217db4d77908cdf60f585659e for
 qemu-devel@nongnu.org; Thu, 19 May 2022 11:37:01 CST
X-Transaction-ID: 887ea5c217db4d77908cdf60f585659e
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [PATCH v24 2/8] cpus: Introduce cpu_list_generation_id
Date: Thu, 19 May 2022 11:36:42 +0800
Message-Id: <4d7a5f2c86066839054282b1c224067d89d32fc1.1652931128.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1652931128.git.huangy81@chinatelecom.cn>
References: <cover.1652931128.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1652931128.git.huangy81@chinatelecom.cn>
References: <cover.1652931128.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
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
index db459b4..793364d 100644
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
index 5968551..2281be4 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -35,6 +35,7 @@ extern intptr_t qemu_host_page_mask;
 void qemu_init_cpu_list(void);
 void cpu_list_lock(void);
 void cpu_list_unlock(void);
+unsigned int cpu_list_generation_id_get(void);
 
 void tcg_flush_softmmu_tlb(CPUState *cs);
 
-- 
1.8.3.1


