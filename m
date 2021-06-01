Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E03979E8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:18:04 +0200 (CEST)
Received: from localhost ([::1]:33464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8xn-00033O-Sf
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qV-0002Ay-Ao
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qT-0005fT-Go
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFg9dMi/XHaUmyCE1zJWb6DH07QDM9l3Lb8+5CUtIpQ=;
 b=Ek57D3fEbNRprjWMRKpF+6z/6g1sdF73feCrlThSwAzK15HTNMS90eW9V+E6sCNdZzbTsh
 izLwltNVC92qBp/NvhUQOiJA9oXIqnbxtjways25sZ2KpGWdf6TKbICtIGEaBYV/OBJlBf
 jW35w/5H44vGFzEhe/08JeL0SIm3Keg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-itljg9YxMZaMbmheJnAXCg-1; Tue, 01 Jun 2021 14:10:24 -0400
X-MC-Unique: itljg9YxMZaMbmheJnAXCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E60979EC3;
 Tue,  1 Jun 2021 18:10:23 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1059960CCC;
 Tue,  1 Jun 2021 18:10:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/24] i386: always fill Hyper-V CPUID feature leaves from
 X86CPU data
Date: Tue,  1 Jun 2021 14:10:00 -0400
Message-Id: <20210601181014.2568861-11-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

We have all the required data in X86CPU already and as we are about to
split hyperv_handle_properties() into hyperv_expand_features()/
hyperv_fill_cpuids() we can remove the blind copy. The functional change
is that QEMU won't pass CPUID leaves it doesn't currently know about
to the guest but arguably this is a good change.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210422161130.652779-4-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/kvm/kvm.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 7849e84e9a0..4cd4df223fc 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1208,9 +1208,6 @@ static int hyperv_handle_properties(CPUState *cs,
     }
 
     if (cpu->hyperv_passthrough) {
-        memcpy(cpuid_ent, &cpuid->entries[0],
-               cpuid->nent * sizeof(cpuid->entries[0]));
-
         c = cpuid_find_entry(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, 0);
         if (c) {
             cpu->hyperv_vendor_id[0] = c->ebx;
@@ -1310,12 +1307,6 @@ static int hyperv_handle_properties(CPUState *cs,
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
2.30.2


