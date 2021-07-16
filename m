Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829943CB716
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:01:52 +0200 (CEST)
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4MXP-00064O-A5
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m4MUe-0003TV-K8
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:59:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m4MUc-0004le-Hh
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626436737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UhQYb2x4NIX908cRk1SvJjhhUbKkvXuUfwDK6FTzTvM=;
 b=enf2/kDr/+zY1xzu/VBdkCCJSiHAlNoWXnp8CAj/hJWsikxAma4Um7iiJJb1EjiqXuAws5
 kUxZC41VJSXqZnhwNbVhAlhw6YsiJWkgj2/KeZaoEqoHIWQ1B9qHsIJdejSB7JxnnCsjL7
 /gGLc2fozCBP71fttnzXG5t3KrtvxE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-68SLks1aNA-2Zp2vvOuolA-1; Fri, 16 Jul 2021 07:58:56 -0400
X-MC-Unique: 68SLks1aNA-2Zp2vvOuolA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 641741018721;
 Fri, 16 Jul 2021 11:58:55 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49739604CD;
 Fri, 16 Jul 2021 11:58:53 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 1/2] i386: assert 'cs->kvm_state' is not null
Date: Fri, 16 Jul 2021 13:58:51 +0200
Message-Id: <20210716115852.418293-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reports potential NULL pointer dereference in
get_supported_hv_cpuid_legacy() when 'cs->kvm_state' is NULL. While
'cs->kvm_state' can indeed be NULL in hv_cpuid_get_host(),
kvm_hyperv_expand_features() makes sure that it only happens when
KVM_CAP_SYS_HYPERV_CPUID is supported and KVM_CAP_SYS_HYPERV_CPUID
implies KVM_CAP_HYPERV_CPUID so get_supported_hv_cpuid_legacy() is
never really called. Add asserts to strengthen the protection against
broken KVM behavior.

Coverity: CID 1458243
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 59ed8327ac13..e69abe48e3f8 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -974,6 +974,12 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
     do_sys_ioctl =
         kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID) > 0;
 
+    /*
+     * Non-empty KVM context is needed when KVM_CAP_SYS_HYPERV_CPUID is
+     * unsupported, kvm_hyperv_expand_features() checks for that.
+     */
+    assert(do_sys_ioctl || cs->kvm_state);
+
     /*
      * When the buffer is too small, KVM_GET_SUPPORTED_HV_CPUID fails with
      * -E2BIG, however, it doesn't report back the right size. Keep increasing
@@ -1105,6 +1111,14 @@ static uint32_t hv_cpuid_get_host(CPUState *cs, uint32_t func, int reg)
         if (kvm_check_extension(kvm_state, KVM_CAP_HYPERV_CPUID) > 0) {
             cpuid = get_supported_hv_cpuid(cs);
         } else {
+            /*
+             * 'cs->kvm_state' may be NULL when Hyper-V features are expanded
+             * before KVM context is created but this is only done when
+             * KVM_CAP_SYS_HYPERV_CPUID is supported and it implies
+             * KVM_CAP_HYPERV_CPUID.
+             */
+            assert(cs->kvm_state);
+
             cpuid = get_supported_hv_cpuid_legacy(cs);
         }
         hv_cpuid_cache = cpuid;
-- 
2.31.1


