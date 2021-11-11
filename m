Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50D44D542
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:48:12 +0100 (CET)
Received: from localhost ([::1]:60014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7cq-0003nu-4v
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ml7as-0002kY-2m
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ml7aq-00070Y-K2
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636627568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSNabNYEv4BIjvPa8ct5+AzhPZTQwnMAaU5NwfoPrV8=;
 b=GXwqFJplkGDDOCuqQsAHf6A0IRRp7sMd5l1E7DShpUm9D7gSQUXUabakAi/YwBcP43PP8N
 mVg0UEYv38YcAVfYfIofKqdMbO6CCS3IdH4ywAbRfeDUVXK9vY/V4n42xAHNzKm69hgIRM
 W9Rbsm8vqM6WlKVNKEjakvnI5DxtVl0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-Krp5QRbeO_yivnfG0i1QRg-1; Thu, 11 Nov 2021 05:46:06 -0500
X-MC-Unique: Krp5QRbeO_yivnfG0i1QRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 67-20020a1c0046000000b0032cd88916e5so2516330wma.6
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GSNabNYEv4BIjvPa8ct5+AzhPZTQwnMAaU5NwfoPrV8=;
 b=2YO5clxdOeTjetktz6sW4sbS6UDNtjRkhyrtrZxX+8TPYs/PGgItW0rhSK3SuhIMDe
 DG3CnfKEc8jl7aW+5FKAv0wOc7XR+jhKL8+1EdrPNkukyLhsRa8UPBKcQapLWdO1DQg1
 VqGvsVSwHj3dCcrb8GKrmVHnWJndNhIM5hlTAizvw4zXBlMjIctKd/zFV6JqvVl0GIK+
 1Amyn6Og7iKji6RESv3T0Qnd9Q8u0RuNGVZo3MFRT2vm00mcQerkkoJv4YPf4OBGNKos
 RuFVMNd+A/aLmlHi3ExTdA7xR056ZoVSgk6odpxlrMfTE8J6LBSr0VxUTSto0aokCxHr
 u7xw==
X-Gm-Message-State: AOAM533/uMx3/ff+GPLP/pNkksRjAlhT0VF9QalDj9Nd0tatlaBhWScM
 gKB/bvrYxXteCWHFg5BB7qkEGXGkHppkhlMCLbzq+HLsxOPbjNKIsL3wQiraPS+c+i/PoKwU0Wp
 lMrWT7xFl8iuovtY=
X-Received: by 2002:a05:600c:4f14:: with SMTP id
 l20mr23770947wmq.164.1636627565410; 
 Thu, 11 Nov 2021 02:46:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwt/ho9qCkklb1GbbCA9bmE1PR+/r9nron5TDJlr+JCNLo7+VT4CM2bA0uPWZGIR/LxpfDF7w==
X-Received: by 2002:a05:600c:4f14:: with SMTP id
 l20mr23770929wmq.164.1636627565233; 
 Thu, 11 Nov 2021 02:46:05 -0800 (PST)
Received: from [192.168.3.132] (p4ff23ee8.dip0.t-ipconnect.de. [79.242.62.232])
 by smtp.gmail.com with ESMTPSA id z6sm3187077wmp.1.2021.11.11.02.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 02:46:04 -0800 (PST)
Message-ID: <868d4d21-cd51-0224-9019-068e5465cfc4@redhat.com>
Date: Thu, 11 Nov 2021 11:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] Fix tcg_out_vec_op argument type
To: Thomas Huth <thuth@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
References: <20211027085629.240704-1-mrezanin@redhat.com>
 <b570034b-3e21-382e-0085-5d00560d8156@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <b570034b-3e21-382e-0085-5d00560d8156@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.21 11:42, Thomas Huth wrote:
> On 27/10/2021 10.56, Miroslav Rezanina wrote:
>> Newly defined tcg_out_vec_op (34ef767609 tcg/s390x: Add host vector framework)
>> for s390x uses pointer argument definition.
>> This fails on gcc 11 as original declaration uses array argument:
>>
>> In file included from ../tcg/tcg.c:430:
>> /builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:42: error: argument 5 of type 'const TCGArg *' {aka 'const long unsigned int *'} declared as a pointer [-Werror=array-parameter=]
>>   2702 |                            const TCGArg *args, const int *const_args)
>>        |                            ~~~~~~~~~~~~~~^~~~
>> ../tcg/tcg.c:121:41: note: previously declared as an array 'const TCGArg[16]' {aka 'const long unsigned int[16]'}
>>    121 |                            const TCGArg args[TCG_MAX_OP_ARGS],
>>        |                            ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
>> In file included from ../tcg/tcg.c:430:
>> /builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:59: error: argument 6 of type 'const int *' declared as a pointer [-Werror=array-parameter=]
>>   2702 |                            const TCGArg *args, const int *const_args)
>>        |                                                ~~~~~~~~~~~^~~~~~~~~~
>> ../tcg/tcg.c:122:38: note: previously declared as an array 'const int[16]'
>>    122 |                            const int const_args[TCG_MAX_OP_ARGS]);
>>        |                            ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Fixing argument type to pass build.
>>
>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>> ---
>>   tcg/s390x/tcg-target.c.inc | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
>> index 8938c446c8..57e803e339 100644
>> --- a/tcg/s390x/tcg-target.c.inc
>> +++ b/tcg/s390x/tcg-target.c.inc
>> @@ -2699,7 +2699,8 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
>>   
>>   static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>>                              unsigned vecl, unsigned vece,
>> -                           const TCGArg *args, const int *const_args)
>> +                           const TCGArg args[TCG_MAX_OP_ARGS],
>> +                           const int const_args[TCG_MAX_OP_ARGS])
>>   {
>>       TCGType type = vecl + TCG_TYPE_V64;
>>       TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Acked-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


