Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E70625DCCC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 17:06:38 +0200 (CEST)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEDIT-0002R8-8G
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 11:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED8c-0001eC-DI
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:56:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52329
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED8a-0007GE-C3
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:56:26 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-IbQlGEotPDq9gBsXDU4QFw-1; Fri, 04 Sep 2020 10:55:11 -0400
X-MC-Unique: IbQlGEotPDq9gBsXDU4QFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D6D81084D6D
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 14:55:10 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DF827E416;
 Fri,  4 Sep 2020 14:55:08 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 19/22] i386: prepare hyperv_expand_features() to be called
 at CPU feature expansion time
Date: Fri,  4 Sep 2020 16:54:28 +0200
Message-Id: <20200904145431.196885-20-vkuznets@redhat.com>
In-Reply-To: <20200904145431.196885-1-vkuznets@redhat.com>
References: <20200904145431.196885-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:12
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

If hyperv_expand_features() is called before vCPU is created, cs->kvm_state
is NULL. We can only do the expantion if system wide KVM_GET_SUPPORTED_HV_CPUID
is supported.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index b76d4a5a147b..c17e7db5e627 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -986,6 +986,10 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
     do_sys_ioctl =
         kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID) > 0;
 
+    if (!do_sys_ioctl && !cs->kvm_state) {
+        return NULL;
+    }
+
     /*
      * When the buffer is too small, KVM_GET_SUPPORTED_HV_CPUID fails with
      * -E2BIG, however, it doesn't report back the right size. Keep increasing
@@ -1023,6 +1027,10 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
     struct kvm_cpuid2 *cpuid;
     struct kvm_cpuid_entry2 *entry_feat, *entry_recomm;
 
+    if (!cs->kvm_state) {
+        return NULL;
+    }
+
     /* HV_CPUID_FEATURES, HV_CPUID_ENLIGHTMENT_INFO */
     cpuid = g_malloc0(sizeof(*cpuid) + 2 * sizeof(*cpuid->entries));
     cpuid->nent = 2;
@@ -1218,12 +1226,15 @@ static void hyperv_expand_features(CPUState *cs, Error **errp)
     if (!hyperv_enabled(cpu))
         return;
 
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV_CPUID) > 0) {
+    if (kvm_check_extension(kvm_state, KVM_CAP_HYPERV_CPUID) > 0) {
         cpuid = get_supported_hv_cpuid(cs);
     } else {
         cpuid = get_supported_hv_cpuid_legacy(cs);
     }
 
+    if (!cpuid)
+        return;
+
     if (cpu->hyperv_passthrough) {
         c = cpuid_find_entry(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, 0);
         if (c) {
-- 
2.25.4


