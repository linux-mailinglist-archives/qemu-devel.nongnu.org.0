Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2B64FB58
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:38:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6b82-0002Cr-8P; Sat, 17 Dec 2022 12:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6b80-0002A8-Gw
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:37:40 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6b7y-0003zy-Sz
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:37:40 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so9153195pjp.1
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0S3HrYOPdp1IO8+IiEU3LAvFsnuMdZ0o6U5aUTUBGLA=;
 b=gYmLhMChVZVPyugOC+Le0w5wHQBWDvkSo1oARUdkgqELjZ5pbgZEHdHm51RundtMD2
 solscdwZ9fqfu1+doh5MOH9M0IVypAKHYAnplnSE8+dhzey3tPQ/d+Ojj9ZjW6B/uCUI
 0xo8rTrAtXV6Y4cNc+6L9rkVVyh9MakrYSxNzvFGGjq3uApJsp/S3O8jO3jrsl+yfMHS
 9uviid1F1a8HIadUcvGiWZKPArnHeJ2giZVvz6Vqak6g378Cr1Nn1wFclkLxGtAY0EV1
 d7/bn3GJnfCou+DZdpiMQg+MQzWtiynpBHPPksnhVZJuMYDj5ktPiio/MZ+Cy6gUfazr
 H2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0S3HrYOPdp1IO8+IiEU3LAvFsnuMdZ0o6U5aUTUBGLA=;
 b=45hqrYqexKOhSYAo9mBjd7Gpu++wxqmMEMOtXnhXUy1d4VHxwbEdIZSb1qA1yA023p
 LImU5gCxY9NibT7DCSY5KrBXzbyOIOxerKw/wujS5lucuPMEtNpIr9QxP/SekDm7Ee41
 PkT3SXzSxcMx6cFirRWC3t9S/8kTsGCUFf2fAwE8b8f3aVUnYVVRTtNQQWWClc+jt5On
 8bJK34cchhfJSqFVp8t3JjePwpPYHAnrVuJ6/sRv4NNjQa7pmhmPr85yoj1YH3gIXXjS
 raebXvf83Y32xS0u95eEceEQj24weR0hgESl7ybcGFOLVb3KfTTKJ1Nu+MMTt7+SdiV3
 IUzQ==
X-Gm-Message-State: AFqh2krDxYy1nST8co39unbewkKl5Bc03wbwovjghR0J+Uo3PTVvlNJ/
 2j+CrE/BNGUBTLBdI9OUuqt82g==
X-Google-Smtp-Source: AMrXdXuNdSEVOv1fXai3UOj7MgaHFdY0tCEDVOGl4YqjS8+AAEXieYi8SSnWrBSGOHX9TS2Dq68n4g==
X-Received: by 2002:a17:90b:88d:b0:223:9b0d:15ab with SMTP id
 bj13-20020a17090b088d00b002239b0d15abmr5656453pjb.12.1671298656824; 
 Sat, 17 Dec 2022 09:37:36 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:dbe7:d50a:f977:e69b?
 ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090a39c700b00200461cfa99sm6578348pjf.11.2022.12.17.09.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 09:37:36 -0800 (PST)
Message-ID: <b76158c6-fba7-3314-ab8f-edfbe342d56f@linaro.org>
Date: Sat, 17 Dec 2022 09:37:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/5] hw/s390x/pv: Un-inline s390_pv_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221217152454.96388-1-philmd@linaro.org>
 <20221217152454.96388-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221217152454.96388-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/17/22 07:24, Philippe Mathieu-Daudé wrote:
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
>   
>       s390_flic_init();...
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

You've lost the error path above.  And it seems like we could just handle null cgs early. 
E.g.

     if (machine->cgs) {
         if (kvm_enabled()) {
             s390_pv_kvm_init(machine->cgs, &error_fatal);
         } else {
             error_report(...);
             exit(EXIT_FAILURE);
         }
     }

(since qabi/error.h says not to use error_setg(&error_fatal, ...)).


r~


