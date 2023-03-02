Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C326A82D2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:55:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8f-0003qJ-R8; Thu, 02 Mar 2023 07:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6m-0002ZS-UW
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6j-0003IY-Lo
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=79RsmoLxuuXkGBmklmtuZd+2O+6/W1NcISno4kDP6RA=;
 b=PwLiaKxDr/ytuXcvGx9+fuMbtcZqfDZUUE5gPP2XWd5y68s9miLptxLesvwaaAYlZIWjPw
 /V00bhUyPJQXGje94/Fwufb9zvpqoc9iHUlf7zZPTlOdcLbAtgvCKkyuEMCSdsEy6ouj3S
 WkXjGwHTl3CWsFDZHDMeNUgJUSI02mU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-JTgOrAalMVyl7zOH1sEP5g-1; Thu, 02 Mar 2023 07:32:24 -0500
X-MC-Unique: JTgOrAalMVyl7zOH1sEP5g-1
Received: by mail-wm1-f70.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so1010332wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=79RsmoLxuuXkGBmklmtuZd+2O+6/W1NcISno4kDP6RA=;
 b=hmabz0enfTCAAakb1+nfGomvcUdYTyThYxPWTjfGBzaDYVpw5QiSideKndNAxIX5OO
 7qMQGn8B7/hraySQzicpRZ6Y8zXeA3Wg7gVWR6bV+C57g/rnQialIoHuSTxTokEfbXco
 PLKuVetZHbLNvBfB/lEx8Nb/6diM6ljqrL0NoZG5iajVVxZxixsPYweYrGBTtUNuEcgA
 d6I9sOMeJz7InE0g0DR8wxzXFdNeYPWTeRPBMlsgTPd3O1mAYjM+6YIZlFe0uIVRIQEk
 3HSdAID8APns+nX4pDnrzwi2qj4fLYf01LRI0aHpbrSL3IDQ4FRPuALs4n0TBjv0O1ib
 wR5w==
X-Gm-Message-State: AO0yUKVsntvrIB2sT5CAO3j+FniI3jiCflDjjSYw+BQQ0IoJwmyZdO9c
 mvN1VU1Vc5YxHD6nv8mbzSDk4RS8RJdLFHvy29hipOFD2N/8VvJFIol3UhwM1J5U1BrUMdA0z+O
 NTdOUnpHTQ8438sKquF6xol2NK9RddG99StSY/ikkOXwx/6F0ssBoOAgM8mfJYVvveUn3/lqSmU
 o=
X-Received: by 2002:adf:f186:0:b0:2c7:4d7d:56b1 with SMTP id
 h6-20020adff186000000b002c74d7d56b1mr7249072wro.4.1677760342310; 
 Thu, 02 Mar 2023 04:32:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+Ws7tPK7WGkY5fYaSyk/SBexLrfdBUnDwvPiSI+xvCv9mVHEfdWJsIcH33IDzuMQbstnmEJw==
X-Received: by 2002:adf:f186:0:b0:2c7:4d7d:56b1 with SMTP id
 h6-20020adff186000000b002c74d7d56b1mr7249056wro.4.1677760342007; 
 Thu, 02 Mar 2023 04:32:22 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b002c5d3f0f737sm15078271wri.30.2023.03.02.04.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 37/62] hw/xen: Implement EVTCHNOP_bind_vcpu
Date: Thu,  2 Mar 2023 13:30:04 +0100
Message-Id: <20230302123029.153265-38-pbonzini@redhat.com>
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
 hw/i386/kvm/xen_evtchn.c  | 40 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 ++
 target/i386/kvm/xen-emu.c | 12 ++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index e2e36d94f670..cbaf4f535aaf 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -791,6 +791,46 @@ int xen_evtchn_unmask_op(struct evtchn_unmask *unmask)
     return ret;
 }
 
+int xen_evtchn_bind_vcpu_op(struct evtchn_bind_vcpu *vcpu)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    XenEvtchnPort *p;
+    int ret = -EINVAL;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(vcpu->port)) {
+        return -EINVAL;
+    }
+
+    if (!valid_vcpu(vcpu->vcpu)) {
+        return -ENOENT;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    p = &s->port_table[vcpu->port];
+
+    if (p->type == EVTCHNSTAT_interdomain ||
+        p->type == EVTCHNSTAT_unbound ||
+        p->type == EVTCHNSTAT_pirq ||
+        (p->type == EVTCHNSTAT_virq && virq_is_global(p->type_val))) {
+        /*
+         * unmask_port() with do_unmask==false will just raise the event
+         * on the new vCPU if the port was already pending.
+         */
+        p->vcpu = vcpu->vcpu;
+        unmask_port(s, vcpu->port, false);
+        ret = 0;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
+
 int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 1ebc7580eba5..486b031c8292 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -23,6 +23,7 @@ struct evtchn_bind_ipi;
 struct evtchn_send;
 struct evtchn_alloc_unbound;
 struct evtchn_bind_interdomain;
+struct evtchn_bind_vcpu;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
@@ -31,5 +32,6 @@ int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
 int xen_evtchn_send_op(struct evtchn_send *send);
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
 int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain);
+int xen_evtchn_bind_vcpu_op(struct evtchn_bind_vcpu *vcpu);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 1aff6b104259..8dc0d320f5ea 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -952,6 +952,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_bind_vcpu: {
+        struct evtchn_bind_vcpu vcpu;
+
+        qemu_build_assert(sizeof(vcpu) == 8);
+        if (kvm_copy_from_gva(cs, arg, &vcpu, sizeof(vcpu))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_bind_vcpu_op(&vcpu);
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.1


