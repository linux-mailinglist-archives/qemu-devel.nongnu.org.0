Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE2C6A8283
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:43:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi6G-0000zj-3l; Thu, 02 Mar 2023 07:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5v-0000Tt-AB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5t-00032n-Ko
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8nDbHLy1N2RwrxdAZ/c3Ppx0lBqj7M6wymm1IGPf2g=;
 b=bRSgc+6XO80ectlwmpelb9T+RD5FdQA+hO42kOmG/TKV4KupU5iR1zwSyE0E8SnQFUSVxl
 bFSUlADYcob6QBybCS54Q+0kEMC0rbHcY8T4wREBNNxzkMyESG6jE9SqSv3vHiKKmXXm2c
 0+ibZNgomuq8XM6NHx8ZFNOvdlBdEFo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-qsSUQ77WOsihb51YZJeeyg-1; Thu, 02 Mar 2023 07:31:32 -0500
X-MC-Unique: qsSUQ77WOsihb51YZJeeyg-1
Received: by mail-wr1-f70.google.com with SMTP id
 bx25-20020a5d5b19000000b002c7ce4ce3c3so3197647wrb.13
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U8nDbHLy1N2RwrxdAZ/c3Ppx0lBqj7M6wymm1IGPf2g=;
 b=1QyEN5NfTybw4JIpykzKRNdBTPYIg+qdDlQjUvtAnqxnyLjJrt+Ng97f/9tGVHh9Vq
 ZoVqKne1J5HujLdm8RbY+0SxDHKHWv+y7yV/X6hzrMa8dM5BSZpo6zzENG9vHZG9uMuF
 MSpeX8cboVJAirZGvtC6tvSGf1Y2OutO6Tn1daK+LkJeExyniNI5Hj94yWGeO9wGitIX
 DsGakhbHzh+jFPO6KdNgw1k4JMvSEznLusqStgnM7toKamT3VXPMx+j59D6AAtjZ5Re8
 Z3kiggGkQQd0yjWeCA4w/fuyknyBQKL9W+RBgqBJTpCep233/TztDBjiEV1UdO5OxZjk
 v3pw==
X-Gm-Message-State: AO0yUKVT7XoUgl2MjlEY+y8diSs4O+/KuZ9Du5RGePGdtmG12uF0JbTf
 mNclrbsVD7TVexpEz7WPXD1T+wg9Apn9mHpGV10nfIiiVei6t/TlN4e8JShtdkCBxsZRKF+wWAD
 UsbB9+PmjsGAX58cKgRyydfOOjDuEdE0yNN2qEwc/WnCjoSF6q3aLEsH3lDHN7J9DeMdc/wxgMp
 8=
X-Received: by 2002:a05:600c:4da5:b0:3eb:42ab:7b5 with SMTP id
 v37-20020a05600c4da500b003eb42ab07b5mr8279829wmp.1.1677760290377; 
 Thu, 02 Mar 2023 04:31:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8POrClXqdrZYcjHnxfN7MyPj6yJY0pt7lpOUw+hTpIqk+dJ9GEQls3799bR6ca28sVO8o97w==
X-Received: by 2002:a05:600c:4da5:b0:3eb:42ab:7b5 with SMTP id
 v37-20020a05600c4da500b003eb42ab07b5mr8279816wmp.1.1677760290130; 
 Thu, 02 Mar 2023 04:31:30 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u4-20020adfed44000000b002c563b124basm15323550wro.103.2023.03.02.04.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 19/62] i386/xen: implement HYPERVISOR_hvm_op
Date: Thu,  2 Mar 2023 13:29:46 +0100
Message-Id: <20230302123029.153265-20-pbonzini@redhat.com>
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

From: Joao Martins <joao.m.martins@oracle.com>

This is when guest queries for support for HVMOP_pagetable_dying.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 2b235e7b2714..4002b1b797cb 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -26,6 +26,7 @@
 #include "hw/xen/interface/version.h"
 #include "hw/xen/interface/sched.h"
 #include "hw/xen/interface/memory.h"
+#include "hw/xen/interface/hvm/hvm_op.h"
 
 #include "xen-compat.h"
 
@@ -349,6 +350,19 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                 int cmd, uint64_t arg)
+{
+    switch (cmd) {
+    case HVMOP_pagetable_dying:
+        exit->u.hcall.result = -ENOSYS;
+        return true;
+
+    default:
+        return false;
+    }
+}
+
 int kvm_xen_soft_reset(void)
 {
     int err;
@@ -450,6 +464,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case __HYPERVISOR_sched_op:
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
+    case __HYPERVISOR_hvm_op:
+        return kvm_xen_hcall_hvm_op(exit, cpu, exit->u.hcall.params[0],
+                                    exit->u.hcall.params[1]);
     case __HYPERVISOR_memory_op:
         return kvm_xen_hcall_memory_op(exit, cpu, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1]);
-- 
2.39.1


