Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B281C41D546
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:11:53 +0200 (CEST)
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrAW-00013t-9k
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mVr8a-0000MA-PS
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:09:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mVr8Y-00071i-8e
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632989388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vbU+6+QfkYWrFvJT86U1nxSYZ8NO9Osq9OwtBmaCs9Q=;
 b=XOfqChZgM0qDscg6pqT3XTYgzDg+0Al9VN18bGQxpc8jUZjGkGuvUUBEzkYPas5n2lZBoF
 X/HQuHACP5rNqdiv6ptYMdGH6anuq860JQBQECPRGER/TXbdPKm39zU3bvHBRgsYEb63xr
 DtoD2Dwfh1/FqEzQrDJl9zSuSh74udc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-Odk8WjQBPE-7uHgdaUbTOw-1; Thu, 30 Sep 2021 04:09:45 -0400
X-MC-Unique: Odk8WjQBPE-7uHgdaUbTOw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w6-20020a50d786000000b003dabc563406so1019773edi.17
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 01:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vbU+6+QfkYWrFvJT86U1nxSYZ8NO9Osq9OwtBmaCs9Q=;
 b=i6WJWvTbcN/J0R46zKf8xrXBdFPNGEY1q/WC8j7qLLhn4Qu35yEBwOCIxG0QDaLLN+
 G9VxAEbVhG/C+MVl+SrLiCpAGgHlkyZuv0qWQtfOa+sV6Cto7MFTgTQPWh3FhDiHTi+I
 DjbEJ8eFp/rBpxHqL6/JYScjhusPIU+1Oj5fZL4h4cZQfq1dYUnDh260MRmP9oN/6Adq
 +femOHgzcdz6zkKMYatcEyJb7PjyK/90eBVslbUyKgdqUqcuahczS/oAtbyYBRjN3+9O
 18CkKyKVJlAHYoCUCPH5CdfNd4QgvPSS1JYeZHhEhnBv8H6ErZn16trSNBX8ms4XRLkT
 Wv7Q==
X-Gm-Message-State: AOAM531S0Z44sj814Mi0do3nVOLTDXypYdKs3++TXVxhXsiPftdjM7E+
 TwjdR/dcM04JkdeCS5dpw8zgJ/Yn0EbTuX2IqIT8cgS9qMjKVGl4z+Q+aLptsDBmUs8ZxR6OqlB
 qfjfgG6LiAl97rLs=
X-Received: by 2002:aa7:c690:: with SMTP id n16mr5480317edq.304.1632989384475; 
 Thu, 30 Sep 2021 01:09:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW8Sd3KUXsJwS0DdPs0j/nGaTM7SdErsmB/uOZsuwO4rHkCVea92IvoRlUTQypuSlXOfvXPw==
X-Received: by 2002:aa7:c690:: with SMTP id n16mr5480299edq.304.1632989384293; 
 Thu, 30 Sep 2021 01:09:44 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id k10sm1016846ejo.117.2021.09.30.01.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 01:09:43 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/8] i386: Assorted KVM PV and Hyper-V feature
 improvements
In-Reply-To: <679f17f9-8b8e-fc76-6a9c-cedd791a483e@redhat.com>
References: <20210902093530.345756-1-vkuznets@redhat.com>
 <679f17f9-8b8e-fc76-6a9c-cedd791a483e@redhat.com>
Date: Thu, 30 Sep 2021 10:09:42 +0200
Message-ID: <87fstm8oxl.fsf@vitty.brq.redhat.com>
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
Cc: Igor Mammedov <imammedo@redhat.com>, Vadim Rozenfeld <vrozenfe@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 02/09/21 11:35, Vitaly Kuznetsov wrote:
>> This is a continuation of "[PATCH 0/3] i386/kvm: Paravirtualized features usage
>> enforcement" series, thus v2.
>> 
>> This series implements several unrelated features but as there are code
>> dependencies between them I'm sending it as one series.
>> 
>> PATCH1 adds empty 6.2 machine types and the required compat infrastructure
>> (to be used by PATCH8)
>> PATCH2 adds documentation for KVM PV features
>> PATCH3 adds support for KVM_CAP_ENFORCE_PV_FEATURE_CPUID
>> PATCH4 adds support for KVM_CAP_HYPERV_ENFORCE_CPUID
>> PATCHes5-6 add 'hv-avic' feature
>> PATCH7 makes Hyper-V version info settable
>> PATCH8 changes the default Hyper-V version to 2016
>> 
>> Vitaly Kuznetsov (8):
>>    i386: Add 6.2 machine types
>>    i386: docs: Briefly describe KVM PV features
>>    i386: Support KVM_CAP_ENFORCE_PV_FEATURE_CPUID
>>    i386: Support KVM_CAP_HYPERV_ENFORCE_CPUID
>>    i386: Move HV_APIC_ACCESS_RECOMMENDED bit setting to
>>      hyperv_fill_cpuids()
>>    i386: Implement pseudo 'hv-avic' ('hv-apicv') enlightenment
>>    i386: Make Hyper-V version id configurable
>>    i386: Change the default Hyper-V version to match WS2016
>> 
>>   docs/hyperv.txt                |  41 +++++++++++--
>>   docs/kvm-pv.txt                | 103 +++++++++++++++++++++++++++++++++
>>   hw/core/machine.c              |   3 +
>>   hw/i386/pc.c                   |   7 +++
>>   hw/i386/pc_piix.c              |  14 ++++-
>>   hw/i386/pc_q35.c               |  13 ++++-
>>   include/hw/boards.h            |   3 +
>>   include/hw/i386/pc.h           |   3 +
>>   target/i386/cpu.c              |  22 +++++--
>>   target/i386/cpu.h              |  12 +++-
>>   target/i386/kvm/hyperv-proto.h |   1 +
>>   target/i386/kvm/kvm.c          |  62 +++++++++++++++-----
>>   12 files changed, 260 insertions(+), 24 deletions(-)
>>   create mode 100644 docs/kvm-pv.txt
>> 
>
> Queued patches 3-8, thanks.

Patch3 with the hunk to docs/kvm-pv.txt dropped I suppose (as PATCH2
introducing the file is not queued)? I can include it in the next
submission then.

Thanks!

-- 
Vitaly


