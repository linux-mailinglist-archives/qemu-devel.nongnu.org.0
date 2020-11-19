Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91002B9029
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:34:23 +0100 (CET)
Received: from localhost ([::1]:37202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhGg-0002Zk-MY
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfhEw-0000u3-Hr
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:32:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfhEu-0007Yh-Pg
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605781951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ccVsbNk2QdwM3pGNv4kZj49rkrzkM9UrTzWxML6Yezs=;
 b=Vy119d603FH4lQep71aqqXn36Ere5eCqxjeabx+tcfHsM0iZHQkzV9fybCQCbN1BVhVzFd
 7CwoVfrLVB8GqALhK15u0T0plmrdbLEQ8Ox3GAR8CQjGe8O56LOWLIEgwxb8qRCkk2Ex0e
 E2s6IZvRBkZwG26f+NQ658ijvI6uu/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-m8vPc7BlN3eZFz6yN1xzeQ-1; Thu, 19 Nov 2020 05:32:29 -0500
X-MC-Unique: m8vPc7BlN3eZFz6yN1xzeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F323A1005D54
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:32:28 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.193.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B76060854;
 Thu, 19 Nov 2020 10:32:27 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] i386: move hyperv_version_id initialization to
 x86_cpu_realizefn()
Date: Thu, 19 Nov 2020 11:32:19 +0100
Message-Id: <20201119103221.1665171-4-vkuznets@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
hyperv_version_id initialization to x86_cpu_realizefn().

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c |  4 ++++
 target/i386/cpu.h |  1 +
 target/i386/kvm.c | 14 ++++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 18a73ca4708b..9e182929d29d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6532,6 +6532,10 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
     cpu->hyperv_interface_id[1] = 0;
     cpu->hyperv_interface_id[2] = 0;
     cpu->hyperv_interface_id[3] = 0;
+
+    /* Hypervisor system identity */
+    cpu->hyperv_version_id[0] = 0x00001bbc;
+    cpu->hyperv_version_id[1] = 0x00060001;
 }
 
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1f30d642007c..913927356c55 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1662,6 +1662,7 @@ struct X86CPU {
     OnOffAuto hyperv_no_nonarch_cs;
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
+    uint32_t hyperv_version_id[4];
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index eb09766ec9b7..58a2528c6c41 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1219,6 +1219,14 @@ static int hyperv_handle_properties(CPUState *cs,
             cpu->hyperv_interface_id[3] = c->edx;
         }
 
+        c = cpuid_find_entry(cpuid, HV_CPUID_VERSION, 0);
+        if (c) {
+            cpu->hyperv_version_id[0] = c->eax;
+            cpu->hyperv_version_id[1] = c->ebx;
+            cpu->hyperv_version_id[2] = c->ecx;
+            cpu->hyperv_version_id[3] = c->edx;
+        }
+
         c = cpuid_find_entry(cpuid, HV_CPUID_FEATURES, 0);
         if (c) {
             env->features[FEAT_HYPERV_EAX] = c->eax;
@@ -1308,8 +1316,10 @@ static int hyperv_handle_properties(CPUState *cs,
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_VERSION;
-    c->eax = 0x00001bbc;
-    c->ebx = 0x00060001;
+    c->eax = cpu->hyperv_version_id[0];
+    c->ebx = cpu->hyperv_version_id[1];
+    c->ecx = cpu->hyperv_version_id[2];
+    c->edx = cpu->hyperv_version_id[3];
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_FEATURES;
-- 
2.26.2


