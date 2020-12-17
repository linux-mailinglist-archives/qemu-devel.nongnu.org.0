Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0B2DD8C8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:54:38 +0100 (CET)
Received: from localhost ([::1]:52320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyQ9-0006tt-Hx
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIW-0006NQ-1L
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIQ-0001yJ-TH
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03ZxzwqJxQpWkWOLxZqE3qDFyTd9lSnbCeEHtpFjpOM=;
 b=h9siUYQ0kOjcVRZFNWGeU1QlVuiOCXHM7kn2Db1aVMmVIS/6PeOwm+bMsK4yQqb754yooT
 MSlLMwpGOGUcTpABYmQCPvbyVGALQTcWUTkoaaxYcZI0V8gBKdoFogpYbM5WISlBwNEPv/
 6NvrxWi8mvSJ0GShQHOeZClC8nTJQS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-JGgylrl-OIW53hL2NfYwPQ-1; Thu, 17 Dec 2020 13:46:35 -0500
X-MC-Unique: JGgylrl-OIW53hL2NfYwPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF0CC800D53;
 Thu, 17 Dec 2020 18:46:33 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 854751A353;
 Thu, 17 Dec 2020 18:46:33 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 09/17] i386: move hyperv_version_id initialization to
 x86_cpu_realizefn()
Date: Thu, 17 Dec 2020 13:46:12 -0500
Message-Id: <20201217184620.3945917-10-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

As a preparation to expanding Hyper-V CPU features early, move
hyperv_version_id initialization to x86_cpu_realizefn().

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20201119103221.1665171-4-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h     |  1 +
 target/i386/cpu.c     |  4 ++++
 target/i386/kvm/kvm.c | 14 ++++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index fd29afebc9..adce57dc78 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1666,6 +1666,7 @@ struct X86CPU {
     OnOffAuto hyperv_no_nonarch_cs;
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
+    uint32_t hyperv_version_id[4];
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ab10c0225d..6c5b0fef79 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6567,6 +6567,10 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
     cpu->hyperv_interface_id[1] = 0;
     cpu->hyperv_interface_id[2] = 0;
     cpu->hyperv_interface_id[3] = 0;
+
+    /* Hypervisor system identity */
+    cpu->hyperv_version_id[0] = 0x00001bbc;
+    cpu->hyperv_version_id[1] = 0x00060001;
 }
 
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d3aa7ca281..db2069406d 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1222,6 +1222,14 @@ static int hyperv_handle_properties(CPUState *cs,
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
@@ -1311,8 +1319,10 @@ static int hyperv_handle_properties(CPUState *cs,
 
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
2.28.0


