Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AFB38F3F0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 21:57:55 +0200 (CEST)
Received: from localhost ([::1]:57314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llGi2-0005q4-MB
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 15:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=771b08666=sidcha@amazon.de>)
 id 1llGfw-0003mt-Su
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:55:44 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:22670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=771b08666=sidcha@amazon.de>)
 id 1llGft-0001aL-48
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1621886142; x=1653422142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=jtPJZRoIcIGMgdID0wVBNd10aPPe6ZAomW4bRSwxqzk=;
 b=YsSb7TjOBDQzrPM37EneoR98Wp+eYsOaNlEYyr3jvm9ZTNxlyedp5pGd
 gtoWGin93pY2iXA/oCXskP7Xmbf6u0HBVZ3Y6zad+LCt4CTZRNS1oObVj
 Ce2JloD9iFXXfFe1umd06mRHreBFVGezjJCoFbr76bgTM06daoMP4v2q6 Q=;
X-IronPort-AV: E=Sophos;i="5.82,325,1613433600"; d="scan'208";a="114312619"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 24 May 2021 19:55:40 +0000
Received: from EX13D28EUC003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 292A2A2121; Mon, 24 May 2021 19:55:37 +0000 (UTC)
Received: from uc8bbc9586ea454.ant.amazon.com (10.43.161.253) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Mon, 24 May 2021 19:55:33 +0000
From: Siddharth Chandrasekaran <sidcha@amazon.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
CC: Siddharth Chandrasekaran <sidcha@amazon.de>, Siddharth Chandrasekaran
 <sidcha.dev@gmail.com>, Alexander Graf <graf@amazon.com>, Evgeny Iakovlev
 <eyakovl@amazon.de>, Liran Alon <liran@amazon.com>, Ioannis Aslanidis
 <iaslan@amazon.de>, <qemu-devel@nongnu.org>, <kvm@vger.kernel.org>
Subject: [PATCH 3/6] kvm/i386: Stop using cpu->kvm_msr_buf in kvm_put_one_msr()
Date: Mon, 24 May 2021 21:54:06 +0200
Message-ID: <04c81a02c19a47e799e06b9c9ccb97e9a77f5927.1621885749.git.sidcha@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621885749.git.sidcha@amazon.de>
References: <cover.1621885749.git.sidcha@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.253]
X-ClientProxiedBy: EX13D10UWB004.ant.amazon.com (10.43.161.121) To
 EX13D28EUC003.ant.amazon.com (10.43.164.43)
Precedence: Bulk
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=771b08666=sidcha@amazon.de; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

kvm_put_one_msr() zeros cpu->kvm_msr_buf and uses it to set one MSR to
KVM. It is pretty wasteful as cpu->kvm_msr_buf is 4096 bytes long;
instead use a local buffer to avoid memset.

Also, expose this method from kvm_i386.h as hyperv.c needs to set MSRs
in a subsequent patch.

Signed-off-by: Siddharth Chandrasekaran <sidcha@amazon.de>
---
 target/i386/kvm/kvm.c      | 12 ++++++++----
 target/i386/kvm/kvm_i386.h |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d972eb4705..d19a2913fd 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2534,12 +2534,16 @@ static void kvm_msr_entry_add(X86CPU *cpu, uint32_t index, uint64_t value)
     msrs->nmsrs++;
 }
 
-static int kvm_put_one_msr(X86CPU *cpu, int index, uint64_t value)
+int kvm_put_one_msr(X86CPU *cpu, int index, uint64_t value)
 {
-    kvm_msr_buf_reset(cpu);
-    kvm_msr_entry_add(cpu, index, value);
+    uint8_t msr_buf[sizeof(struct kvm_msrs) + sizeof(struct kvm_msr_entry)] = { 0 };
+    struct kvm_msrs *msr = (struct kvm_msrs *)msr_buf;
+
+    msr->nmsrs = 1;
+    msr->entries[0].index = index;
+    msr->entries[0].data = value;
 
-    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MSRS, cpu->kvm_msr_buf);
+    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MSRS, msr);
 }
 
 void kvm_put_apicbase(X86CPU *cpu, uint64_t value)
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index dc72508389..0c4cd08071 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -40,6 +40,7 @@ void kvm_synchronize_all_tsc(void);
 void kvm_arch_reset_vcpu(X86CPU *cs);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 
+int kvm_put_one_msr(X86CPU *cpu, int index, uint64_t value);
 void kvm_put_apicbase(X86CPU *cpu, uint64_t value);
 
 bool kvm_enable_x2apic(void);
-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




