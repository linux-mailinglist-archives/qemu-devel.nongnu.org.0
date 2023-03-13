Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92E46B7F1A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 18:15:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pblkw-0002HJ-6v; Mon, 13 Mar 2023 13:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pblku-0002Go-7h
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:14:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pblks-0003fz-HF
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678727677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJP6VUkwFGYAY1BpgXT9Iu7NR1d5+Kne1UwV2XxOSPc=;
 b=WdAbYsIsH2J4Y5IX6FNrMuFLQteoSwbSamEF5jpG76u3QYqpZeGaDr05Z1dWsAqijwUOTc
 wz1RdtZ1c64mV1Ztb8LX5TFvGJd7v1KPLSwJ46zY5sBBFRQbzwFKKO+SVB5tla/dpk1SYh
 tWtEDOfF01OeHPW0xp6ATwvxaqx7Q3c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-wqbNm1MwMEyuRflEgB_fRw-1; Mon, 13 Mar 2023 13:14:17 -0400
X-MC-Unique: wqbNm1MwMEyuRflEgB_fRw-1
Received: by mail-wr1-f72.google.com with SMTP id
 i11-20020a5d522b000000b002ceac3d4413so673293wra.11
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 10:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678727650;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tJP6VUkwFGYAY1BpgXT9Iu7NR1d5+Kne1UwV2XxOSPc=;
 b=Ya0Dzj3H3kS8OX1K+geNDHEzteTsSJbT9TRoQSOKWB10Y7w66m4xzapgDPoU7G4gu0
 IFsmJpHiRPCqKkXGaY6yNgbRh2KnaabNbZaapTh073UASXhybTwdg6+skKp67To20uOy
 4yhNQBm2lYAM/s80cskEjgC88oA+aT2NS0q1Fc5kVnm/Y+WF0pMUPZKWJ1fbWANzfd2A
 pCtm+nydBBVeIzvuChF7XLXVK9i8YEVE9Jl0U4e3uCYgb9zJvrEc+Us/hPMh8k5eSwq3
 K5VEIkJfAAnQvbDf/Jo7s9hW7h+pLiu8MZf8+8+Gz3EjVYSohpn2ViR3tpa0iBcMsUR1
 pQUw==
X-Gm-Message-State: AO0yUKV25aN8a8sSQjbRl0IM01ddcZaOhRtxm6T8FB4IR4EQN2kGh2A7
 OHORVvHri5IqPLjn+X5XYug4f1+OTxepv70QQERJ6nW3RdhCGcXcYeQcWFPjPc7F3q6V11s1kuN
 KuDKFjuMDnSOnO7Y=
X-Received: by 2002:a5d:4f83:0:b0:2ce:a8e2:f89e with SMTP id
 d3-20020a5d4f83000000b002cea8e2f89emr4376261wru.46.1678727650508; 
 Mon, 13 Mar 2023 10:14:10 -0700 (PDT)
X-Google-Smtp-Source: AK7set8IIsXzX7tsPHYsgWKTUIfnUnCzl5pyG6pVrunrfidzr6la9MPKkcAwH7EFYI5o731bb3EIBg==
X-Received: by 2002:a5d:4f83:0:b0:2ce:a8e2:f89e with SMTP id
 d3-20020a5d4f83000000b002cea8e2f89emr4376247wru.46.1678727650220; 
 Mon, 13 Mar 2023 10:14:10 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 t18-20020a5d42d2000000b002ceb7a11eb9sm7986wrr.42.2023.03.13.10.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 10:14:09 -0700 (PDT)
Message-ID: <b23fcfab-cc1b-a861-94ed-217af69f1ef8@redhat.com>
Date: Mon, 13 Mar 2023 18:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org>
 <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
 <CAFEAcA94DQ9rhCwhXHUKQQG6QdWTVOLNEUcKk12t=_WVMtG--A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
In-Reply-To: <CAFEAcA94DQ9rhCwhXHUKQQG6QdWTVOLNEUcKk12t=_WVMtG--A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/03/2023 18.03, Peter Maydell wrote:
> On Mon, 13 Mar 2023 at 17:00, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 10/03/2023 11.31, Alex Bennée wrote:
>>> The kerneldoc processor complains about the mismatched variable name.
>>> Fix it.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    include/exec/memory.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>> index 6fa0b071f0..15ade918ba 100644
>>> --- a/include/exec/memory.h
>>> +++ b/include/exec/memory.h
>>> @@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>>>     *
>>>     * @notifier: the notifier to be notified
>>>     */
>>> -void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
>>> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier);
>>
>> I also keep running into this problem ... I wonder whether we should run
>> sphinx with "-W" to turn warnings into errors when configure has been run
>> with --enable-werror ...?
> 
> We certainly try to do that: docs/meson.build says:
> 
>    # If we're making warnings fatal, apply this to Sphinx runs as well
>    if get_option('werror')
>      SPHINX_ARGS += [ '-W' ]
>    endif
> 
> Has that broken ?

It apparently does not work in our CI, see e.g.:

https://gitlab.com/qemu-project/qemu/-/jobs/3922732898#L1420

... there is a warning here, but the job succeeded happily.

  Thomas


