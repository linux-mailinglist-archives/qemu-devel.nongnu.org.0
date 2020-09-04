Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D525DCAA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 17:00:44 +0200 (CEST)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEDCl-0000xx-2a
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 11:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED8I-0000vk-Bj
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:56:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39306
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED8E-0007Du-5v
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:56:06 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-JJKWu44JMwyMKWi8R7gmKA-1; Fri, 04 Sep 2020 10:54:51 -0400
X-MC-Unique: JJKWu44JMwyMKWi8R7gmKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 822D31084D62
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 14:54:50 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25D3A7E416;
 Fri,  4 Sep 2020 14:54:48 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 09/22] i386: add reserved FEAT_HYPERV_ECX CPUID leaf
Date: Fri,  4 Sep 2020 16:54:18 +0200
Message-Id: <20200904145431.196885-10-vkuznets@redhat.com>
In-Reply-To: <20200904145431.196885-1-vkuznets@redhat.com>
References: <20200904145431.196885-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:58:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

As a preparation to expanding Hyper-V CPU features early, add
reserved FEAT_HYPERV_ECX CPUID leaf.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 target/i386/cpu.h | 1 +
 target/i386/kvm.c | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ef3c672cf415..70588571ccb1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -974,6 +974,11 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .cpuid = { .eax = 0x40000003, .reg = R_EBX, },
     },
+    [FEAT_HYPERV_ECX] = {
+        .type = CPUID_FEATURE_WORD,
+        /* reserved */
+        .cpuid = { .eax = 0x40000003, .reg = R_ECX, },
+    },
     [FEAT_HYPERV_EDX] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 095d0bf75493..39e0e89aa41f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -521,6 +521,7 @@ typedef enum FeatureWord {
     FEAT_KVM_HINTS,     /* CPUID[4000_0001].EDX */
     FEAT_HYPERV_EAX,    /* CPUID[4000_0003].EAX */
     FEAT_HYPERV_EBX,    /* CPUID[4000_0003].EBX */
+    FEAT_HYPERV_ECX,    /* CPUID[4000_0003].ECX */
     FEAT_HYPERV_EDX,    /* CPUID[4000_0003].EDX */
     FEAT_HV_RECOMM_EAX, /* CPUID[4000_0004].EAX */
     FEAT_HV_NESTED_EAX, /* CPUID[4000_000A].EAX */
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 96ac719adca1..259be2d514dd 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1251,6 +1251,7 @@ static int hyperv_handle_properties(CPUState *cs,
         if (c) {
             env->features[FEAT_HYPERV_EAX] = c->eax;
             env->features[FEAT_HYPERV_EBX] = c->ebx;
+            env->features[FEAT_HYPERV_ECX] = c->ecx;
             env->features[FEAT_HYPERV_EDX] = c->edx;
         }
 
@@ -1350,6 +1351,7 @@ static int hyperv_handle_properties(CPUState *cs,
     c->function = HV_CPUID_FEATURES;
     c->eax = env->features[FEAT_HYPERV_EAX];
     c->ebx = env->features[FEAT_HYPERV_EBX];
+    c->ecx = env->features[FEAT_HYPERV_ECX];
     c->edx = env->features[FEAT_HYPERV_EDX];
 
     c = &cpuid_ent[cpuid_i++];
-- 
2.25.4


