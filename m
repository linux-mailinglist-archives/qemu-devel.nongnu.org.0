Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8AE6AD024
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:25:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIK8-0002yd-Ha; Mon, 06 Mar 2023 16:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZIK7-0002yQ-F2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:24:47 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZIK5-0007rb-Q9
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:24:47 -0500
Received: by mail-pj1-x1042.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso14526114pjb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 13:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678137884;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ct3Vxi3JL8VTltpME0NZyangJ9MCSNlxQkRorA4180o=;
 b=W1zhzjDy2LL9ctpWJ9ZXKPmbguPrwywWGVKiKkbeaFKve0xfsNVXBzX19CKuxVTxzM
 /M3uvjyLMyrS17TQoZqEceyUEUJbelrqzOhFQJ6UQOvfVl17uUI8UuQh17bYV8cRX071
 r7kJG4NsDTWwAW/PypBtsa8rZvBEdVsReri0kQP5zJkUAhYHCWhrcZL3Vwm9warUrgf4
 j/JVn/JeYTPur0gIpQIntI3sHQ6p9XPunuEnbd0IDBivgPMruWdLGDLRlLLkPXJWHK64
 U/R204dfLK2XWQjLn9clESHY94b4vLEKZT03ef1zpNT7V1yEKuqH36VURncA4XF4TWTb
 DnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678137884;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ct3Vxi3JL8VTltpME0NZyangJ9MCSNlxQkRorA4180o=;
 b=SLbTNLtSzbamSxCX14pxy72bez13sYyItcxn75GYTI+fkqmeJJvhOTqBPcT4rzGO2P
 YifJo0tfHeakqW80t4mng5XewRHiNyPK5ufuPTHfePRj9abWCyA2ynUwgyjLbEdCWWkf
 QLOXN/WrL3bdwxY5VbOqDFXuXAcayhFjZ8FXteZZvyI4j51Gl5+TAAaVI4nZgzWTTpZr
 UP2dLjLXRhg2QbmOOmpGAntCE46JZFRhhUV4CGNFiDXncemJma3NcpG1BpeNV8jRHG99
 D9GYQhbk4byxXNT3Vu+3rH1EEYyAT8WwY2HKC1AqW0mFmHNZM08W/dHHvEeoUkgTlKcn
 pyyQ==
X-Gm-Message-State: AO0yUKXR0vWSto5DBzIx+JnN79yqraIWIHomRLLg9c2qpOVTlw3f0bMV
 qwIO6Je7f6kJV4CLOaTvuCn/Fw==
X-Google-Smtp-Source: AK7set8vMndnU6DJRfEijGhzqtTTbpTUVmGay7re3ZTqHsG8RBFdMUw1VjsHqqVvi5SWUSq6gQVRxQ==
X-Received: by 2002:a17:903:187:b0:199:1996:71ec with SMTP id
 z7-20020a170903018700b00199199671ecmr14923238plg.16.1678137883901; 
 Mon, 06 Mar 2023 13:24:43 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:7632:29c7:3cce:bec3?
 ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 ji20-20020a170903325400b0019c93a9a854sm7093115plb.213.2023.03.06.13.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 13:24:43 -0800 (PST)
Message-ID: <004c0c81-958c-ba34-a743-6f2a4a4d133a@linaro.org>
Date: Mon, 6 Mar 2023 13:24:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/9] linux-user: Diagnose incorrect -R size
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-2-richard.henderson@linaro.org>
 <CAFEAcA81_bQMYK9w0LitTrBkp+ue33gUocUMZco_HG0AxgGeaw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA81_bQMYK9w0LitTrBkp+ue33gUocUMZco_HG0AxgGeaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
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

On 3/6/23 04:56, Peter Maydell wrote:
> On Mon, 6 Mar 2023 at 02:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Zero is the value for 'off', and should not be used with -R.
>> We have been enforcing host page alignment for the non-R
>> fallback of MAX_RESERVED_VA, but failing to enforce for -R.
> 
> I'm pretty sure we have users who specifically use "-R 0" to
> ask for "definitely turn off any reserved VA".
> Here's a random example from an old gcc bug report:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60681
> and somebody using it via the environment variable:
> https://www.openembedded.org/pipermail/openembedded-core/2015-January/100572.html

Odd.

Well, it won't actually have the effect of "definitely turn off", it will merely leave 
things as per the default, which *will* enable reserved va for 32-bit guests on 64-bit hosts.

The only remaining question is whether we diagnose this oddness or silently accept it.  It 
feels like someone playing with options they don't actually understand and an error is 
warranted.


r~

