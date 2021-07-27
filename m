Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1793D713D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:32:42 +0200 (CEST)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8IW1-0006Dp-85
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m8IRi-0000Ff-Hi
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m8IRe-0008Ap-JO
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627374489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6X0Iabb0FhBxeKcx21Ajt0IQPCONpGDQJOOttphAHNA=;
 b=SjdthOYw2n+B33LTtYL8RmTwa1MoXVeTUC+pUxcbnWcUva5phcqXnPyNhLbOBJD4/67xJo
 DnZ2VCOFHwIrd4E7wFVtYKFKqAcce9HGbzJ1OEdTEESTcU3k67uGtcRy/zly8V0CBsmFQ9
 cVZRi7gDpATF+zb8qXlQ5UNWwP3oIJc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-ggZEyLACOku2Jdeyyh0Vjw-1; Tue, 27 Jul 2021 04:28:07 -0400
X-MC-Unique: ggZEyLACOku2Jdeyyh0Vjw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o26-20020a05600c511ab0290252d0248251so1060395wms.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 01:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6X0Iabb0FhBxeKcx21Ajt0IQPCONpGDQJOOttphAHNA=;
 b=KmSq44yfi+/LbTrc+2mpDIsAuTU46QCTit5Ul4+FpNniGSBFplvOf+uqg4h0jAMrIy
 O9EYpyqx81LOEUAdLlu5Uv7Mo4N1NtPSqcbKGSMoEwIklWcE2Srsi2HeNOAM7DXAFkmb
 r2pGbk1dLneS5u0H3GOR7YLBlk2Ls4WOuy0JSE7LEDdiBIAz/gi2i7MHGYo5WNknyLTa
 wT+yiHrDXKncgqY9A0DLE6nG7JayTYptND18pVJrLyEwNaBYB4r3VDMPLqDqOaibrpWT
 mUXNk/W5t2pS039kxYDp7cfgUMGd8RS7Wbx4X9CWAtThN8VMLAjA37vq7O7UduA/66ZL
 miWQ==
X-Gm-Message-State: AOAM5327dIWuOitWpGBTR1plikJfdqZYd7luha93U1YGmdbrCsdnYQT9
 l4WXZAcbvoUS7k+Yz1UhdQa0dptovnCg5ftk3GjhQPlmJdm8UEPJR5sJotTZdHuuo0VOpIapD7h
 XR4RODh/39pGrG4E=
X-Received: by 2002:a05:600c:1c1f:: with SMTP id
 j31mr2842126wms.132.1627374486205; 
 Tue, 27 Jul 2021 01:28:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGQFg9YMagm+Jl0dw+uJwHyYpCvej5EVEzVrlQMxbnY3nDUO4FGYbYY07xW4rR23KmKH1G2A==
X-Received: by 2002:a05:600c:1c1f:: with SMTP id
 j31mr2842106wms.132.1627374485970; 
 Tue, 27 Jul 2021 01:28:05 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id v5sm2474691wrd.74.2021.07.27.01.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 01:28:05 -0700 (PDT)
Date: Tue, 27 Jul 2021 09:28:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [PATCH v4] i386: Add ratelimit for bus locks acquired in guest
Message-ID: <YP/DkxqH3h4fROM/@work-vm>
References: <20210521043820.29678-1-chenyi.qiang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210521043820.29678-1-chenyi.qiang@intel.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chenyi Qiang (chenyi.qiang@intel.com) wrote:
> A bus lock is acquired through either split locked access to writeback
> (WB) memory or any locked access to non-WB memory. It is typically >1000
> cycles slower than an atomic operation within a cache and can also
> disrupts performance on other cores.
> 
> Virtual Machines can exploit bus locks to degrade the performance of
> system. To address this kind of performance DOS attack coming from the
> VMs, bus lock VM exit is introduced in KVM and it can report the bus
> locks detected in guest. If enabled in KVM, it would exit to the
> userspace to let the user enforce throttling policies once bus locks
> acquired in VMs.
> 
> The availability of bus lock VM exit can be detected through the
> KVM_CAP_X86_BUS_LOCK_EXIT. The returned bitmap contains the potential
> policies supported by KVM. The field KVM_BUS_LOCK_DETECTION_EXIT in
> bitmap is the only supported strategy at present. It indicates that KVM
> will exit to userspace to handle the bus locks.
> 
> This patch adds a ratelimit on the bus locks acquired in guest as a
> mitigation policy.
> 
> Introduce a new field "bus_lock_ratelimit" to record the limited speed
> of bus locks in the target VM. The user can specify it through the
> "bus-lock-ratelimit" as a machine property. In current implementation,
> the default value of the speed is 0 per second, which means no
> restrictions on the bus locks.
> 
> As for ratelimit on detected bus locks, simply set the ratelimit
> interval to 1s and restrict the quota of bus lock occurence to the value
> of "bus_lock_ratelimit". A potential alternative is to introduce the
> time slice as a property which can help the user achieve more precise
> control.
> 
> The detail of bus lock VM exit can be found in spec:
> https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html
> 
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>

Hi Chenyi,

  I noticed in this patch:


> +static void kvm_rate_limit_on_bus_lock(void)
> +{
> +    uint64_t delay_ns = ratelimit_calculate_delay(&bus_lock_ratelimit_ctrl, 1);
> +
> +    if (delay_ns) {
> +        g_usleep(delay_ns / SCALE_US);
> +    }
> +}

and wondered if this would block cpu kicks, and what would happen if
delay_ns got quite big - Eduardo thinks it might get upto 1s.

Also, it feels similar to what migration does during 'auto converge';
see softmuu/cpu-throttle.c - instead of doing your own g_usleep
you could call cpu_throttle_set with a given throttle rate.

Dave

> +
>  MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>  {
>      X86CPU *x86_cpu = X86_CPU(cpu);
> @@ -4237,6 +4271,9 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>      } else {
>          env->eflags &= ~IF_MASK;
>      }
> +    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
> +        kvm_rate_limit_on_bus_lock();
> +    }
>  
>      /* We need to protect the apic state against concurrent accesses from
>       * different threads in case the userspace irqchip is used. */
> @@ -4595,6 +4632,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>          ioapic_eoi_broadcast(run->eoi.vector);
>          ret = 0;
>          break;
> +    case KVM_EXIT_X86_BUS_LOCK:
> +        /* already handled in kvm_arch_post_run */
> +        ret = 0;
> +        break;
>      default:
>          fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>          ret = -1;
> -- 
> 2.17.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


