Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6131339B412
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:36:30 +0200 (CEST)
Received: from localhost ([::1]:50518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4NZ-00041E-Df
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lp4Mk-0003Jq-IE
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:35:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lp4Mi-0000lA-S3
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622792136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xbe580QAJ0cKUvYyp3AcT5F/UI8wtoDzuMFw9FBv1t4=;
 b=SAWfQj5cjFIZ5bl8ATsa+pDXhys1/+4T6zu0mQ1UZKiwrg4iAFUXxs2zyMDLZmwJ3C359G
 vkKRBAxECeQgIl8z/yX22rif8NzYh34PE/BX+ZTgJbyj07lqG57KBDbuHuRf8gIkojIiFp
 SQGyJDJ0oB495TBnjSjIMpcZcZRCIg8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-4OvsZIIVNSC-HIwC-PrErg-1; Fri, 04 Jun 2021 03:35:35 -0400
X-MC-Unique: 4OvsZIIVNSC-HIwC-PrErg-1
Received: by mail-ej1-f69.google.com with SMTP id
 16-20020a1709063010b029037417ca2d43so3060771ejz.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 00:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Xbe580QAJ0cKUvYyp3AcT5F/UI8wtoDzuMFw9FBv1t4=;
 b=t5BhkQm1vsH7sTftVCGivD9iNdI7YKhr+Io/i354wHm3bBi0HLO8IVkqQXX45cN4of
 3IoSLJ+GwKhEIsFltDmO7++DbY23kBckxxzWcOG3PKcaHSvK6rhRmv/j60s05RA12Gbw
 6nLWID7UlloIxrLKQau7hIylTOhd4k2TtTGpDaun58fKj0Y3Hr/KB9hEw4+H2BXN+ZF4
 Oi2poHbalf+2z1gessyzJwg9wgUVCpKSvXChKo+xGfqqUFF14COLsAb7ntODKBbKOWTQ
 pLfNM/BD6A3eCDqTeNZaM+YX2lfaZy8nKNkfw0466heL54T1h6zLdkXFUBLO0G4Y8wvA
 U6ZQ==
X-Gm-Message-State: AOAM53227DskK3lsI+XpJfm/JtA470yNoUH1aN5sPbXNwmnY7uYrFva7
 DqjpDYwkHifnDVdmwHbWVSAMQZOHlHOdUdjsIRWs6TQpcjdJfZRwKDAO2hn1WyluWiHKFNc33xC
 QcZHDd8QFpxYsQIk=
X-Received: by 2002:a17:906:8a55:: with SMTP id
 gx21mr2972969ejc.179.1622792128857; 
 Fri, 04 Jun 2021 00:35:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHvjkEeGdyW97sFZr4+BFND02dkQ32/Srl0hwlzUxDQl3+8sMxsXv8irUqt7lj8E4/vhkeEg==
X-Received: by 2002:a17:906:8a55:: with SMTP id
 gx21mr2972953ejc.179.1622792128647; 
 Fri, 04 Jun 2021 00:35:28 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id n13sm2429121ejk.97.2021.06.04.00.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 00:35:28 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v7 8/9] i386: Hyper-V SynIC requires
 POST_MESSAGES/SIGNAL_EVENTS priviliges
In-Reply-To: <20210603230017.3goxm7fdu5fpdkdw@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-9-vkuznets@redhat.com>
 <20210603230017.3goxm7fdu5fpdkdw@habkost.net>
Date: Fri, 04 Jun 2021 09:35:27 +0200
Message-ID: <871r9i13r4.fsf@vitty.brq.redhat.com>
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

> On Thu, Jun 03, 2021 at 01:48:34PM +0200, Vitaly Kuznetsov wrote:
>> When Hyper-V SynIC is enabled, we may need to allow Windows guests to make
>> hypercalls (POST_MESSAGES/SIGNAL_EVENTS). No issue is currently observed
>> because KVM is very permissive, allowing these hypercalls regarding of
>> guest visible CPUid bits.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  target/i386/kvm/hyperv-proto.h | 6 ++++++
>>  target/i386/kvm/kvm.c          | 6 ++++++
>>  2 files changed, 12 insertions(+)
>> 
>> diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
>> index e30d64b4ade4..5fbb385cc136 100644
>> --- a/target/i386/kvm/hyperv-proto.h
>> +++ b/target/i386/kvm/hyperv-proto.h
>> @@ -38,6 +38,12 @@
>>  #define HV_ACCESS_FREQUENCY_MSRS     (1u << 11)
>>  #define HV_ACCESS_REENLIGHTENMENTS_CONTROL  (1u << 13)
>>  
>> +/*
>> + * HV_CPUID_FEATURES.EBX bits
>> + */
>> +#define HV_POST_MESSAGES             (1u << 4)
>> +#define HV_SIGNAL_EVENTS             (1u << 5)
>> +
>>  /*
>>   * HV_CPUID_FEATURES.EDX bits
>>   */
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index a3897d4d8788..6a32d43e6ec1 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -1343,6 +1343,12 @@ static int hyperv_fill_cpuids(CPUState *cs,
>>      /* Unconditionally required with any Hyper-V enlightenment */
>>      c->eax |= HV_HYPERCALL_AVAILABLE;
>>  
>> +    /* SynIC and Vmbus devices require messages/signals hypercalls */
>> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC) &&
>> +        !cpu->hyperv_synic_kvm_only) {
>> +        c->ebx |= HV_POST_MESSAGES | HV_SIGNAL_EVENTS;
>
> Why exactly is the hyperv_synic_kvm_only check needed?
>

'hyperv_synic_kvm_only' means SynIC is only used for in-KVM stimers and
in this case Post Messages / Signal Events hypercalls are not used. KVM
will also return an error to the guest directly (as it can't forward
them to QEMU). No need to expose HV_POST_MESSAGES | HV_SIGNAL_EVENTS.

> Is the hyperv_synic_kvm_only check the only reason this was done
> here and not at kvm_hyperv_properties?
>

Yes, basically.

>
>> +    }
>> +
>>      /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
>>      c->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
>>  
>> -- 
>> 2.31.1
>> 

-- 
Vitaly


