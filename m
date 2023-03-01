Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A06A6D8D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:56:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMtR-0000Pr-KU; Wed, 01 Mar 2023 08:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f4e15e254fb7e3cd38fc+7129+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pXMsw-0008Qq-Uv
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:48 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f4e15e254fb7e3cd38fc+7129+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pXMst-0002lF-WB
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=iXm+/bbFSB60Z8XPPgp2BPnambpKNzovS6crSNKSiqE=; b=CwnuLh1bYumGy/lhi9r7mtWnUE
 868L7utT4rkc1TpP5WjAaenn2o/bahzev22D6mII1WjCBpaBuRhgiqOw6kKmck5U4YuZ001MT9tMx
 M5KqcK1Fqing/KQAlm2KkgreV4UkiXvAbJGiUD5BkG4K3f7yG3B0f2Wdja6tvZY5Z6Hu0cZeg/pKw
 Id23z+RykL6BB5Ksf+LGpDnsx+JtVPZrqvqYaf1qPGaTKmlVb3V8vuIkXYv4Au/a8nmtK2av19SoJ
 Koieqvb3Wi15zKULk8wiVkTfqAQ/Q77EsnMmM+0Rhc9rFSC44IeGzL99vTuSKDLE6y+h1IyJVYBzY
 gDYIaSaA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pXMse-001f6R-2c; Wed, 01 Mar 2023 13:52:29 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXMse-0049Ws-0J; Wed, 01 Mar 2023 13:52:28 +0000
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
Subject: [PATCH v15 48/60] i386/xen: Reserve Xen special pages for console,
 xenstore rings
Date: Wed,  1 Mar 2023 13:52:11 +0000
Message-Id: <20230301135223.988336-49-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301135223.988336-1-dwmw2@infradead.org>
References: <20230301135223.988336-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+f4e15e254fb7e3cd38fc+7129+infradead.org+dwmw2@casper.srs.infradead.org;
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

From: David Woodhouse <dwmw@amazon.co.uk>

Xen has eight frames at 0xfeff8000 for this; we only really need two for
now and KVM puts the identity map at 0xfeffc000, so limit ourselves to
four.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 include/sysemu/kvm_xen.h  |  9 +++++++++
 target/i386/kvm/xen-emu.c | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index 49afa0eb9e..b2aafaf7ab 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -30,4 +30,13 @@ uint16_t kvm_xen_get_gnttab_max_frames(void);
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
 
+#define XEN_SPECIAL_AREA_ADDR 0xfeff8000UL
+#define XEN_SPECIAL_AREA_SIZE 0x4000UL
+
+#define XEN_SPECIALPAGE_CONSOLE     0
+#define XEN_SPECIALPAGE_XENSTORE    1
+
+#define XEN_SPECIAL_PFN(x) ((XEN_SPECIAL_AREA_ADDR >> TARGET_PAGE_BITS) + \
+                            XEN_SPECIALPAGE_##x)
+
 #endif /* QEMU_SYSEMU_KVM_XEN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index c210ff9d91..75bcf7b630 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -23,6 +23,7 @@
 
 #include "hw/pci/msi.h"
 #include "hw/i386/apic-msidef.h"
+#include "hw/i386/e820_memory_layout.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/kvm/xen_gnttab.h"
@@ -169,6 +170,15 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
     }
 
     s->xen_caps = xen_caps;
+
+    /* Tell fw_cfg to notify the BIOS to reserve the range. */
+    ret = e820_add_entry(XEN_SPECIAL_AREA_ADDR, XEN_SPECIAL_AREA_SIZE,
+                         E820_RESERVED);
+    if (ret < 0) {
+        fprintf(stderr, "e820_add_entry() table is full\n");
+        return ret;
+    }
+
     return 0;
 }
 
-- 
2.39.0


