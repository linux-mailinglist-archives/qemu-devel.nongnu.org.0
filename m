Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADC769D56F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 21:57:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUD5d-0001RW-HR; Mon, 20 Feb 2023 15:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+82aa7fb0aadd3de72584+7120+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pUD5C-0007b4-QJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 15:48:25 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+82aa7fb0aadd3de72584+7120+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pUD54-0003Zo-0H
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 15:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RY7C6dXfMar4eKxsDeeSIWScndrjydBvLih789amM/w=; b=bq2MqHWTT7nOOh5vFvxU8ahPiy
 fURIgSmeVehWwKdqgyQX4gWb5GVhgRPHzKTEOAGM17KxDQ++MN7SFJ9psDK4b9vUWjqGBPqXOKIb6
 UiVf3Ghok/odNu3ASgmvPzfNccDx/StxEQhGwLI3eI6BYouoMuhtBJ8MwkDmuaAr1lTxAv8DD4Mom
 q0baR2sU317u2sHbjNryp13Dmi0RTLqwpaDDSWDKX7cHXAq0Mo5Wmzy6M0PnafGEO+stOhyKVfePV
 AKwVk4rEhL/VjZCBvaN8CxIg1h0EuEFhpWV4uVMDCAe9/HP6QcmMSwGTqgtbGktXWiwbPqliotH+U
 Md9aYybA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pUD4V-00BvKc-1J; Mon, 20 Feb 2023 20:48:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pUD4V-00B4sC-0v; Mon, 20 Feb 2023 20:47:39 +0000
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
Subject: [PATCH v12 26/60] i386/xen: implement HVMOP_set_param
Date: Mon, 20 Feb 2023 20:47:02 +0000
Message-Id: <20230220204736.2639601-27-dwmw2@infradead.org>
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

From: Ankur Arora <ankur.a.arora@oracle.com>

This is the hook for adding the HVM_PARAM_CALLBACK_IRQ parameter in a
subsequent commit.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Split out from another commit]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 55dc2ac012..67c5832d09 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -489,6 +489,36 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
+                             uint64_t arg)
+{
+    CPUState *cs = CPU(cpu);
+    struct xen_hvm_param hp;
+    int err = 0;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(hp) == 16);
+
+    if (kvm_copy_from_gva(cs, arg, &hp, sizeof(hp))) {
+        err = -EFAULT;
+        goto out;
+    }
+
+    if (hp.domid != DOMID_SELF && hp.domid != xen_domid) {
+        err = -ESRCH;
+        goto out;
+    }
+
+    switch (hp.index) {
+    default:
+        return false;
+    }
+
+out:
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
                                               X86CPU *cpu, uint64_t arg)
 {
@@ -530,6 +560,9 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         ret = -ENOSYS;
         break;
 
+    case HVMOP_set_param:
+        return handle_set_param(exit, cpu, arg);
+
     default:
         return false;
     }
-- 
2.39.0


