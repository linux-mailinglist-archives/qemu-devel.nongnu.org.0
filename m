Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EFD53C5C7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:12:11 +0200 (CEST)
Received: from localhost ([::1]:44282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1Te-0005dw-Hq
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HF-0005e5-9J
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HC-0003I3-VH
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654239557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sp5P5C2Pj8ss+jhGYxrC9BuR0pTV01u5nsNyhRTfKS0=;
 b=dhHOE4fEbuj4Sngf57+bqGOpVqzpXBTuci1mVOnWfLpgsWJegWxmRRZg/G8rd1Tq6fx7HU
 F+nmBk1w1fiNW0FpGAdISmWqinA3LIyNTY2ZXBvnR44soVwPcz6jvH7urg8xmDvCbLOROy
 UUXVJEgsZhFg/Y4pD3ZoFDug8ExSTt8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-lVJIvxOKO3qpCsoqvP93fw-1; Fri, 03 Jun 2022 02:59:16 -0400
X-MC-Unique: lVJIvxOKO3qpCsoqvP93fw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9702100DE72;
 Fri,  3 Jun 2022 06:59:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CEB42166B26;
 Fri,  3 Jun 2022 06:59:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org,
	Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Subject: [PULL 03/12] target/s390x: kvm: Honor storage keys during emulation
Date: Fri,  3 Jun 2022 08:58:56 +0200
Message-Id: <20220603065905.23805-4-thuth@redhat.com>
In-Reply-To: <20220603065905.23805-1-thuth@redhat.com>
References: <20220603065905.23805-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>

Storage key controlled protection is currently not honored when
emulating instructions.
If available, enable key protection for the MEM_OP ioctl, thereby
enabling it for the s390_cpu_virt_mem_* functions, when using kvm.
As a result, the emulation of the following instructions honors storage
keys:

* CLP
  	The Synch I/O CLP command would need special handling in order
  	to support storage keys, but is currently not supported.
* CHSC
	Performing commands asynchronously would require special
	handling, but commands are currently always synchronous.
* STSI
* TSCH
	Must (and does) not change channel if terminated due to
	protection.
* MSCH
	Suppressed on protection, works because fetching instruction.
* SSCH
	Suppressed on protection, works because fetching instruction.
* STSCH
* STCRW
	Suppressed on protection, this works because no partial store is
	possible, because the operand cannot span multiple pages.
* PCISTB
* MPCIFC
* STPCIFC

Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Message-Id: <20220506153956.2217601-3-scgl@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/kvm/kvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 53098bf541..7bd8db0e7b 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -151,12 +151,15 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
 static int cap_sync_regs;
 static int cap_async_pf;
 static int cap_mem_op;
+static int cap_mem_op_extension;
 static int cap_s390_irq;
 static int cap_ri;
 static int cap_hpage_1m;
 static int cap_vcpu_resets;
 static int cap_protected;
 
+static bool mem_op_storage_key_support;
+
 static int active_cmma;
 
 static int kvm_s390_query_mem_limit(uint64_t *memory_limit)
@@ -354,6 +357,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_sync_regs = kvm_check_extension(s, KVM_CAP_SYNC_REGS);
     cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
     cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
+    cap_mem_op_extension = kvm_check_extension(s, KVM_CAP_S390_MEM_OP_EXTENSION);
+    mem_op_storage_key_support = cap_mem_op_extension > 0;
     cap_s390_irq = kvm_check_extension(s, KVM_CAP_S390_INJECT_IRQ);
     cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
     cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
@@ -842,6 +847,7 @@ int kvm_s390_mem_op(S390CPU *cpu, vaddr addr, uint8_t ar, void *hostbuf,
                        : KVM_S390_MEMOP_LOGICAL_READ,
         .buf = (uint64_t)hostbuf,
         .ar = ar,
+        .key = (cpu->env.psw.mask & PSW_MASK_KEY) >> PSW_SHIFT_KEY,
     };
     int ret;
 
@@ -851,6 +857,9 @@ int kvm_s390_mem_op(S390CPU *cpu, vaddr addr, uint8_t ar, void *hostbuf,
     if (!hostbuf) {
         mem_op.flags |= KVM_S390_MEMOP_F_CHECK_ONLY;
     }
+    if (mem_op_storage_key_support) {
+        mem_op.flags |= KVM_S390_MEMOP_F_SKEY_PROTECTION;
+    }
 
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_S390_MEM_OP, &mem_op);
     if (ret < 0) {
-- 
2.31.1


