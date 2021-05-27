Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A64392892
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:31:53 +0200 (CEST)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAUi-00085x-4E
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lmASJ-0006Zd-17
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lmASG-00084l-Ee
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622100559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GhPa+9jFCcmQdhsnAQmrooNq/fEJDHOzD10IL0MbY1w=;
 b=bgXL4LQyPgU/w91kiJ4Exeuui2lCRU9TAP0AbHE6ch8jgz7Q+NdEhP+qsXg7PvWjQrpRXA
 L2By441mTNMdOkYc3uMkKqsvl6PEUCm/lO5W98bJiL8ciecFeCQRVu0PGnCOq4mitUX7J2
 ZcqaOGGWqxbNc3Y5wekj0NvcNFa7eCE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-MKECVMsqP2WTEBKxQ5nRWQ-1; Thu, 27 May 2021 03:29:17 -0400
X-MC-Unique: MKECVMsqP2WTEBKxQ5nRWQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so1412685wri.1
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 00:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=GhPa+9jFCcmQdhsnAQmrooNq/fEJDHOzD10IL0MbY1w=;
 b=aeQ1B9rfUBY8z1XGfSKS9EeZAo7NgbsRtlT59lHPAcy1PcCV5VuUIj9L2OZFStt0tu
 xxiIEYV0vaQSpe+l1i0ocGijyW9gyVtyP3YjjnCgu9AHw5litS1WY4WkepwjLd4w25i+
 BFHv/tlKmEbQprA8G0nedxvWmQnMdLM7lx38sfT/+EQiICFJkf+cdBMfGMlhuvi4JtWm
 YWa34LiDLxLobSu6ICWJu/XNEm4lFP7FSiK8sOFbYIlVXHQkMvfmy83H7OM7ijlQ9+OS
 KeHUVkz/Wg/Eh3aIfYJ3LMGocIHW4fbT7i2XUQB/+BDMnx4/lQOeJffPAcgYJCX8iD7y
 Djtw==
X-Gm-Message-State: AOAM533T1pLcszxGEKkVx+xbC7cEtXDdFsQDi/q9MDxHBm6xFvn8c+gM
 ZB2EsMMBaTyFYyOcHyqZjJXtue3JXRhi+pQ1oMNd0jSvmzovuSBRhIaqseSkKudbIQJrJSzEGTI
 vde9hhLFXxtoPCIw=
X-Received: by 2002:a05:6000:c2:: with SMTP id
 q2mr1830787wrx.288.1622100556451; 
 Thu, 27 May 2021 00:29:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqn6CfoNpheI4YklisZeHS2p0/i0/Y8B89vuK7TS34ClN7VeeyMvdRYSh8yDvFMyG7lVTFxA==
X-Received: by 2002:a05:6000:c2:: with SMTP id
 q2mr1830768wrx.288.1622100556256; 
 Thu, 27 May 2021 00:29:16 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id 11sm1789176wmo.24.2021.05.27.00.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:29:15 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 15/19] i386: expand Hyper-V features during CPU
 feature expansion time
In-Reply-To: <20210526165719.y5ubvjn3s75vtbe2@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-16-vkuznets@redhat.com>
 <20210521214548.rhdybkofpcfvke3k@habkost.net>
 <87eedw72ju.fsf@vitty.brq.redhat.com>
 <20210526165719.y5ubvjn3s75vtbe2@habkost.net>
Date: Thu, 27 May 2021 09:29:14 +0200
Message-ID: <87lf807hyt.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Mon, May 24, 2021 at 02:13:09PM +0200, Vitaly Kuznetsov wrote:
> [...]
>> >> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> >> index a42263b24fca..d5551c4ab5cf 100644
>> >> --- a/target/i386/kvm/kvm.c
>> >> +++ b/target/i386/kvm/kvm.c
>> >> @@ -1216,13 +1216,22 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
>> >>   * of 'hv_passthrough' mode and fills the environment with all supported
>> >>   * Hyper-V features.
>> >>   */
>> >> -static void hyperv_expand_features(CPUState *cs, Error **errp)
>> >> +void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>> >>  {
>> >> -    X86CPU *cpu = X86_CPU(cs);
>> >> +    CPUState *cs = CPU(cpu);
>> >>  
>> >>      if (!hyperv_enabled(cpu))
>> >>          return;
>> >>  
>> >> +    /*
>> >> +     * When kvm_hyperv_expand_features is called at CPU feature expansion
>> >> +     * time per-CPU kvm_state is not available yet so we can only proceed
>> >> +     * when KVM_CAP_SYS_HYPERV_CPUID is supported.
>> >> +     */
>> >> +    if (!cs->kvm_state &&
>> >> +        !kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID))
>> >> +        return;
>> >> +
>> >>      if (cpu->hyperv_passthrough) {
>> >>          cpu->hyperv_vendor_id[0] =
>> >>              hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
>> >> @@ -1556,7 +1565,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>> >>      env->apic_bus_freq = KVM_APIC_BUS_FREQUENCY;
>> >>  
>> >>      /* Paravirtualization CPUIDs */
>> >> -    hyperv_expand_features(cs, &local_err);
>> >> +    kvm_hyperv_expand_features(cpu, &local_err);
>> >
>> > Do we still need to call the function again here?
>> >
>> > If the first expansion isn't expanding everything, I'm afraid
>> > this second call will hide bugs in query-cpu-model-expansion.
>> >
>> 
>> The first expansion will do nothing if KVM_CAP_SYS_HYPERV_CPUID is not
>> supported, calling it here allows us to proceed. The series makes
>> 'query-cpu-model-expansion' output correct only with
>> KVM_CAP_SYS_HYPERV_CPUID, without it we don't seem to be able to do much
>> (unless we decide to create a 'scratch' CPU or something like that).
>
> Oh, I see.  I suggest adding a comment explaining that.
> Developers might be tempted to delete it and not notice it breaks
> under older kernels.

Will do, thanks!

-- 
Vitaly


