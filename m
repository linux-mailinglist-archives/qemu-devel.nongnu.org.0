Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30427642B36
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 16:18:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2DCy-0002FB-92; Mon, 05 Dec 2022 10:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2DCv-0002Dz-5N
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 10:16:37 -0500
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2DCt-0007j4-8N
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 10:16:36 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 q2-20020a4a8e02000000b004a0236114ecso1740284ook.11
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2db1r/seusJTJ3hX8upDWGlzXSHsTv8WGLVobuiiQkI=;
 b=F7Oyydka+Iidf9HUuCHn+X8NH5TrMi9wby425NxPxKcCHPjrrgay90g6JoERDGaHrH
 /dP0mbjv6j6cAXB/mCeiNlLfYrJdSFtb/PYIASsSzZJiGQAw4fxqOb/l1Yp2wLjGGsRl
 B9YA9I61QERu8DJCNKFMGCnWs+JeRyHCkvNpjea5FpPPU4jTFDrs12Rnp4b5F1d+rN0Y
 ItvVuml/s8HbE4MPm+w0UdCFC+unCKaqguw6WpogTbifSes5szIEZC1Sjjjygp2OFhhc
 aWQcuogN+vPjfqxUnLRcz8rhrmG/F/Ha/INrOxArJAyb2t8hlCSacssx9ZwKnPIDQxM8
 yw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2db1r/seusJTJ3hX8upDWGlzXSHsTv8WGLVobuiiQkI=;
 b=Y96EWiRkBVgxygrxhebPkjFnqDSInWT8rgq9nPTH/jOQz0oilIB+AlspArVwW1odBm
 IpsdyOe7SG1dRHj1jIlSULOtJtsnEQp1EntF1No6DBoz4k3c8zGrNRjWc1lMTkPnVU/L
 y+X9kCjyn5tHKQ71OiUtALup0kq6IBm6IU24enfYFOiM/C6M9mxoctFkyzIMq9xHeJwR
 hhJ+OwGBckfV9gzatJXYRAN4kirGYYJCNhqdixiJMRJwDHCutwISvRK5U3jXg/tfrPSV
 z/AMEwgnTV5ldZMSarhQi9PSckOVm+fXvzmxEioEFNdA6r0ednxbFTNn+vJpLJOBVjq8
 8FXg==
X-Gm-Message-State: ANoB5pljZJzFq1LaDFtw+SVeRXg9qjKeklh4QJJvI+DF4yx+BwzRq04w
 nmiz9XFBgCGRWEC8ze5/uLNgHQ==
X-Google-Smtp-Source: AA0mqf5+7a4T3OUKANGmtM6nDkUDNOG5aZLy7vF2lxpZNhRCy96A+uTxsUpxfdOxBU7G2GWjUyvrIA==
X-Received: by 2002:a4a:8c23:0:b0:47f:d445:b435 with SMTP id
 u32-20020a4a8c23000000b0047fd445b435mr28102852ooj.87.1670253393300; 
 Mon, 05 Dec 2022 07:16:33 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:1a20:95f1:5a63:705b?
 ([2806:102e:18:70b5:1a20:95f1:5a63:705b])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a9d5d18000000b0066da36d2c45sm7833909oti.22.2022.12.05.07.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 07:16:32 -0800 (PST)
Message-ID: <8dd34ce4-276f-5bc0-4282-95075a02638a@linaro.org>
Date: Mon, 5 Dec 2022 09:16:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] util/bufferiszero: Use __attribute__((target)) for
 avx2/avx512
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, tstellar@redhat.com
References: <20221204015123.362726-1-richard.henderson@linaro.org>
 <20221204015123.362726-2-richard.henderson@linaro.org>
 <Y43TXpkMDYAZy18k@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y43TXpkMDYAZy18k@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 12/5/22 05:17, Daniel P. Berrangé wrote:
> On Sat, Dec 03, 2022 at 07:51:22PM -0600, Richard Henderson wrote:
>> Use the attribute, which is supported by clang, instead of
>> the #pragma, which is not supported and, for some reason,
>> also not detected by the meson probe, so we fail by -Werror.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   meson.build         |  8 ++------
>>   util/bufferiszero.c | 41 ++++++-----------------------------------
>>   2 files changed, 8 insertions(+), 41 deletions(-)
>>
> 
> 
>> diff --git a/util/bufferiszero.c b/util/bufferiszero.c
>> index ec3cd4ca15..1790ded7d4 100644
>> --- a/util/bufferiszero.c
>> +++ b/util/bufferiszero.c
>> @@ -64,18 +64,11 @@ buffer_zero_int(const void *buf, size_t len)
>>   }
>>   
>>   #if defined(CONFIG_AVX512F_OPT) || defined(CONFIG_AVX2_OPT) || defined(__SSE2__)
>> -/* Do not use push_options pragmas unnecessarily, because clang
>> - * does not support them.
>> - */
>> -#if defined(CONFIG_AVX512F_OPT) || defined(CONFIG_AVX2_OPT)
>> -#pragma GCC push_options
>> -#pragma GCC target("sse2")
>> -#endif
>> -#include <emmintrin.h>
> 
> So the old code included emmintrin.h, and possibly either
> immintrin.h / simmintrin.h, but the new code only
> includes immintrin.h.
> 
> I'm not saying that's wrong, I'm just wondering why it is
> changing, as it feels possibly tangential to the pragma
> -> attribute conversion. Could you mention this in the
> commit message, or split it to a separate cleanup patch
> if its a functionally unrelated change.

Adding

     Include only <immintrin.h> as that is the outermost "official"
     header for these intrinsics -- emmintrin.h and smmintrin.> are
     older SSE2 and SSE4 specific headers, while the immintrin.h
     includes all of the Intel intrinsics.


r~

