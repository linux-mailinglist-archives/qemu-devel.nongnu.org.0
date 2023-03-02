Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E9B6A82B4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi98-0003uV-NP; Thu, 02 Mar 2023 07:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6Z-0002Tv-HY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6X-0003GB-3x
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p045YGNsUkHLlYlprLAAlEdm8b7gdb975n9yXq24B9I=;
 b=an9znq3FMijRxqlnbdv3TvUaLdslgfTtzmgo8fHkakvQSmQC61aNAMRNrKxF8M98L5Kf9b
 DzwYoA/h5p4VbqO5mK29XH1NcWnAq0nRDi7f1K6bfDjzteO6ryTCOfj91QZJOdeYHRhHpR
 rWHjA5kMUuC7gvmNRAicNkJmdqaDYlI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-QttC81poPHe4QVqVy3IXFw-1; Thu, 02 Mar 2023 07:32:03 -0500
X-MC-Unique: QttC81poPHe4QVqVy3IXFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so1208305wms.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p045YGNsUkHLlYlprLAAlEdm8b7gdb975n9yXq24B9I=;
 b=TN3bfHTuHEwv3bKUC/yWeEnaPfCAg7wqwyMbzulOHYPHoFUrCesQrRYOggfrkyHTqO
 wyW3CDTBuCmLfyvmKzjAY9/yiQtuy+D3rKTjWqE+OB4PxoEYsG9jUVgINctlcP++iJFe
 rRqoDDHPdLMYqIgxDwxvRSrQe7Q5keznePi9X5gt9CjSp+FnBv22mACMBgTn8P1CrQs3
 KfUxYU77M427oy6fv02pXXUPbmmGpp3mZWgOl10hypcpCie3I/TV11/YmLMrNu3MfAux
 ctCuWM87AK/ugU94QDeYJFLOjNN9838KaZZ/ZkZaDRB0Lto4X4g2eWJeWBFcs9r8iaOI
 tuZw==
X-Gm-Message-State: AO0yUKUTYaukBCFFJr/ZdlwOhOwPemgEtwQJv8RNUyjZD9qJ4CJucCv2
 MGQ0Bm5rLt8s2OgwkSkLLUQZmSyl8kdEugiSdetwPd0lYHIjyuZpRw9K+WFAO9WWujuhRLhW4CJ
 v1gl1YYf5Ib3vx8SiRZDXdgza2tWJhY0fl2vKdyfoAAMgKMuvgVMlaUI70prJdiXhXNDp5dSnZF
 c=
X-Received: by 2002:a05:600c:164a:b0:3eb:4cb5:dfa with SMTP id
 o10-20020a05600c164a00b003eb4cb50dfamr7373161wmn.31.1677760322176; 
 Thu, 02 Mar 2023 04:32:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8DvfZ/BGEd9eMtuKpFW0d1J5sz7ClMPh8H3iTc5YlsQPGR0lDbJ1Ki7irzve6CP9UHLBPCQg==
X-Received: by 2002:a05:600c:164a:b0:3eb:4cb5:dfa with SMTP id
 o10-20020a05600c164a00b003eb4cb50dfamr7373144wmn.31.1677760321852; 
 Thu, 02 Mar 2023 04:32:01 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003e9ded91c27sm3215782wmo.4.2023.03.02.04.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 30/62] hw/xen: Implement EVTCHNOP_close
Date: Thu,  2 Mar 2023 13:29:57 +0100
Message-Id: <20230302123029.153265-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

It calls an internal close_port() helper which will also be used from
EVTCHNOP_reset and will actually do the work to disconnect/unbind a port
once any of that is actually implemented in the first place.

That in turn calls a free_port() internal function which will be in
error paths after allocation.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 123 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |   2 +
 target/i386/kvm/xen-emu.c |  12 ++++
 3 files changed, 137 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 8bed33890f53..c57d36b492e0 100644
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
@@ -257,3 +293,90 @@ int xen_evtchn_status_op(struct evtchn_status *status)
     qemu_mutex_unlock(&s->port_lock);
     return 0;
 }
+
+static int clear_port_pending(XenEvtchnState *s, evtchn_port_t port)
+{
+    void *p = xen_overlay_get_shinfo_ptr();
+
+    if (!p) {
+        return -ENOTSUP;
+    }
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
index 76467636eed7..cb3924941a57 100644
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
index 45fac5ea03bd..fab7d6b6a914 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -805,6 +805,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
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
2.39.1


