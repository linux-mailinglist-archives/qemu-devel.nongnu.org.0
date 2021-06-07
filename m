Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E17B39D849
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 11:07:45 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqBEV-0005KD-W8
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 05:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqBDY-0004ap-6p
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 05:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqBDV-0005uf-HG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 05:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623056800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbkvEggg+QM2uzgoTSpWCMiBNIAPM6bB2jUooCZoEN4=;
 b=VOSW5idp81lInUy4UCKD33ahuQD40UEeDeBi4Y6zcToqDxTqAluDsyeyQ1jib9nAv2nFIg
 bVrdpn2Q316kBqjSXJ4nb8QwbGRKP7yic9OqWZuKzpMh6URq7W3DvjVNYgJ93tukbMyfmy
 mYBmXmSu878P01cEscaAC4Z8aRt8UVY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-3MOPjGKSPQGY4apTlO8E3A-1; Mon, 07 Jun 2021 05:06:39 -0400
X-MC-Unique: 3MOPjGKSPQGY4apTlO8E3A-1
Received: by mail-wr1-f70.google.com with SMTP id
 e11-20020a056000178bb0290119c11bd29eso2715873wrg.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 02:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MbkvEggg+QM2uzgoTSpWCMiBNIAPM6bB2jUooCZoEN4=;
 b=iMoUSbF2obpYWW1/mAURDUUx3GfrwnGQYY5AHL3G/AP8siZZLJzMiMIuiCxYtj8kmw
 XKfhjAJlSAkGmD0cBPSYSgodes7kuiM/6rOpBNNPXr+wOPaihFCpqHPWDmQvpTG3kcWj
 dmDXk0UW6N2v/tlimXIUjS7kQ/H7LFRvqLQFVHAUpUV5fVzfl28TSLbZMarMk2Xl2MIA
 wO443cvcs7UhrOP1H7u84ZWE4GstSVuckpnELfbGUO/u1ozjzc3BDYWbcAyFmxrEydt9
 EErWTLOxBY22QWGFY89vJwSvXRc3hTE8vWPxIbvrsFFH3H7exe+XkYSZr8i5Rfq4xrSF
 E1/w==
X-Gm-Message-State: AOAM531NSGvjU1rEEKGfQDyBRNfCYH2r0D27o+TQIbpn3gXB7ha9jyyF
 wRFxk3b8QugmFNC7ESLjEoyb7t9leg5YCTjXR6mcE3eTs8eaaHbMLZ15D7TjYeShkYibKUkT/NN
 C7xAfZ1XVIwMxGmU=
X-Received: by 2002:a1c:a184:: with SMTP id k126mr15936624wme.82.1623056798439; 
 Mon, 07 Jun 2021 02:06:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmi6uYhIQXyJU3cOJV1Te+Ztyz7ZPYnCiHtvAhaI6cU2ZBVzg4lyqFxvjjUHrXxSOchzCYRg==
X-Received: by 2002:a1c:a184:: with SMTP id k126mr15936595wme.82.1623056798142; 
 Mon, 07 Jun 2021 02:06:38 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6188.dip0.t-ipconnect.de. [91.12.97.136])
 by smtp.gmail.com with ESMTPSA id
 h9sm13353156wmb.35.2021.06.07.02.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 02:06:37 -0700 (PDT)
Subject: Re: [PATCH v2 24/26] s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-25-david@redhat.com>
 <f02310d9-9655-0d4c-5fa5-480f8e4eec9a@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <52f61460-ab82-af00-04a7-11aefd6c3f65@redhat.com>
Date: Mon, 7 Jun 2021 11:06:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f02310d9-9655-0d4c-5fa5-480f8e4eec9a@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.06.21 20:13, Richard Henderson wrote:
> On 5/17/21 7:27 AM, David Hildenbrand wrote:
>> +    if (unlikely(nan_a || nan_b)) {
> 
> Perhaps better as (dcmask_a | dcmask_b) & DCMASK_NAN ?
> 
>> +        if (sig_a || sig_b) {
> 
> Similarly.
> 

Will do, thanks.

>> +    } else if (unlikely(inf_a && inf_b)) {
>> +        switch (type) {
>> +        case S390_MINMAX_TYPE_JAVA:
>> +            return neg_a && !neg_b ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;
>> +        case S390_MINMAX_TYPE_C_MACRO:
>> +        case S390_MINMAX_TYPE_CPP:
>> +            return neg_b ? S390_MINMAX_RES_B : S390_MINMAX_RES_A;
>> +        case S390_MINMAX_TYPE_F:
>> +            return !neg_a && neg_b ? S390_MINMAX_RES_B : S390_MINMAX_RES_A;
>> +        default:
>> +            g_assert_not_reached();
>> +        }
> 
> I don't understand why inf_a && inf_b gets a special case.  Inf is
> well-ordered. If the arguments are equal you can't tell the difference between
> them, so it doesn't matter whether A or B is returned.
> 
> I would pass this case along to S390_MINMAX_RES_MINMAX.

Thinking about it, that makes sense. I have no clue why the PoP has 
these special cases expressed in the tables, at least it managed to 
confuse me.

> 
>> +    } else if (unlikely(zero_a && zero_b)) {
>> +        switch (type) {
>> +        case S390_MINMAX_TYPE_JAVA:
>> +            return neg_a && !neg_b ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;
> 
> If neg_a && neg_b, both A and B are -0, and you can't distinguish them.  So
> this would seem to simplify to

Another case of "let's make the tables inconsistent to confuse David".

> 
>       neg_a ? S390_MINMAX_RES_A : S390_MINMAX_RES_B
> 
>> +        case S390_MINMAX_TYPE_C_MACRO:
>> +            return S390_MINMAX_RES_B;
>> +        case S390_MINMAX_TYPE_F:
>> +            return !neg_a && neg_b ? S390_MINMAX_RES_B : S390_MINMAX_RES_A;
> 
> Similarly if !neg_a && !neg_b, both A and B are +0.
> 
> Otherwise this looks good.

Agreed, thanks!


-- 
Thanks,

David / dhildenb


