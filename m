Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044BC3684BA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:22:48 +0200 (CEST)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZc6J-0006e9-3S
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbvk-0003TQ-En
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:11:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbvc-000302-T7
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619107903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=enSgmchDiSsyk6O2fIM4ulnaU+mgxEZFvGR8kRYH8Tc=;
 b=Sqpav3RxZpqdEaLCHKMNWmcfrSocXhBw5FOrDOpVApJldbqs+tllB5rgvIEacAGyiiiEcu
 7gff62vjxDA4IA4f7hcC/7Y3j5bM8VjYMG5qg7dbx97MtPOgXcxp+1qtZRYYQELjh95aE/
 P+QnovMWfT7FHssW0IzogTU0IxUN0Dw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-pH4bKxcJOMGdGFS5yAdebw-1; Thu, 22 Apr 2021 12:11:41 -0400
X-MC-Unique: pH4bKxcJOMGdGFS5yAdebw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED11E814337
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:11:40 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BEB15B4A0;
 Thu, 22 Apr 2021 16:11:39 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/19] i386: invert hyperv_spinlock_attempts setting logic
 with hv_passthrough
Date: Thu, 22 Apr 2021 18:11:13 +0200
Message-Id: <20210422161130.652779-3-vkuznets@redhat.com>
In-Reply-To: <20210422161130.652779-1-vkuznets@redhat.com>
References: <20210422161130.652779-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no need to have this special case: like all other Hyper-V
enlightenments we can just use kernel's supplied value in hv_passthrough
mode.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ab073a5e9c44..afd173514da1 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1256,11 +1256,7 @@ static int hyperv_handle_properties(CPUState *cs,
         c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
         if (c) {
             env->features[FEAT_HV_RECOMM_EAX] = c->eax;
-
-            /* hv-spinlocks may have been overriden */
-            if (cpu->hyperv_spinlock_attempts != HYPERV_SPINLOCK_NEVER_NOTIFY) {
-                c->ebx = cpu->hyperv_spinlock_attempts;
-            }
+            cpu->hyperv_spinlock_attempts = c->ebx;
         }
         c = cpuid_find_entry(cpuid, HV_CPUID_NESTED_FEATURES, 0);
         if (c) {
-- 
2.30.2


