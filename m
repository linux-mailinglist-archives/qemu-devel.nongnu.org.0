Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371066D170
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:08:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXV4-0006uD-E1; Mon, 16 Jan 2023 16:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXUr-0006iv-61
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:29 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXUm-0003ZL-Sn
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MoJrA4s7EWNDRTvIFJa7IjSplzNwkG6QEEjZqhZqpW8=; b=rA62bwMIin6co4d7Tne1xGn92S
 B/Hrsah3bspVHvJO5iNBzA3WnaoEQYCzhqN9dBWg6HjRr43bQHFwFnBst8XY5jQiRfMn8yp1rTReX
 1gGg9Jd3SCb7WHy3gNnjrEH13Tkly/U76FMpV3M3Ef0nfvBK5d0pwx2jSvl1MuQ5On+nN812fhXau
 VTV6MvwPKBavxgKTr106/KwQwIYMTZKD9AgHRX6icAPGlJzoswN+U03DYhGqyv6UrMOxv+WecPJ0s
 MRz19t7aM3RxHYyaawpmDIrTdrhJ/5OIZMlyRjJxeCiujeRbJJ0MH3+bSAO79a1OzS6eXB4bWc0ER
 McjUIIlQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHXUl-0097Vp-NB; Mon, 16 Jan 2023 21:58:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXUX-004iQo-3C; Mon, 16 Jan 2023 21:58:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v7 47/51] i386/xen: Reserve Xen special pages for console,
 xenstore rings
Date: Mon, 16 Jan 2023 21:58:01 +0000
Message-Id: <20230116215805.1123514-48-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116215805.1123514-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org;
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
---
 include/sysemu/kvm_xen.h  |  8 ++++++++
 target/i386/kvm/xen-emu.c | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index df92205a7d..ed12b3aaec 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -29,4 +29,12 @@ uint16_t kvm_xen_get_gnttab_max_frames(void);
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
 
+#define XEN_SPECIAL_AREA_ADDR 0xfeff8000UL
+#define XEN_SPECIAL_AREA_SIZE 0x4000UL
+
+#define XEN_SPECIALPAGE_CONSOLE     0
+#define XEN_SPECIALPAGE_XENSTORE    1
+
+#define XEN_SPECIAL_PFN(x) ((XEN_SPECIAL_AREA_ADDR >> TARGET_PAGE_BITS) + XEN_SPECIALPAGE_##x)
+
 #endif /* QEMU_SYSEMU_KVM_XEN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index c90ac7790a..0110ef55c7 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -22,6 +22,7 @@
 
 #include "hw/pci/msi.h"
 #include "hw/i386/apic-msidef.h"
+#include "hw/i386/e820_memory_layout.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/kvm/xen_gnttab.h"
@@ -168,6 +169,15 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
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


