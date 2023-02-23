Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F2B6A0919
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAzn-0004GX-S4; Thu, 23 Feb 2023 07:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pVAzg-0003mA-4p
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:40 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pVAzY-0004hl-MD
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=M/RnWWrRacpN6pjXGw9Nv7r7l1To+WJD0qoQcZrTAk0=; b=sI5SdH+rYPW7VQGcERKjSIykP7
 Cv/A5F/bdETsDVfyE612p5dPFXCWsvyLLAe02zsSxn+nJNuICdBpyk8GOVLI196vEHsHqKl+eDCtg
 EGkFso63SZak2qFQNmqlTztiOF40uzp8Tk41o89W3qAqTye0ojRMlcOroLFHeo78gY/m0Nu+RBOt5
 U01VYeUzMQ4g4vbVv+2ainXoTYV12Myg2H7BW88d2zWXaAsqZ7cVTVOVE4kxvLBcI9KRPvHrA695l
 ce562gDS0pmV+fuSwS9ztrMPPsZBVbwpyQ0SiNu4x9kSHjJwMkpQRzD8+RTXKWsz3vYpc+ETSlAcN
 fQ5crOHQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pVAzK-00EMjK-10; Thu, 23 Feb 2023 12:46:18 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pVAzK-00DYsE-06; Thu, 23 Feb 2023 12:46:18 +0000
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
Subject: [PATCH v13 49/60] i386/xen: handle HVMOP_get_param
Date: Thu, 23 Feb 2023 12:46:02 +0000
Message-Id: <20230223124613.3231331-50-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230223124613.3231331-1-dwmw2@infradead.org>
References: <20230223124613.3231331-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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

From: Joao Martins <joao.m.martins@oracle.com>

Which is used to fetch xenstore PFN and port to be used
by the guest. This is preallocated by the toolstack when
guest will just read those and use it straight away.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 1bb84d8019..ee58cc7376 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -762,6 +762,42 @@ out:
     return true;
 }
 
+static bool handle_get_param(struct kvm_xen_exit *exit, X86CPU *cpu,
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
+    case HVM_PARAM_STORE_PFN:
+        hp.value = XEN_SPECIAL_PFN(XENSTORE);
+        break;
+    default:
+        return false;
+    }
+
+    if (kvm_copy_to_gva(cs, arg, &hp, sizeof(hp))) {
+        err = -EFAULT;
+    }
+out:
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
                                               X86CPU *cpu, uint64_t arg)
 {
@@ -806,6 +842,9 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     case HVMOP_set_param:
         return handle_set_param(exit, cpu, arg);
 
+    case HVMOP_get_param:
+        return handle_get_param(exit, cpu, arg);
+
     default:
         return false;
     }
-- 
2.39.0


