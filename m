Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C939B3DF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:29:11 +0200 (CEST)
Received: from localhost ([::1]:45896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4GU-0000W8-Qr
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lp4Fj-0008FP-24
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lp4Fh-0004LC-AN
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622791700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qzMtTkHCI1LfHpnXZoXy8EbSozyT4UL1igT7AKjx8Q8=;
 b=CRwms094nsqe1EEDP6L5cMhlFfA8bNf/2Q+RtKH3dHYDt30/XQSgNdyRg7owXAgmuPLIlo
 xrd0KI/mII88amvobjkSYEfSUftsuGRdH6XVPgspB6cMxzOkfUfzOBdJh829ePudkayAlP
 bSfsnEY3O0D7NXlg3EBloUhlLcc4Cyg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-d4DCGzdkNMymSbAsW8h7rA-1; Fri, 04 Jun 2021 03:28:19 -0400
X-MC-Unique: d4DCGzdkNMymSbAsW8h7rA-1
Received: by mail-ej1-f72.google.com with SMTP id
 b10-20020a170906194ab02903ea7d084cd3so3056516eje.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 00:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qzMtTkHCI1LfHpnXZoXy8EbSozyT4UL1igT7AKjx8Q8=;
 b=JU9LCQkgwLHRIS6YXiwKp94Bqxkp8ToWwFcFa6Fz/Sz8XNXRWrjA2wdgS9j1XbKggx
 EL1NNAegsx05yyd5otwc+PQSANb2fJygq7rk6wg0s6/1pHFpm3gFf9ZhTsl6gn8r/bxs
 5BZ8bzfGfeRwetr5bcaMiPohPswy0Glo92suT98MLftvBvlmGayP2RRG/iwaR0amXYt/
 GFCSvifOn31xs7e1+SvBH7GhjVgIE3xrVV0IFfpOL2p84p0tGBgV2rw74lfOfHDMnOwI
 9589nenNqtX0g+mbVXI9Yv4EHuidNrQpKqkkCw77jDxwxT/1+91rZ8etCueeE8mwLyBh
 YSEQ==
X-Gm-Message-State: AOAM531A2I1LzzS15kRQ0fb8l/ZxM/HmNC7K1cLCaMGf3hbrP2BeGKcU
 kXLupYxwfexdUZ+4HpeewXvLf81obkXCWhh198+wLY0KNlEgzSpYCrQm72JoXik7UPFBM1OCYxA
 oq2+M+zHcmD1YVYE=
X-Received: by 2002:a17:906:80c8:: with SMTP id
 a8mr2827835ejx.195.1622791697818; 
 Fri, 04 Jun 2021 00:28:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ+gRdezLvoae22U1ZS19JwekMocwGgOUoW2+39TXZR/Q8nkOAK6d4djrqmpPILRc0FKl3JA==
X-Received: by 2002:a17:906:80c8:: with SMTP id
 a8mr2827815ejx.195.1622791697557; 
 Fri, 04 Jun 2021 00:28:17 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id br21sm2457876ejb.124.2021.06.04.00.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 00:28:17 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v7 3/9] i386: hardcode supported eVMCS version to '1'
In-Reply-To: <20210603223506.no7j7jais3qixdhs@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-4-vkuznets@redhat.com>
 <20210603223506.no7j7jais3qixdhs@habkost.net>
Date: Fri, 04 Jun 2021 09:28:15 +0200
Message-ID: <877dja1434.fsf@vitty.brq.redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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

> On Thu, Jun 03, 2021 at 01:48:29PM +0200, Vitaly Kuznetsov wrote:
>> Currently, the only eVMCS version, supported by KVM (and described in TLFS)
>> is '1'. When Enlightened VMCS feature is enabled, QEMU takes the supported
>> eVMCS version range (from KVM_CAP_HYPERV_ENLIGHTENED_VMCS enablement) and
>> puts it to guest visible CPUIDs. When (and if) eVMCS ver.2 appears a
>> problem on migration is expected: it doesn't seem to be possible to migrate
>> from a host supporting eVMCS ver.2 to a host, which only support eVMCS
>> ver.1.
>
> Isn't it possible and safe to expose eVMCS ver.1 to the guest on
> a host that supports ver.2?

We expose the supported range, guest is free to use any eVMCS version in
the range (see below):

>
>> 
>> Hardcode eVMCS ver.1 as the result of 'hv-evmcs' enablement for now. Newer
>> eVMCS versions will have to have their own enablement options (e.g.
>> 'hv-evmcs=2').
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  docs/hyperv.txt       |  2 +-
>>  target/i386/kvm/kvm.c | 16 +++++++++++-----
>>  2 files changed, 12 insertions(+), 6 deletions(-)
>> 
>> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
>> index a51953daa833..000638a2fd38 100644
>> --- a/docs/hyperv.txt
>> +++ b/docs/hyperv.txt
>> @@ -170,7 +170,7 @@ Recommended: hv-frequencies
>>  3.16. hv-evmcs
>>  ===============
>>  The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
>> -enabled, it provides Enlightened VMCS feature to the guest. The feature
>> +enabled, it provides Enlightened VMCS version 1 feature to the guest. The feature
>>  implements paravirtualized protocol between L0 (KVM) and L1 (Hyper-V)
>>  hypervisors making L2 exits to the hypervisor faster. The feature is Intel-only.
>>  Note: some virtualization features (e.g. Posted Interrupts) are disabled when
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index c676ee8b38a7..d57eede5dc81 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -1490,13 +1490,19 @@ static int hyperv_init_vcpu(X86CPU *cpu)
>>          ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
>>                                    (uintptr_t)&evmcs_version);
>>  
>> -        if (ret < 0) {
>> -            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
>> -                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
>> +        /*
>> +         * KVM is required to support EVMCS ver.1. as that's what 'hv-evmcs'
>> +         * option sets. Note: we hardcode the maximum supported eVMCS version
>> +         * to '1' as well so 'hv-evmcs' feature is migratable even when (and if)
>> +         * ver.2 is implemented. A new option (e.g. 'hv-evmcs=2') will then have
>> +         * to be added.
>> +         */
>> +        if (ret < 0 || (uint8_t)evmcs_version > 1) {
>
> Wait, do you really want to get a fatal error every time, after a
> kernel upgrade?
>

Here, evmcs_version (returned by kvm_vcpu_enable_cap()) represents a
*range* of supported eVMCS versions:

(evmcs_highest_supported_version << 8) | evmcs_lowest_supported_version

Currently, this is 0x101 [1..1] range.

The '(uint8_t)evmcs_version > 1' check here means 'eVMCS v1' is no
longer supported by KVM. This is not going to happen any time soon, but
I can imagine in 10 years or so we'll be dropping v1 so the range (in
theory) can be [10..2] -- which would mean eVMCS ver. 1 is NOT
supported. And we can't proceed then.

> I was expecting this:
>
>   vcpu_evmcs_version = 1; /* hardcoded, but can become configurable later */
>   ...
>   kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0, (uintptr_t)&supported_evmcs_version);
>   if (ret < 0 || supported_evmcs_version < vcpu_evmcs_version) {
>     error_setg(...);
>     return;
>   }
>   cpu->hyperv_nested[0] = vcpu_evmcs_version;
>
>
>> +            error_report("Hyper-V %s verson 1 is not supported by kernel",
>> +                         kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
>>              return ret;
>>          }
>> -
>> -        cpu->hyperv_nested[0] = evmcs_version;
>> +        cpu->hyperv_nested[0] = (1 << 8) | 1;
>>      }
>>  
>>      return 0;
>> -- 
>> 2.31.1
>> 

-- 
Vitaly


