Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4D41C856
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:27:27 +0200 (CEST)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbUU-000754-7h
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVbTX-0006O0-QP
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:26:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVbTT-0001Po-Dq
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632929181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0XytLEB1YMgLL8fgRtWa869Li5pYNLFEj+QTYR0EEY=;
 b=hgSNTvcnHmy1jUSt1gu0UAKcMrTiAvyA5sh3u6FPxsEdMCXuFM6x/rHeUiaglTxkwD7Vup
 +2nOfwgPttdTdga2NA4ji4VwhSfNXk5HHzKATncMdxJ7X/+wsOUI08aE1Z8f13nz6u0kn1
 eVPq7NeYfeHYaJR1FOFFargpeptVWhw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-Qz-jYKqVPnWzgb-sI98WiA-1; Wed, 29 Sep 2021 11:26:19 -0400
X-MC-Unique: Qz-jYKqVPnWzgb-sI98WiA-1
Received: by mail-ed1-f71.google.com with SMTP id
 2-20020a508e02000000b003d871759f5dso2788212edw.10
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 08:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q0XytLEB1YMgLL8fgRtWa869Li5pYNLFEj+QTYR0EEY=;
 b=tCIV/sT16iED428s51gx2FF71xI4Uc1zinlN5vlMWum3/N2qET+TOZkr+agEp1gIj0
 pQHDqSNR46eaxCk5Y075ummx6nmt9XB2cA29WFHNOWN8siwrxYF0ad0RL+4TjQKBEuj8
 Vp1O2XQZgMpCe/9EnmOJyhRefn0oZS9nKfNXeOT0OgkrHXP/R93/I8tFQ50wnQjb+gfM
 m1QhtfnQB+SQv3A3Ssb2ILqtIQjDXSDE01Uhf7QS4KKluzeYwQM4LhDsV9nTEc2nNEfm
 8dAphwFviQO7SHoJujSUDELzQ3kUTj3UL6kJnqEvq+w/ioqoiisT65VsuDtg4dHJaV29
 0BiA==
X-Gm-Message-State: AOAM531n/pzlwd68ixJR/d9yLptSOEQ/7Od2hnkg8PD5YfUlMt0zbgmM
 ILMHegRxvsaaQL5QIJcB+8Lil8WKm1pMcKP6UDDEM2XDu5FeIooM/XCBNcubXc8qO3wJGi6ZP6J
 pusmw4tM53dnD2+E=
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr302607ejd.241.1632929175959; 
 Wed, 29 Sep 2021 08:26:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzxtw6bzb3fi/ARWFFBB9BKNv+/vXfOey7ivSYZSgFe0m1UOyp3aHl22Ls6CMniRLc1nefLQ==
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr302322ejd.241.1632929173156; 
 Wed, 29 Sep 2021 08:26:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j14sm91375edl.21.2021.09.29.08.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 08:26:12 -0700 (PDT)
Message-ID: <aa10fb46-3c65-71c2-abb0-c726078f2f16@redhat.com>
Date: Wed, 29 Sep 2021 17:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/8] i386: docs: Briefly describe KVM PV features
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20210902093530.345756-1-vkuznets@redhat.com>
 <20210902093530.345756-3-vkuznets@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210902093530.345756-3-vkuznets@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Vadim Rozenfeld <vrozenfe@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/21 11:35, Vitaly Kuznetsov wrote:
> KVM PV features don't seem to be documented anywhere, in particular, the
> fact that some of the features are enabled by default and some are not can
> only be figured out from the code.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>   docs/kvm-pv.txt | 92 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 92 insertions(+)
>   create mode 100644 docs/kvm-pv.txt



Please place this in docs/system/i386 (linked from 
docs/system/target-i386.rst).

> diff --git a/docs/kvm-pv.txt b/docs/kvm-pv.txt
> new file mode 100644
> index 000000000000..84ad7fa60f8d
> --- /dev/null
> +++ b/docs/kvm-pv.txt
> @@ -0,0 +1,92 @@
> +KVM paravirtualized features
> +============================
> +
> +
> +1. Description
> +===============

In addition to other conversions to rst, please:

a) use --- for headings at the second level

> +In some cases when implementing a hardware interface in software is slow, KVM
> +implements its own paravirtualized interfaces.
> +
> +2. Setup
> +=========
> +KVM PV features are represented as CPU flags. The following features are enabled
> +by default for any CPU model when KVM is enabled:
> +  kvmclock
> +  kvm-nopiodelay
> +  kvm-asyncpf
> +  kvm-steal-time
> +  kvm-pv-eoi
> +  kvmclock-stable-bit
> +
> +'kvm-msi-ext-dest-id' feature is enabled by default in x2apic mode with split
> +irqchip (e.g. "-machine ...,kernel-irqchip=split -cpu ...,x2apic").
> +
> +Note: when cpu model 'host' is used, QEMU passes through all KVM PV features
> +exposed by KVM to the guest.
> +
> +3. Existing features
> +====================
> +3.1. kvmclock
> +================
> +This feature exposes KVM specific PV clocksource to the guest.

b) use a definition list like

kvmclock
   Expose a KVM-specific paravirtualized clocksource to the guest.

kvm-nopiodelay
   ...

You may also want to highlight the version of Linux that introduced the 
feature.

Paolo

> +3.2. kvm-nopiodelay
> +===================
> +The guest doesn't need to perform delays on PIO operations.
> +
> +3.3. kvm-mmu
> +============
> +This feature is deprecated.
> +
> +3.4. kvm-asyncpf
> +================
> +Enables asynchronous page fault mechanism. Note: since Linux-5.10 the feature is
> +deprecated and not enabled by KVM. Use "kvm-asyncpf-int" instead.
> +
> +3.5. kvm-steal-time
> +===================
> +Enables stolen (when guest vCPU is not running) time accounting.
> +
> +3.6. kvm-pv-eoi
> +===============
> +Enables paravirtualized end-of-interrupt signaling.
> +
> +3.7. kvm-pv-unhalt
> +==================
> +Enables paravirtualized spinlocks support.
> +
> +3.8. kvm-pv-tlb-flush
> +=====================
> +Enables paravirtualized TLB flush mechanism.
> +
> +3.9. kvm-pv-ipi
> +===============
> +Enables paravirtualized IPI mechanism.
> +
> +3.10. kvm-poll-control
> +======================
> +Enables host-side polling on HLT control from the guest.
> +
> +3.11. kvm-pv-sched-yield
> +========================
> +Enables paravirtualized sched yield feature.
> +
> +3.12. kvm-asyncpf-int
> +=====================
> +Enables interrupt based asynchronous page fault mechanism.
> +
> +3.13. kvm-msi-ext-dest-id
> +=========================
> +Support 'Extended Destination ID' for external interrupts. The feature allows
> +to use up to 32768 CPUs without IRQ remapping (but other limits may apply making
> +the number of supported vCPUs for a given configuration lower).
> +
> +3.14. kvmclock-stable-bit
> +=========================
> +Tells the guest that guest visible TSC value can be fully trusted for kvmclock
> +computations and no warps are expected.
> +
> +4. Useful links
> +================
> +Please refer to Documentation/virt/kvm in Linux for additional detail.
> 


