Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABAE6A826D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:39:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8R-0003Vq-D4; Thu, 02 Mar 2023 07:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6U-0002PV-IT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6S-0003FY-Fv
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkYeojCCCHHlvA0WltcLcHJjtzQOyBV1IjUcPXVnKMA=;
 b=OOXrVZwERah/SNSV3PFNlahnS9NfiHDLJvZvdKLWRwMsH7B99bSuKufLpU7k8KTViHZ4TT
 Sa2CXvGC5NGXSkFfneTIZfdtYAcVEIKZouznfSduPY+NgcUWhxgU8j9ngAvCxf4YvBDkIb
 uE/nmGa8CZlHPL9iAvJPM1XCI+YPiQc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-YgVelCr3MUaDGVMW6KTzzg-1; Thu, 02 Mar 2023 07:32:06 -0500
X-MC-Unique: YgVelCr3MUaDGVMW6KTzzg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so1009585wms.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkYeojCCCHHlvA0WltcLcHJjtzQOyBV1IjUcPXVnKMA=;
 b=v/yyWpbb0b8Y+ufXEdA142WxdPMHCchbgHbiVTPcoZAkntnrqrjLyScFTTIIi8viBw
 tI8RPoenIxeln+2A9k4a6RhRTaOk4qov0t94pdW2M+pZsJEBzIQLVpthoocgkRXMddnA
 k8Vygu1bbNPqh5kipQgN9W8yMqcX6+Znade3zlDOBwseLJeIISN68FsA4VE0wztHyp5T
 I6//6CtYQnafh72FO6s9vxOLkf5KahwbLi5c/+PsvNE0LuRzquvcefX6NmYUoFYQbhEh
 dXBMgQURry7I4hKmw/A0YhSRdXNKjeDgNQ0qMkyScvpfT802akASvM5V0mxuHfFMIKRW
 9oEA==
X-Gm-Message-State: AO0yUKU0EWWfmazDfSHbQrUvyCu5eTwWt+D6jNjWp+Q1tCbjTxe3ieOC
 tONzFrChPlKG1/7NfqJOyPAVx8KfJfV3ndsVfwcCMNoYMQCLXrTwDUj+nzYnHzTbUTEOAcMxg5e
 tp0gZrrH4YHQyE80tSywZ6P+fBTWTmCEC55pcjlu++XR4EaQNIsEjSBivhi8RL2r3/Tk27LRsy8
 8=
X-Received: by 2002:a05:600c:44d6:b0:3ea:e7f7:4faa with SMTP id
 f22-20020a05600c44d600b003eae7f74faamr8005924wmo.26.1677760325108; 
 Thu, 02 Mar 2023 04:32:05 -0800 (PST)
X-Google-Smtp-Source: AK7set++EpT43+eyMA3mxkETjZ/e09ZYv9+l+vZiGcrOGavnGhNp7obJ2v9ZVDscoAqkUeHlEooEUQ==
X-Received: by 2002:a05:600c:44d6:b0:3ea:e7f7:4faa with SMTP id
 f22-20020a05600c44d600b003eae7f74faamr8005910wmo.26.1677760324867; 
 Thu, 02 Mar 2023 04:32:04 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b003daf6e3bc2fsm6107711wmq.1.2023.03.02.04.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 31/62] hw/xen: Implement EVTCHNOP_unmask
Date: Thu,  2 Mar 2023 13:29:58 +0100
Message-Id: <20230302123029.153265-32-pbonzini@redhat.com>
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

This finally comes with a mechanism for actually injecting events into
the guest vCPU, with all the atomic-test-and-set that's involved in
setting the bit in the shinfo, then the index in the vcpu_info, and
injecting either the lapic vector as MSI, or letting KVM inject the
bare vector.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 175 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |   2 +
 target/i386/kvm/xen-emu.c |  12 +++
 3 files changed, 189 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index c57d36b492e0..54707f1f9fe1 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -224,6 +224,13 @@ int xen_evtchn_set_callback_param(uint64_t param)
     return ret;
 }
 
+static void inject_callback(XenEvtchnState *s, uint32_t vcpu)
+{
+    int type = s->callback_param >> CALLBACK_VIA_TYPE_SHIFT;
+
+    kvm_xen_inject_vcpu_callback_vector(vcpu, type);
+}
+
 static bool valid_port(evtchn_port_t port)
 {
     if (!port) {
@@ -294,6 +301,152 @@ int xen_evtchn_status_op(struct evtchn_status *status)
     return 0;
 }
 
+/*
+ * Never thought I'd hear myself say this, but C++ templates would be
+ * kind of nice here.
+ *
+ * template<class T> static int do_unmask_port(T *shinfo, ...);
+ */
+static int do_unmask_port_lm(XenEvtchnState *s, evtchn_port_t port,
+                             bool do_unmask, struct shared_info *shinfo,
+                             struct vcpu_info *vcpu_info)
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
+    if (do_unmask) {
+        /*
+         * If this is a true unmask operation, clear the mask bit. If
+         * it was already unmasked, we have nothing further to do.
+         */
+        if (!((qatomic_fetch_and(&shinfo->evtchn_mask[idx], ~mask) & mask))) {
+            return 0;
+        }
+    } else {
+        /*
+         * This is a pseudo-unmask for affinity changes. We don't
+         * change the mask bit, and if it's *masked* we have nothing
+         * else to do.
+         */
+        if (qatomic_fetch_or(&shinfo->evtchn_mask[idx], 0) & mask) {
+            return 0;
+        }
+    }
+
+    /* If the event was not pending, we're done. */
+    if (!(qatomic_fetch_or(&shinfo->evtchn_pending[idx], 0) & mask)) {
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
+static int do_unmask_port_compat(XenEvtchnState *s, evtchn_port_t port,
+                                 bool do_unmask,
+                                 struct compat_shared_info *shinfo,
+                                 struct compat_vcpu_info *vcpu_info)
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
+    if (do_unmask) {
+        /*
+         * If this is a true unmask operation, clear the mask bit. If
+         * it was already unmasked, we have nothing further to do.
+         */
+        if (!((qatomic_fetch_and(&shinfo->evtchn_mask[idx], ~mask) & mask))) {
+            return 0;
+        }
+    } else {
+        /*
+         * This is a pseudo-unmask for affinity changes. We don't
+         * change the mask bit, and if it's *masked* we have nothing
+         * else to do.
+         */
+        if (qatomic_fetch_or(&shinfo->evtchn_mask[idx], 0) & mask) {
+            return 0;
+        }
+    }
+
+    /* If the event was not pending, we're done. */
+    if (!(qatomic_fetch_or(&shinfo->evtchn_pending[idx], 0) & mask)) {
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
+static int unmask_port(XenEvtchnState *s, evtchn_port_t port, bool do_unmask)
+{
+    void *vcpu_info, *shinfo;
+
+    if (s->port_table[port].type == EVTCHNSTAT_closed) {
+        return -EINVAL;
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
+        return do_unmask_port_lm(s, port, do_unmask, shinfo, vcpu_info);
+    } else {
+        return do_unmask_port_compat(s, port, do_unmask, shinfo, vcpu_info);
+    }
+}
+
 static int clear_port_pending(XenEvtchnState *s, evtchn_port_t port)
 {
     void *p = xen_overlay_get_shinfo_ptr();
@@ -380,3 +533,25 @@ int xen_evtchn_close_op(struct evtchn_close *close)
 
     return ret;
 }
+
+int xen_evtchn_unmask_op(struct evtchn_unmask *unmask)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(unmask->port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    ret = unmask_port(s, unmask->port, true);
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index cb3924941a57..69c6b0d743ae 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -17,7 +17,9 @@ int xen_evtchn_set_callback_param(uint64_t param);
 
 struct evtchn_status;
 struct evtchn_close;
+struct evtchn_unmask;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
+int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index fab7d6b6a914..884e1c9c11d1 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -817,6 +817,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = xen_evtchn_close_op(&close);
         break;
     }
+    case EVTCHNOP_unmask: {
+        struct evtchn_unmask unmask;
+
+        qemu_build_assert(sizeof(unmask) == 4);
+        if (kvm_copy_from_gva(cs, arg, &unmask, sizeof(unmask))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_unmask_op(&unmask);
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.1


