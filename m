Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81206A827E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:42:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi7l-0002ve-2H; Thu, 02 Mar 2023 07:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6j-0002Yv-Tn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6h-0003IC-Ov
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rqgVeJf/beC3uBaalPhqtNLIfVze+AudTdQPh37DMk=;
 b=GmxTFoWoqsJ8sB5me0/L8rWgibFzdasDnyfBuLgsrYPYvVzHClsD0JJM4w9rmXpx2IXFpq
 Hw6vSufZcjUkTyUzMFBZF4lla0tYCeGH6kUlfoVs5i/0K040xZrq2+6Y6iuUjQjs/TMABS
 2gunCcnDHapr5P2GMS7/pfAaA9tQg9Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-i799-jDKPuOtrNYqS1Wl3Q-1; Thu, 02 Mar 2023 07:32:21 -0500
X-MC-Unique: i799-jDKPuOtrNYqS1Wl3Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 m28-20020a05600c3b1c00b003e7d4662b83so1222407wms.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5rqgVeJf/beC3uBaalPhqtNLIfVze+AudTdQPh37DMk=;
 b=ArzoVKp8NmMyJGQilxxJPs1uc9p+V+93LcPT4mxq1e87OQdbT2NttYeaJh1TZlrT0O
 uax84MjGJW9z9IVV/OkvgrRcEykHtiBP8CD7PZXiN6vM13nO0+VtKfF0L2KPFIuH+Mo6
 NJoL+FVSmU30xVcAFuYVKGMtKFH208yN6q7LygtMnrQ95022lPkZvEC42QUrppBwJHvB
 j5lGDyokOTRBCbqMBwJ/Dg/Kr0lK/NvlKbINCt4aU9XuFzYljp7uPu36FxQEQSSO45A3
 +d5HiPDzkISf7VtdDQEA1w5wKkcbsiFqwQYDSlf6TO09EOH8ogPbKyNCpV6I46xIQaXI
 59yQ==
X-Gm-Message-State: AO0yUKXrdTBpcO4Fr7zi4+wQQdX81N5ggWTBqPgW5j/aMFMVPfT7BUGA
 vqnhX3FG68ocmbFnOQiIfpRV66WxuXWdnko1uOOly35q97g+QTyzUNWN4zEVNds0GRJTpbHdwwZ
 nyc180YQfbbPV0aCWYqVK7BMoiyvE12Ey1ly8XHc4uOxFKLr2XCXso5PDEQN8kGDQ42S0gvxCDQ
 Q=
X-Received: by 2002:adf:f111:0:b0:2c7:17a2:b70 with SMTP id
 r17-20020adff111000000b002c717a20b70mr6697784wro.69.1677760339491; 
 Thu, 02 Mar 2023 04:32:19 -0800 (PST)
X-Google-Smtp-Source: AK7set8s33TaVCgvEtztZX6+QcBLlaUiaeTD5kWQDZJXhnGdICE81+xApUUC/5N46/jczfpF9j1iMg==
X-Received: by 2002:adf:f111:0:b0:2c7:17a2:b70 with SMTP id
 r17-20020adff111000000b002c717a20b70mr6697765wro.69.1677760339206; 
 Thu, 02 Mar 2023 04:32:19 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y18-20020adffa52000000b002c55efa9cbesm14836526wrr.39.2023.03.02.04.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 36/62] hw/xen: Implement EVTCHNOP_bind_interdomain
Date: Thu,  2 Mar 2023 13:30:03 +0100
Message-Id: <20230302123029.153265-37-pbonzini@redhat.com>
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 78 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 +
 target/i386/kvm/xen-emu.c | 16 ++++++++
 3 files changed, 96 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index df25bf0806a6..e2e36d94f670 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -722,6 +722,23 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
         }
         break;
 
+    case EVTCHNSTAT_interdomain:
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
+            /* Not yet implemented. This can't happen! */
+        } else {
+            /* Loopback interdomain */
+            XenEvtchnPort *rp = &s->port_table[p->type_val];
+            if (!valid_port(p->type_val) || rp->type_val != port ||
+                rp->type != EVTCHNSTAT_interdomain) {
+                error_report("Inconsistent state for interdomain unbind");
+            } else {
+                /* Set the other end back to unbound */
+                rp->type = EVTCHNSTAT_unbound;
+                rp->type_val = 0;
+            }
+        }
+        break;
+
     default:
         break;
     }
@@ -837,6 +854,67 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
     return ret;
 }
 
+int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    uint16_t type_val;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (interdomain->remote_dom == DOMID_QEMU) {
+        type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU;
+    } else if (interdomain->remote_dom == DOMID_SELF ||
+               interdomain->remote_dom == xen_domid) {
+        type_val = 0;
+    } else {
+        return -ESRCH;
+    }
+
+    if (!valid_port(interdomain->remote_port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    /* The newly allocated port starts out as unbound */
+    ret = allocate_port(s, 0, EVTCHNSTAT_unbound, type_val,
+                        &interdomain->local_port);
+    if (ret) {
+        goto out;
+    }
+
+    if (interdomain->remote_dom == DOMID_QEMU) {
+        /* We haven't hooked up QEMU's PV drivers to this yet */
+        ret = -ENOSYS;
+    } else {
+        /* Loopback */
+        XenEvtchnPort *rp = &s->port_table[interdomain->remote_port];
+        XenEvtchnPort *lp = &s->port_table[interdomain->local_port];
+
+        if (rp->type == EVTCHNSTAT_unbound && rp->type_val == 0) {
+            /* It's a match! */
+            rp->type = EVTCHNSTAT_interdomain;
+            rp->type_val = interdomain->local_port;
+
+            lp->type = EVTCHNSTAT_interdomain;
+            lp->type_val = interdomain->remote_port;
+        } else {
+            ret = -EINVAL;
+        }
+    }
+
+    if (ret) {
+        free_port(s, interdomain->local_port);
+    }
+ out:
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+
+}
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index fc080138e3f2..1ebc7580eba5 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -22,6 +22,7 @@ struct evtchn_bind_virq;
 struct evtchn_bind_ipi;
 struct evtchn_send;
 struct evtchn_alloc_unbound;
+struct evtchn_bind_interdomain;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
@@ -29,5 +30,6 @@ int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
 int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
 int xen_evtchn_send_op(struct evtchn_send *send);
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
+int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index ac04387a6a12..1aff6b104259 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -936,6 +936,22 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_bind_interdomain: {
+        struct evtchn_bind_interdomain interdomain;
+
+        qemu_build_assert(sizeof(interdomain) == 12);
+        if (kvm_copy_from_gva(cs, arg, &interdomain, sizeof(interdomain))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_bind_interdomain_op(&interdomain);
+        if (!err &&
+            kvm_copy_to_gva(cs, arg, &interdomain, sizeof(interdomain))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.1


