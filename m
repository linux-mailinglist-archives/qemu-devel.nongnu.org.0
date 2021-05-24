Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161838E236
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 10:22:57 +0200 (CEST)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll5rU-0003G9-7L
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 04:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll5qR-0002a6-Dz
 for qemu-devel@nongnu.org; Mon, 24 May 2021 04:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll5qN-00071l-J5
 for qemu-devel@nongnu.org; Mon, 24 May 2021 04:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621844506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uxHLbW472ZdWlqCcIodXanbrmmQ0DbKZfun6OXT73oc=;
 b=NevwByp/87BBPIUFvG35uAo1jWmCwdvxSlpkjoFW9yyACoHSdfbW3p4VNiTpk6LnHYffBU
 POA/ABJTqdepHkjdZfDYay47LSZe0L805oIcCG9IaYnYKYSaE/w3kRTdAJwHQPZnz6LSCT
 AKI91oGc0hY2XkMhPLwPBiffJIqpYYY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-UTMd03NXNVSWFEkd19dvqA-1; Mon, 24 May 2021 04:21:44 -0400
X-MC-Unique: UTMd03NXNVSWFEkd19dvqA-1
Received: by mail-wr1-f70.google.com with SMTP id
 c13-20020a5d6ccd0000b029010ec741b84bso12700206wrc.23
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 01:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=uxHLbW472ZdWlqCcIodXanbrmmQ0DbKZfun6OXT73oc=;
 b=L4ccnyuHIzf5Ww6a7DvubHVzBY5GnRRaYLKlB1QflP3JS48PzgK4/P/oEVaOuA0ZAi
 5uGLClGPHhPNvDSfvfJ8PTAmCrHQ+G+MgSKGLMGZpKh9eE07ilt6fZF7MVg/8PAybSlP
 0o3YCnkT5LV/DKLyv0r1QNf6KqAXzsn2a3JgBxVw3w6ZHq6Jporlamj3jIXTdrpdKpOj
 L6Rv4hI/PrGyRHOs5NqCCUZ0cNNDQ7tTtlfzxonSIQOwtYBovTYRRaz6HjKmJg/bAQVH
 4W4PbZzbWNPv1AjCdiDDKhOSxDBZWx8pyBlG0WxLMttuMLdE0OhYz25gVFP54GQZjwCY
 yQwg==
X-Gm-Message-State: AOAM530sJesw996uQOwyQbSweTYHoEWGy4g1bQcjUJiJtODfYlSKvgUY
 SYmhNQ3mt4ccG1YEG1q4YRUeid/L3ZrAfaZLtMIL9S7EpkG60G+ahv6Mb94hWG0dkK7aip91iFl
 fg3lceK/gmy6sgvU=
X-Received: by 2002:adf:d221:: with SMTP id k1mr21133932wrh.298.1621844503139; 
 Mon, 24 May 2021 01:21:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz49DvDObSGAsM3eDwpLLTm7kZPVR87IHL1HQ8f2JI4p1CiWYoflcq0xZBX0D1ObC66rEUYrw==
X-Received: by 2002:adf:d221:: with SMTP id k1mr21133917wrh.298.1621844502923; 
 Mon, 24 May 2021 01:21:42 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id b10sm13420910wrr.27.2021.05.24.01.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 01:21:42 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Liang Li <liliang324@gmail.com>
Subject: Re: About the performance of hyper-v
In-Reply-To: <CA+2MQi-OK5zK_sBtm8k-nnqVPQTSzE1UVTEfQ4KBChMHc=Npzg@mail.gmail.com>
References: <CA+2MQi-_06J1cmLhKAmV1vkPEnvDx6+bOnK06OciYmdymaNruw@mail.gmail.com>
 <87cztmkdlp.fsf@vitty.brq.redhat.com>
 <CA+2MQi_LG57KRRFjMR_zPvJBDaH4z16S5J=c+U+-Ss_Z71Ax7g@mail.gmail.com>
 <87y2c8iia0.fsf@vitty.brq.redhat.com>
 <CA+2MQi-OK5zK_sBtm8k-nnqVPQTSzE1UVTEfQ4KBChMHc=Npzg@mail.gmail.com>
Date: Mon, 24 May 2021 10:21:41 +0200
Message-ID: <87k0no4k4q.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Tianyu.Lan@microsoft.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Liang Li <liliang324@gmail.com> writes:

>> >> > Analyze events for all VMs, all VCPUs:
>> >> >              VM-EXIT    Samples  Samples%     Time%    Min Time    Max
>> >> > Time         Avg time
>> >> >   EXTERNAL_INTERRUPT     471831    59.89%    68.58%      0.64us
>> >> > 65.42us      2.34us ( +-   0.11% )
>> >> >            MSR_WRITE     238932    30.33%    23.07%      0.48us
>> >> > 41.05us      1.56us ( +-   0.14% )
>> >> >
>> >> > Total Samples:787803, Total events handled time:1611193.84us.
>> >> >
>> >> > I tried turning off hyper-v for the same workload and repeat the test,
>> >> > the overall virtualization overhead reduced by about of 50%:
>> >> >
>> >> > -------
>> >> >
>> >> > Analyze events for all VMs, all VCPUs:
>> >> >
>> >> >              VM-EXIT    Samples  Samples%     Time%    Min Time    Max
>> >> > Time         Avg time
>> >> >           APIC_WRITE     255152    74.43%    50.72%      0.49us
>> >> > 50.01us      1.42us ( +-   0.14% )
>> >> >        EPT_MISCONFIG      39967    11.66%    40.58%      1.55us
>> >> > 686.05us      7.27us ( +-   0.43% )
>> >> >            DR_ACCESS      35003    10.21%     4.64%      0.32us
>> >> > 40.03us      0.95us ( +-   0.32% )
>> >> >   EXTERNAL_INTERRUPT       6622     1.93%     2.08%      0.70us
>> >> > 57.38us      2.25us ( +-   1.42% )
>> >> >
>> >> > Total Samples:342788, Total events handled time:715695.62us.
>> >> >
>> >> > For this scenario,  hyper-v works really bad.  stimer works better
>> >> > than hpet, but on the other hand, it relies on SynIC which has
>> >> > negative effects for IPI intensive workloads.
>> >> > Do you have any plans for improvement?
>> >> >
>> >>
>> >> Hey,
>> >>
>> >> the above can be caused by the fact that when 'hv-synic' is enabled, KVM
>> >> automatically disables APICv and this can explain the overhead and the
>> >> fact that you're seeing more vmexits. KVM disables APICv because SynIC's
>> >> 'AutoEOI' feature is incompatible with it. We can, however, tell Windows
>> >> to not use AutoEOI ('Recommend deprecating AutoEOI' bit) and only
>> >> inhibit APICv if the recommendation was ignored. This is implemented in
>> >> the following KVM patch series:
>> >> https://lore.kernel.org/kvm/20210518144339.1987982-1-vkuznets@redhat.com/
>> >>
>> >> It will, however, require a new 'hv-something' flag to QEMU. For now, it
>> >> can be tested with 'hv-passthrough'.
>> >>
>> >> It would be great if you could give it a spin!
>> >>
>> >> --
>> >> Vitaly
>> >
>> > It's great to know that you already have a solution for this. :)
>> >
>> > By the way,  is there any requirement for the version of windows or
>> > windows updates for the new feature to work?
>>
>> AFAIR, 'Recommend deprecating AutoEOI' bit appeared in WS2012 so I'd
>> expect WS2008 to ignore it completely (and thus SynIC will always be
>> disabling APICv for it).
>>
>
> Hi Vitaly,
>       I tried your patchset and found it's not helpful to reduce the
> virtualization overhead.
> here are some perfdata with the same workload
>
> ===============================
> Analyze events for all VMs, all VCPUs:
>              VM-EXIT    Samples  Samples%     Time%    Min Time    Max
> Time         Avg time
>            MSR_WRITE     924045    89.96%    81.10%      0.42us
> 68.42us      1.26us ( +-   0.07% )
>            DR_ACCESS      44669     4.35%     2.36%      0.32us
> 50.74us      0.76us ( +-   0.32% )
>   EXTERNAL_INTERRUPT      29809     2.90%     6.42%      0.66us
> 70.75us      3.10us ( +-   0.54% )
>               VMCALL      17819     1.73%     5.21%      0.75us
> 15.64us      4.20us ( +-   0.33%
>
> Total Samples:1027227, Total events handled time:1436343.94us.
> ===============================
>
> The result shows the overhead increased.  enable the apicv can help to
> reduce the vm-exit
> caused by interrupt injection, but on the other side, there are a lot
> of vm-exit caused by APIC_EOI.
>
> When turning off the hyper-v and using the kvm apicv, there is no such
> overhead. 

I think I know what's happening. We've asked Windows to use synthetic
MSRs to access APIC (HV_APIC_ACCESS_RECOMMENDED) and this can't be
accelerated in hardware.

Could you please try the following hack (KVM):

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index c8f2592ccc99..66ee85a83e9a 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -145,6 +145,13 @@ void kvm_update_cpuid_runtime(struct kvm_vcpu *vcpu)
                                           vcpu->arch.ia32_misc_enable_msr &
                                           MSR_IA32_MISC_ENABLE_MWAIT);
        }
+
+       /* Dirty hack: force HV_DEPRECATING_AEOI_RECOMMENDED. Not to be merged! */
+       best = kvm_find_cpuid_entry(vcpu, HYPERV_CPUID_ENLIGHTMENT_INFO, 0);
+       if (best) {
+               best->eax &= ~HV_X64_APIC_ACCESS_RECOMMENDED;
+               best->eax |= HV_DEPRECATING_AEOI_RECOMMENDED;
+       }
 }
 EXPORT_SYMBOL_GPL(kvm_update_cpuid_runtime);
 
> It seems turning on hyper V related features is not always the best
> choice for a windows guest.

Generally it is, we'll just need to make QEMU smarter when setting
'recommendation' bits.

-- 
Vitaly


