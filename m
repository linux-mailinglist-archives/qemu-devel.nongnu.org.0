Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902BC27EA35
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 15:46:43 +0200 (CEST)
Received: from localhost ([::1]:46950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNcRO-0001vJ-Jp
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 09:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kNcMR-0006Di-4M
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 09:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kNcML-0005cD-W2
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 09:41:34 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601473284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJBU8aZ+zZJD/zVbzW/GKomX9R0tdkTMKW4JLjL86MM=;
 b=Ny3qf7Xk3VRd1nZGVr/mnnGCtDKATMAaRwEMOllMSoCgAh4oYP6ivbPhY7TOsWlCY7N0LO
 8vpqPbsJUPO7d16XvZ7GFZ7u75s5Y06s0pT3jZydxTWSTV9ZUb/dOOrnrc9SHxmgBngmzk
 9CtDmTOi1deDzns/0KDBi9qB2pd2Tx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-V1k8gMFeOJKjZQ81QAI2jw-1; Wed, 30 Sep 2020 09:41:23 -0400
X-MC-Unique: V1k8gMFeOJKjZQ81QAI2jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FFC110BBEC3
 for <qemu-devel@nongnu.org>; Wed, 30 Sep 2020 13:41:22 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDF5B60C05;
 Wed, 30 Sep 2020 13:41:20 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 08/19] i386: keep hyperv_vendor string up-to-date
Date: Wed, 30 Sep 2020 15:40:16 +0200
Message-Id: <20200930134027.1348021-9-vkuznets@redhat.com>
In-Reply-To: <20200930134027.1348021-1-vkuznets@redhat.com>
References: <20200930134027.1348021-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When cpu->hyperv_vendor is not set manually we default to "Microsoft Hv"
and in 'hv_passthrough' mode we get the information from the host. This
information is stored in cpu->hyperv_vendor_id[] array but we don't update
cpu->hyperv_vendor string so e.g. QMP's query-cpu-model-expansion output
is incorrect.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c | 20 ++++++++++----------
 target/i386/kvm.c |  4 ++++
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d657590ab55d..8ec0af0a6d48 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6493,18 +6493,18 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
 {
     size_t len;
 
+    /* Hyper-V vendor id */
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
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index afddc9a4a260..eb21f77be51b 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1229,6 +1229,10 @@ static int hyperv_handle_properties(CPUState *cs,
             cpu->hyperv_vendor_id[0] = c->ebx;
             cpu->hyperv_vendor_id[1] = c->ecx;
             cpu->hyperv_vendor_id[2] = c->edx;
+            cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
+                                           sizeof(cpu->hyperv_vendor_id) + 1);
+            memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
+                   sizeof(cpu->hyperv_vendor_id));
         }
 
         c = cpuid_find_entry(cpuid, HV_CPUID_INTERFACE, 0);
-- 
2.25.4


