Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C8A38D08D
	for <lists+qemu-devel@lfdr.de>; Sat, 22 May 2021 00:08:30 +0200 (CEST)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkDJl-0004ej-Mw
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 18:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lkDI6-0003BO-Fw
 for qemu-devel@nongnu.org; Fri, 21 May 2021 18:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lkDI2-00010o-CJ
 for qemu-devel@nongnu.org; Fri, 21 May 2021 18:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621634801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d4/jvxtiWC6+1wQOxpqUkMe+JIzh3cY5tCr+EmYTbe8=;
 b=irD6ul4rbMR7qzperTCqMUVbqjI7NNLw9SA+bsQGgD2pmkLtW4ukU4jhKQwYJiVbB2vihY
 uhC2s/2gOzK+Jfg0tB126B/A58efuek/fhc4BuvgsswoyFxzUEfKL8qjmiNSQXNYn9Pprn
 /La+XUgyBM7eeU9o8cmmj+T/df6KNm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-w-H5FA8rOh-nD9RHhjugWA-1; Fri, 21 May 2021 18:06:39 -0400
X-MC-Unique: w-H5FA8rOh-nD9RHhjugWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F4AB801B12
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 22:06:38 +0000 (UTC)
Received: from localhost (ovpn-115-27.rdu2.redhat.com [10.10.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7009160FC2;
 Fri, 21 May 2021 22:06:38 +0000 (UTC)
Date: Fri, 21 May 2021 18:06:37 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 17/19] i386: HV_HYPERCALL_AVAILABLE privilege bit is
 always needed
Message-ID: <20210521220637.kg6g7lfvpwasnzez@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-18-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-18-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

On Thu, Apr 22, 2021 at 06:11:28PM +0200, Vitaly Kuznetsov wrote:
> According to TLFS, Hyper-V guest is supposed to check
> HV_HYPERCALL_AVAILABLE privilege bit before accessing
> HV_X64_MSR_GUEST_OS_ID/HV_X64_MSR_HYPERCALL MSRs but at least some
> Windows versions ignore that. As KVM is very permissive and allows
> accessing these MSRs unconditionally, no issue is observed. We may,
> however, want to tighten the checks eventually. Conforming to the
> spec is probably also a good idea.
> 
> Add HV_HYPERCALL_AVAILABLE to all 'leaf' features with no dependencies.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Are all VMs being created with HV_HYPERCALL_AVAILABLE unset,
today?

Wouldn't it be simpler to simply add a new
HYPERV_FEAT_HYPERCALL_AVAILABLE bit to hyperv_features, and
enabling it by default?

We don't necessarily need to make it configurable by the user,
but probably it would be a good idea to keep the bit unset by
default on older machine types.  Even if guests don't mind seeing
the bit changing under their feet, it would make it easier for
automated test cases that check for unexpected changes in raw
CPUID data.


> ---
>  target/i386/kvm/kvm.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 2c1a77f9b00f..d81451276cd8 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -835,6 +835,8 @@ static struct {
>      [HYPERV_FEAT_CRASH] = {
>          .desc = "crash MSRs (hv-crash)",
>          .flags = {
> +            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> +             .bits = HV_HYPERCALL_AVAILABLE},
>              {.func = HV_CPUID_FEATURES, .reg = R_EDX,
>               .bits = HV_GUEST_CRASH_MSR_AVAILABLE}
>          }
> @@ -843,28 +845,28 @@ static struct {
>          .desc = "reset MSR (hv-reset)",
>          .flags = {
>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> -             .bits = HV_RESET_AVAILABLE}
> +             .bits = HV_HYPERCALL_AVAILABLE | HV_RESET_AVAILABLE}
>          }
>      },
>      [HYPERV_FEAT_VPINDEX] = {
>          .desc = "VP_INDEX MSR (hv-vpindex)",
>          .flags = {
>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> -             .bits = HV_VP_INDEX_AVAILABLE}
> +             .bits = HV_HYPERCALL_AVAILABLE | HV_VP_INDEX_AVAILABLE}
>          }
>      },
>      [HYPERV_FEAT_RUNTIME] = {
>          .desc = "VP_RUNTIME MSR (hv-runtime)",
>          .flags = {
>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> -             .bits = HV_VP_RUNTIME_AVAILABLE}
> +             .bits = HV_HYPERCALL_AVAILABLE | HV_VP_RUNTIME_AVAILABLE}
>          }
>      },
>      [HYPERV_FEAT_SYNIC] = {
>          .desc = "synthetic interrupt controller (hv-synic)",
>          .flags = {
>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> -             .bits = HV_SYNIC_AVAILABLE}
> +             .bits = HV_HYPERCALL_AVAILABLE | HV_SYNIC_AVAILABLE}
>          }
>      },
>      [HYPERV_FEAT_STIMER] = {
> @@ -879,7 +881,7 @@ static struct {
>          .desc = "frequency MSRs (hv-frequencies)",
>          .flags = {
>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> -             .bits = HV_ACCESS_FREQUENCY_MSRS},
> +             .bits = HV_HYPERCALL_AVAILABLE | HV_ACCESS_FREQUENCY_MSRS},
>              {.func = HV_CPUID_FEATURES, .reg = R_EDX,
>               .bits = HV_FREQUENCY_MSRS_AVAILABLE}
>          }
> @@ -888,7 +890,8 @@ static struct {
>          .desc = "reenlightenment MSRs (hv-reenlightenment)",
>          .flags = {
>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
> -             .bits = HV_ACCESS_REENLIGHTENMENTS_CONTROL}
> +             .bits = HV_HYPERCALL_AVAILABLE |
> +             HV_ACCESS_REENLIGHTENMENTS_CONTROL}
>          }
>      },
>      [HYPERV_FEAT_TLBFLUSH] = {
> -- 
> 2.30.2
> 

-- 
Eduardo


