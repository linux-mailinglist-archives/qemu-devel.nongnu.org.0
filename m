Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F856A82F1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:57:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi9o-0005DE-RY; Thu, 02 Mar 2023 07:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6B-00010d-EB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi69-0003AL-Lg
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEekgL67A2OQXUb7viJzgwaGITaNaMQ6WTyvmaKdRRQ=;
 b=OFGlb93h0+UJhlmxulnyYGjwZXUBXcT2PkOP/YdITE69Kf3suc+Q1mLeeZhUq6MBZwRcVv
 TfGX+jg6S/hi2n6kfCltZkPWye6UUgH0Igv0gayu97IfnpNf3E4tbnFa00oLfueASOjUd8
 i4VYYwwFE8VkG5tjKj2GmVyPgMG25t8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-3TQeuDX3OgKMSxFGFM5IWw-1; Thu, 02 Mar 2023 07:31:45 -0500
X-MC-Unique: 3TQeuDX3OgKMSxFGFM5IWw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso1193284wms.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GEekgL67A2OQXUb7viJzgwaGITaNaMQ6WTyvmaKdRRQ=;
 b=M2fbNf/GhAbGUBuja80pa5yRJs/+hJWhE2ZvGEG/fclG/Uhod1ouUR7+oyGb7zHZjv
 z8spQFh6KbWHrJ3ZtJFewPsaQC6haYQuqaEFmvdp9hpLqGsp/FJJe07a7Gi1y03CIF9b
 KfPg5M60U/Ygu7NMu/QLh4LcrJchFhCbyuUIc1y0cjCJVHbVEZy3iNo1JJAQZasOi/NP
 hS5fP1dspTR0qC7vD9ka+1r9jjWyP6dvtu/n399wvey1QfJ0qZvTDeAkK5i9S4fqD6eh
 ovAYN7bzCvBCmtdXI5UUFZHjK8zcoNzSe8RVOiebAOAY/wJPWSlPgHsl+XgU9LmIz+p/
 HylA==
X-Gm-Message-State: AO0yUKUar0YYJpfU3ht7k0jA3YMG1J/7199k89RXyttAZerLVVrxBvM6
 wHMV7K+ODadQIBJDkKGRmS5zUm2QuJIzKpHY9OM/vrHPUHsGunvsM4TSwpiQkaBXPke4NJnlgre
 TuDIYom1Zqz/svp1/3QPjzyPj2itm0Bkh9EfixPHmjWO7KZ/ZdJNEebgP5gYz3ZeLpFY5qnCb/G
 I=
X-Received: by 2002:adf:edc7:0:b0:2c7:a3c:5bd6 with SMTP id
 v7-20020adfedc7000000b002c70a3c5bd6mr7634306wro.52.1677760304531; 
 Thu, 02 Mar 2023 04:31:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+WzV+t7tqK/mKzssMnzRaWeJYcnRfg9ua4tlpMjjTaGUhq7jUqCAxa6ap+1Ci4mNXh/S0LKw==
X-Received: by 2002:adf:edc7:0:b0:2c7:a3c:5bd6 with SMTP id
 v7-20020adfedc7000000b002c70a3c5bd6mr7634289wro.52.1677760304234; 
 Thu, 02 Mar 2023 04:31:44 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d2-20020adfe842000000b002c552c6c8c2sm15314064wrn.87.2023.03.02.04.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 24/62] i386/xen: implement HYPERVISOR_event_channel_op
Date: Thu,  2 Mar 2023 13:29:51 +0100
Message-Id: <20230302123029.153265-25-pbonzini@redhat.com>
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

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Ditch event_channel_op_compat which was never available to HVM guests]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index c0a8e4c34e70..ac143c05a441 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -28,6 +28,7 @@
 #include "hw/xen/interface/memory.h"
 #include "hw/xen/interface/hvm/hvm_op.h"
 #include "hw/xen/interface/vcpu.h"
+#include "hw/xen/interface/event_channel.h"
 
 #include "xen-compat.h"
 
@@ -588,6 +589,27 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
+                                    int cmd, uint64_t arg)
+{
+    int err = -ENOSYS;
+
+    switch (cmd) {
+    case EVTCHNOP_init_control:
+    case EVTCHNOP_expand_array:
+    case EVTCHNOP_set_priority:
+        /* We do not support FIFO channels at this point */
+        err = -ENOSYS;
+        break;
+
+    default:
+        return false;
+    }
+
+    exit->u.hcall.result = err;
+    return true;
+}
+
 int kvm_xen_soft_reset(void)
 {
     CPUState *cpu;
@@ -694,6 +716,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case __HYPERVISOR_sched_op:
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
+    case __HYPERVISOR_event_channel_op:
+        return kvm_xen_hcall_evtchn_op(exit, exit->u.hcall.params[0],
+                                       exit->u.hcall.params[1]);
     case __HYPERVISOR_vcpu_op:
         return kvm_xen_hcall_vcpu_op(exit, cpu,
                                      exit->u.hcall.params[0],
-- 
2.39.1


