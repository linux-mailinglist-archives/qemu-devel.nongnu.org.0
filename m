Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE4B38203D
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 19:56:10 +0200 (CEST)
Received: from localhost ([::1]:52540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liKzp-0007K1-93
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 13:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liKyk-0006b2-Qt
 for qemu-devel@nongnu.org; Sun, 16 May 2021 13:55:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liKyi-0002RZ-OO
 for qemu-devel@nongnu.org; Sun, 16 May 2021 13:55:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q5so4095748wrs.4
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 10:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y5B/uWyOG9YV5t15CA6LA4IzqODtSVU1YzLGF2wsxAc=;
 b=OH6gyjM0O5c3O7XwTRzDbwKlyAxuLdjjaVWYZ18EUob1zrClFv21KfgPg5UqeT/pT5
 9M6STA7LQHB4qaKgb3Cv+uKtgNN6DMTHzWjMcwvCjJ/wrKjrapWBP5ogNN9qTGTmoVFG
 ykioVoqyTlL/6pbfDMPvV71PypQznWB3AditKGyTijc0JXT8kyMySucUmZ9V4M8C8BKH
 bWBWKovn/HpSyR5mxBRMEwxST5Mk3EJZXQ5CAIHw3o8xqQgAh23E4DwX1q/7wKc8giki
 27V/sJvRcWzTDZLVOpiwL3V/xM4F5wBZX7mzw1VIdnJWUNzqjzpyCzQXjskuzFiduaN8
 /pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y5B/uWyOG9YV5t15CA6LA4IzqODtSVU1YzLGF2wsxAc=;
 b=VKFDvQBGOymHVr8/MuJx5fXH3wBok04LB0zDUKnNTP9rrMPh5CE5vW4iME5rqRojEN
 w2wdQZ26deF0OuG9GfUz5SoC77FPAe+ASscQpIV40Jav42Vikxqt+RNw+mDHpeJTtCKj
 RnPBxkd1I7aOOh+TaVBvj8YuzGMUTCgo5oW0HqmD4cvnXvbxqbtreEwNvRT2FGBTO05v
 H6Mi8DghtWlOK0aN74l7XVltrDdQUIvZJtshQP5A7LTCK2cvxpu0M0rEsshYjQGPuapJ
 tispqDkqjYfXl5/ZClcHwfimb80vLj6JtE9DxY2A/MQ3ZpI3Wnl09OQiKv1ByvEvCY3s
 2i7w==
X-Gm-Message-State: AOAM530Ug+8yCYi0QQ8J2WoTFtAsg0/KmqsMKTqyKKDtkNs760Byetvl
 +FhE/+m1k0CQdwgwWNBvVR4=
X-Google-Smtp-Source: ABdhPJx61bpxgUG+HQg9VhqFXYnspIQs5V7RSuw5IlGY6iKW0DuK/TS+1YFGT9KAEXZGzmevmq92oQ==
X-Received: by 2002:adf:e48b:: with SMTP id i11mr33897340wrm.228.1621187697547; 
 Sun, 16 May 2021 10:54:57 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t16sm4951103wrb.66.2021.05.16.10.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 10:54:57 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: Align data dumped at end of TB
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210515104202.241504-1-f4bug@amsat.org>
 <90edde1e-b429-0364-8507-d760be8ed1fe@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bfb85bc3-ca3f-0b83-9a3c-b24c6aae472c@amsat.org>
Date: Sun, 16 May 2021 19:54:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <90edde1e-b429-0364-8507-d760be8ed1fe@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/21 4:01 PM, Richard Henderson wrote:
> On 5/15/21 5:42 AM, Philippe Mathieu-Daudé wrote:
>> +                qemu_log("0x%08" PRIxPTR ":  .quad  0x%0*" TCG_PRIlx
>> "\n",
>> +                         (uintptr_t)&rx_data_gen_ptr[i],
>> +                         2 * sizeof(tcg_target_ulong),
>> rx_data_gen_ptr[i]);
> 
> This doesn't quite work, because
> 
> 
>> ../qemu/accel/tcg/translate-all.c:2045:26: error: field width
>> specifier ‘*’ expects argument of type ‘int’, but argument 3 has type
>> ‘long unsigned int’ [-Werror=format=]
>>  2045 |                 qemu_log("0x%08" PRIxPTR ":  .quad  0x%0*"
>> TCG_PRIlx "\n",
>>       |                          ^~~~~~~
>>  2046 |                          (uintptr_t)&rx_data_gen_ptr[i],
>>  2047 |                          2 * sizeof(tcg_target_ulong),
>> rx_data_gen_ptr[i]);
>>       |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>       |                          |
>>       |                          long unsigned int
> 
> 
> However, I also noticed that we shouldn't be printing ".quad" for 32-bit
> hosts either.  So I'll just split this into two separate qemu_log
> invocations, based on sizeof(tcg_target_ulong).

Thanks :)

