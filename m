Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF0F316BDF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:58:31 +0100 (CET)
Received: from localhost ([::1]:48554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9sow-0006yz-RA
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sYW-0007LD-7t
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:41:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sYP-0008VM-Uv
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612975282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OyGuZSwO/lx4FxtJ5gDgP/LIZ375ifM28YqMTyS9PtU=;
 b=TC8KEvlUQIrHlSs+fLj+dn1KF1H9bb0eQhVij2JQ9QPaqauDd+pyml2uBhN86z0/P4FvDR
 7XoeWR9gs7+n4KJ+SiA8edinfH22vXvRIWuGtbA5ON3MRPrUVEJLDHfRC0ErDd5bUxwmVc
 jf0oTnNvwVj7YOIotqNzEdmZuHAEp8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-zpErjX73P4ac6u7unzZUaw-1; Wed, 10 Feb 2021 11:41:21 -0500
X-MC-Unique: zpErjX73P4ac6u7unzZUaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 371D71005501
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:41:20 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A34005D9D0;
 Wed, 10 Feb 2021 16:41:18 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v4 18/21] i386: be more picky about implicit 'hv-evmcs'
 enablement
Date: Wed, 10 Feb 2021 17:40:30 +0100
Message-Id: <20210210164033.607612-19-vkuznets@redhat.com>
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

Enlightened VMCS is the only (currently implemented in QEMU) Hyper-V
feature with hardware dependencies, it pairs with Intel VMX. It doesn't
seem right to enable this feature when VMX wasn't enabled in the guest and
when it wasn't explicitly requested on the command line. Currently, the
only possible scenario is 'hv-passthrough' which will enable 'hv-evmcs'
when the host supports it, regardless of guest VMX exposure. The upcoming
'hv-default' should also avoid enabling 'hv-evmcs' without VMX.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index fca088d4d3b5..480908b2463a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1315,8 +1315,17 @@ void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TLBFLUSH, errp)) {
         return;
     }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_EVMCS, errp)) {
-        return;
+    /*
+     * 'hv-evmcs' is not enabled when it wasn't explicitly requested and guest
+     * CPU lacks VMX.
+     */
+    if (cpu_has_vmx(&cpu->env) ||
+        (cpu->hyperv_features_on & BIT(HYPERV_FEAT_EVMCS))) {
+        if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_EVMCS, errp)) {
+            return;
+        }
+    } else {
+        cpu->hyperv_features &= ~BIT(HYPERV_FEAT_EVMCS);
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_IPI, errp)) {
         return;
-- 
2.29.2


