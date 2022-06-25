Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FC455ABC8
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 19:43:13 +0200 (CEST)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o59oO-0006KM-Ni
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 13:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1o59kI-0003Lo-UL
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:38:58 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:53110
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1o59kF-0007RC-S2
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 13:38:58 -0400
HMM_SOURCE_IP: 172.18.0.48:34982.1285566443
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.97.81 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 3FC322800C5;
 Sun, 26 Jun 2022 01:38:46 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id f72eeaf29a7d49a990ac706115d5be86 for
 qemu-devel@nongnu.org; Sun, 26 Jun 2022 01:38:52 CST
X-Transaction-ID: f72eeaf29a7d49a990ac706115d5be86
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hyman <huangy81@chinatelecom.cn>
Subject: [PATCH v25 2/8] cpus: Introduce cpu_list_generation_id
Date: Sun, 26 Jun 2022 01:38:31 +0800
Message-Id: <06e1f1362b2501a471dce796abb065b04f320fa5.1656177590.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1656177590.git.huangy81@chinatelecom.cn>
References: <cover.1656177590.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1656177590.git.huangy81@chinatelecom.cn>
References: <cover.1656177590.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
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


