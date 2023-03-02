Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3D6A82A1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:51:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8J-0002yq-2T; Thu, 02 Mar 2023 07:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6d-0002UT-2E
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6b-0003HL-BX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NDjVGp0dIGJEJab/RXk335NOwHswWdDScGy8GXlP8Sk=;
 b=bhFkpVXzYHyoaWjSO51zerKyuc24Fn3OndGt65uA8LJ3i/6ojFHZtxg7uA+2qBrEhj0bjN
 ZfLDn1KSWnrp6FpgzAba5ZO8pqkqG3aVTP47wEL3axvdppY4AfOTAvGrcw3fg8cRRD56fy
 A9UQ/4T9bOwfoJAO59peiiWg2Dw8Rg4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-ZxYhGsxUNcyAP3xbur1ygw-1; Thu, 02 Mar 2023 07:32:15 -0500
X-MC-Unique: ZxYhGsxUNcyAP3xbur1ygw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so1014357wmq.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDjVGp0dIGJEJab/RXk335NOwHswWdDScGy8GXlP8Sk=;
 b=Bps7n9jY/8UujX/WpldgB3/WSWVErersNhyVZn8vQCoiveNuRvKvh4aEibX2O0X7FK
 Kms6KY958IgxG+MjS9PN6LNVSjFvOOmza6moxfEGyn+U0mEFK0gvypeIkQlTGNdqwUi+
 s57KV2JdKPPHFghy9K3I9MbZvig3Z+JK/2KQ/bLPTRepEF50MBM0GE/hnKiIxQaIGvN5
 u1vhTraNVngFm0Q2P2ipZVyf0U6/xE4rxqJuw6yLDJZJQ6i6Fr5MNGIK56nJWovetoZN
 VM79R4EEVo/PB6uNbFQh2PXopmPExdyToHHzwHNrKciYNMCdrG11eakCKrafsd2fw7tg
 WP2Q==
X-Gm-Message-State: AO0yUKXUb4USgsnKj+2ne0YKy29hdXqfvKh/DFm49SSQeipnTTTaMYiP
 wj2khKvpTpa6yPrup41tsvaO4WXiYKk0C3VNK8RPf9felbBdP7rvzzjpJpQ+Fn9k4RHxGhDmg5z
 T1VlFT6FDscTR7KziObASLzB+ZBllpaA59D4/XHmDRKm0ZN+/cc+1LOObA//rgRf+bSb33B/rcu
 4=
X-Received: by 2002:a5d:6545:0:b0:2c7:cc8:782c with SMTP id
 z5-20020a5d6545000000b002c70cc8782cmr1429931wrv.1.1677760333891; 
 Thu, 02 Mar 2023 04:32:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8qXkTO8FTYfmiDo8WWd+lhsFDCOl+jq8OWxWQ3/LhBvV7/f49W1bsDuEO4qggO32MeIAQJEw==
X-Received: by 2002:a5d:6545:0:b0:2c7:cc8:782c with SMTP id
 z5-20020a5d6545000000b002c70cc8782cmr1429917wrv.1.1677760333551; 
 Thu, 02 Mar 2023 04:32:13 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ja20-20020a05600c557400b003eb596cbc54sm2954411wmb.0.2023.03.02.04.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 34/62] hw/xen: Implement EVTCHNOP_send
Date: Thu,  2 Mar 2023 13:30:01 +0100
Message-Id: <20230302123029.153265-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 180 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |   2 +
 target/i386/kvm/xen-emu.c |  12 +++
 3 files changed, 194 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index eea80dc0f53c..ce7a96923409 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -490,6 +490,133 @@ static int unmask_port(XenEvtchnState *s, evtchn_port_t port, bool do_unmask)
     }
 }
 
+static int do_set_port_lm(XenEvtchnState *s, evtchn_port_t port,
+                          struct shared_info *shinfo,
+                          struct vcpu_info *vcpu_info)
+{
+    const int bits_per_word = BITS_PER_BYTE * sizeof(shinfo->evtchn_pending[0]);
+    typeof(shinfo->evtchn_pending[0]) mask;
+    int idx = port / bits_per_word;
+    int offset = port % bits_per_word;
+
+    mask = 1UL << offset;
+
+    if (idx >= bits_per_word) {
+        return -EINVAL;
+    }
+
+    /* Update the pending bit itself. If it was already set, we're done. */
+    if (qatomic_fetch_or(&shinfo->evtchn_pending[idx], mask) & mask) {
+        return 0;
+    }
+
+    /* Check if it's masked. */
+    if (qatomic_fetch_or(&shinfo->evtchn_mask[idx], 0) & mask) {
+        return 0;
+    }
+
+    /* Now on to the vcpu_info evtchn_pending_sel index... */
+    mask = 1UL << idx;
+
+    /* If a port in this word was already pending for this vCPU, all done. */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_pending_sel, mask) & mask) {
+        return 0;
+    }
+
+    /* Set evtchn_upcall_pending for this vCPU */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_upcall_pending, 1)) {
+        return 0;
+    }
+
+    inject_callback(s, s->port_table[port].vcpu);
+
+    return 0;
+}
+
+static int do_set_port_compat(XenEvtchnState *s, evtchn_port_t port,
+                              struct compat_shared_info *shinfo,
+                              struct compat_vcpu_info *vcpu_info)
+{
+    const int bits_per_word = BITS_PER_BYTE * sizeof(shinfo->evtchn_pending[0]);
+    typeof(shinfo->evtchn_pending[0]) mask;
+    int idx = port / bits_per_word;
+    int offset = port % bits_per_word;
+
+    mask = 1UL << offset;
+
+    if (idx >= bits_per_word) {
+        return -EINVAL;
+    }
+
+    /* Update the pending bit itself. If it was already set, we're done. */
+    if (qatomic_fetch_or(&shinfo->evtchn_pending[idx], mask) & mask) {
+        return 0;
+    }
+
+    /* Check if it's masked. */
+    if (qatomic_fetch_or(&shinfo->evtchn_mask[idx], 0) & mask) {
+        return 0;
+    }
+
+    /* Now on to the vcpu_info evtchn_pending_sel index... */
+    mask = 1UL << idx;
+
+    /* If a port in this word was already pending for this vCPU, all done. */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_pending_sel, mask) & mask) {
+        return 0;
+    }
+
+    /* Set evtchn_upcall_pending for this vCPU */
+    if (qatomic_fetch_or(&vcpu_info->evtchn_upcall_pending, 1)) {
+        return 0;
+    }
+
+    inject_callback(s, s->port_table[port].vcpu);
+
+    return 0;
+}
+
+static int set_port_pending(XenEvtchnState *s, evtchn_port_t port)
+{
+    void *vcpu_info, *shinfo;
+
+    if (s->port_table[port].type == EVTCHNSTAT_closed) {
+        return -EINVAL;
+    }
+
+    if (s->evtchn_in_kernel) {
+        XenEvtchnPort *p = &s->port_table[port];
+        CPUState *cpu = qemu_get_cpu(p->vcpu);
+        struct kvm_irq_routing_xen_evtchn evt;
+
+        if (!cpu) {
+            return 0;
+        }
+
+        evt.port = port;
+        evt.vcpu = kvm_arch_vcpu_id(cpu);
+        evt.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL;
+
+        return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_EVTCHN_SEND, &evt);
+    }
+
+    shinfo = xen_overlay_get_shinfo_ptr();
+    if (!shinfo) {
+        return -ENOTSUP;
+    }
+
+    vcpu_info = kvm_xen_get_vcpu_info_hva(s->port_table[port].vcpu);
+    if (!vcpu_info) {
+        return -EINVAL;
+    }
+
+    if (xen_is_long_mode()) {
+        return do_set_port_lm(s, port, shinfo, vcpu_info);
+    } else {
+        return do_set_port_compat(s, port, shinfo, vcpu_info);
+    }
+}
+
 static int clear_port_pending(XenEvtchnState *s, evtchn_port_t port)
 {
     void *p = xen_overlay_get_shinfo_ptr();
@@ -709,3 +836,56 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
 
     return ret;
 }
+
+int xen_evtchn_send_op(struct evtchn_send *send)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    XenEvtchnPort *p;
+    int ret = 0;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(send->port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    p = &s->port_table[send->port];
+
+    switch (p->type) {
+    case EVTCHNSTAT_interdomain:
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
+            /*
+             * This is an event from the guest to qemu itself, which is
+             * serving as the driver domain. Not yet implemented; it will
+             * be hooked up to the qemu implementation of xenstore,
+             * console, PV net/block drivers etc.
+             */
+            ret = -ENOSYS;
+        } else {
+            /* Loopback interdomain ports; just a complex IPI */
+            set_port_pending(s, p->type_val);
+        }
+        break;
+
+    case EVTCHNSTAT_ipi:
+        set_port_pending(s, send->port);
+        break;
+
+    case EVTCHNSTAT_unbound:
+        /* Xen will silently drop these */
+        break;
+
+    default:
+        ret = -EINVAL;
+        break;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
+
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 107f4208485e..500fdbe8b804 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -20,10 +20,12 @@ struct evtchn_close;
 struct evtchn_unmask;
 struct evtchn_bind_virq;
 struct evtchn_bind_ipi;
+struct evtchn_send;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
 int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
 int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
+int xen_evtchn_send_op(struct evtchn_send *send);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index b8b439dd311a..19a7f16ebe6b 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -909,6 +909,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_send: {
+        struct evtchn_send send;
+
+        qemu_build_assert(sizeof(send) == 4);
+        if (kvm_copy_from_gva(cs, arg, &send, sizeof(send))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_send_op(&send);
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.1


