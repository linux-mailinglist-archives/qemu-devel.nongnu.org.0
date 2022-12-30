Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F79865985F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:43:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEGf-00008l-SA; Fri, 30 Dec 2022 07:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFt-0007nF-NG
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:12:57 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFo-0004y4-O1
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DWmAgz2PnR7ucjTnf8cGzMbYOuPw6IKNUeaX6O8eXDs=; b=WUOdxws5Kg1uWsD94EYayi6Bgq
 Zc+FyeDHgQ1jGnQ7JKnJ6lXAwr1FUr1m3E+AuBSa0sqqGmfx2SolVOHskGe4mc1BJXs0ZNZHPWh1n
 IvHoAyXUyKbUYQ+AsUoXbmZGlLwZQeELhbcEMef2ecKtKwwsYGcTP8+ZlzhAxLzLc69k2Rg09qwQ7
 P0eroYUGU1B50OgVvzLufmVKxc08DU6pUUgs9s1f4suWGr8RlXvlVEZHyw7NM5bMhQgInCu6v2525
 XzbTeHPYD7EtRGBa7zRdxcJQo0664jmoiUsG9CvImePo5dMRSUqKXSFG/65dUQKI1SC4L46dEuOcS
 A1Pc3SHQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pBEFl-00Ac8I-6M; Fri, 30 Dec 2022 12:12:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pBEFZ-005NxU-Vf; Fri, 30 Dec 2022 12:12:37 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [RFC PATCH v5 30/52] hw/xen: Implement EVTCHNOP_close
Date: Fri, 30 Dec 2022 12:12:13 +0000
Message-Id: <20221230121235.1282915-31-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221230121235.1282915-1-dwmw2@infradead.org>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org;
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

It calls an internal close_port() helper which will also be used from
EVTCHNOP_reset and will actually do the work to disconnect/unbind a port
once any of that is actually implemented in the first place.

That in turn calls a free_port() internal function which will be in
error paths after allocation.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 121 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |   2 +
 target/i386/kvm/xen-emu.c |  12 ++++
 3 files changed, 135 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 0f1abfb760..f732821d5b 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -21,6 +21,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
+
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
 
@@ -40,6 +41,41 @@ typedef struct XenEvtchnPort {
     uint16_t type_val;  /* pirq# / virq# / remote port according to type */
 } XenEvtchnPort;
 
+/* 32-bit compatibility definitions, also used natively in 32-bit build */
+struct compat_arch_vcpu_info {
+    unsigned int cr2;
+    unsigned int pad[5];
+};
+
+struct compat_vcpu_info {
+    uint8_t evtchn_upcall_pending;
+    uint8_t evtchn_upcall_mask;
+    uint16_t pad;
+    uint32_t evtchn_pending_sel;
+    struct compat_arch_vcpu_info arch;
+    struct vcpu_time_info time;
+}; /* 64 bytes (x86) */
+
+struct compat_arch_shared_info {
+    unsigned int max_pfn;
+    unsigned int pfn_to_mfn_frame_list_list;
+    unsigned int nmi_reason;
+    unsigned int p2m_cr3;
+    unsigned int p2m_vaddr;
+    unsigned int p2m_generation;
+    uint32_t wc_sec_hi;
+};
+
+struct compat_shared_info {
+    struct compat_vcpu_info vcpu_info[XEN_LEGACY_MAX_VCPUS];
+    uint32_t evtchn_pending[32];
+    uint32_t evtchn_mask[32];
+    uint32_t wc_version;      /* Version counter: see vcpu_time_info_t. */
+    uint32_t wc_sec;
+    uint32_t wc_nsec;
+    struct compat_arch_shared_info arch;
+};
+
 #define COMPAT_EVTCHN_2L_NR_CHANNELS            1024
 
 /*
@@ -252,3 +288,88 @@ int xen_evtchn_status_op(struct evtchn_status *status)
     qemu_mutex_unlock(&s->port_lock);
     return 0;
 }
+
+static int clear_port_pending(XenEvtchnState *s, evtchn_port_t port)
+{
+    void *p = xen_overlay_get_shinfo_ptr();
+    if (!p)
+        return -ENOTSUP;
+
+    if (xen_is_long_mode()) {
+        struct shared_info *shinfo = p;
+        const int bits_per_word = BITS_PER_BYTE * sizeof(shinfo->evtchn_pending[0]);
+        typeof(shinfo->evtchn_pending[0]) mask;
+        int idx = port / bits_per_word;
+        int offset = port % bits_per_word;
+
+        mask = 1UL << offset;
+
+        qatomic_fetch_and(&shinfo->evtchn_pending[idx], ~mask);
+    } else {
+        struct compat_shared_info *shinfo = p;
+        const int bits_per_word = BITS_PER_BYTE * sizeof(shinfo->evtchn_pending[0]);
+        typeof(shinfo->evtchn_pending[0]) mask;
+        int idx = port / bits_per_word;
+        int offset = port % bits_per_word;
+
+        mask = 1UL << offset;
+
+        qatomic_fetch_and(&shinfo->evtchn_pending[idx], ~mask);
+    }
+    return 0;
+}
+
+static void free_port(XenEvtchnState *s, evtchn_port_t port)
+{
+    s->port_table[port].type = EVTCHNSTAT_closed;
+    s->port_table[port].type_val = 0;
+    s->port_table[port].vcpu = 0;
+
+    if (s->nr_ports == port + 1) {
+        do {
+            s->nr_ports--;
+        } while (s->nr_ports &&
+                 s->port_table[s->nr_ports - 1].type == EVTCHNSTAT_closed);
+    }
+
+    /* Clear pending event to avoid unexpected behavior on re-bind. */
+    clear_port_pending(s, port);
+}
+
+static int close_port(XenEvtchnState *s, evtchn_port_t port)
+{
+    XenEvtchnPort *p = &s->port_table[port];
+
+    switch (p->type) {
+    case EVTCHNSTAT_closed:
+        return -ENOENT;
+
+    default:
+        break;
+    }
+
+    free_port(s, port);
+    return 0;
+}
+
+int xen_evtchn_close_op(struct evtchn_close *close)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(close->port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    ret = close_port(s, close->port);
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 76467636ee..cb3924941a 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -16,6 +16,8 @@ void xen_evtchn_create(void);
 int xen_evtchn_set_callback_param(uint64_t param);
 
 struct evtchn_status;
+struct evtchn_close;
 int xen_evtchn_status_op(struct evtchn_status *status);
+int xen_evtchn_close_op(struct evtchn_close *close);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 6f3f8ae834..a95063434e 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -787,6 +787,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_close: {
+        struct evtchn_close close;
+
+        qemu_build_assert(sizeof(close) == 4);
+        if (kvm_copy_from_gva(cs, arg, &close, sizeof(close))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_close_op(&close);
+        break;
+    }
     default:
         return false;
     }
-- 
2.35.3


