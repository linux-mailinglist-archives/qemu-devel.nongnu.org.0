Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767B3520091
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:59:21 +0200 (CEST)
Received: from localhost ([::1]:45734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4r2-0007Fz-3K
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1no4ot-00062l-LH
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1no4oq-0001ny-Ly
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652108223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p+QaHk6AkXo6gLr0X4IHzkJZyYolCjkn37YX+X6eW7o=;
 b=GngLB/invHfNQ0hTaM9P1lz6yRGaGmuoYDWuNp522I/G4MrpGwWsYhPxaq5CKOQvSaG3qO
 NdUIxiKxDjYPEkRkpMOs/HALUt8RDjEhi+SrtQBJrBCJqDajSetaxDmoVr5hrlFCcDxBUt
 BMqxOSOguTXTyWRBV+2NOJzb5hYUK4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592--8I_Pc2ENkGOqxUnEHujZg-1; Mon, 09 May 2022 10:55:56 -0400
X-MC-Unique: -8I_Pc2ENkGOqxUnEHujZg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC45A80B718
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 14:55:55 +0000 (UTC)
Received: from fuller.cnet (ovpn-112-4.gru2.redhat.com [10.97.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76F7741370B;
 Mon,  9 May 2022 14:55:55 +0000 (UTC)
Received: by fuller.cnet (Postfix, from userid 1000)
 id 41631409DE6B; Mon,  9 May 2022 11:54:00 -0300 (-03)
Date: Mon, 9 May 2022 11:54:00 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Vadim Rozenfeld <vrozenfe@redhat.com>
Subject: Re: [PATCH] target/i386: properly reset TSC on reset
Message-ID: <YnkrCFDa6zE6wV4Q@fuller.cnet>
References: <20220324173136.222647-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324173136.222647-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mtosatti@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 06:31:36PM +0100, Paolo Bonzini wrote:
> Some versions of Windows hang on reboot if their TSC value is greater
> than 2^54.  The calibration of the Hyper-V reference time overflows
> and fails; as a result the processors' clock sources are out of sync.
> 
> The issue is that the TSC _should_ be reset to 0 on CPU reset and
> QEMU tries to do that.  However, KVM special cases writing 0 to the
> TSC and thinks that QEMU is trying to hot-plug a CPU, which is
> correct the first time through but not later.  Thwart this valiant
> effort and reset the TSC to 1 instead, but only if the CPU has been
> run once.
> 
> For this to work, env->tsc has to be moved to the part of CPUArchState
> that is not zeroed at the beginning of x86_cpu_reset.
> 
> Reported-by: Vadim Rozenfeld <vrozenfe@redhat.com>
> Supersedes: <20220324082346.72180-1-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo,

Won't this disable the logic to sync TSCs, making it possible
for TSC of SMP guests to go out of sync? (And remember the logic
to sync TSCs from within a guest is fragile, in case of VCPU overload
for example).

> ---
>  target/i386/cpu.c | 13 +++++++++++++
>  target/i386/cpu.h |  2 +-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ec3b50bf6e..cb6b5467d0 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5931,6 +5931,19 @@ static void x86_cpu_reset(DeviceState *dev)
>      env->xstate_bv = 0;
>  
>      env->pat = 0x0007040600070406ULL;
> +
> +    if (kvm_enabled()) {
> +        /*
> +         * KVM handles TSC = 0 specially and thinks we are hot-plugging
> +         * a new CPU, use 1 instead to force a reset.
> +         */
> +        if (env->tsc != 0) {
> +            env->tsc = 1;
> +        }
> +    } else {
> +        env->tsc = 0;
> +    }
> +
>      env->msr_ia32_misc_enable = MSR_IA32_MISC_ENABLE_DEFAULT;
>      if (env->features[FEAT_1_ECX] & CPUID_EXT_MONITOR) {
>          env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_MWAIT;
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index e31e6bd8b8..982c532353 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1554,7 +1554,6 @@ typedef struct CPUArchState {
>      target_ulong kernelgsbase;
>  #endif
>  
> -    uint64_t tsc;
>      uint64_t tsc_adjust;
>      uint64_t tsc_deadline;
>      uint64_t tsc_aux;
> @@ -1708,6 +1707,7 @@ typedef struct CPUArchState {
>      int64_t tsc_khz;
>      int64_t user_tsc_khz; /* for sanity check only */
>      uint64_t apic_bus_freq;
> +    uint64_t tsc;
>  #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>      void *xsave_buf;
>      uint32_t xsave_buf_len;
> -- 
> 2.35.1
> 
> 
> 


