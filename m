Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1871725DCAC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 17:01:53 +0200 (CEST)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEDDs-0002ZE-16
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 11:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED8H-0000t1-AA
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:56:05 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26131
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED8E-0007Dt-6Q
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:56:05 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-75y9-7LAPZ2v8dDOmMd64w-1; Fri, 04 Sep 2020 10:54:49 -0400
X-MC-Unique: 75y9-7LAPZ2v8dDOmMd64w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C189B8D3289
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 14:54:48 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3326B7A1F4;
 Fri,  4 Sep 2020 14:54:47 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 08/22] i386: invert hyperv_spinlock_attempts setting logic
 with hv_passthrough
Date: Fri,  4 Sep 2020 16:54:17 +0200
Message-Id: <20200904145431.196885-9-vkuznets@redhat.com>
In-Reply-To: <20200904145431.196885-1-vkuznets@redhat.com>
References: <20200904145431.196885-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:57:33
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

There is no need to have this special case: like all other Hyper-V
enlightenments we can just use kernel's supplied value in hv_passthrough
mode.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 1cb5592d4f7d..96ac719adca1 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1265,11 +1265,7 @@ static int hyperv_handle_properties(CPUState *cs,
         c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
         if (c) {
             env->features[FEAT_HV_RECOMM_EAX] = c->eax;
-
-            /* hv-spinlocks may have been overriden */
-            if (cpu->hyperv_spinlock_attempts != HYPERV_SPINLOCK_NEVER_RETRY) {
-                c->ebx = cpu->hyperv_spinlock_attempts;
-            }
+            cpu->hyperv_spinlock_attempts = c->ebx;
         }
         c = cpuid_find_entry(cpuid, HV_CPUID_NESTED_FEATURES, 0);
         if (c) {
-- 
2.25.4


