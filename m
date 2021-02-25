Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F650324FC0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 13:16:59 +0100 (CET)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFZi-0003vI-7s
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 07:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFFYP-0003Pc-Py
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:15:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFFYL-0000P9-4l
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614255332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vykrYS+sxzkHOOmtF/52lMMUXyxGWC4o0RUntPvg5e4=;
 b=gLLCCietCcXhj6AEomiEuaqCpR4eLQzGznaoRvlzm3TFNxPIgeKw6P2kRXgjjdx0pYguBj
 4ndIz97j+rKHH9jJEEPZ5wa30pUcCFBFo/cbH561Agb8CjJt/iRtNJH86Qx1rTskZV9IDO
 VXWCqGMXZyQ0/AIFFn5y+VbgC3W3OG0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-hv5koOscN32vaqUqsKDulQ-1; Thu, 25 Feb 2021 07:15:30 -0500
X-MC-Unique: hv5koOscN32vaqUqsKDulQ-1
Received: by mail-ej1-f69.google.com with SMTP id bs10so2323040ejb.21
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 04:15:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vykrYS+sxzkHOOmtF/52lMMUXyxGWC4o0RUntPvg5e4=;
 b=fLjfwBz4xIx/+3Hf7PaO2H4eaRZWYprFB+aiuwqbRyq/NOllDmWvtfLp+PQv+R6LHU
 lM4q5Da8QIX53yoXAc9hoAjsmhlZj38SgwUW6vecZskrkwZsr0P/EAbFfyt+7HJF6JAY
 SWPrVHIJDcKKkYPOVjLe+S8zySApWK9rgxC8s4HJzas5WXZ4GdLW3cct2sF9+etb+La/
 VckkXhdAEgmr29yuFRBRaKrTbe70gNz3nNlBpp8EdGQTsJJ7d3Z/PjuAX8kk8GDZm0AY
 vyB8aLUxBk9vaw2Vcsmcz9EJrdFTBtjpNreJjJ3Vsb7RkkijzDgZmqH/j7owb1cWkEBm
 dyaQ==
X-Gm-Message-State: AOAM5336faCIrqCaHEQhnnXvNitgUjHuqYfhiFZDFMbUrcY9cUMOvr43
 DxEQ3tjMsxo1BTfaNIF/KHcQL25heNMRLreUAcGWKiVS6abeMOuyGBAdZdKWPFyDxe5gCOsWo0N
 iYK42u8vvQqIZv4yeI3Jhn3z6fpra7L8OImaKHMOIMonxVA/+hopODn0TnvQY5zaTGys=
X-Received: by 2002:a05:6402:1205:: with SMTP id
 c5mr2625049edw.222.1614255329360; 
 Thu, 25 Feb 2021 04:15:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGpLGyGnIzwRUqrFrUU07Equya68Pd76Nh/VdWhR7C1ACfnRRrIPt4BQzVs+geDXizTGev3g==
X-Received: by 2002:a05:6402:1205:: with SMTP id
 c5mr2625025edw.222.1614255329186; 
 Thu, 25 Feb 2021 04:15:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t16sm3433912edi.60.2021.02.25.04.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 04:15:28 -0800 (PST)
Subject: Re: [PATCH] tcg/i386: rdpmc: use the the condtions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Zheng Zhan Liang <linuxmaker@163.com>
References: <20210225054756.35962-1-linuxmaker@163.com>
 <433c4c21-be83-1cb9-91bb-0f855fd161ed@redhat.com>
 <8650b361-ecf1-2d24-c827-0e539bac62ec@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9ce76c44-1c9f-6c0c-0da9-e92198fe5858@redhat.com>
Date: Thu, 25 Feb 2021 13:15:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8650b361-ecf1-2d24-c827-0e539bac62ec@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/21 11:13, Philippe Mathieu-Daudé wrote:
> Hi Paolo,
> 
> On 2/25/21 11:07 AM, Paolo Bonzini wrote:
>> On 25/02/21 06:47, Zheng Zhan Liang wrote:
>>> Signed-off-by: Zheng Zhan Liang <linuxmaker@163.com>
>>> ---
>>>    target/i386/tcg/misc_helper.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/i386/tcg/misc_helper.c
>>> b/target/i386/tcg/misc_helper.c
>>> index f02e4fd400..90b87fdef0 100644
>>> --- a/target/i386/tcg/misc_helper.c
>>> +++ b/target/i386/tcg/misc_helper.c
>>> @@ -222,7 +222,8 @@ void helper_rdtscp(CPUX86State *env)
>>>      void helper_rdpmc(CPUX86State *env)
>>>    {
>>> -    if ((env->cr[4] & CR4_PCE_MASK) && ((env->hflags & HF_CPL_MASK)
>>> != 0)) {
>>> +    if (((env->cr[4] & CR4_PCE_MASK) == 0 ) &&
>>> +        ((env->hflags & HF_CPL_MASK) != 0)) {
>>>            raise_exception_ra(env, EXCP0D_GPF, GETPC());
>>>        }
>>>        cpu_svm_check_intercept_param(env, SVM_EXIT_RDPMC, 0, GETPC());
>>>
>>
>> Queued, thanks.
> 
> Do you mind fixing the patch subject?

Yes, done already actually.  Thanks,

Paolo


