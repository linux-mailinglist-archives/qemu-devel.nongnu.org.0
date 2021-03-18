Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACB4340A25
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:25:31 +0100 (CET)
Received: from localhost ([::1]:58456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvSe-0004S0-NR
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMvAx-0003wJ-HA
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:07:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMvAr-0003mE-KS
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616083620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVo5JH+vGu60uHhHX5nnyx+nk+LURsoWNrBf8MGIOWI=;
 b=WJdD0uPuw3pkiILN9MXAazBr4rb70oF4VZb1j9kRJ+kzYPe8uzimA0+X8jeL+rceXxGWOO
 pIO6kya/zbktcrByWA+xV9LHyHpLD6I4fse1i55uNCgD8ks/t+glVTbb0KhP/X6DrlymRb
 VnYbBpiC6sw4ivoqQaJkZSuYE82MIjM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-1oSHxGgZNniKJbkZPeVZrw-1; Thu, 18 Mar 2021 12:06:57 -0400
X-MC-Unique: 1oSHxGgZNniKJbkZPeVZrw-1
Received: by mail-ed1-f70.google.com with SMTP id bm8so8315087edb.4
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DVo5JH+vGu60uHhHX5nnyx+nk+LURsoWNrBf8MGIOWI=;
 b=e7jc6broN90dYA7f4F5W/m6B/xf/5aKEVxJ4VWEGyJxCNahEb51eaifCs1G33j/v22
 0G95Ne3oaibSW/9HkddkSEVVmCqOC/VDxi2hh6ruwh90BIr8o33PniYBlN3ZC/p6Oc+D
 P4jeOyw3TpM/Pr5l1Q4bKCxPIqaILUGSUvm2cjB+FgZY4UzOEuQgo6lePmEkA6Mb7Z2l
 +j54wxQf/IIFFBvUDyFQQXlkpUkm1FHszjko7l5VVKpaFwAJu0ETFB7lvRRHVpO8JBLQ
 qkZoBRemUe7xZjRlijp82KPf6Hbam2y27667VAD4WgXduzKfx3zVgd4rjeAO2BJF0wbs
 j9sw==
X-Gm-Message-State: AOAM533jRMD3WnVu3o+91I4MhqjWALNCpNeTC1g45QJeeEv8Y8f8OUyf
 ZBPytnIF7Ge0z3TGYcOVXDsWmtKjSn3XvT/tsrDHjU6MImlMQQorIos5vFdqMss8cPc8UuvJSXD
 wHZZ8UVPqSDCsCKM=
X-Received: by 2002:a17:906:8546:: with SMTP id
 h6mr41047942ejy.23.1616083616370; 
 Thu, 18 Mar 2021 09:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOxO5xXi/tu8TXve6PNPuPdnXVNY2fIYObTJ82F2Y8Mh/S9l0pNpKnEApLUS1YcyhJGrUVbw==
X-Received: by 2002:a17:906:8546:: with SMTP id
 h6mr41047927ejy.23.1616083616235; 
 Thu, 18 Mar 2021 09:06:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y12sm2189237ejb.104.2021.03.18.09.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 09:06:55 -0700 (PDT)
Subject: Re: [PATCH 1/3] i386: Make Hyper-V related sections KVM only
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-2-vkuznets@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <060ef1a9-0447-ddac-4694-7aba4676a36b@redhat.com>
Date: Thu, 18 Mar 2021 17:06:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210318160249.1084178-2-vkuznets@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 17:02, Vitaly Kuznetsov wrote:
> Currently, Hyper-V enlightenments are only implemented by KVM so there's no
> need to have corresponding vmstate_x86_cpu sections when !CONFIG_KVM.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

I expect WHPX may implement at least some, so I'll leave this out.

Paolo

> ---
>   target/i386/machine.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/i386/machine.c b/target/i386/machine.c
> index 3967dfc25763..a4777a73b0a9 100644
> --- a/target/i386/machine.c
> +++ b/target/i386/machine.c
> @@ -697,6 +697,7 @@ static const VMStateDescription vmstate_mpx = {
>       }
>   };
>   
> +#ifdef CONFIG_KVM
>   static bool hyperv_hypercall_enable_needed(void *opaque)
>   {
>       X86CPU *cpu = opaque;
> @@ -895,6 +896,7 @@ static const VMStateDescription vmstate_msr_hyperv_reenlightenment = {
>           VMSTATE_END_OF_LIST()
>       }
>   };
> +#endif
>   
>   static bool avx512_needed(void *opaque)
>   {
> @@ -1484,6 +1486,7 @@ VMStateDescription vmstate_x86_cpu = {
>           &vmstate_msr_ia32_feature_control,
>           &vmstate_msr_architectural_pmu,
>           &vmstate_mpx,
> +#ifdef CONFIG_KVM
>           &vmstate_msr_hypercall_hypercall,
>           &vmstate_msr_hyperv_vapic,
>           &vmstate_msr_hyperv_time,
> @@ -1492,6 +1495,7 @@ VMStateDescription vmstate_x86_cpu = {
>           &vmstate_msr_hyperv_synic,
>           &vmstate_msr_hyperv_stimer,
>           &vmstate_msr_hyperv_reenlightenment,
> +#endif
>           &vmstate_avx512,
>           &vmstate_xss,
>           &vmstate_umwait,
> 


