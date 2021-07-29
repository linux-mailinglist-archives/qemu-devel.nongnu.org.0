Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D73DAA82
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 19:52:33 +0200 (CEST)
Received: from localhost ([::1]:41712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ACu-0004tz-DC
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 13:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9AC9-0004De-Ni
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:51:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9AC7-0004z6-3U
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:51:45 -0400
Received: by mail-pl1-x633.google.com with SMTP id e21so7862777pla.5
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=N0xmrVrACFAYJ+DiXEXf/PvPtfH1r5qsGkdILsev55w=;
 b=OqGtYt9AgDSzRl/7oKw2v+AUTl5nenx7meASCbi1QZFy0fgIXvGIVkweEOgXGWj7ng
 3WPgaU0kobyJ440CxviRBG6+lcondCtQJjg4vQBrXfs3H4tdW9T6WWTLpHVXLr22p1NS
 dZEjJpM0vtprOTF1mvQBXe+6rSSHVXX04xVE43iJM6YVOqBca/zsL3oNmhDP2s5ydV1w
 0FN1sV6JoEgYMkyOThf1Dt7d9GQ0PdI7PqebP8W7H49sLvfkHkQTP2C5J7M5wNA4BMud
 snaN5jsla8GPaVtaCVMR0qh5X2VaGebgo3q4i48Bpi3Gbo6fZKF9c5is+NftrhwEwYk7
 30XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N0xmrVrACFAYJ+DiXEXf/PvPtfH1r5qsGkdILsev55w=;
 b=IYiDHP+0R2AwAQ+O7/aF5ZW0qxJcyZoYmE5vGd2oBapdVVwZWDs0JpNyPDvrMfqi2Q
 MG5NNRpIdlyxM5jkxldpMW8RSnrsBy9etHVV0EC10kdd1/dxC6z0c3bnnAGbCQ0Lr52M
 9lmv4OLXp74O1tQR8J9KGy1Fw5JuALd5PjPUs2ECSGEByzZFdK2uyzQWch+O70JyFKdg
 X3qkV9ptIFi5Ac/ENygXylmKKdC6eEz5RnV3MQubRBo0TNbVl+Qj9pFcyxTVNNp29x7h
 gvyTUgU0LyQrUaYYPhzdoZHvbLNg6FwnquUn/ADD9lY+7QkxcVpTL9asdIA0AmScjR1r
 kB4g==
X-Gm-Message-State: AOAM533tf+RlEbSAeY+VFRvtw7jK4uu9hBZmjIeznWgH9A4QJsOGTut/
 5+FuOVpCdhZFr8YJ+PLzrBATNedH/xQtEw==
X-Google-Smtp-Source: ABdhPJxrqrwRxukQhInxmaKD7jwKQBTNbgmM4Ak/XAfQnEZ21C5T9SDuKmX0vQhYGJbRCUWcteGfkg==
X-Received: by 2002:a63:e405:: with SMTP id a5mr4901812pgi.150.1627581101542; 
 Thu, 29 Jul 2021 10:51:41 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id f18sm4196138pfe.25.2021.07.29.10.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 10:51:39 -0700 (PDT)
Subject: Re: [PATCH for-6.2 01/43] hw/core: Make do_unaligned_access available
 to user-only
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-2-richard.henderson@linaro.org>
 <b777e16d-8a5c-90bd-82cc-dc4d2b13945e@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba33a754-b6c6-0dbb-fb20-7d75d5b9883e@linaro.org>
Date: Thu, 29 Jul 2021 07:51:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b777e16d-8a5c-90bd-82cc-dc4d2b13945e@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 8:19 PM, Philippe Mathieu-Daudé wrote:
> On 7/29/21 2:46 AM, Richard Henderson wrote:
>> We shouldn't be ignoring SIGBUS for user-only.
>> Move our existing TCGCPUOps hook out from CONFIG_SOFTMMU.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/hw/core/tcg-cpu-ops.h | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>> index eab27d0c03..513d6bfe72 100644
>> --- a/include/hw/core/tcg-cpu-ops.h
>> +++ b/include/hw/core/tcg-cpu-ops.h
>> @@ -60,6 +60,13 @@ struct TCGCPUOps {
>>       /** @debug_excp_handler: Callback for handling debug exceptions */
>>       void (*debug_excp_handler)(CPUState *cpu);
>>   
>> +    /**
>> +     * @do_unaligned_access: Callback for unaligned access handling
>> +     */
>> +    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>> +                                MMUAccessType access_type,
>> +                                int mmu_idx, uintptr_t retaddr);
> 
> Shouldn't it be QEMU_NORETURN?
> 

I think in system mode we're allowed to return, letting the unaligned access continue. 
But I'm not sure about that, and it may not even be used.

r~

