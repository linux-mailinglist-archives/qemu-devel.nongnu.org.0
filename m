Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5136B6A0928
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:58:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVB2Q-0002Nw-Rh; Thu, 23 Feb 2023 07:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pVB02-00058K-RC
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:47:04 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pVAzg-0004pv-Ch
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xLs//yjhfJ9B8FfOLFsi4hdgqFgtYlFp5tWusYgps4g=; b=Q8UixvnhjV1B7usVnw8/PsaO9O
 eQJOhZWg4G8eYwuV4QSOO7YT297VWyaFwTZsHxOEn0691fqmCFNOOhST4nWo9xFGJlQ7Z+xIweKcd
 g+rsrrijAgsKsMqqZ0pYhCLyAL3xwMoGMYsMkZwBm4EUakE0sYItuOPIe/MS45RjbDzKPbxFLjM3H
 AFvEoEqfAR+sZbZCBkzykMRiMtGkIC3QKEuz0XmSbQyyxi0K7Aj4cIcx+w//slM2NFqDeIpAVnVOU
 WJfCpAf37zAD3Us4R3+jeMygNc4oHUzAueSlttUqczSGCOa2JpTm92m/GDZzffP0nWYMSu+WJBtdh
 8m849X2Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pVAzI-00CujW-1V; Thu, 23 Feb 2023 12:46:17 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pVAzI-00DYpv-15; Thu, 23 Feb 2023 12:46:16 +0000
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
Subject: [PATCH v13 19/60] i386/xen: implement HYPERVISOR_hvm_op
Date: Thu, 23 Feb 2023 12:45:32 +0000
Message-Id: <20230223124613.3231331-20-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230223124613.3231331-1-dwmw2@infradead.org>
References: <20230223124613.3231331-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org;
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

From: Joao Martins <joao.m.martins@oracle.com>

This is when guest queries for support for HVMOP_pagetable_dying.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 2b235e7b27..4002b1b797 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -26,6 +26,7 @@
 #include "hw/xen/interface/version.h"
 #include "hw/xen/interface/sched.h"
 #include "hw/xen/interface/memory.h"
+#include "hw/xen/interface/hvm/hvm_op.h"
 
 #include "xen-compat.h"
 
@@ -349,6 +350,19 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                 int cmd, uint64_t arg)
+{
+    switch (cmd) {
+    case HVMOP_pagetable_dying:
+        exit->u.hcall.result = -ENOSYS;
+        return true;
+
+    default:
+        return false;
+    }
+}
+
 int kvm_xen_soft_reset(void)
 {
     int err;
@@ -450,6 +464,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case __HYPERVISOR_sched_op:
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
+    case __HYPERVISOR_hvm_op:
+        return kvm_xen_hcall_hvm_op(exit, cpu, exit->u.hcall.params[0],
+                                    exit->u.hcall.params[1]);
     case __HYPERVISOR_memory_op:
         return kvm_xen_hcall_memory_op(exit, cpu, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1]);
-- 
2.39.0


