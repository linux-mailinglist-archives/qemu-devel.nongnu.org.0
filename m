Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23641619B3A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 16:16:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqyPs-0004oR-8W; Fri, 04 Nov 2022 11:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqyPc-0004lo-O9
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 11:15:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqyPP-0000Wl-4H
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 11:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667574901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tE42PNnFF/m0fEHtmSiadsyNXCXcPI2ur/gt+05bV+k=;
 b=IhG/58gQ6rUZ6ywdRgC7vXzJUHPjOM7D0Sjv/i3Y02XjRW2GiIjnIxk+zN73aG8jEGO5Pt
 ojq4YZo2quTVsXB83cBGA87SFvZbXzvPMWCHRVUEiPLcca3JodRkRlm6bkgDCCcLTbc1xL
 RTnjTeJWQNSyQ7q/GkJgDkBEGFiWwfw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-bP32ffFeP-WFP6Kkw4XF0g-1; Fri, 04 Nov 2022 11:14:57 -0400
X-MC-Unique: bP32ffFeP-WFP6Kkw4XF0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDC132999B25;
 Fri,  4 Nov 2022 15:14:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6ABD2C2C8D9;
 Fri,  4 Nov 2022 15:14:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH 2/3] KVM: keep track of running vcpu ioctls
Date: Fri,  4 Nov 2022 11:14:53 -0400
Message-Id: <20221104151454.136551-3-eesposit@redhat.com>
In-Reply-To: <20221104151454.136551-1-eesposit@redhat.com>
References: <20221104151454.136551-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Just as in kvm-all.c, introduce per-vcpu QemuLockCnt to keep
track when vcpus are executing an ioctl.
Keep a per-vcpu lock to minimize cache line bouncing.
The kvm listener will then use the lock to prevent new ioctls
from running when modifying memslots.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 accel/kvm/kvm-all.c   | 14 ++++++++++++++
 hw/core/cpu-common.c  |  2 ++
 include/hw/core/cpu.h |  3 +++
 3 files changed, 19 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 099d7bda56..48cdf1fecd 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2811,6 +2811,18 @@ static void kvm_eat_signals(CPUState *cpu)
     } while (sigismember(&chkset, SIG_IPI));
 }
 
+static void kvm_cpu_set_in_ioctl(CPUState *cpu, bool in_ioctl)
+{
+    if (unlikely(qemu_mutex_iothread_locked())) {
+        return;
+    }
+    if (in_ioctl) {
+        qemu_lockcnt_inc(&cpu->in_ioctl_lock);
+    } else {
+        qemu_lockcnt_dec(&cpu->in_ioctl_lock);
+    }
+}
+
 static void kvm_set_in_ioctl(bool in_ioctl)
 {
     if (likely(qemu_mutex_iothread_locked())) {
@@ -3049,7 +3061,9 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type, ...)
     va_end(ap);
 
     trace_kvm_vcpu_ioctl(cpu->cpu_index, type, arg);
+    kvm_cpu_set_in_ioctl(cpu, true);
     ret = ioctl(cpu->kvm_fd, type, arg);
+    kvm_cpu_set_in_ioctl(cpu, false);
     if (ret == -1) {
         ret = -errno;
     }
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index f9fdd46b9d..8d6a4b1b65 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -237,6 +237,7 @@ static void cpu_common_initfn(Object *obj)
     cpu->nr_threads = 1;
 
     qemu_mutex_init(&cpu->work_mutex);
+    qemu_lockcnt_init(&cpu->in_ioctl_lock);
     QSIMPLEQ_INIT(&cpu->work_list);
     QTAILQ_INIT(&cpu->breakpoints);
     QTAILQ_INIT(&cpu->watchpoints);
@@ -248,6 +249,7 @@ static void cpu_common_finalize(Object *obj)
 {
     CPUState *cpu = CPU(obj);
 
+    qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
     qemu_mutex_destroy(&cpu->work_mutex);
 }
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index f9b58773f7..07852b2a3c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -397,6 +397,9 @@ struct CPUState {
     uint32_t kvm_fetch_index;
     uint64_t dirty_pages;
 
+    /* kvm only for now: CPU is in kvm_vcpu_ioctl() (esp. KVM_RUN) */
+    QemuLockCnt in_ioctl_lock;
+
     /* Used for events with 'vcpu' and *without* the 'disabled' properties */
     DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
     DECLARE_BITMAP(trace_dstate, CPU_TRACE_DSTATE_MAX_EVENTS);
-- 
2.31.1


