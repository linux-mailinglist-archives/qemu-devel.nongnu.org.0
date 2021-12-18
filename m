Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679DE47982D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 03:29:17 +0100 (CET)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myPTI-0006cb-0Q
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 21:29:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myPSJ-0005tl-Ht
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 21:28:15 -0500
Received: from [2607:f8b0:4864:20::1030] (port=51755
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myPSH-0005oN-NG
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 21:28:15 -0500
Received: by mail-pj1-x1030.google.com with SMTP id v16so3827187pjn.1
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 18:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N0QOipPP7DsYNeWn9pbEZ2skR01k5Yp1HkOfR7OV6cs=;
 b=b44xbkJibl9cXvB18hOWr4we+XTnj5ZsYmKikLQRR4l3/crmzLjWRz0oKrHhLQsWFw
 Hees2Xl4Y7+dOvrsDCGdWt7Z5fVmH05NU3oYbOW4kFDDwIAiRD1XjhRD7hDThTze5az/
 rcsAvK0u4Ib6kwTY3j04r2pAvHxnw0ASmhPZJbEieB+cVdNVUsnBDWTCY6ELf1RNXtWM
 1pqNQeBGO+He78TFSFiPtccsdHA1BKhNRBt5AGA6YCryGY5BrFb3JnCEq4leZt1bYveh
 vfglcruzuQ5p8dZITZxDUCwcVsMfRIgT19SqsQfJaCzhxP9ezyW+tma4noKI9tRkpdbS
 SKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N0QOipPP7DsYNeWn9pbEZ2skR01k5Yp1HkOfR7OV6cs=;
 b=egECdaUCy36CEfWPJHoJ+PPhFB93aHP0HsL5sugRQX165zTJf/c6sSx+a+QqLVgSO/
 HXaznK69SzoqgsfLxwZ1IHca2nND16zCBHxc7CL4JTbaEYRshKv5Yyc7sDcJrk0v/8Qq
 Od/LT9HdSTcIshBSQF0NxVrzh78XHLyacKcwK+kywyKUs86iEAIykIBQPaBoGZNfpexs
 eoqRVTo5rHGDDYoCC/5fjeAXzBYU9l3EAJd2VSFIjB75uzo+a+Xs2PtAuqATc/IzoRhN
 q9relwIa7FSvlCW1IczRhSAWcMUQBFC3Vuip7C+ARBy/Lwcp1Cmlkbl87rtJEmLpIQYx
 V5Nw==
X-Gm-Message-State: AOAM533YFITbP9mHDijaDOulSWiripesYWpdejol9Zbak6cSZ6k8eqXF
 C63TUjgATfpqpvtXDVm7sg8HDA==
X-Google-Smtp-Source: ABdhPJwoch+dDEL4KLakp2wlAEWD7FQYl2xT4lATGa+RRJ1MhJmhj8ChZXBIwDSFy35of5e1hgfRmw==
X-Received: by 2002:a17:90b:4b41:: with SMTP id
 mi1mr15267036pjb.2.1639794492239; 
 Fri, 17 Dec 2021 18:28:12 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s25sm1263270pfg.208.2021.12.17.18.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 18:28:11 -0800 (PST)
Subject: Re: [PATCH] hw/timer/etraxfs_timer: Add vmstate for ETRAX timers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211106105623.510868-1-f4bug@amsat.org>
 <8f417138-a3bb-7d07-bda9-db4740550f2f@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5cad7d04-1699-35d2-8d96-b236d451101d@linaro.org>
Date: Fri, 17 Dec 2021 18:28:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8f417138-a3bb-7d07-bda9-db4740550f2f@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 3:37 PM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 11/6/21 11:56, Philippe Mathieu-Daudé wrote:
>> Add the vmstate for the ETRAX timers.
>> This is in theory a migration compatibility break
>> for the 'AXIS devboard 88' CRIS machine.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/timer/etraxfs_timer.c | 34 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 33 insertions(+), 1 deletion(-)


In that it matches another similar timer device:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


>> +static const VMStateDescription vmstate_etraxfs = {
>> +    .name = "etraxfs",
>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_PTIMER(ptimer_t0, ETRAXTimerState),
>> +        VMSTATE_PTIMER(ptimer_t1, ETRAXTimerState),
>> +        VMSTATE_PTIMER(ptimer_wd, ETRAXTimerState),
>> +
>> +        VMSTATE_UINT32(wd_hits, ETRAXTimerState),
>> +
>> +        VMSTATE_UINT32(rw_tmr0_div, ETRAXTimerState),
>> +        VMSTATE_UINT32(r_tmr0_data, ETRAXTimerState),
>> +        VMSTATE_UINT32(rw_tmr0_ctrl, ETRAXTimerState),
>> +
>> +        VMSTATE_UINT32(rw_tmr1_div, ETRAXTimerState),
>> +        VMSTATE_UINT32(r_tmr1_data, ETRAXTimerState),
>> +        VMSTATE_UINT32(rw_tmr1_ctrl, ETRAXTimerState),
>> +
>> +        VMSTATE_UINT32(rw_wd_ctrl, ETRAXTimerState),
>> +
>> +        VMSTATE_UINT32(rw_intr_mask, ETRAXTimerState),
>> +        VMSTATE_UINT32(rw_ack_intr, ETRAXTimerState),
>> +        VMSTATE_UINT32(r_intr, ETRAXTimerState),
>> +        VMSTATE_UINT32(r_masked_intr, ETRAXTimerState),
>> +
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};

What I don't understand is how these controls get applied to qemu_irq after vmload, here 
or in any other device.  It seems like we should have some post_load hook that calls 
timer_update_irq, etc.


r~

