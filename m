Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5FA3703F6
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 01:17:33 +0200 (CEST)
Received: from localhost ([::1]:37038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lccO4-0003gt-5n
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 19:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lccMm-0003Gk-3b
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 19:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lccMe-00023Q-15
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 19:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619824561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wMnh8lIj2q+/1n++dI7QXzK9j3gEjj/zd+pVGGUbiAE=;
 b=DM3aKQfOV7DVyTNz6aN56OyGkt3cnopSQJVHLw7mzJnGWOxdYegbKnkNi+rXpHGnIhjFJk
 PU7GyaqaUNh4J2W4w/TYDQ3RYIXPlP5Ym1hyMTEyhQ6KJk66aEukZDVDlxI5hGd/nhVmh8
 QXY5cyv8xhm9cWjsm+WQfaKUm+OejJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-mLpNu8N0PNaIZrT-jcPG1Q-1; Fri, 30 Apr 2021 19:15:59 -0400
X-MC-Unique: mLpNu8N0PNaIZrT-jcPG1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D57E58015BA
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 23:15:58 +0000 (UTC)
Received: from localhost (ovpn-115-66.phx2.redhat.com [10.3.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 953185C1C4;
 Fri, 30 Apr 2021 23:15:58 +0000 (UTC)
Date: Fri, 30 Apr 2021 19:15:57 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 03/19] i386: always fill Hyper-V CPUID feature leaves
 from X86CPU data
Message-ID: <20210430231557.wm6dgl6pmi45ofr5@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-4-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-4-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 06:11:14PM +0200, Vitaly Kuznetsov wrote:
> We have all the required data in X86CPU already and as we are about to
> split hyperv_handle_properties() into hyperv_expand_features()/
> hyperv_fill_cpuids() we can remove the blind copy. The functional change
> is that QEMU won't pass CPUID leaves it doesn't currently know about
> to the guest but arguably this is a good change.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

This makes hv-passthrough less useful for debugging and
development, but safer for using in production.  I assume we want
to eventually make hv-passthrough supported in production when
live migration support isn't required.

I'll trust your judgement here and assume this is really a good
change, but maybe this should be documented more explicitly in
the hv-passthrough section at docs/hyperv.txt?

Anyway:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> ---
>  target/i386/kvm/kvm.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index afd173514da1..7c751185491f 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1207,9 +1207,6 @@ static int hyperv_handle_properties(CPUState *cs,
>      }
>  
>      if (cpu->hyperv_passthrough) {
> -        memcpy(cpuid_ent, &cpuid->entries[0],
> -               cpuid->nent * sizeof(cpuid->entries[0]));
> -
>          c = cpuid_find_entry(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, 0);
>          if (c) {
>              cpu->hyperv_vendor_id[0] = c->ebx;
> @@ -1309,12 +1306,6 @@ static int hyperv_handle_properties(CPUState *cs,
>          goto free;
>      }
>  
> -    if (cpu->hyperv_passthrough) {
> -        /* We already copied all feature words from KVM as is */
> -        r = cpuid->nent;
> -        goto free;
> -    }
> -
>      c = &cpuid_ent[cpuid_i++];
>      c->function = HV_CPUID_VENDOR_AND_MAX_FUNCTIONS;
>      c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
> -- 
> 2.30.2
> 

-- 
Eduardo


