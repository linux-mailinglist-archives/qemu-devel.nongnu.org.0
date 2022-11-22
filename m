Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D086341ED
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 17:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWXW-0007Mh-A6; Tue, 22 Nov 2022 11:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxWXS-0007MJ-OG
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:54:26 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxWXR-0003sE-6b
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:54:26 -0500
Received: by mail-pl1-x631.google.com with SMTP id g10so14203743plo.11
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 08:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f7KdshWuL1yf6kd8agMOKkFodgzZ5x9rXv/QSBjmsKk=;
 b=UWwcG14HEFpjixrxNVobhGNRJTc9VujBMUpRpSUu3POrrCpRs9UHJgPuOslAU/+JSY
 FO4PYanOEDDobCJoxuOb0MrAhUBCwmwRWLqyjVA7LcHIYHUZCqLu1GjiyLKAo3uO/ssC
 Pii/TCnUfoDrEBvM8t3Mxp8e1bJzLCkjEZA4y3DVwE+UkAvk9q6x/GaPeybvkJ6cP/vo
 Ts9fkFgbDiY1O9ViBU4LzRi9TFCNfNUh5N7VVyiGVu5c9sHEzC1tk7HDXyZIC8HvPNhj
 pzIGpioiijcWGSaUm/wroVv6wTACWBjuRB45zYqtcbYRBFckcbmN+8Q0PluEugsi6Tpd
 gAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f7KdshWuL1yf6kd8agMOKkFodgzZ5x9rXv/QSBjmsKk=;
 b=1Ch91uY/k6lBU87xB6p51cUUqWpljuOhKE7lfC+WmHwvf4Ig1lGs8cDeH0AjdtSW1b
 Svpu3q+eBZ/H8HBgFiWz6hF1CJW37d25x4xDuRZzolVWhV/Am7G2G+2GmsShaKcurD4E
 f1gC3iYPV1lpMENWWjQiwDCMzLXxK6mdXPsNzyGysbYjglGGCDYRxQM7GA/fpfbhAf2d
 2GpnYXdAZMfxHGx2CP83mfpuTnkLrhcH9tLeGkPkSUrZzVPUbV/NRG1lp2mU3HBQcf0S
 2gl4V8PD58YVsc50zMtM2g+uraed0v0A7LihnsgTz+wWv1LG2lIHIEqQV2cwLIVksXDx
 lcMA==
X-Gm-Message-State: ANoB5pnG1zF2KWq+pTiIBtFcUSLKxbnVtTTzl7gYiRcXBINFk80MNv3l
 epWwZsVHhv6NbBJ1rOgqNY3zDQ==
X-Google-Smtp-Source: AA0mqf4X7t3tynMbtqkCO+7R8LDQJ743gtLB9UGjTHK7wH0XWKP78XBW2cXTOfBuTOtf7Otyz3DQXg==
X-Received: by 2002:a17:902:f391:b0:178:71f9:b8fc with SMTP id
 f17-20020a170902f39100b0017871f9b8fcmr5030641ple.44.1669136063523; 
 Tue, 22 Nov 2022 08:54:23 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90f5:6f8b:e78a:4a0?
 ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170902969100b001871acf245csm2942219plp.37.2022.11.22.08.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 08:54:22 -0800 (PST)
Message-ID: <ad677647-423e-0ce9-8cc9-68cb0849c320@linaro.org>
Date: Tue, 22 Nov 2022 08:54:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 v3 14/45] tcg: Introduce tcg_type_size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-15-richard.henderson@linaro.org>
 <6e038f52-6736-ec37-5f67-bbc41e83a228@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6e038f52-6736-ec37-5f67-bbc41e83a228@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 11/22/22 03:30, Philippe Mathieu-Daudé wrote:
> On 11/11/22 08:40, Richard Henderson wrote:
>> Add a helper function for computing the size of a type.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/tcg/tcg.h | 16 ++++++++++++++++
>>   tcg/tcg.c         | 26 ++++++++++++--------------
>>   2 files changed, 28 insertions(+), 14 deletions(-)
>>
>> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
>> index f2da340bb9..8bcd60d0ed 100644
>> --- a/include/tcg/tcg.h
>> +++ b/include/tcg/tcg.h
>> @@ -319,6 +319,22 @@ typedef enum TCGType {
>>   #endif
>>   } TCGType;
>> +/**
>> + * tcg_type_size
>> + * @t: type
>> + *
>> + * Return the size of the type in bytes.
>> + */
>> +static inline int tcg_type_size(TCGType t)
>> +{
>> +    unsigned i = t;
>> +    if (i >= TCG_TYPE_V64) {
>> +        tcg_debug_assert(i < TCG_TYPE_COUNT);
>> +        i -= TCG_TYPE_V64 - 1;
>> +    }
>> +    return 4 << i;
> 
> I'd feel safer if we assign TCG_TYPE_I32 .. TCG_TYPE_V256 in TCGType,
> just in case.

What do you mean?

r~

