Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833A725DCA5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 16:59:54 +0200 (CEST)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEDBx-00084b-IK
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 10:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED83-0000U7-No
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED82-0007DC-2J
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599231349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUoqjAqzCkzOwJPI6RPWCQKNVsV4ET0FkbNM68Cuoyo=;
 b=FmQk2RPSjHD+VKPwTptkZDxKq1WrSFTPEBGJAmRXVeDmOa2YM3aTTQfFPjwaz5KwFND55O
 iRNZ57YpmNwtjMHvsYpygy4fwygh6rBGrs7ujd2crljmGqbvJSCH1VrckuCpiap9Ik3Prm
 ZlqybYG+YqCrkBYw4hl5QW+xyx1nEw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-DTdPiY_RM_qLf4M9ZS8ikA-1; Fri, 04 Sep 2020 10:54:41 -0400
X-MC-Unique: DTdPiY_RM_qLf4M9ZS8ikA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D74FF18BA285
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 14:54:40 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 645977A1F4;
 Fri,  4 Sep 2020 14:54:39 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 04/22] i386: move hyperv_interface_id initialization to
 x86_cpu_realizefn()
Date: Fri,  4 Sep 2020 16:54:13 +0200
Message-Id: <20200904145431.196885-5-vkuznets@redhat.com>
In-Reply-To: <20200904145431.196885-1-vkuznets@redhat.com>
References: <20200904145431.196885-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 06:46:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

As a preparation to expanding Hyper-V CPU features early, move
hyperv_interface_id initialization to x86_cpu_realizefn().

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c |  6 ++++++
 target/i386/cpu.h |  1 +
 target/i386/kvm.c | 18 ++++++++++++------
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 07e9da9e567e..16888125a30a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6638,6 +6638,12 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
     }
 
+    /* 'Hv#1' interface identification*/
+    cpu->hyperv_interface_id[0] = 0x31237648;
+    cpu->hyperv_interface_id[1] = 0;
+    cpu->hyperv_interface_id[2] = 0;
+    cpu->hyperv_interface_id[3] = 0;
+
     if (cpu->ucode_rev == 0) {
         /* The default is the same as KVM's.  */
         if (IS_AMD_CPU(env)) {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 903994818093..91edc54a268c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1660,6 +1660,7 @@ struct X86CPU {
     bool hyperv_passthrough;
     OnOffAuto hyperv_no_nonarch_cs;
     uint32_t hyperv_vendor_id[3];
+    uint32_t hyperv_interface_id[4];
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 47779c5e1efd..a36c65100cd0 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1188,7 +1188,6 @@ static int hyperv_handle_properties(CPUState *cs,
     CPUX86State *env = &cpu->env;
     struct kvm_cpuid2 *cpuid;
     struct kvm_cpuid_entry2 *c;
-    uint32_t signature[3];
     uint32_t cpuid_i = 0;
     int r;
 
@@ -1232,6 +1231,14 @@ static int hyperv_handle_properties(CPUState *cs,
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
@@ -1314,11 +1321,10 @@ static int hyperv_handle_properties(CPUState *cs,
 
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
2.25.4


