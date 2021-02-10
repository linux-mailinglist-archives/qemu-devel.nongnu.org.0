Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201F316B98
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:47:25 +0100 (CET)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9seA-0003yY-7L
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sXs-000729-9U
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:40:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sXn-0008KA-R2
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612975247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ee3IZXj1PsPCi9G25ei8tWCodyL6T+WK4xsjb7cw7aQ=;
 b=WEZjaT5VFgOhFO/5Boc6g3N4oRgkMcbscM6R/zL+ucZDCh3jzCaBkFPyHgvGQJHNjLqc0+
 rJCtLgpQxboqSytuiK/Q3+ZlZUSDI4M0BtOGA6FbXwSx1Yjxl4AvOyua3hskGATMZTG7UN
 7KhjP7bvEHG/bIu8mRYp98S+E1NJY7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-sJOSZeWQP5m6nK402zfA_g-1; Wed, 10 Feb 2021 11:40:45 -0500
X-MC-Unique: sJOSZeWQP5m6nK402zfA_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69B48107ACE8
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:40:44 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 987FF5D9D0;
 Wed, 10 Feb 2021 16:40:42 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v4 03/21] i386: always fill Hyper-V CPUID feature leaves from
 X86CPU data
Date: Wed, 10 Feb 2021 17:40:15 +0100
Message-Id: <20210210164033.607612-4-vkuznets@redhat.com>
In-Reply-To: <20210210164033.607612-1-vkuznets@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have all the required data in X86CPU already and as we are about to
split hyperv_handle_properties() into hyperv_expand_features()/
hyperv_fill_cpuids() we can remove the blind copy. The functional change
is that QEMU won't pass CPUID leaves it doesn't currently know about
to the guest but arguably this is a good change.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 211efbd13b49..ba285a364792 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1206,9 +1206,6 @@ static int hyperv_handle_properties(CPUState *cs,
     }
 
     if (cpu->hyperv_passthrough) {
-        memcpy(cpuid_ent, &cpuid->entries[0],
-               cpuid->nent * sizeof(cpuid->entries[0]));
-
         c = cpuid_find_entry(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, 0);
         if (c) {
             cpu->hyperv_vendor_id[0] = c->ebx;
@@ -1307,12 +1304,6 @@ static int hyperv_handle_properties(CPUState *cs,
         goto free;
     }
 
-    if (cpu->hyperv_passthrough) {
-        /* We already copied all feature words from KVM as is */
-        r = cpuid->nent;
-        goto free;
-    }
-
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_VENDOR_AND_MAX_FUNCTIONS;
     c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
-- 
2.29.2


