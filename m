Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0112B9028
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:34:20 +0100 (CET)
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhGd-0002Qi-K9
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfhEu-0000rg-MC
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:32:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfhEs-0007Xb-Ga
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605781949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omc7TRuONExAhVIJ0XSu8a+uM7zNFhfUz/mxNMAY6rM=;
 b=Lm6z7RlGdSwnA09gRkKToSq++BRdc9MQ0ZZF+FTzDcBqV4M0TqmwLyo9dF5w+oXNdQs0id
 AJcqCSAHJSiAyTnWxqe1kC5G3rBVYtE78yh3iWWvuy8zT7W7v6+EH52Z88f9e2MFbu4a+0
 6hm2rmF7v8w1ioweTBf6mT016EqYWxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-lUJQlZyGMV-Esfq5xmlFIA-1; Thu, 19 Nov 2020 05:32:28 -0500
X-MC-Unique: lUJQlZyGMV-Esfq5xmlFIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CC70801B1F
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:32:27 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.193.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 088DA60854;
 Thu, 19 Nov 2020 10:32:25 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] i386: move hyperv_interface_id initialization to
 x86_cpu_realizefn()
Date: Thu, 19 Nov 2020 11:32:18 +0100
Message-Id: <20201119103221.1665171-3-vkuznets@redhat.com>
In-Reply-To: <20201119103221.1665171-1-vkuznets@redhat.com>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

As a preparation to expanding Hyper-V CPU features early, move
hyperv_interface_id initialization to x86_cpu_realizefn().

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c |  6 ++++++
 target/i386/cpu.h |  1 +
 target/i386/kvm.c | 18 ++++++++++++------
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2a6885753378..18a73ca4708b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6526,6 +6526,12 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
         memset(cpu->hyperv_vendor_id, 0, 12);
         memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
     }
+
+    /* 'Hv#1' interface identification*/
+    cpu->hyperv_interface_id[0] = 0x31237648;
+    cpu->hyperv_interface_id[1] = 0;
+    cpu->hyperv_interface_id[2] = 0;
+    cpu->hyperv_interface_id[3] = 0;
 }
 
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index be640bf45c29..1f30d642007c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1661,6 +1661,7 @@ struct X86CPU {
     bool hyperv_passthrough;
     OnOffAuto hyperv_no_nonarch_cs;
     uint32_t hyperv_vendor_id[3];
+    uint32_t hyperv_interface_id[4];
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 788a2cf2ec51..eb09766ec9b7 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1168,7 +1168,6 @@ static int hyperv_handle_properties(CPUState *cs,
     CPUX86State *env = &cpu->env;
     struct kvm_cpuid2 *cpuid;
     struct kvm_cpuid_entry2 *c;
-    uint32_t signature[3];
     uint32_t cpuid_i = 0;
     int r;
 
@@ -1212,6 +1211,14 @@ static int hyperv_handle_properties(CPUState *cs,
             cpu->hyperv_vendor_id[2] = c->edx;
         }
 
+        c = cpuid_find_entry(cpuid, HV_CPUID_INTERFACE, 0);
+        if (c) {
+            cpu->hyperv_interface_id[0] = c->eax;
+            cpu->hyperv_interface_id[1] = c->ebx;
+            cpu->hyperv_interface_id[2] = c->ecx;
+            cpu->hyperv_interface_id[3] = c->edx;
+        }
+
         c = cpuid_find_entry(cpuid, HV_CPUID_FEATURES, 0);
         if (c) {
             env->features[FEAT_HYPERV_EAX] = c->eax;
@@ -1294,11 +1301,10 @@ static int hyperv_handle_properties(CPUState *cs,
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_INTERFACE;
-    memcpy(signature, "Hv#1\0\0\0\0\0\0\0\0", 12);
-    c->eax = signature[0];
-    c->ebx = 0;
-    c->ecx = 0;
-    c->edx = 0;
+    c->eax = cpu->hyperv_interface_id[0];
+    c->ebx = cpu->hyperv_interface_id[1];
+    c->ecx = cpu->hyperv_interface_id[2];
+    c->edx = cpu->hyperv_interface_id[3];
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_VERSION;
-- 
2.26.2


