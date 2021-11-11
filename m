Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90C544D558
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:54:10 +0100 (CET)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7ic-0001cp-3t
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7hb-0000oa-Me
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:53:07 -0500
Received: from [2a00:1450:4864:20::32d] (port=55923
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7hZ-00084W-Sd
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:53:07 -0500
Received: by mail-wm1-x32d.google.com with SMTP id v127so4653673wme.5
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n1uCL1VN6zxS5Va/ClPLPdlVVBVB/zZjcjNUsMMQBu0=;
 b=pbsCRqZrdy1zhzWYChTAghz6F5rL9TqKLzb85ZR5X+UFvHaN7q8772CDjRr8Fab1r2
 Cs3Ch+OlvJxqRCVnOvPWpnGdQkltAt3UjgtZpEwPZDSslHgr0DiuK4FVnvTooDPH73uN
 QEzVuj1vGko524lMBzK/SZECwB1s6sXgdANARhfMHiEr9vAu0dc/kdPGY8l+LJ/hhnR3
 STIXwHfmzazERyXxYnLXeBDLbDic5PiuGTkjK8xlFtgEL9RfDGJC/TweoPTrTDIBEEHA
 t5JRB1L5eeBovVxsFZznhaOdrDmCmicJA71dVdUaG4zZhpgjL0DfF89pY5JXRGErrEQz
 mtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n1uCL1VN6zxS5Va/ClPLPdlVVBVB/zZjcjNUsMMQBu0=;
 b=5hOQPQFaC0UJkZLWGPDNhT3aqczKCaboOt7o8MspOe06v8YHEWWYj5Gj7iLmrhC7Xx
 vrzsMHO2cMMiTLXUKNIfn+LGC+JyeeZqcEfl3qrNEZjTWEAbued1IvIUyuouOkawKWfB
 CnirNVIv6+B2wedxXcrU2iDQ9dYXqbS4UCLZkkDj2eMGI6uS0E4wOUTv3e1uCSGFVpkJ
 Jx5UJdDoyGf9x3yRzauxNd1dJVmoS/1thrwJZIcta7Pey2cj8u269L5HHDSfZ6gngl8k
 i9JcfCJ6l8yRols+OdBfoUHFgujsVJvKrpf9nobVRbWeMeQK66KhufNbnP9MtEfGgO8i
 NumA==
X-Gm-Message-State: AOAM532Fm3drGB5Y0zFKQQ8iK1qvpXAdCBf671gnyCNEEwe71KBYqEDT
 zjwIZTUhhbvyQk8I5KfwY89Gdw==
X-Google-Smtp-Source: ABdhPJzFC3LvbnzsorNm1sA0MrLqtWmtb2W3x20vCvL7VYyCdQMJy3WXfgLBpikEcJwDdPGL4fbGmQ==
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr24509225wml.6.1636627984085; 
 Thu, 11 Nov 2021 02:53:04 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id l4sm2486732wrv.94.2021.11.11.02.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 02:53:03 -0800 (PST)
Subject: Re: [PATCH] Fix tcg_out_vec_op argument type
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel@nongnu.org
References: <20211027085629.240704-1-mrezanin@redhat.com>
 <b570034b-3e21-382e-0085-5d00560d8156@redhat.com>
 <868d4d21-cd51-0224-9019-068e5465cfc4@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <46a619c5-92a5-dba0-1793-c488e20fdaf2@linaro.org>
Date: Thu, 11 Nov 2021 11:53:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <868d4d21-cd51-0224-9019-068e5465cfc4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 11/11/21 11:46 AM, David Hildenbrand wrote:
> On 11.11.21 11:42, Thomas Huth wrote:
>> On 27/10/2021 10.56, Miroslav Rezanina wrote:
>>> Newly defined tcg_out_vec_op (34ef767609 tcg/s390x: Add host vector framework)
>>> for s390x uses pointer argument definition.
>>> This fails on gcc 11 as original declaration uses array argument:
>>>
>>> In file included from ../tcg/tcg.c:430:
>>> /builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:42: error: argument 5 of type 'const TCGArg *' {aka 'const long unsigned int *'} declared as a pointer [-Werror=array-parameter=]
>>>    2702 |                            const TCGArg *args, const int *const_args)
>>>         |                            ~~~~~~~~~~~~~~^~~~
>>> ../tcg/tcg.c:121:41: note: previously declared as an array 'const TCGArg[16]' {aka 'const long unsigned int[16]'}
>>>     121 |                            const TCGArg args[TCG_MAX_OP_ARGS],
>>>         |                            ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
>>> In file included from ../tcg/tcg.c:430:
>>> /builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:59: error: argument 6 of type 'const int *' declared as a pointer [-Werror=array-parameter=]
>>>    2702 |                            const TCGArg *args, const int *const_args)
>>>         |                                                ~~~~~~~~~~~^~~~~~~~~~
>>> ../tcg/tcg.c:122:38: note: previously declared as an array 'const int[16]'
>>>     122 |                            const int const_args[TCG_MAX_OP_ARGS]);
>>>         |                            ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Fixing argument type to pass build.
>>>
>>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>>> ---
>>>    tcg/s390x/tcg-target.c.inc | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
>>> index 8938c446c8..57e803e339 100644
>>> --- a/tcg/s390x/tcg-target.c.inc
>>> +++ b/tcg/s390x/tcg-target.c.inc
>>> @@ -2699,7 +2699,8 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
>>>    
>>>    static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>>>                               unsigned vecl, unsigned vece,
>>> -                           const TCGArg *args, const int *const_args)
>>> +                           const TCGArg args[TCG_MAX_OP_ARGS],
>>> +                           const int const_args[TCG_MAX_OP_ARGS])
>>>    {
>>>        TCGType type = vecl + TCG_TYPE_V64;
>>>        TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
> 
> Acked-by: David Hildenbrand <david@redhat.com>

Queued to tcg-next, thanks.


r~


