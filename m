Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19098619B38
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 16:16:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqyPT-0004kn-KA; Fri, 04 Nov 2022 11:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqyPR-0004kY-9Y
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 11:15:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqyPP-0000Y3-IP
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 11:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667574902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FqajUAJmYrE2XQXwS2++lD6bdpKZOtRow+ECsg6ZdMo=;
 b=Jjt+V1z2V/77eyydv8Tc1n2mFqAjMU0pKMZbHmIyixwzX775/T7XzFZQuAFMLWNcKlNGTr
 i6AeC4wUqRmzVwJs3xDA7BqGxJMbPXNYSuCsishF41OdmfosG/LCD9kKrlSxo0L0YrWOGM
 SyJTjcWNOe+K+GDWs761wZ3LYsDRWVY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-iCifCcRINnyAhF1zNoGO6g-1; Fri, 04 Nov 2022 11:14:56 -0400
X-MC-Unique: iCifCcRINnyAhF1zNoGO6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61DBA185A78F;
 Fri,  4 Nov 2022 15:14:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 223B8C1908B;
 Fri,  4 Nov 2022 15:14:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH 1/3] KVM: keep track of running ioctls
Date: Fri,  4 Nov 2022 11:14:52 -0400
Message-Id: <20221104151454.136551-2-eesposit@redhat.com>
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

kvm_in_ioctl_lock uses a QemuLockCnt to keep track of the running
ioctls. It will be used by the memory listener to make sure no
new ioctl runs when it has to perform memslots modifications.

Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 accel/kvm/kvm-all.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f99b0becd8..099d7bda56 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -105,6 +105,8 @@ static int kvm_sstep_flags;
 static bool kvm_immediate_exit;
 static hwaddr kvm_max_slot_size = ~0;
 
+QemuLockCnt kvm_in_ioctl_lock;
+
 static const KVMCapabilityInfo kvm_required_capabilites[] = {
     KVM_CAP_INFO(USER_MEMORY),
     KVM_CAP_INFO(DESTROY_MEMORY_REGION_WORKS),
@@ -2310,6 +2312,7 @@ static int kvm_init(MachineState *ms)
     assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size());
 
     s->sigmask_len = 8;
+    qemu_lockcnt_init(&kvm_in_ioctl_lock);
 
 #ifdef KVM_CAP_SET_GUEST_DEBUG
     QTAILQ_INIT(&s->kvm_sw_breakpoints);
@@ -2808,6 +2811,18 @@ static void kvm_eat_signals(CPUState *cpu)
     } while (sigismember(&chkset, SIG_IPI));
 }
 
+static void kvm_set_in_ioctl(bool in_ioctl)
+{
+    if (likely(qemu_mutex_iothread_locked())) {
+        return;
+    }
+    if (in_ioctl) {
+        qemu_lockcnt_inc(&kvm_in_ioctl_lock);
+    } else {
+        qemu_lockcnt_dec(&kvm_in_ioctl_lock);
+    }
+}
+
 int kvm_cpu_exec(CPUState *cpu)
 {
     struct kvm_run *run = cpu->kvm_run;
@@ -3014,7 +3029,9 @@ int kvm_vm_ioctl(KVMState *s, int type, ...)
     va_end(ap);
 
     trace_kvm_vm_ioctl(type, arg);
+    kvm_set_in_ioctl(true);
     ret = ioctl(s->vmfd, type, arg);
+    kvm_set_in_ioctl(false);
     if (ret == -1) {
         ret = -errno;
     }
@@ -3050,7 +3067,9 @@ int kvm_device_ioctl(int fd, int type, ...)
     va_end(ap);
 
     trace_kvm_device_ioctl(fd, type, arg);
+    kvm_set_in_ioctl(true);
     ret = ioctl(fd, type, arg);
+    kvm_set_in_ioctl(false);
     if (ret == -1) {
         ret = -errno;
     }
-- 
2.31.1


