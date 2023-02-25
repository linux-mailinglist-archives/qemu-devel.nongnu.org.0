Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8826A28B1
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 11:02:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrNC-0001NH-GP; Sat, 25 Feb 2023 05:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVrN4-0001CK-LP
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:01:43 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVrN0-0006xH-V3
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:01:37 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso1620324pjb.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 02:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JRxuu7nx2eKBD2RAPyu+eXUUfS7AAS5x5j6iGnoImwA=;
 b=YRRY7xE5D2AQ4NoUvIho7RXJdC+v7xIIEhMAHT/UYPu6Hlw/xfh61zKXi7YiGhXvWw
 +vVDKwENNXI8vCGfo9mmp06Xba1vdpYMRf6C9JHeGoMs+cR6mg5YmC7poGA8xsjx6nzZ
 JDSk0rOaQWrSZv+hTpPz/0gSEDIvHaGhHAbFEdsyUrsZEDvD/B5L8AWm6WQD2qaUTwd/
 ZSkTN8M4YYz6LsQNJY7wWRQnrV+Swto51BXXPRhFGc9J19GcsmTCNmhNbPJm9sYiA7T5
 JRkcsBOfv2+dpJs+jIXd6TThPdSuMcfi8N70xraBxvV12cmiPfsrKyum8XYpGswfzYb5
 r7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JRxuu7nx2eKBD2RAPyu+eXUUfS7AAS5x5j6iGnoImwA=;
 b=lgEeRf+k43Y9LVkFlkwPxjpdKqRtVr0tucgQV/7PvGQaFBagO7YUtrG6iU/yaRXxDk
 fJzBU4gISAqB7LYGJ5vgxRnYT6ytagqbqdDe5Xh818/TG042IJYGo+S0z53lI9rDF1gl
 Qv1mNTn8jbCYEk3FaE2nVXBYrOwxDCisuKW/ZtOfYqXmsL8eLmuyKPMP+hzNb6mJzoYS
 iNn/8YeGfOfpa70wGc17UXwhhEzrZRYU+YDqfqZiye4XjOciHZkDmMl9wGq6Fuv74zdy
 YwJptHi9Uyl0NrlgRs78pR3I0HKQ9nDqUa7QUO4iRWAfZyA4AxXGh4BaywMXGW6mVh4Y
 D+Yg==
X-Gm-Message-State: AO0yUKW9V7wEJeQZYvIRNFv4OHCafMdA0ifizWAdMzSTIfjqEKazRMKr
 ZSFf36IXn2i2U1S8oEje8C0IIw==
X-Google-Smtp-Source: AK7set9hpEo+CLZBacByW89sijaJgOpoxwMDq20xi4TmTKeJXkwOHmdaCl1p51CroHOI6zhGZmCKsQ==
X-Received: by 2002:a17:90b:4b83:b0:233:be7b:e71c with SMTP id
 lr3-20020a17090b4b8300b00233be7be71cmr22101304pjb.5.1677319293163; 
 Sat, 25 Feb 2023 02:01:33 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 l22-20020a656816000000b00478ca052819sm808828pgt.47.2023.02.25.02.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:01:32 -0800 (PST)
Message-ID: <0943d3c4-2ee2-21fa-1441-6262876f5bed@linaro.org>
Date: Sat, 25 Feb 2023 00:01:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 14/30] tcg: Use tcg_constant_ptr in do_dup
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
 <20230225085945.1798188-15-richard.henderson@linaro.org>
 <da634383-48cd-8b3d-b5b0-b6ca598cf1e2@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <da634383-48cd-8b3d-b5b0-b6ca598cf1e2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 2/24/23 23:53, Philippe Mathieu-Daudé wrote:
> On 25/2/23 09:59, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tcg-op-gvec.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
>> index a10d406bba..877b0b659b 100644
>> --- a/tcg/tcg-op-gvec.c
>> +++ b/tcg/tcg-op-gvec.c
>> @@ -630,7 +630,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
>>        * stores through to memset.
>>        */
>>       if (oprsz == maxsz && vece == MO_8) {
>> -        TCGv_ptr t_size = tcg_const_ptr(oprsz);
>> +        TCGv_ptr t_size = tcg_constant_ptr(oprsz);
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Can we remove tcg_const_ptr() or inline it in plugin-gen.c?

There's some cleanup in the next patch.
Is that the last use?  If so, we can remove it.


r~

