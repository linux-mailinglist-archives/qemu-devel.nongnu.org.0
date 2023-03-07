Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3196ADB4D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:04:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUAl-0000K1-Ul; Tue, 07 Mar 2023 05:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZUAj-0000JR-SG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:03:53 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZUAi-0000QG-Do
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:03:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so10007095wmb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678183430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6odpsjDKSheFxSV8zVxgWqHdbY9SBpso3wUrL7rbId0=;
 b=ppG+slDWNcP8cbVrLgoHs9T7tyoIGNUfYtmWrSWkbhgGZvN4aJEGhFmoWwzSQbreIe
 f7C+59p9mJ6sc7WSD1jLrS83+a0R3JiHP567Elc7SgdSI/LztKvoQlzRS2qoYpq6Bp1T
 V8YHUeboY88ouXvLh4+qFoT3qpKphaO5V9vvxXNne/ym1USIn1IxXDzZ9d0RBIdtRTdz
 DmXjSbcZjbEZOL9tfeJf9D4elgOna4h2hnmKdYjGchak1km2qnMnbjHVaQ59V8HxA+Wc
 P5N9juMjsCGrCYxfXgkf8IhZYnCFshDu20Y9aBHZVbx59FeIAV/7pvfuoPgjkb4T8NEk
 aFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678183430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6odpsjDKSheFxSV8zVxgWqHdbY9SBpso3wUrL7rbId0=;
 b=rsO0JMpGXBtNHhBlC14uOrqEKQerCPG0qoErKmAUvf6bO6/rVrPv09JI6IxELcwGoD
 OXh0N5WFjKw0OBY0JBozBldDjGPHouPf1LAWEG4J/G6xmZYrfxhX7keXD0i9Kndyzr3j
 02/8/eQkSpzU3fGok0saGNgOFY9ARucmFswkvi8yZN0IOIEbQfP9ETh9XrSO0o3N9uxh
 lBqCmSjXKE9aeN/fJskCpH7pmXxYcGY2v+GwioGzbgx9RmXjn1RvtzXQu6SfIw9TndeG
 JqBTxT9sg84Fr+zGhg6snMRSGE5d0YLKAN06nY/o0v2IBFPkPzmWKaJSSDgu9sKTJkrp
 7ZGw==
X-Gm-Message-State: AO0yUKULMJ2H4u06I0O9fwEkw7BM+F5zgvE6qzjY0FloNmgTfCGyNaR8
 wAduCh3oW2snio15bcYmS0eOGg==
X-Google-Smtp-Source: AK7set8/8epwsl7Ouiva6mUUV5ZsymnuhjdqTW0IDW54Ji8Lwi7ef85qzdGE2KFoUYqM8YGlJ4AcBQ==
X-Received: by 2002:a05:600c:4509:b0:3eb:32ff:da8 with SMTP id
 t9-20020a05600c450900b003eb32ff0da8mr13094827wmo.16.1678183430474; 
 Tue, 07 Mar 2023 02:03:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020a7bce8a000000b003ea57808179sm16461714wmj.38.2023.03.07.02.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:03:49 -0800 (PST)
Message-ID: <bbaedbb6-0d3c-f740-5bc4-d58ebf4ad45d@linaro.org>
Date: Tue, 7 Mar 2023 11:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 13/23] target/loongarch: Update README
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
 <20220704093357.983255-14-richard.henderson@linaro.org>
 <4b5c9662-c609-8b52-ebd0-cbc461c751f7@linaro.org>
 <d0ba9ca0-f038-232b-581a-ac92b21871aa@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d0ba9ca0-f038-232b-581a-ac92b21871aa@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 7/3/23 02:53, gaosong wrote:
> 
> 在 2023/3/6 下午10:29, Philippe Mathieu-Daudé 写道:
>>> +- Linux-user emulation
>>> +
>>> +  We already support Linux user emulation. We can use LoongArch 
>>> cross-tools to build LoongArch executables on X86 machines,
>>> +  and We can also use qemu-loongarch64 to run LoongArch executables.
>>> +
>>> +  1. Config cross-tools env.
>>> +
>>> +     see System emulation.
>>> +
>>> +  2. Test tests/tcg/multiarch.
>>> +
>>> +     ./configure  --static  --prefix=/usr  --disable-werror 
>>> --target-list="loongarch64-linux-user" --enable-debug
>>
>> Why are we recommending to build this particular target with
>> --disable-werror, what is the problem? 
> This is copied from our old version code.  We need drop it.

Ah OK, good then!

Thanks,

Phil.


