Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA18560C6A6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:40:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFRH-0004K7-Cn; Tue, 25 Oct 2022 04:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1onEiR-0003RC-Ap
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1onEi9-0005h3-Dk
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666684256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0YG+2NLzWyx0KRFXEpM2GjU3iasA3S4YJbO1qy9pEw=;
 b=eSCxYupa/vhQnWyJ2rtp4ipxCOW8s+9gnJJMdzFZoWJwvsjYaZqpN/R61aU18g8U0L+A2D
 zIO1TXJXh9tjQcj4Ymop6esxHCfOTuffzZc4TNX+S8GZHpbqxJ2wqC7Vb9CK219d6qdX80
 Mnje5ZFyNj/tSUjwHHJiQWdRJL9dAGw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-wt3bIohFPxKuV0JfxMUUBA-1; Tue, 25 Oct 2022 03:50:43 -0400
X-MC-Unique: wt3bIohFPxKuV0JfxMUUBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C34241C05199;
 Tue, 25 Oct 2022 07:50:42 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2C1C40C2064;
 Tue, 25 Oct 2022 07:50:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>
Subject: [PULL v2 06/11] s390x: Add protected dump cap
Date: Tue, 25 Oct 2022 11:49:58 +0400
Message-Id: <20221025075003.18161-7-marcandre.lureau@redhat.com>
In-Reply-To: <20221025075003.18161-1-marcandre.lureau@redhat.com>
References: <20221025075003.18161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Janosch Frank <frankja@linux.ibm.com>

Add a protected dump capability for later feature checking.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Message-Id: <20221017083822.43118-7-frankja@linux.ibm.com>
---
 target/s390x/kvm/kvm_s390x.h | 1 +
 target/s390x/kvm/kvm.c       | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
index aaae8570de..f9785564d0 100644
--- a/target/s390x/kvm/kvm_s390x.h
+++ b/target/s390x/kvm/kvm_s390x.h
@@ -26,6 +26,7 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state);
 void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu);
 int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu);
 int kvm_s390_get_hpage_1m(void);
+int kvm_s390_get_protected_dump(void);
 int kvm_s390_get_ri(void);
 int kvm_s390_get_zpci_op(void);
 int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_clock);
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 508c24cfec..04cae0b999 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -158,6 +158,7 @@ static int cap_hpage_1m;
 static int cap_vcpu_resets;
 static int cap_protected;
 static int cap_zpci_op;
+static int cap_protected_dump;
 
 static bool mem_op_storage_key_support;
 
@@ -364,6 +365,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
     cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
     cap_zpci_op = kvm_check_extension(s, KVM_CAP_S390_ZPCI_OP);
+    cap_protected_dump = kvm_check_extension(s, KVM_CAP_S390_PROTECTED_DUMP);
 
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
@@ -2045,6 +2047,11 @@ int kvm_s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch,
     return kvm_vm_ioctl(kvm_state, KVM_IOEVENTFD, &kick);
 }
 
+int kvm_s390_get_protected_dump(void)
+{
+    return cap_protected_dump;
+}
+
 int kvm_s390_get_ri(void)
 {
     return cap_ri;
-- 
2.37.3


