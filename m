Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DDC316BBA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:51:39 +0100 (CET)
Received: from localhost ([::1]:59916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9siI-0007r0-Ds
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sXs-00072J-Ex
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:40:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sXn-0008J4-9s
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612975243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3FzcW4YkQIfGDu7vetopn4MP4AyUdLcKukRg+tfNZE=;
 b=Nih6nrnuqtOtYgKHaf9Lhkv6hQ7nWIxhAjMPkeay4z2j/qoFr0Lg+pz1j/T2L4DzCPYj3v
 sTHmmy80l3nx07rdevn93ZMXRzekVV/fINqRjzw8qoXO3+/WXIL++n0alzYTiGguwpv2pu
 sE1PxS8fkeSXUe30CsYE1w9JmN3JmGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-G4H6vON8MeyjgXpAyBogcQ-1; Wed, 10 Feb 2021 11:40:41 -0500
X-MC-Unique: G4H6vON8MeyjgXpAyBogcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E6AB107ACC7
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:40:40 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80D485D9E8;
 Wed, 10 Feb 2021 16:40:38 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v4 01/21] i386: keep hyperv_vendor string up-to-date
Date: Wed, 10 Feb 2021 17:40:13 +0100
Message-Id: <20210210164033.607612-2-vkuznets@redhat.com>
In-Reply-To: <20210210164033.607612-1-vkuznets@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
 Igor Mammedov <imammedo@redhat.com>
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
 target/i386/kvm/kvm.c |  4 ++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9c3d2d60b7e5..d03c1588ba0e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6547,17 +6547,16 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
 
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
index e97f84175707..6ae4be44aa6f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1214,6 +1214,10 @@ static int hyperv_handle_properties(CPUState *cs,
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
2.29.2


