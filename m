Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDBA6A826E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:40:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8I-0002vx-Ae; Thu, 02 Mar 2023 07:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6F-0001Ff-47
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6D-0003BO-Ja
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5rJBANBTNQoMcPYBk1lEdwItM0lARWYTN87VeLKF/w=;
 b=FE6aakDjZsnkdcYyjjeZwcIxy5/0/L0yWWGYh6lnRDnCRz/eUwoRDdtBmwHd311MT1K7nO
 ujCCCXxvfydNa3UoUoRuQ+GvL+/VF8b7VlZDjHUnwskHqK6xkxOugN74PIQpa0QzQBj4fE
 CQjRk+zyhH8TgFua/QPN23y4v8uSEzc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-3atPxcyRMDaCNmSabmtEUg-1; Thu, 02 Mar 2023 07:31:51 -0500
X-MC-Unique: 3atPxcyRMDaCNmSabmtEUg-1
Received: by mail-wm1-f72.google.com with SMTP id
 u19-20020a05600c00d300b003eb24ce58ceso5686402wmm.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5rJBANBTNQoMcPYBk1lEdwItM0lARWYTN87VeLKF/w=;
 b=T4rZgJjmP8t5TjMyklQ9GD5w1kRDB33V76dUOCmIp7EDZENMp9yi6zgVPKY87xTKAz
 YBA71IJytB3V7EEUVswKZO/5+EY2UDMuvuEhANagecLBBuOAn4JWVwOiRnmGNrZbUUMM
 iksOKhZ3v1RM+xb5hX+H+1By/db0A/nCyiwyci67CDIkjq4to2AUYG14lpWtXAAj+rt0
 A/D3jLfCZVCU49zc6twsgWF4WlJf55CWkrwUX3QveU0KH4BdyOmblWwcJxmrrXn+k4YJ
 AJFCU9eUA2Uj3kQPxj7QO43lwL/K0eZNwT6ukAxpGpDqf6nM3qAn4knLj3Ff1dPninMI
 BFOA==
X-Gm-Message-State: AO0yUKW7JUgUCX8FJPXvzvfbXWjQqjMhWUIspQ8iaAlGr/Tw2HEkvIAS
 sYKR1hpaeOuXWIiwE5aUwvbXro7SzPhL7Pj6+5Nfirx+IDhT+jpO4KCUV/spiKVrncjCWQaH+SO
 f0j7NLDULtJnR7iPMkz7Qn5w3X442HzzhPn7smGvX8R8PcGljK8emMLxwE3PmypZFN3tFazynn0
 I=
X-Received: by 2002:adf:f74a:0:b0:2c7:1b1d:5aa with SMTP id
 z10-20020adff74a000000b002c71b1d05aamr6984386wrp.19.1677760310504; 
 Thu, 02 Mar 2023 04:31:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9xawImKB/sedImxD/xywJHUhy4zQtJ19qiQd6gDxlC7hGlPJUpgdqI1k42OUPmQ/pexBh81A==
X-Received: by 2002:adf:f74a:0:b0:2c7:1b1d:5aa with SMTP id
 z10-20020adff74a000000b002c71b1d05aamr6984367wrp.19.1677760310186; 
 Thu, 02 Mar 2023 04:31:50 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a05600c554c00b003e1f2e43a1csm2847670wmb.48.2023.03.02.04.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 26/62] i386/xen: implement HVMOP_set_param
Date: Thu,  2 Mar 2023 13:29:53 +0100
Message-Id: <20230302123029.153265-27-pbonzini@redhat.com>
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

From: Ankur Arora <ankur.a.arora@oracle.com>

This is the hook for adding the HVM_PARAM_CALLBACK_IRQ parameter in a
subsequent commit.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Split out from another commit]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index e9a4422d93f0..ce858ac63ce1 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -489,6 +489,36 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
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
+    default:
+        return false;
+    }
+
+out:
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
                                               X86CPU *cpu, uint64_t arg)
 {
@@ -530,6 +560,9 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         ret = -ENOSYS;
         break;
 
+    case HVMOP_set_param:
+        return handle_set_param(exit, cpu, arg);
+
     default:
         return false;
     }
-- 
2.39.1


