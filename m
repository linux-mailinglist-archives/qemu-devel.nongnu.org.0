Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F08B609A26
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:00:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omiA4-00070Q-Sa
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1omGji-0002TC-Ge
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 11:48:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1omGjg-0008LN-Vl
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 11:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666453712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dbzyM+9g9fjSLtaxfcxeYNDxW4iMiSOGFthjgPIStQ=;
 b=ZCmUJx7v/yKmnw7jPuEawHltPsjwKyjkyfMVxz4HnvMwm7WMKCxPPE/5LvwTCERw8DbMSu
 R+eeQLSaxD6Wd9MtGZqXsmmiMB8FOk1PBOvl22z+ozkt3shcmfamGrO0kCgI/Lo6t19BTv
 xZGh6pANAP0fWVeqH2anLHJX7hJfuiU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-UIIhHk5sP4-sgGnYe7LgDA-1; Sat, 22 Oct 2022 11:48:28 -0400
X-MC-Unique: UIIhHk5sP4-sgGnYe7LgDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EAA5811E75;
 Sat, 22 Oct 2022 15:48:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEC8140C6E14;
 Sat, 22 Oct 2022 15:48:26 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 2/2] accel/kvm: introduce begin/commit listener callbacks
Date: Sat, 22 Oct 2022 11:48:23 -0400
Message-Id: <20221022154823.1823193-3-eesposit@redhat.com>
In-Reply-To: <20221022154823.1823193-1-eesposit@redhat.com>
References: <20221022154823.1823193-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These callback make sure that all vcpus are blocked before
performing memslot updates, and resumed once we are finished.

They rely on kvm support for KVM_KICK_ALL_RUNNING_VCPUS and
KVM_RESUME_ALL_KICKED_VCPUS ioctls to respectively pause and
resume all vcpus that are in KVM_RUN state.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 accel/kvm/kvm-all.c | 50 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 645f0a249a..bd0dfa8613 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -178,6 +178,8 @@ bool kvm_has_guest_debug;
 int kvm_sstep_flags;
 static bool kvm_immediate_exit;
 static hwaddr kvm_max_slot_size = ~0;
+static QemuEvent mem_transaction_proceed;
+
 
 static const KVMCapabilityInfo kvm_required_capabilites[] = {
     KVM_CAP_INFO(USER_MEMORY),
@@ -1523,6 +1525,38 @@ static void kvm_region_del(MemoryListener *listener,
     memory_region_unref(section->mr);
 }
 
+static void kvm_begin(MemoryListener *listener)
+{
+    KVMState *s = kvm_state;
+
+    /*
+     * Make sure BQL is taken so cpus in kvm_cpu_exec that just exited from
+     * KVM_RUN do not continue, since many run->exit_reason take it anyways.
+     */
+    assert(qemu_mutex_iothread_locked());
+
+    /*
+     * Stop incoming cpus that want to execute KVM_RUN from running.
+     * Makes cpus calling qemu_event_wait() in kvm_cpu_exec() block.
+     */
+    qemu_event_reset(&mem_transaction_proceed);
+
+    /* Ask KVM to stop all vcpus that are currently running KVM_RUN */
+    kvm_vm_ioctl(s, KVM_KICK_ALL_RUNNING_VCPUS);
+}
+
+static void kvm_commit(MemoryListener *listener)
+{
+    KVMState *s = kvm_state;
+    assert(qemu_mutex_iothread_locked());
+
+    /* Ask KVM to resume all vcpus that are currently blocked in KVM_RUN */
+    kvm_vm_ioctl(s, KVM_RESUME_ALL_KICKED_VCPUS);
+
+    /* Resume cpus waiting in qemu_event_wait() in kvm_cpu_exec() */
+    qemu_event_set(&mem_transaction_proceed);
+}
+
 static void kvm_log_sync(MemoryListener *listener,
                          MemoryRegionSection *section)
 {
@@ -1668,6 +1702,8 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
     kml->listener.region_del = kvm_region_del;
     kml->listener.log_start = kvm_log_start;
     kml->listener.log_stop = kvm_log_stop;
+    kml->listener.begin = kvm_begin;
+    kml->listener.commit = kvm_commit;
     kml->listener.priority = 10;
     kml->listener.name = name;
 
@@ -2611,6 +2647,7 @@ static int kvm_init(MachineState *ms)
     }
 
     kvm_state = s;
+    qemu_event_init(&mem_transaction_proceed, false);
 
     ret = kvm_arch_init(ms, s);
     if (ret < 0) {
@@ -2875,6 +2912,19 @@ int kvm_cpu_exec(CPUState *cpu)
     }
 
     qemu_mutex_unlock_iothread();
+
+    /*
+     * Wait that a running memory transaction (memslot update) is concluded.
+     *
+     * If the event state is EV_SET, it means kvm_commit() has already finished
+     * and called qemu_event_set(), therefore cpu can execute.
+     *
+     * If it's EV_FREE, it means kvm_begin() has already called
+     * qemu_event_reset(), therefore a memory transaction is happening and the
+     * cpu must wait.
+     */
+    qemu_event_wait(&mem_transaction_proceed);
+
     cpu_exec_start(cpu);
 
     do {
-- 
2.31.1


