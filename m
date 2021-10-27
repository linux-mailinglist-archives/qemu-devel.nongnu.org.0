Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E3743C918
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:00:20 +0200 (CEST)
Received: from localhost ([::1]:47206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhbP-00014d-8H
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mfhSQ-0006U5-Ge
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mfhSO-0000gK-5i
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635335459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V5nhoQIbD97gRfJkmQo3iACFIRxKs1pshW/4vSiZal8=;
 b=hDLkIfsuLgquDqmYOicSTEljLDtQwj5cp7KEBuvOcY0hcTyviB306R6lnJ1xQsSr/31svY
 DETc2u4EIDqoMONpQnFslKqvSQ1gHdV2cipBftPrng5TX+hZ4ROrRJWBqw0HLHyVNZ+m1E
 tqjC8CaIHM+oXEfG9C5p7cKD2BeWk1U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-T3t3SkjrNsi7t7OO1qsxqg-1; Wed, 27 Oct 2021 07:50:55 -0400
X-MC-Unique: T3t3SkjrNsi7t7OO1qsxqg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p18-20020a05600c205200b0032ccb9d9f76so1079228wmg.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 04:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=V5nhoQIbD97gRfJkmQo3iACFIRxKs1pshW/4vSiZal8=;
 b=PfMQef/gU80TLx2vfmweWuXmDlr4AJAA4X95+16OW4xKk0HXLY3lGmiuE95dGuAPV5
 CamQa+5+Y7nXUzrycG75MGadyU50kRrNPwMxw1BznflfT9dyqFfHPppRP2elbqIov3H0
 t3qVyjVFMG4iUUXR7p4ivo5TH5h2oc/L+mQXl5JBu26cR43M2dHvXDmNSANhLExcfmh1
 iSo1sR8Gyo36PSoxymamQLzRp32Lq+G+qfe6QTdWD7nb3Sbold1Nwwccs1YKD410r7SK
 Bk+9dyXsnzzkp/BaSyWD3fZn/NCBIrkOaHhLPeKtNyiG9UZNj9LfeXed8e2GGgjNF+eW
 IaQw==
X-Gm-Message-State: AOAM530m/9NFcquj/GehLZnHTxth7DIDNrxDOjpikZKizYrrjA8kYa/i
 qYjf0siCpF9LEsDZUWM7JBmYeh9Q2DZV6IFeKY0/bbJCsYYe1p/YzIdYz5+RuAMQkCKp//hQuhp
 lD6x0XoOwazCIzZc=
X-Received: by 2002:adf:e389:: with SMTP id e9mr14528981wrm.117.1635335454655; 
 Wed, 27 Oct 2021 04:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDYWUK7AS5KQVc9efB+yzTB6hcMKUi3kuwkY8s1NiJNHrb09wvdj0DvjYPCGfaoPxgUtdfUA==
X-Received: by 2002:adf:e389:: with SMTP id e9mr14528937wrm.117.1635335454312; 
 Wed, 27 Oct 2021 04:50:54 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id s3sm3147518wmh.30.2021.10.27.04.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 04:50:53 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3] i386: docs: Briefly describe KVM PV features
In-Reply-To: <20211026161207.03117a1e@redhat.com>
References: <20211004140445.624875-1-vkuznets@redhat.com>
 <20211026161207.03117a1e@redhat.com>
Date: Wed, 27 Oct 2021 13:50:52 +0200
Message-ID: <87h7d2u1nn.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Mon,  4 Oct 2021 16:04:45 +0200
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>

Thanks for the review! As I can see, the patch already made it to
'master':

commit 7f7c8d0ce3630849a4df3d627b11de354fcb3bb0
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Mon Oct 4 16:04:45 2021 +0200

    i386: docs: Briefly describe KVM PV features

we can send follow-ups, of course. 

>> KVM PV features don't seem to be documented anywhere, in particular, the
>> fact that some of the features are enabled by default and some are not can
>> only be figured out from the code.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>> Changes since "[PATCH v2 0/8] i386: Assorted KVM PV and Hyper-V feature
>>  improvements" [Paolo Bonzini]:
>> - Convert to 'rst' and move to docs/system/i386/kvm-pv.rst.
>> - Add information about the version of Linux that introduced the particular
>>   PV feature.
>> ---
>>  docs/system/i386/kvm-pv.rst | 100 ++++++++++++++++++++++++++++++++++++
>>  docs/system/target-i386.rst |   1 +
>>  2 files changed, 101 insertions(+)
>>  create mode 100644 docs/system/i386/kvm-pv.rst
>> 
>> diff --git a/docs/system/i386/kvm-pv.rst b/docs/system/i386/kvm-pv.rst
>> new file mode 100644
>> index 000000000000..1e5a9923ef45
>> --- /dev/null
>> +++ b/docs/system/i386/kvm-pv.rst
>> @@ -0,0 +1,100 @@
>> +Paravirtualized KVM features
>> +============================
>> +
>> +Description
>> +-----------
>> +
>> +In some cases when implementing hardware interfaces in software is slow, ``KVM``
>> +implements its own paravirtualized interfaces.
>> +
>> +Setup
>> +-----
>> +
>> +Paravirtualized ``KVM`` features are represented as CPU flags. The following
>> +features are enabled by default for any CPU model when ``KVM`` acceleration is
>> +enabled:
>
> /if host kernel supports them
>

It does as QEMU requires linux >= 4.5. I'm not sure what happens if it
doesn't, maybe it won't start. 

>> +
>> +- ``kvmclock``
>> +- ``kvm-nopiodelay``
>
>> +- ``kvm-asyncpf``
>
> later you say it's not enabled by default since x.y and something else
> should be used instead

The situation is a bit weird. QEMU will still be enabling kvm-asyncpf by
default. This, however, has no effect currently as KVM dropped support
for this feature (in favor of kvm-asyncpf-int but this one is *not*
enabled by default)

>
> maybe add a kernel version for each item in this list aka: (since: ... [,till])
>
>> +- ``kvm-steal-time``
>> +- ``kvm-pv-eoi``
>> +- ``kvmclock-stable-bit``
>> +
>> +``kvm-msi-ext-dest-id`` feature is enabled by default in x2apic mode with split
>> +irqchip (e.g. "-machine ...,kernel-irqchip=split -cpu ...,x2apic").
>
>
>> +Note: when CPU model ``host`` is used, QEMU passes through all supported
>> +paravirtualized ``KVM`` features to the guest.
>
> Is it true in case of kvm-pv-enforce-cpuid=on ?

Yes, I believe these two things are orthogonal: CPU model 'host' will
give you everything supported by the kernel, 'kvm-pv-enforce-cpuid' will
tell KVM to forbid using features, not exposed in guest visible CPUIDs:
but combined with 'host' this is going to be an empty set as all
features are enabled.

>
> Also I'd s/passes through/enables/
> on the grounds that host CPUID simply doesn't have such CPUIDs
> so it's a bit confusing.

I meant to say 'passes through' from KVM, not from pCPU but I see why
this is not clear.

>
>
>> +Existing features
>> +-----------------
>> +
>> +``kvmclock``
>> +  Expose a ``KVM`` specific paravirtualized clocksource to the guest. Supported
>> +  since Linux v2.6.26.
>> +
>> +``kvm-nopiodelay``
>> +  The guest doesn't need to perform delays on PIO operations. Supported since
>> +  Linux v2.6.26.
>> +
>> +``kvm-mmu``
>> +  This feature is deprecated.
>> +
>> +``kvm-asyncpf``
>> +  Enable asynchronous page fault mechanism. Supported since Linux v2.6.38.
>> +  Note: since Linux v5.10 the feature is deprecated and not enabled by ``KVM``.
>
>> +  Use ``kvm-asyncpf-int`` instead.
> 'Use' or 'Used' by default?
>

'kvm-asyncpf' is a dead feature now so in case users want to get
Asynchronouse Page Faults they need to enable 'kvm-asyncpf-int'
manually, thus 'use'.

>
>> +``kvm-steal-time``
>> +  Enable stolen (when guest vCPU is not running) time accounting. Supported
>> +  since Linux v3.1.
>> +
>> +``kvm-pv-eoi``
>> +  Enable paravirtualized end-of-interrupt signaling. Supported since Linux
>> +  v3.10.
>> +
>> +``kvm-pv-unhalt``
>> +  Enable paravirtualized spinlocks support. Supported since Linux v3.12.
>> +
>> +``kvm-pv-tlb-flush``
>> +  Enable paravirtualized TLB flush mechanism. Supported since Linux v4.16.
>> +
>> +``kvm-pv-ipi``
>> +  Enable paravirtualized IPI mechanism. Supported since Linux v4.19.
>> +
>> +``kvm-poll-control``
>> +  Enable host-side polling on HLT control from the guest. Supported since Linux
>> +  v5.10.
>> +
>> +``kvm-pv-sched-yield``
>> +  Enable paravirtualized sched yield feature. Supported since Linux v5.10.
>> +
>> +``kvm-asyncpf-int``
>> +  Enable interrupt based asynchronous page fault mechanism. Supported since Linux
>> +  v5.10.
>> +
>> +``kvm-msi-ext-dest-id``
>> +  Support 'Extended Destination ID' for external interrupts. The feature allows
>> +  to use up to 32768 CPUs without IRQ remapping (but other limits may apply making
>
> maybe add a footnote pointing to what 'other limits' may exist.

A footnote would also do. The main point here is that this feature by
itself doesn't guarantee that the limit for the number of vCPUs is
'32768', hope this is clear.

>
>> +  the number of supported vCPUs for a given configuration lower). Supported since
>> +  Linux v5.10.
>> +
>> +``kvmclock-stable-bit``
>> +  Tell the guest that guest visible TSC value can be fully trusted for kvmclock
>> +  computations and no warps are expected. Supported since Linux v2.6.35.
>> +
>> +Supplementary features
>> +----------------------
>> +
>> +``kvm-pv-enforce-cpuid``
>> +  Limit the supported paravirtualized feature set to the exposed features only.
>
> Does 'the exposed features' mean feature flags explicitly set for CPU
> on command line?

Explicitly enabled + features, enabled by default OR '-cpu host' (all
features). 'Exposed' here is an implementation detail: KVM doesn't know
how guest visible CPUIDs were built, the only thing it does is every
time a feature is used (e.g. a PV MSR is being written to) it checks if
the feature bit is set. I'd appreciate a suggestion on how to word this
better from QEMU's point of view.

>
>> +  Note, by default, ``KVM`` allows the guest to use all currently supported
>> +  paravirtualized features even when they were not announced in guest visible
>> +  CPUIDs. Supported since Linux v5.10.
>> +
>> +
>> +Useful links
>> +------------
>> +
>> +Please refer to Documentation/virt/kvm in Linux for additional details.
>> diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
>> index 6a86d638633a..4daa53c35d8f 100644
>> --- a/docs/system/target-i386.rst
>> +++ b/docs/system/target-i386.rst
>> @@ -26,6 +26,7 @@ Architectural features
>>     :maxdepth: 1
>>  
>>     i386/cpu
>> +   i386/kvm-pv
>>     i386/sgx
>>  
>>  .. _pcsys_005freq:
>

-- 
Vitaly


