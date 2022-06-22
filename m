Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11C555424
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 21:24:55 +0200 (CEST)
Received: from localhost ([::1]:51102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o45yA-0006Qd-1I
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 15:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45Gx-0008O7-Cz
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:40:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45Gh-0002HX-M6
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655923197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8DQU0i0lGKHWOmR2WyMVOo1Rb4B9cDG2PRWzNiPdnM=;
 b=Ek7OkA3f+d4yP4+0/wejbmXEUuu6P6rT4p1ldSSw2EltD/lZxoUTbeyoVRfYqxfHAbFfpd
 CGxHN4yVoYiebY26sZD/CfEOZ1BxqodcqEDfCNYbqq9NPCFpiAGoky2Qz3JOiQlGlLVOrF
 Krtqo/4df58SL101AM/msqrDwn2iKLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-bFW3NKbKM2aBDn-rPBUYgg-1; Wed, 22 Jun 2022 14:39:54 -0400
X-MC-Unique: bFW3NKbKM2aBDn-rPBUYgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3CE1802D1F;
 Wed, 22 Jun 2022 18:39:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D581E9D63;
 Wed, 22 Jun 2022 18:39:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 27/33] cpus: Introduce cpu_list_generation_id
Date: Wed, 22 Jun 2022 19:39:11 +0100
Message-Id: <20220622183917.155308-28-dgilbert@redhat.com>
In-Reply-To: <20220622183917.155308-1-dgilbert@redhat.com>
References: <20220622183917.155308-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <4d7a5f2c86066839054282b1c224067d89d32fc1.1652931128.git.huangy81@chinatelecom.cn>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 cpus-common.c             | 8 ++++++++
 include/exec/cpu-common.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index db459b41ce..793364dc0e 100644
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
index 5968551a05..2281be4e10 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -35,6 +35,7 @@ extern intptr_t qemu_host_page_mask;
 void qemu_init_cpu_list(void);
 void cpu_list_lock(void);
 void cpu_list_unlock(void);
+unsigned int cpu_list_generation_id_get(void);
 
 void tcg_flush_softmmu_tlb(CPUState *cs);
 
-- 
2.36.1


