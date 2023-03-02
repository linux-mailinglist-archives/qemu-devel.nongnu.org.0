Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F46A8253
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:35:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi7O-0002f2-Bh; Thu, 02 Mar 2023 07:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5x-0000et-W7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5w-00035L-FC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7CwJxDfN3K2I2RtaBpt7PI+9HJfQj4Qdyc9Yuv/MO4=;
 b=gtOGSHJSwBvmPcktlFRmODW2IohsXCJQL3WDZREXCfj/PBTWtDt4MCQHDrL+hY/0kDnRZO
 Pfnnh8cxNHlrUaNOj6CffpKfzJbBi7ZLa2we+HretkEmku7FtA3vyszoLihISip8t9rKpn
 eJxDJUC6aY3O7m7/KzyPNI4VEZVMt4c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-czv9tejjMNyerfiMOEao1g-1; Thu, 02 Mar 2023 07:31:34 -0500
X-MC-Unique: czv9tejjMNyerfiMOEao1g-1
Received: by mail-wr1-f70.google.com with SMTP id
 g6-20020adfa486000000b002c55ef1ec94so3146229wrb.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R7CwJxDfN3K2I2RtaBpt7PI+9HJfQj4Qdyc9Yuv/MO4=;
 b=H9wEMk86R3JKoNAl8MW9nP+uZO/i9dB2hs/WJ1quUspuOTwEUPSw+Vq2KJSiCUXRZc
 qb4euulUU1pA8KxPdJS/woPSH0vW1gmDtbsWc0JvbWyUKpogUeB9XcRxk8KMRCjoxO+w
 I1Qb+/zDie01EY9T08uJv0+FILB+faBKEPlfQrIJlPhYahQQ+P/PNAd3XbGxFUmKIiZx
 A6FJq99YxXss26293vfm/bfIRtrr4efmbGrfegOkK5RxIvnrbPVdGWoi8vz/KX35DIRo
 qxKU7ShXD+V9Doc7otpJJiIaluphi/4EbZBg4BSrqzQHrZcAYbtsgOtssdjj3B3Jb32o
 24mQ==
X-Gm-Message-State: AO0yUKW2uNBTK1ORvXYSxtnUlUVGiKSE2xtNudxJBRqzQkVX1hXOjOQa
 56ymhpKUKdcOtqjKTYc4gXhBcud1HVA1p9AR82tQ+OcYIjzjg5yyoSmTnY4CPAp7Z0NDImMBmQM
 pwWqNkeGYsoNzksgfJQM2EoVH8yiNbshbIqyusdW2ODtTJ5hvQcNNMyZ6dmEgdM5ztHzLeMgezW
 A=
X-Received: by 2002:a05:600c:3148:b0:3df:f7f1:4faf with SMTP id
 h8-20020a05600c314800b003dff7f14fafmr7553852wmo.34.1677760292889; 
 Thu, 02 Mar 2023 04:31:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+B6w6GCMVkZ04e9Ym7VB+ZGGz8RjyWDzjqIHAJaFSmIC3ne6IzYCbOOyEAf0WO9vzuq7eTIg==
X-Received: by 2002:a05:600c:3148:b0:3df:f7f1:4faf with SMTP id
 h8-20020a05600c314800b003dff7f14fafmr7553836wmo.34.1677760292628; 
 Thu, 02 Mar 2023 04:31:32 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q10-20020adfea0a000000b002c567b58e9asm15364647wrm.56.2023.03.02.04.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 20/62] i386/xen: implement HYPERVISOR_vcpu_op
Date: Thu,  2 Mar 2023 13:29:47 +0100
Message-Id: <20230302123029.153265-21-pbonzini@redhat.com>
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

This is simply when guest tries to register a vcpu_info
and since vcpu_info placement is optional in the minimum ABI
therefore we can just fail with -ENOSYS

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 4002b1b797cb..e5ae0a9a386d 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -27,6 +27,7 @@
 #include "hw/xen/interface/sched.h"
 #include "hw/xen/interface/memory.h"
 #include "hw/xen/interface/hvm/hvm_op.h"
+#include "hw/xen/interface/vcpu.h"
 
 #include "xen-compat.h"
 
@@ -363,6 +364,25 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     }
 }
 
+static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                  int cmd, int vcpu_id, uint64_t arg)
+{
+    int err;
+
+    switch (cmd) {
+    case VCPUOP_register_vcpu_info:
+        /* no vcpu info placement for now */
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
     int err;
@@ -464,6 +484,11 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case __HYPERVISOR_sched_op:
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
+    case __HYPERVISOR_vcpu_op:
+        return kvm_xen_hcall_vcpu_op(exit, cpu,
+                                     exit->u.hcall.params[0],
+                                     exit->u.hcall.params[1],
+                                     exit->u.hcall.params[2]);
     case __HYPERVISOR_hvm_op:
         return kvm_xen_hcall_hvm_op(exit, cpu, exit->u.hcall.params[0],
                                     exit->u.hcall.params[1]);
-- 
2.39.1


