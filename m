Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39CE6AF6E2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZeA2-0000B3-71; Tue, 07 Mar 2023 15:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZeA0-00009T-9X
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:43:48 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe9y-0005Tm-IZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:43:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso7998089wms.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 12:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678221825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=veYUbNuxMNHS9GsRvwWC1zH3IoLuwXWqx3zd4Xf94bw=;
 b=k7R2mHUwQZIVeQzDRL/gqut5R0OHcBurrtgnxvFQgwaDP3FySfieth99Dt/s9I8hzh
 EmWVVnfyFeRYtlP7zpzrnzQv96GHVK1uMzDdMuHI/lW/0G/QBrFlSQTfXcBxYnWmA9pi
 EjHdxXtXglKnKGyyj/5zk9agFu+x+4/qUnJp2MRxoZDzAAGLn18gZTAvgST7g+i82tsP
 MuW+fEArtS/xgrASLwuzFg9AjgMWvl3j6wWi2MCQxTMMKxDgxzhBiM4j78tt1vuZeidU
 YUQxakb0IJVSFPIIG/eNjgyglSsY1z31W6W9K+h3Az/MrfBVFayRn/omFAj63Uxaxw/4
 uM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678221825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=veYUbNuxMNHS9GsRvwWC1zH3IoLuwXWqx3zd4Xf94bw=;
 b=BmEjJHPzQ7xN16FUfJe2u5jXLcXE5stkXmpM7yxHuuPiidIYGypzpOIaPqgprw1+UF
 Bl+h0m9w1+UvkDL8FgzbrAPU7gwks8rGahlmyIGET+O48FBWLygsFsw2e3ElQ5BvF6Lk
 gmq55+XSaJysZcuc7cGZCxsUVRoDrXrBR7Zz/ziApZhnyUL92WhN+s6qom2EWXqyGBTv
 vxPmnO+Vcwg6DDRLJwviHtS3N1rHiZGzBSnPug/e48cSlHZTjv9j+NglKzwqH7Yz9YDM
 xFxuY42jFWOfoHuVS4qW1bjBgfyu0qkuB7nHOHtN6aPxzWv9TY+lqG8XMZyZg4dQGUmt
 oSHw==
X-Gm-Message-State: AO0yUKUCZ/YdTOChUkVdbGDFRk2uPCnLwhGrwAr2TZO4Fgxu+nu8EbhL
 pRAfvIRUwH0EOxuma/Kq6NyhZQ==
X-Google-Smtp-Source: AK7set+8O8yLgbOo71x0MbjxRmocYOvVgn1njmVu9rPbH7Bt++J3N+XaNaexaywQ6PjpLIWGXNzXQw==
X-Received: by 2002:a05:600c:3b0c:b0:3eb:2b88:999f with SMTP id
 m12-20020a05600c3b0c00b003eb2b88999fmr13476972wms.5.1678221824760; 
 Tue, 07 Mar 2023 12:43:44 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 f32-20020a05600c492000b003eaf666cbe0sm13736793wmp.27.2023.03.07.12.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 12:43:44 -0800 (PST)
Message-ID: <4b67f103-0df3-891c-2a0f-466a82e89732@linaro.org>
Date: Tue, 7 Mar 2023 21:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/51] Net patches
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230307070816.34833-1-jasowang@redhat.com>
 <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 7/3/23 18:01, Peter Maydell wrote:
> On Tue, 7 Mar 2023 at 07:08, Jason Wang <jasowang@redhat.com> wrote:
>>
>> The following changes since commit 817fd33836e73812df2f1907612b57750fcb9491:
>>
>>    Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)
>>
>> are available in the git repository at:
>>
>>    https://github.com/jasowang/qemu.git tags/net-pull-request
>>
>> for you to fetch changes up to c19b566a3898510ec2b3e881b3fb78614b240414:
>>
>>    hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100() (2023-03-07 14:55:39 +0800)
>>
>> ----------------------------------------------------------------

> build-oss-fuzz failed on something involving fuzzing eepro100:
> https://gitlab.com/qemu-project/qemu/-/jobs/3889073821
Jason, please drop my patches. I'll look at that failure.

