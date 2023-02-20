Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D059169D540
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 21:51:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUD5b-00014V-SC; Mon, 20 Feb 2023 15:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+82aa7fb0aadd3de72584+7120+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pUD59-0007ab-CV
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 15:48:25 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+82aa7fb0aadd3de72584+7120+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pUD50-0003Yg-6E
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 15:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=k8GCQQoJy2aRlOQPrVefZT/ee28eSx+Uu4q7yzFpNOU=; b=WHkjtpQAQum6Y/IHcNA25L57X7
 iRqPu6HdnD7mICuyMuAK7b9D7NABp1iHDNYIiidrsHrtp4hcmgf2/lJ2eq8UMdQkVGRyVFxnIWPwK
 PvMCRosFbCwyt4LNSSZvpvIe+NBfQEyZjze+fpWpiE6+izJxyAPHcORoj/pKif3gqCJhYDDbEYMRG
 4jqdd3zgyJG3yKPDMPYjrWj9rTWVC9+4CknGOgBb62OYltgI+po0avBEGWK0vV5OmdPQVIvNu8yy2
 IO9/Y7rkdQeYkhSd7ijnvQdLqMntG6aPlcvomBqP6j1waDWRIDZzTTuqHwcMmqPK7TxJozMw1slLO
 JFlnxf4Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pUD4U-00BvKR-0g; Mon, 20 Feb 2023 20:47:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pUD4U-00B4qk-0I; Mon, 20 Feb 2023 20:47:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [PATCH v12 06/60] i386/hvm: Set Xen vCPU ID in KVM
Date: Mon, 20 Feb 2023 20:46:42 +0000
Message-Id: <20230220204736.2639601-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230220204736.2639601-1-dwmw2@infradead.org>
References: <20230220204736.2639601-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+82aa7fb0aadd3de72584+7120+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

There are (at least) three different vCPU ID number spaces. One is the
internal KVM vCPU index, based purely on which vCPU was chronologically
created in the kernel first. If userspace threads are all spawned and
create their KVM vCPUs in essentially random order, then the KVM indices
are basically random too.

The second number space is the APIC ID space, which is consistent and
useful for referencing vCPUs. MSIs will specify the target vCPU using
the APIC ID, for example, and the KVM Xen APIs also take an APIC ID
from userspace whenever a vCPU needs to be specified (as opposed to
just using the appropriate vCPU fd).

The third number space is not normally relevant to the kernel, and is
the ACPI/MADT/Xen CPU number which corresponds to cs->cpu_index. But
Xen timer hypercalls use it, and Xen timer hypercalls *really* want
to be accelerated in the kernel rather than handled in userspace, so
the kernel needs to be told.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/kvm.c     |  5 +++++
 target/i386/kvm/xen-emu.c | 28 ++++++++++++++++++++++++++++
 target/i386/kvm/xen-emu.h |  1 +
 3 files changed, 34 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2b3daabf7b..165fa5232d 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1869,6 +1869,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
             }
         }
 
+        r = kvm_xen_init_vcpu(cs);
+        if (r) {
+            return r;
+        }
+
         kvm_base += 0x100;
 #else /* CONFIG_XEN_EMU */
         /* This should never happen as kvm_arch_init() would have died first. */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 34d5bc1bc9..4883b95d9d 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -52,6 +52,34 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
     return 0;
 }
 
+int kvm_xen_init_vcpu(CPUState *cs)
+{
+    int err;
+
+    /*
+     * The kernel needs to know the Xen/ACPI vCPU ID because that's
+     * what the guest uses in hypercalls such as timers. It doesn't
+     * match the APIC ID which is generally used for talking to the
+     * kernel about vCPUs. And if vCPU threads race with creating
+     * their KVM vCPUs out of order, it doesn't necessarily match
+     * with the kernel's internal vCPU indices either.
+     */
+    if (kvm_xen_has_cap(EVTCHN_SEND)) {
+        struct kvm_xen_vcpu_attr va = {
+            .type = KVM_XEN_VCPU_ATTR_TYPE_VCPU_ID,
+            .u.vcpu_id = cs->cpu_index,
+        };
+        err = kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &va);
+        if (err) {
+            error_report("kvm: Failed to set Xen vCPU ID attribute: %s",
+                         strerror(-err));
+            return err;
+        }
+    }
+
+    return 0;
+}
+
 uint32_t kvm_xen_get_caps(void)
 {
     return kvm_state->xen_caps;
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index 2101df0182..d62f1d8ed8 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -24,5 +24,6 @@
 #define XEN_VERSION(maj, min) ((maj) << 16 | (min))
 
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
+int kvm_xen_init_vcpu(CPUState *cs);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
-- 
2.39.0


