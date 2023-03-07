Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309786AF6CB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:38:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZe4C-0001Uy-Bt; Tue, 07 Mar 2023 15:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe40-0001UE-96
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:37:36 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe3y-0004PL-Lx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:37:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso8021862wmo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 12:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678221453;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SBnzhz7HWpWln65LWFZdMf4Kjd3qe6OdBRwG5WhL2mM=;
 b=kQug1MtyKHszI52LoU5rToMhQ6z3rOQuUbNEKUl8kMl5AYBBHJabIa2fWjElQBugZM
 Mn91UHvT8iEXCy2Q+oR6caWKY3UzbbdNKI8ZiF2bWVQNJZjx+wd6aCXO4affQXnP6hG5
 EYwlKOZhQ7Fmezapucv9ollfe9vF6qnGiAOcGAI2mgnPjITQLoFoQyXEf3wN0yNSmIP+
 3mspaq36KEet8Rg3nzlRNQxSa4ccoNjeHd561r2lncdAj1/MGLy4P6bgFSg8oz6yqDLo
 g39RADkh61HIWGPo1d5ld0zQ8fRvbFfWegkeN981itNtUE7XsDlrmP09a9g+1Mmfe3dm
 +m5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678221453;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SBnzhz7HWpWln65LWFZdMf4Kjd3qe6OdBRwG5WhL2mM=;
 b=JzDkT7XjFktnXgFuG7bI502Th6CT7J1YQpS4Mb2sU9kJ4kmHB1Yjhd4xZMZrYDYcBB
 7Url34JjdxZI8A8vlVBCfugx1D9fhIcdRO/tXd+q2nr+okg34AZmmysNXvJmC2UA57G9
 7jNFYnSfkVinLHoHDz3QpFG+gBpd+LX7Ln6eO25ewiTuqHad6KauYwbpDaxAw31eCq+F
 Cwv4k3sTNm7zQTRmSQB34rX3zWV2LwTBArDQP3UNZeIPCxPTPZa1Qh7byNDgR0SiM8C/
 vcTnKPTvbrDHvNjHEVwB56dJQ8+xYfzHnJj6xwyW7B7R6Z2xrZ+a4pvyTLm2pYdazsSG
 lgew==
X-Gm-Message-State: AO0yUKVbcZyBBC6fB7ICZNnpWfXJd02nXfMVZfRAKmKm7vaE356a4poJ
 aTb71BmGUp76WutyIThw95r1Jw==
X-Google-Smtp-Source: AK7set8CNBsnwmkUMriBXeziv0DtNGS09mewDfR6mAsWh13Gee/LUgZfImly4hCATWymxQPNUaCl0w==
X-Received: by 2002:a05:600c:4ec6:b0:3e2:147f:ac16 with SMTP id
 g6-20020a05600c4ec600b003e2147fac16mr14536748wmq.10.1678221453103; 
 Tue, 07 Mar 2023 12:37:33 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 q11-20020a05600c46cb00b003dc1d668866sm19051533wmo.10.2023.03.07.12.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 12:37:32 -0800 (PST)
Message-ID: <42d16cdc-6a66-8aab-564e-1fbf3e79462b@linaro.org>
Date: Tue, 7 Mar 2023 21:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/6] block: convert bdrv_graph_wrlock() to
 AIO_WAIT_WHILE_UNLOCKED()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-4-stefanha@redhat.com>
 <5b5cc9c3-7768-f4a7-c188-90de98053db7@linaro.org>
In-Reply-To: <5b5cc9c3-7768-f4a7-c188-90de98053db7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/3/23 11:19, Philippe Mathieu-Daudé wrote:
> On 1/3/23 21:57, Stefan Hajnoczi wrote:
>> The following conversion is safe and does not change behavior:
>>
>>       GLOBAL_STATE_CODE();
>>       ...
>>    -  AIO_WAIT_WHILE(qemu_get_aio_context(), ...);
>>    +  AIO_WAIT_WHILE_UNLOCKED(NULL, ...);
>>
>> Since we're in GLOBAL_STATE_CODE(), qemu_get_aio_context() is our home
>> thread's AioContext. Thus AIO_WAIT_WHILE() does not unlock the
>> AioContext:
>>
>>    if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
>>        while ((cond)) {                                           \
>>            aio_poll(ctx_, true);                                  \
>>            waited_ = true;                                        \
>>        }                                                          \
>>
>> And that means AIO_WAIT_WHILE_UNLOCKED(NULL, ...) can be substituted.
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block/graph-lock.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


