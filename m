Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624A8328012
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:55:24 +0100 (CET)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGj19-0002j1-Bp
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGix9-0006Kt-5g
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGix7-0008Av-Hu
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614606672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZZ+6cjdYvXjAQueMSXVi2Hk39X3kgiy8hj6VSuKDas=;
 b=Y7ZD0euwYqR286mUIN8XJreNneJZdFfPCoz8tRIgLxHTwkZHnX2Rj2LQ/LMiOaYiV9Pdsa
 W++NZZQkKyFGEKAODDYyObeYvOE3/wk1mwcjpBFfLKtGbpy3odBDb9tPjy8exJHvdhDSfv
 y7ejkdRkFTKKinRgcLKWu9LpQpBpCow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-jUL8ragCN8WnD-u7ocQPRw-1; Mon, 01 Mar 2021 08:51:10 -0500
X-MC-Unique: jUL8ragCN8WnD-u7ocQPRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15A9D8030D4
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 13:51:09 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 668A45D735;
 Mon,  1 Mar 2021 13:51:07 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/17] i386: keep hyperv_vendor string up-to-date
Date: Mon,  1 Mar 2021 14:50:47 +0100
Message-Id: <20210301135103.306003-2-vkuznets@redhat.com>
In-Reply-To: <20210301135103.306003-1-vkuznets@redhat.com>
References: <20210301135103.306003-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When cpu->hyperv_vendor is not set manually we default to "Microsoft Hv"
and in 'hv_passthrough' mode we get the information from the host. This
information is stored in cpu->hyperv_vendor_id[] array but we don't update
cpu->hyperv_vendor string so e.g. QMP's query-cpu-model-expansion output
is incorrect.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c     | 19 +++++++++----------
 target/i386/kvm/kvm.c |  5 +++++
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a53446e6a56..ee094877d7a1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6653,17 +6653,16 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
 
     /* Hyper-V vendor id */
     if (!cpu->hyperv_vendor) {
-        memcpy(cpu->hyperv_vendor_id, "Microsoft Hv", 12);
-    } else {
-        len = strlen(cpu->hyperv_vendor);
-
-        if (len > 12) {
-            warn_report("hv-vendor-id truncated to 12 characters");
-            len = 12;
-        }
-        memset(cpu->hyperv_vendor_id, 0, 12);
-        memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
+        object_property_set_str(OBJECT(cpu), "hv-vendor-id", "Microsoft Hv",
+                                &error_abort);
+    }
+    len = strlen(cpu->hyperv_vendor);
+    if (len > 12) {
+        warn_report("hv-vendor-id truncated to 12 characters");
+        len = 12;
     }
+    memset(cpu->hyperv_vendor_id, 0, 12);
+    memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
 
     /* 'Hv#1' interface identification*/
     cpu->hyperv_interface_id[0] = 0x31237648;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 0b5755e42b87..8e9ae7522582 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1215,6 +1215,11 @@ static int hyperv_handle_properties(CPUState *cs,
             cpu->hyperv_vendor_id[0] = c->ebx;
             cpu->hyperv_vendor_id[1] = c->ecx;
             cpu->hyperv_vendor_id[2] = c->edx;
+            cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
+                                           sizeof(cpu->hyperv_vendor_id) + 1);
+            memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
+                   sizeof(cpu->hyperv_vendor_id));
+            cpu->hyperv_vendor[sizeof(cpu->hyperv_vendor_id)] = 0;
         }
 
         c = cpuid_find_entry(cpuid, HV_CPUID_INTERFACE, 0);
-- 
2.29.2


