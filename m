Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06AE6A825E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:37:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiAr-0006mZ-94; Thu, 02 Mar 2023 07:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7e-0002vf-67
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7H-0003sL-Lp
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3qtZtM3F7lM2dr4qwMUHBHKRZr+tdOjqwpMHwp/TkI=;
 b=eexI6eVVnSgo82aJrhTxXaVl78c2efjcsDgjj5Uz1pFxGwTCEmcAR80A0zzA/qc0Kvpcvk
 AMX3Qzt/xkm/XBFLxGcCKDXDSRzAA5ZitAhShmKMZFFzH99yvfSC2DWkW4s4vtVTpArxLX
 2wj2vZkB1VjK1IvqJIdKwgOg6DJu11Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-P-r5vWigMcWXVnL-iej3vQ-1; Thu, 02 Mar 2023 07:32:57 -0500
X-MC-Unique: P-r5vWigMcWXVnL-iej3vQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 y16-20020a1c4b10000000b003dd1b5d2a36so578986wma.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l3qtZtM3F7lM2dr4qwMUHBHKRZr+tdOjqwpMHwp/TkI=;
 b=qPwoGteb4WgceIFyqYOw5q2lWRo0o5D1rlbKUjwhjZAJWmcK0fCuD54ymfpkF/5J8J
 I1RAaxLPE0k6YZ8/e7JcOEuGxcKo4RC+6PhaMrmG8uaNHDQoY8MH2A1nL7l8g85m7YnT
 voDBDiUNrO6mioY6s1QQ1DDFvI1j4LdWjHl+w2SdMWXgTallRULm3g1cvaPOI1M9iIDS
 dwVGcsZxXLvev1yVp36c5OL3qYPqTMJM6CrHnUShOGXm3vNKJhbrTXQNcJvyluR2IjT+
 uxji/2w4kK2DyV84lJ9QzT1ZmG/KHxbWqLMOugXOiHZ31tSMuy8Iaqj93bS8r7dclipw
 37Lg==
X-Gm-Message-State: AO0yUKXqXGY++sKySYL2dGhIPPnIzb4JxbMARC03vLN2TjiXHeGR5ajD
 mEgkxwKuvK21u8+dUjwllqykuvzBUi0Xf7ItqSvopNquJ4Wx2K3cO3dDd+7M8e2aWw12UgwlgOZ
 bWlMoWArfr5trAGkIto62Kx3JOnpn7cuMouNs8MKMaZO9shYxnSRevQMQBZna2Etlbr5cmnFVrQ
 g=
X-Received: by 2002:a05:600c:3413:b0:3df:eecc:de2b with SMTP id
 y19-20020a05600c341300b003dfeeccde2bmr7370769wmp.11.1677760376421; 
 Thu, 02 Mar 2023 04:32:56 -0800 (PST)
X-Google-Smtp-Source: AK7set81cGnp4ywwWwHbrFC3t+/DGuvD1nbMF7PyZ5AsTO7AGVOQTVJk+uCfHlCYSvwl4fGJHOaYzw==
X-Received: by 2002:a05:600c:3413:b0:3df:eecc:de2b with SMTP id
 y19-20020a05600c341300b003dfeeccde2bmr7370749wmp.11.1677760376000; 
 Thu, 02 Mar 2023 04:32:56 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1ce906000000b003e0015c8618sm2796092wmc.6.2023.03.02.04.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 49/62] i386/xen: handle HVMOP_get_param
Date: Thu,  2 Mar 2023 13:30:16 +0100
Message-Id: <20230302123029.153265-50-pbonzini@redhat.com>
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
index 75bcf7b6306f..d2c88ef0d93f 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -765,6 +765,42 @@ out:
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
@@ -809,6 +845,9 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     case HVMOP_set_param:
         return handle_set_param(exit, cpu, arg);
 
+    case HVMOP_get_param:
+        return handle_get_param(exit, cpu, arg);
+
     default:
         return false;
     }
-- 
2.39.1


