Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F074B32801E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:57:29 +0100 (CET)
Received: from localhost ([::1]:55956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGj3A-0006G2-Ki
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGix9-0006Le-QI
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGix8-0008Bb-7t
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614606673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=STDYG2C0r5ezYHC953mhUFGQmj+wVZ38k9FuWXE1Uco=;
 b=FMSoFWeRSwDlUsfFsohQp9b8W+oY4yWJ/5tLQpj+c71T8F/L0JwP2XOhHcP7fsijlryxE6
 Ax/ifPrWd3zEUuvUv+oZJVglTWh/M7bNmX1bCYBesLjsoIY1SgZg5Ur9iRw4PjOIWNsD8O
 HCcWlFiU/XB1EAZBkDqyqNH1nJTjxu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-C6XmRZc1NmezXxoKJsWAmg-1; Mon, 01 Mar 2021 08:51:12 -0500
X-MC-Unique: C6XmRZc1NmezXxoKJsWAmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17A7B8030CC
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 13:51:11 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76E0A5D735;
 Mon,  1 Mar 2021 13:51:09 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/17] i386: invert hyperv_spinlock_attempts setting logic
 with hv_passthrough
Date: Mon,  1 Mar 2021 14:50:48 +0100
Message-Id: <20210301135103.306003-3-vkuznets@redhat.com>
In-Reply-To: <20210301135103.306003-1-vkuznets@redhat.com>
References: <20210301135103.306003-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 8e9ae7522582..3c1202333d9d 100644
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
2.29.2


