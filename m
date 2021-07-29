Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA63D9EFF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:52:15 +0200 (CEST)
Received: from localhost ([::1]:47188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90py-00041I-KH
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m90p1-0003Ix-F1
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m90ox-0002qO-QH
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627545064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HsLTN2oiSH4yAzKoRBtKqsJ7yLD4zaGlQUK1u4rCkM=;
 b=UqwLNn0O0IMEKkvGrB3a/e0hzUIiBQuV+t4HJY2S99bO53uG+55sZKjhezhN8EUrPqjm17
 /4BfpOX7bgslkn8skBxk709/uGsH/dfL+dS1Qh9Y02cH1Q7cpuaJmkmR1muxBfyzXrt2hH
 6GfVdhPD/1j1XUVfVeX+KNkohiSoeCg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-nJVnOk1gO8Sf2S8I69nWdw-1; Thu, 29 Jul 2021 03:51:02 -0400
X-MC-Unique: nJVnOk1gO8Sf2S8I69nWdw-1
Received: by mail-ej1-f71.google.com with SMTP id
 q19-20020a170906b293b029058a1e75c819so1665241ejz.16
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 00:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1HsLTN2oiSH4yAzKoRBtKqsJ7yLD4zaGlQUK1u4rCkM=;
 b=A3SBVJvvqcb0KWNOXxTb84HpHRapUlYW5Bdfe6nU3EHu9txsKmEsMq4VgJfeGdPHin
 Q5ZGYPKej7iJ0Yu4zeC7l0iXHYX1gAcotd37Ijqqxtn+lHw+5Surci7fyV8+lp8vzjbh
 O5R25pU6he/Mz5ySp1ZoYVE9jtRfH7LRvaQLxtD8VPV/NHIqFJUFUYT04HlnnjVK2RjI
 JIVWYSqCYu0aoS3n7A8OGuLl3f8R+VAGeYOkkxpdIEnenoZlmo5B9Ldzj7X3A8WGSlUJ
 79toryix5L5NvwoaS0pOhXBec2AuYLc5pfjlla3CVnGFVIFAzXRU/gLka1hsEAEZOW2v
 KzPg==
X-Gm-Message-State: AOAM530R/D7aQJ/PIdHVRtmIW/Mbdr+vXh+as3G2rksYv4ss7c8HeA+0
 XBpRHLGMtRVDejtLAC2S7w22tRcAMgE9P33/A3TsirNS/LoCqwKWjOIpIAgqgTLbskgwKFkJWkZ
 /KWFk5iW0zWmq2Kk=
X-Received: by 2002:a17:906:dc90:: with SMTP id
 cs16mr3293998ejc.368.1627545061820; 
 Thu, 29 Jul 2021 00:51:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6h01IMa0vNuMyLTUHHPRcOhmh8SeTQmNoAQb8juASX+hmAMJhICCJU5OfdAh9Kev5RH5atQ==
X-Received: by 2002:a17:906:dc90:: with SMTP id
 cs16mr3293985ejc.368.1627545061652; 
 Thu, 29 Jul 2021 00:51:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id s15sm815008edd.67.2021.07.29.00.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:51:00 -0700 (PDT)
Subject: Re: [PATCH 2/2] i386: Fix coding style in kvm_hyperv_expand_features()
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210716115852.418293-1-vkuznets@redhat.com>
 <20210716115852.418293-2-vkuznets@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f97532bb-9df3-f27f-6fbb-7f0b4679526b@redhat.com>
Date: Thu, 29 Jul 2021 09:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716115852.418293-2-vkuznets@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/07/21 13:58, Vitaly Kuznetsov wrote:
> QEMU coding style requires braces around bodies of ifs.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>   target/i386/kvm/kvm.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index e69abe48e3f8..28ca682b1089 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1219,8 +1219,9 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>       Error *local_err = NULL;
>       int feat;
>   
> -    if (!hyperv_enabled(cpu))
> +    if (!hyperv_enabled(cpu)) {
>           return true;
> +    }
>   
>       /*
>        * When kvm_hyperv_expand_features is called at CPU feature expansion
> @@ -1228,8 +1229,9 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>        * when KVM_CAP_SYS_HYPERV_CPUID is supported.
>        */
>       if (!cs->kvm_state &&
> -        !kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID))
> +        !kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID)) {
>           return true;
> +    }
>   
>       if (cpu->hyperv_passthrough) {
>           cpu->hyperv_vendor_id[0] =
> 

Queued both, thanks.

Paolo


