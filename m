Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E323658B10
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:34:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp8T-0003jg-Cp; Thu, 29 Dec 2022 04:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAp8Q-0003hH-AU
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:23:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAp8O-0002l9-Dk
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672305811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6Clfa2fQyP425ZyB81FVJqnwcV4cHwru0QUTRI8KrA=;
 b=ToAKCFjE4Nb5xJh82CSn4TT3XNFzfOwWDZ+6pme7x/rAOjXp2NXTwJfWirafWt8FwIotPN
 stcAqZeAozaM62IUWhMiht0Awdk2X6DMVRJACGFQMJ+AtBBgwzCpdIc/4CeY2QGjra9vHS
 fSFVAZehR+MrYjMlhlfYl2Fx06LgEH8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-oMCUV4wDP7GnYGeJG8WCpA-1; Thu, 29 Dec 2022 04:23:29 -0500
X-MC-Unique: oMCUV4wDP7GnYGeJG8WCpA-1
Received: by mail-wr1-f71.google.com with SMTP id
 w20-20020adf8bd4000000b00272d0029f18so1758222wra.7
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 01:23:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6Clfa2fQyP425ZyB81FVJqnwcV4cHwru0QUTRI8KrA=;
 b=7RkmKjoH0ZudO9KP0cX4ZPZq9Bb3emD2K43S2HWT2CZka1Hy+7H3+PXkXIiL1T9L3O
 Mv1lrbXMej5nCwm4Pgii6/GBPYFw8szbDVhASXtLFyBeAfM8aBEqjWz5XXl6oVtIl0dQ
 8+cO298kFpExskLJcLwskegP+BYEJEN/eSf8m378KylqoGLXith5j+4hStqc9bos8uvL
 glxrns8csiHolFJamZT92+G0cHtJxT9Tu/PV6WnuFSFy2DKrPepBw1kMtiIR7uXc0wHs
 GWrFyOW0GamHOtnW7NSGLNE/Oj5eXVxMTXVvJG4IbkPjFZKijqeERz65iZbuaZchmK0i
 vz0w==
X-Gm-Message-State: AFqh2kqfvncc3H9v9yeDw4Rn+HbQ+hRdxc9boCxdj8o0tdWNQuA2OLrs
 vFHAylnSy8hYkfD/bt5ctficimzdHVbJk8phXAEqjCzqgjHyUFNwrr2mcTqFw39TrzzPlSW2cNM
 lixJTPD1k7AYd4Ko=
X-Received: by 2002:adf:de0e:0:b0:242:63e5:2449 with SMTP id
 b14-20020adfde0e000000b0024263e52449mr17894877wrm.69.1672305808748; 
 Thu, 29 Dec 2022 01:23:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuKBBjOvp0h00iIMxgP5Bz+pUYeBZtMPOQ2EB/sObG3FHs1z62PhlefuvJmPu6nsNrprkNlFA==
X-Received: by 2002:adf:de0e:0:b0:242:63e5:2449 with SMTP id
 b14-20020adfde0e000000b0024263e52449mr17894846wrm.69.1672305808309; 
 Thu, 29 Dec 2022 01:23:28 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 e16-20020adfdbd0000000b002362f6fcaf5sm17560959wrj.48.2022.12.29.01.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:23:27 -0800 (PST)
Message-ID: <04ea3866-cda5-e27a-a89e-f1d7f0803282@redhat.com>
Date: Thu, 29 Dec 2022 10:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/5] hw/s390x/pv: Un-inline s390_pv_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221217152454.96388-1-philmd@linaro.org>
 <20221217152454.96388-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221217152454.96388-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/12/2022 16.24, Philippe Mathieu-Daudé wrote:
> There is no point in having s390_pv_init() inlined. Directly
> call s390_pv_kvm_init() guarded by kvm_enabled() so the compiler
> can elide when CONFIG_KVM is not set.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/s390x/pv.c              |  4 +++-
>   hw/s390x/s390-virtio-ccw.c |  6 ++++--
>   include/hw/s390x/pv.h      | 13 -------------
>   3 files changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 8dfe92d8df..17c658402d 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -251,7 +251,9 @@ struct S390PVGuestClass {
>   
>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>   {
> -    if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
> +    assert(kvm_enabled());
> +
> +    if (!cgs || !object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
>           return 0;
>       }
>   
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 2e64ffab45..d9a96e315e 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -255,8 +255,10 @@ static void ccw_init(MachineState *machine)
>       /* init CPUs (incl. CPU model) early so s390_has_feature() works */
>       s390_init_cpus(machine);
>   
> -    /* Need CPU model to be determined before we can set up PV */
> -    s390_pv_init(machine->cgs, &error_fatal);
> +    if (kvm_enabled()) {
> +        /* Need CPU model to be determined before we can set up PV */
> +        s390_pv_kvm_init(machine->cgs, &error_fatal);
> +    }

This now slightly changed the order of the checks ... if cgs is set, but kvm 
is disabled, there is now no error message anymore and the code continues 
silently. That sounds wrong?

  Thomas


>       s390_flic_init();
>   
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index 9360aa1091..fad61cc6c6 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -12,7 +12,6 @@
>   #ifndef HW_S390_PV_H
>   #define HW_S390_PV_H
>   
> -#include "qapi/error.h"
>   #include "sysemu/kvm.h"
>   
>   #ifdef CONFIG_KVM
> @@ -78,17 +77,5 @@ static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }
>   #endif /* CONFIG_KVM */
>   
>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> -static inline int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp)
> -{
> -    if (!cgs) {
> -        return 0;
> -    }
> -    if (kvm_enabled()) {
> -        return s390_pv_kvm_init(cgs, errp);
> -    }
> -
> -    error_setg(errp, "Protected Virtualization requires KVM");
> -    return -1;
> -}
>   
>   #endif /* HW_S390_PV_H */


