Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F1E41C884
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:34:22 +0200 (CEST)
Received: from localhost ([::1]:37596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbbA-0003qx-Mx
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVbWw-0001Z6-De
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:29:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVbWu-0004Od-H9
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632929395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReaOI7KXn28K8qNCdfleNEfEVIbJvR6Q6dCdT54QrwI=;
 b=Ftg1/7JzAazyRasJOPPgqgrPtHwj7v0UVlHpn6o55uQxPQsT6aMsb2YEy7pwkPY+DMvMmv
 qoENaHmcVLddEfovhQtdDHArgy8lMZyx19XphWGofJmNGsze+T/YXjiYmyymuvSQvh2vYL
 cy3Des1kx1OG2zGTgqNu+2JzSRz5qEQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-R8AaP3YcPN63ifKam2QaEQ-1; Wed, 29 Sep 2021 11:29:54 -0400
X-MC-Unique: R8AaP3YcPN63ifKam2QaEQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso2752124edj.20
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 08:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ReaOI7KXn28K8qNCdfleNEfEVIbJvR6Q6dCdT54QrwI=;
 b=b+cUgKWo2CySUlJzM48eY6+TedbR/RJbzKD0s5fkxOxswy3ccoX4M0J3PUO3AjDfA0
 RjPLmdJEW4q84iVpzqM3wSzJQ043Lv2NZEOBBbG73nxFKjMTpsY8Sds37qvLdfonFA9D
 SjMKWe5LVGuL8n0Eqz4T647AgCuzfDK5eWO7uitCo4Ges7zNG4N/KA4J7buo7rlpptwy
 obEkHV47W8daBLWWlI2bLLG3hZO/qQ+YJYXV/nabzLAtvBtq3femEorevtEzvwDBWFyw
 26RLyhpsojRP3drrb6UPukfqgFEROLACqex0Iv/Xitop4YuIbZXT55spjdGKcSF/4Uku
 dmgQ==
X-Gm-Message-State: AOAM532H14BBUL6vtJz/4ZbPV6hopgyEnEfZdPaDgjBOdM94KMuFuMii
 XWDQqisLgYXHKtCSHiesuYRf9lsW2/ZIfQ5/t0J1gs78L2iFhE0CkEhjfg4/05+zvnEPL+7fRWk
 OkxmDVuoIntgDDKM=
X-Received: by 2002:a05:6402:1011:: with SMTP id
 c17mr631315edu.144.1632929393021; 
 Wed, 29 Sep 2021 08:29:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzof8dHq0rzcleruG+BkdmdqZ/bCJekWl/wIed937kpFD+tt3Sm3W7jJZf70YgCDpTqUpUFFA==
X-Received: by 2002:a05:6402:1011:: with SMTP id
 c17mr631291edu.144.1632929392797; 
 Wed, 29 Sep 2021 08:29:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cf16sm77185edb.51.2021.09.29.08.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 08:29:52 -0700 (PDT)
Message-ID: <679f17f9-8b8e-fc76-6a9c-cedd791a483e@redhat.com>
Date: Wed, 29 Sep 2021 17:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/8] i386: Assorted KVM PV and Hyper-V feature
 improvements
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20210902093530.345756-1-vkuznets@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210902093530.345756-1-vkuznets@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
> This is a continuation of "[PATCH 0/3] i386/kvm: Paravirtualized features usage
> enforcement" series, thus v2.
> 
> This series implements several unrelated features but as there are code
> dependencies between them I'm sending it as one series.
> 
> PATCH1 adds empty 6.2 machine types and the required compat infrastructure
> (to be used by PATCH8)
> PATCH2 adds documentation for KVM PV features
> PATCH3 adds support for KVM_CAP_ENFORCE_PV_FEATURE_CPUID
> PATCH4 adds support for KVM_CAP_HYPERV_ENFORCE_CPUID
> PATCHes5-6 add 'hv-avic' feature
> PATCH7 makes Hyper-V version info settable
> PATCH8 changes the default Hyper-V version to 2016
> 
> Vitaly Kuznetsov (8):
>    i386: Add 6.2 machine types
>    i386: docs: Briefly describe KVM PV features
>    i386: Support KVM_CAP_ENFORCE_PV_FEATURE_CPUID
>    i386: Support KVM_CAP_HYPERV_ENFORCE_CPUID
>    i386: Move HV_APIC_ACCESS_RECOMMENDED bit setting to
>      hyperv_fill_cpuids()
>    i386: Implement pseudo 'hv-avic' ('hv-apicv') enlightenment
>    i386: Make Hyper-V version id configurable
>    i386: Change the default Hyper-V version to match WS2016
> 
>   docs/hyperv.txt                |  41 +++++++++++--
>   docs/kvm-pv.txt                | 103 +++++++++++++++++++++++++++++++++
>   hw/core/machine.c              |   3 +
>   hw/i386/pc.c                   |   7 +++
>   hw/i386/pc_piix.c              |  14 ++++-
>   hw/i386/pc_q35.c               |  13 ++++-
>   include/hw/boards.h            |   3 +
>   include/hw/i386/pc.h           |   3 +
>   target/i386/cpu.c              |  22 +++++--
>   target/i386/cpu.h              |  12 +++-
>   target/i386/kvm/hyperv-proto.h |   1 +
>   target/i386/kvm/kvm.c          |  62 +++++++++++++++-----
>   12 files changed, 260 insertions(+), 24 deletions(-)
>   create mode 100644 docs/kvm-pv.txt
> 

Queued patches 3-8, thanks.

Paolo


