Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70512888A8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 14:29:05 +0200 (CEST)
Received: from localhost ([::1]:59406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQrWC-00009Y-Iu
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 08:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kQrMf-0008KN-3s
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 08:19:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kQrMX-0007wG-EJ
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 08:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602245943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sSFopokYikvCH7iKBWMAWgY/bdhTJdC0gSqi/NFL5wA=;
 b=TLNeXTCjJNDkv8jT+xMBcBs9FCDMaZXxMHiki+BHWIwoDSl3VbdAh++PxrQqyvyB58Sdx6
 hHC7IQBblhQG1bfVGwMHYep2pVprWq5vyiP05nmU7eQ6Mmyq6Aae/2cmTpefbG1Tz0ywJZ
 CesrMts0XrknIs8yHRuYoF75ELhByqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-UOWsyBTENUqztXkJAsPV2Q-1; Fri, 09 Oct 2020 08:19:01 -0400
X-MC-Unique: UOWsyBTENUqztXkJAsPV2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CD6F196C90F
 for <qemu-devel@nongnu.org>; Fri,  9 Oct 2020 12:19:00 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3AFD5C1BB;
 Fri,  9 Oct 2020 12:18:58 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v3 07/23] i386: move hyperv_limits initialization to
 x86_cpu_realizefn()
Date: Fri,  9 Oct 2020 14:18:26 +0200
Message-Id: <20201009121842.1938010-8-vkuznets@redhat.com>
In-Reply-To: <20201009121842.1938010-1-vkuznets@redhat.com>
References: <20201009121842.1938010-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:40
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
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As a preparation to expanding Hyper-V CPU features early, move
hyperv_limits initialization to x86_cpu_realizefn().

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c |  5 +++++
 target/i386/cpu.h |  1 +
 target/i386/kvm.c | 13 ++++++++++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a8992b0c1c75..45644f063947 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6517,6 +6517,11 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
     /* Hypervisor system identity */
     cpu->hyperv_version_id[0] = 0x00001bbc;
     cpu->hyperv_version_id[1] = 0x00060001;
+
+    /* Hypervisor implementation limits */
+    cpu->hyperv_limits[0] = 64;
+    cpu->hyperv_limits[1] = 0;
+    cpu->hyperv_limits[2] = 0;
 }
 
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index da1fdfd7a9fd..4a4f88f24d78 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1663,6 +1663,7 @@ struct X86CPU {
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
     uint32_t hyperv_version_id[4];
+    uint32_t hyperv_limits[3];
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index cce07f412d2f..d2fee220d653 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1238,6 +1238,15 @@ static int hyperv_handle_properties(CPUState *cs,
             env->features[FEAT_HYPERV_EBX] = c->ebx;
             env->features[FEAT_HYPERV_EDX] = c->edx;
         }
+
+        c = cpuid_find_entry(cpuid, HV_CPUID_IMPLEMENT_LIMITS, 0);
+        if (c) {
+            cpu->hv_max_vps = c->eax;
+            cpu->hyperv_limits[0] = c->ebx;
+            cpu->hyperv_limits[1] = c->ecx;
+            cpu->hyperv_limits[2] = c->edx;
+        }
+
         c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
         if (c) {
             env->features[FEAT_HV_RECOMM_EAX] = c->eax;
@@ -1340,7 +1349,9 @@ static int hyperv_handle_properties(CPUState *cs,
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_IMPLEMENT_LIMITS;
     c->eax = cpu->hv_max_vps;
-    c->ebx = 0x40;
+    c->ebx = cpu->hyperv_limits[0];
+    c->ecx = cpu->hyperv_limits[1];
+    c->edx = cpu->hyperv_limits[2];
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
         __u32 function;
-- 
2.25.4


