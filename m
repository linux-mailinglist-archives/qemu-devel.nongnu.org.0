Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD8551640C
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 13:20:28 +0200 (CEST)
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl7cp-0004zt-01
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 07:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1nl7bj-00047W-If
 for qemu-devel@nongnu.org; Sun, 01 May 2022 07:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1nl7bd-0003hL-Et
 for qemu-devel@nongnu.org; Sun, 01 May 2022 07:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651403952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=da45utcQpgUuFvOkRrzVXw+Fp7+C4yXjrTQj9UzNiJI=;
 b=TmnnY+10e+8DVBA8MovtYte1/C9QkL/SMJvMHGH1w/auIRpJCO5KhoaBH6x0fM/7J0n3RK
 ze8e1pk6kkxxOWWK3rDFUntvKKAM9EgricGe+FASbuY6pwwzAr1Npdu/pnbEItvzFXp1JN
 efYAmlaK4RyyDZws1Im8elt1GezaFcU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-ElcVdCVtMISWMqtEGmM3MA-1; Sun, 01 May 2022 07:18:05 -0400
X-MC-Unique: ElcVdCVtMISWMqtEGmM3MA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42F888002B2;
 Sun,  1 May 2022 11:18:05 +0000 (UTC)
Received: from starship (unknown [10.40.192.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4542A40CFD01;
 Sun,  1 May 2022 11:18:04 +0000 (UTC)
Message-ID: <799a4b04a6edda4956617bea677e6cb50df7dd4c.camel@redhat.com>
Subject: Re: [PATCH] target/i386: do not consult nonexistent host leaves
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Sun, 01 May 2022 14:18:03 +0300
In-Reply-To: <20220429192614.362579-1-pbonzini@redhat.com>
References: <20220429192614.362579-1-pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-04-29 at 21:26 +0200, Paolo Bonzini wrote:
> When cache_info_passthrough is requested, QEMU passes the host values
> of the cache information CPUID leaves down to the guest.  However,
> it blindly assumes that the CPUID leaf exists on the host, and this
> cannot be guaranteed: for example, KVM has recently started to
> synthesize AMD leaves up to 0x80000021 in order to provide accurate
> CPU bug information to guests.
> 
> Querying a nonexistent host leaf fills the output arguments of
> host_cpuid with data that (albeit deterministic) is nonsensical
> as cache information, namely the data in the highest Intel CPUID
> leaf.  If said highest leaf is not ECX-dependent, this can even
> cause an infinite loop when kvm_arch_init_vcpu prepares the input
> to KVM_SET_CPUID2.  The infinite loop is only terminated by an
> abort() when the array gets full.
> 
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/cpu.c | 41 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 99343be926..c5461f7c0b 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5022,6 +5022,37 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
>      return r;
>  }
>  
> +static void x86_cpu_get_cache_cpuid(uint32_t func, uint32_t index,
> +                                    uint32_t *eax, uint32_t *ebx,
> +                                    uint32_t *ecx, uint32_t *edx)
> +{
> +    uint32_t level, unused;
> +
> +    /* Only return valid host leaves.  */
> +    switch (func) {
> +    case 2:
> +    case 4:
> +        host_cpuid(0, 0, &level, &unused, &unused, &unused);
> +        break;
> +    case 0x80000005:
> +    case 0x80000006:
> +    case 0x8000001d:
> +        host_cpuid(0x80000000, 0, &level, &unused, &unused, &unused);
> +        break;
> +    default:
> +        return;
> +    }
> +
> +    if (func > level) {
> +        *eax = 0;
> +        *ebx = 0;
> +        *ecx = 0;
> +        *edx = 0;
> +    } else {
> +        host_cpuid(func, index, eax, ebx, ecx, edx);
> +    }
> +}
> +
>  /*
>   * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
>   */
> @@ -5280,7 +5311,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>      case 2:
>          /* cache info: needed for Pentium Pro compatibility */
>          if (cpu->cache_info_passthrough) {
> -            host_cpuid(index, 0, eax, ebx, ecx, edx);
> +            x86_cpu_get_cache_cpuid(index, 0, eax, ebx, ecx, edx);
>              break;
>          } else if (cpu->vendor_cpuid_only && IS_AMD_CPU(env)) {
>              *eax = *ebx = *ecx = *edx = 0;
> @@ -5300,7 +5331,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>      case 4:
>          /* cache info: needed for Core compatibility */
>          if (cpu->cache_info_passthrough) {
> -            host_cpuid(index, count, eax, ebx, ecx, edx);
> +            x86_cpu_get_cache_cpuid(index, count, eax, ebx, ecx, edx);
>              /* QEMU gives out its own APIC IDs, never pass down bits 31..26.  */
>              *eax &= ~0xFC000000;
>              if ((*eax & 31) && cs->nr_cores > 1) {
> @@ -5702,7 +5733,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>      case 0x80000005:
>          /* cache info (L1 cache) */
>          if (cpu->cache_info_passthrough) {
> -            host_cpuid(index, 0, eax, ebx, ecx, edx);
> +            x86_cpu_get_cache_cpuid(index, 0, eax, ebx, ecx, edx);
>              break;
>          }
>          *eax = (L1_DTLB_2M_ASSOC << 24) | (L1_DTLB_2M_ENTRIES << 16) |
> @@ -5715,7 +5746,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>      case 0x80000006:
>          /* cache info (L2 cache) */
>          if (cpu->cache_info_passthrough) {
> -            host_cpuid(index, 0, eax, ebx, ecx, edx);
> +            x86_cpu_get_cache_cpuid(index, 0, eax, ebx, ecx, edx);
>              break;
>          }
>          *eax = (AMD_ENC_ASSOC(L2_DTLB_2M_ASSOC) << 28) |
> @@ -5775,7 +5806,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>      case 0x8000001D:
>          *eax = 0;
>          if (cpu->cache_info_passthrough) {
> -            host_cpuid(index, count, eax, ebx, ecx, edx);
> +            x86_cpu_get_cache_cpuid(index, count, eax, ebx, ecx, edx);
>              break;
>          }
>          switch (count) {

Makes sense.

Reviewed-by: Maxim Levitsky <mlevisk@redhat.com>

Best regards,
	Maxim Levitsky


