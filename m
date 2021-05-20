Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E71338B80A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 22:03:51 +0200 (CEST)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljotZ-000095-N9
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 16:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljorc-0007T5-RC
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:01:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ljora-0006LY-2z
 for qemu-devel@nongnu.org; Thu, 20 May 2021 16:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621540905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UJ+66Iw4tL9JhWb46LoxCLoeiFSaCuDLy9K18agb7OI=;
 b=KOiSoSgDKJvnPRCj4+T9i+5vYUbihXTNJL6CRp8IDo19awMF0lAlTNnn0+X4NqeNdUvuG5
 rqs4VzcZNjNC+xAARepkZ/LrOAuxCP/pRxLxRrwnBZdubYVNn0MN9Q6fXcW3M9EX2teiPT
 wzduUe6MI2jPdUfiXyiSSbzKw6DlcSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-jFQBrd6SMhiC9dwM2s6cAQ-1; Thu, 20 May 2021 16:01:43 -0400
X-MC-Unique: jFQBrd6SMhiC9dwM2s6cAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03DDB106BB24
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 20:01:43 +0000 (UTC)
Received: from localhost (ovpn-115-27.rdu2.redhat.com [10.10.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99B6710013C1;
 Thu, 20 May 2021 20:01:42 +0000 (UTC)
Date: Thu, 20 May 2021 16:01:41 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 06/19] i386: introduce hv_cpuid_get_host()
Message-ID: <20210520200141.w7zxt4e2dtephpdq@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-7-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-7-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

On Thu, Apr 22, 2021 at 06:11:17PM +0200, Vitaly Kuznetsov wrote:
> As a preparation to implementing hv_cpuid_cache intro introduce
> hv_cpuid_get_host(). No functional change intended.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 102 +++++++++++++++++++++++-------------------
>  1 file changed, 57 insertions(+), 45 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index ba093dba4d23..7aeb704b016e 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1107,6 +1107,19 @@ static int hv_cpuid_get_fw(struct kvm_cpuid2 *cpuid, int fw, uint32_t *r)
>      return 0;
>  }
>  
> +static uint32_t hv_cpuid_get_host(struct kvm_cpuid2 *cpuid, uint32_t func,
> +                                  int reg)
> +{
> +    struct kvm_cpuid_entry2 *entry;
> +
> +    entry = cpuid_find_entry(cpuid, func, 0);
> +    if (!entry) {
> +        return 0;

One possible difference here is that leaves not supported by the
host will now be zeroed out.

...which I expected to be the correct behavior of hv-passthrough,
so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>


> +    }
> +
> +    return cpuid_entry_get_reg(entry, reg);
> +}
> +
>  static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
>  {
>      uint32_t r, fw, bits;
> @@ -1203,7 +1216,7 @@ static int hyperv_handle_properties(CPUState *cs,
>  {
>      X86CPU *cpu = X86_CPU(cs);
>      struct kvm_cpuid2 *cpuid;
> -    struct kvm_cpuid_entry2 *c, *c2;
> +    struct kvm_cpuid_entry2 *c;
>      uint32_t cpuid_i = 0;
>      int r;
>  
> @@ -1235,46 +1248,47 @@ static int hyperv_handle_properties(CPUState *cs,
>      }
>  
>      if (cpu->hyperv_passthrough) {
> -        c = cpuid_find_entry(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, 0);
> -        if (c) {
> -            cpu->hyperv_vendor_id[0] = c->ebx;
> -            cpu->hyperv_vendor_id[1] = c->ecx;
> -            cpu->hyperv_vendor_id[2] = c->edx;
> -            cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
> -                                           sizeof(cpu->hyperv_vendor_id) + 1);
> -            memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
> -                   sizeof(cpu->hyperv_vendor_id));
> -            cpu->hyperv_vendor[sizeof(cpu->hyperv_vendor_id)] = 0;
> -        }
> -
> -        c = cpuid_find_entry(cpuid, HV_CPUID_INTERFACE, 0);
> -        if (c) {
> -            cpu->hyperv_interface_id[0] = c->eax;
> -            cpu->hyperv_interface_id[1] = c->ebx;
> -            cpu->hyperv_interface_id[2] = c->ecx;
> -            cpu->hyperv_interface_id[3] = c->edx;
> -        }
> -
> -        c = cpuid_find_entry(cpuid, HV_CPUID_VERSION, 0);
> -        if (c) {
> -            cpu->hyperv_version_id[0] = c->eax;
> -            cpu->hyperv_version_id[1] = c->ebx;
> -            cpu->hyperv_version_id[2] = c->ecx;
> -            cpu->hyperv_version_id[3] = c->edx;
> -        }
> -
> -        c = cpuid_find_entry(cpuid, HV_CPUID_IMPLEMENT_LIMITS, 0);
> -        if (c) {
> -            cpu->hv_max_vps = c->eax;
> -            cpu->hyperv_limits[0] = c->ebx;
> -            cpu->hyperv_limits[1] = c->ecx;
> -            cpu->hyperv_limits[2] = c->edx;
> -        }
> -
> -        c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
> -        if (c) {
> -            cpu->hyperv_spinlock_attempts = c->ebx;
> -        }
> +        cpu->hyperv_vendor_id[0] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
> +        cpu->hyperv_vendor_id[1] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_ECX);
> +        cpu->hyperv_vendor_id[2] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EDX);
> +        cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
> +                                       sizeof(cpu->hyperv_vendor_id) + 1);
> +        memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
> +               sizeof(cpu->hyperv_vendor_id));
> +        cpu->hyperv_vendor[sizeof(cpu->hyperv_vendor_id)] = 0;
> +
> +        cpu->hyperv_interface_id[0] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_EAX);
> +        cpu->hyperv_interface_id[1] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_EBX);
> +        cpu->hyperv_interface_id[2] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_ECX);
> +        cpu->hyperv_interface_id[3] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_EDX);
> +
> +        cpu->hyperv_version_id[0] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_EAX);
> +        cpu->hyperv_version_id[1] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_EBX);
> +        cpu->hyperv_version_id[2] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_ECX);
> +        cpu->hyperv_version_id[3] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_EDX);
> +
> +        cpu->hv_max_vps = hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS,
> +                                            R_EAX);
> +        cpu->hyperv_limits[0] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS, R_EBX);
> +        cpu->hyperv_limits[1] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS, R_ECX);
> +        cpu->hyperv_limits[2] =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS, R_EDX);
> +
> +        cpu->hyperv_spinlock_attempts =
> +            hv_cpuid_get_host(cpuid, HV_CPUID_ENLIGHTMENT_INFO, R_EBX);
>      }
>  
>      /* Features */
> @@ -1348,10 +1362,8 @@ static int hyperv_handle_properties(CPUState *cs,
>      if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
>          c->eax |= HV_NO_NONARCH_CORESHARING;
>      } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
> -        c2 = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
> -        if (c2) {
> -            c->eax |= c2->eax & HV_NO_NONARCH_CORESHARING;
> -        }
> +        c->eax |= hv_cpuid_get_host(cpuid, HV_CPUID_ENLIGHTMENT_INFO, R_EAX) &
> +            HV_NO_NONARCH_CORESHARING;
>      }
>  
>      c = &cpuid_ent[cpuid_i++];
> -- 
> 2.30.2
> 

-- 
Eduardo


