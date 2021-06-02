Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1817398A12
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:52:03 +0200 (CEST)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQLq-0002kr-T1
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loQKs-0001nG-V6
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loQKp-0007Gd-TN
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622638258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hY+zcRilq4eC+V/y1nO3RGMpqFnpeG8S/6/vneIgYFE=;
 b=BpLtda8wV5fRHC+DsAWY/sRahcj7GvsxfiMxPgCBLaE8TwWi0zGvObsH+IUB9QCYaQmkvx
 +QeQySnBObg5hYsvDeHpa7tCQWOOWZW6kvEDiaoxQQ79h1C1308oRaTn49fLQG0YxaJuAC
 cxD8CEdgyRIsZRc1mtYOiElm4Jux02A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-TyVtEvz0MY6qNGTQqCan3Q-1; Wed, 02 Jun 2021 08:50:55 -0400
X-MC-Unique: TyVtEvz0MY6qNGTQqCan3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DF021854E43;
 Wed,  2 Jun 2021 12:50:54 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-172.ams2.redhat.com
 [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C1625451F;
 Wed,  2 Jun 2021 12:50:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] s390x/kvm: remove unused gs handling
Date: Wed,  2 Jun 2021 14:50:50 +0200
Message-Id: <20210602125050.492500-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With commit 0280b3eb7c05 ("s390x/kvm: use cpu model for gscb on
compat machines"), we removed any calls to kvm_s390_get_gs()
in favour of a different mechanism.

Let's remove the unused kvm_s390_get_gs(), and with it the now
unneeded cap_gs as well.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/kvm-stub.c  |  5 -----
 target/s390x/kvm.c       | 10 +---------
 target/s390x/kvm_s390x.h |  1 -
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/target/s390x/kvm-stub.c b/target/s390x/kvm-stub.c
index 9970b5a8c705..8a308cfebb68 100644
--- a/target/s390x/kvm-stub.c
+++ b/target/s390x/kvm-stub.c
@@ -49,11 +49,6 @@ int kvm_s390_get_ri(void)
     return 0;
 }
 
-int kvm_s390_get_gs(void)
-{
-    return 0;
-}
-
 int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_low)
 {
     return -ENOSYS;
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 4fb3bbfef506..23889245877a 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -154,7 +154,6 @@ static int cap_async_pf;
 static int cap_mem_op;
 static int cap_s390_irq;
 static int cap_ri;
-static int cap_gs;
 static int cap_hpage_1m;
 static int cap_vcpu_resets;
 static int cap_protected;
@@ -369,9 +368,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
     if (cpu_model_allowed()) {
-        if (kvm_vm_enable_cap(s, KVM_CAP_S390_GS, 0) == 0) {
-            cap_gs = 1;
-        }
+        kvm_vm_enable_cap(s, KVM_CAP_S390_GS, 0);
     }
 
     /*
@@ -2039,11 +2036,6 @@ int kvm_s390_get_ri(void)
     return cap_ri;
 }
 
-int kvm_s390_get_gs(void)
-{
-    return cap_gs;
-}
-
 int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
 {
     struct kvm_mp_state mp_state = {};
diff --git a/target/s390x/kvm_s390x.h b/target/s390x/kvm_s390x.h
index 25bbe98b2514..05a5e1e6f46d 100644
--- a/target/s390x/kvm_s390x.h
+++ b/target/s390x/kvm_s390x.h
@@ -27,7 +27,6 @@ void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu);
 int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu);
 int kvm_s390_get_hpage_1m(void);
 int kvm_s390_get_ri(void);
-int kvm_s390_get_gs(void);
 int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_clock);
 int kvm_s390_get_clock_ext(uint8_t *tod_high, uint64_t *tod_clock);
 int kvm_s390_set_clock(uint8_t tod_high, uint64_t tod_clock);
-- 
2.31.1


