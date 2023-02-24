Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92E6A23BC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfXj-0002Nh-PF; Fri, 24 Feb 2023 16:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVfXh-0002Mh-6c
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:23:49 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVfXf-0003Yv-0W
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:23:48 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so3079924wmb.5
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 13:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=stqFr4wPAZtOhAc8FBWFQWdLjdIcYKM20JtgxdqHTn4=;
 b=R3D/bbYW+iOiqN/rDrJx5w8lDXe6kK3wA1m+bqT9eWJWFQXgK0Xo0vMyu8uLqNuNuz
 azprhAlQgqZP76oOSY64yxeB2JI9y/xxXiW6dBILBjMzDM01qwNNDIEXst0dcupLhO/P
 z8EL9uZwh8jbTda58wzxX0apPLLkTB8GlswL+Vme9Lja3G3vWCgappbvt/mFdi6F4acp
 ZopeZ9q6TQTc2lTipjG6VyNyqBaQE9jn6NiES8NlCU79f2fNgCQiF/NH5U/lvjVYIwQH
 WzSQiepEZi4mi5BZaFzeKJNIKtVMMR0leQ492Njr7wMmp3k5Jl7ydD9zmLG85GnPddiS
 4i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=stqFr4wPAZtOhAc8FBWFQWdLjdIcYKM20JtgxdqHTn4=;
 b=dVkCj/397MAqc1NXL0kDwscykwZmcLgYlKWX/Pw06RNcPY488A/1mgbHfiQy3Y8YqO
 I6Q4TvkFCflSTQMuuDBfR8f+b8Rzs/1boebgqru8T2/yJMoB8v98K2S6BJIkRRj6R29S
 HLS8SqS4ezVTVNpEaZKu/MXSyAh4X+R7HkZVylhuZOlYP4Mr5DvgkUOVRYb0eIpqIweh
 nRHopSaGMZuoARw7gQvxBKEpaEljyGRacVNNOLoPrX5r3cgx0BBgWmIsTcZSOfImMcZi
 tV+Yhf9lCF5aQg9CZuHdRX5cfjQdddYfVBi1DERO3YrksIztgSqLfbL5vY7C/qTZ2vDT
 JFPw==
X-Gm-Message-State: AO0yUKVBhZDSguxa2HO6Z4dqG7S5KsWKgqoaBqbNlEDO6aSLjjeZKQGX
 P6ha8DxMRUOZAYtFAFob06WIKA==
X-Google-Smtp-Source: AK7set9IwHjo1jfO5zrRosT/uh00E5mUcxghvE6HFIx+SEvjJwegWNQ8G4Ha3yuNHgoCOfOg8r8RBw==
X-Received: by 2002:a05:600c:3417:b0:3ea:c100:e974 with SMTP id
 y23-20020a05600c341700b003eac100e974mr4990959wmp.26.1677273825243; 
 Fri, 24 Feb 2023 13:23:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c35c600b003dc4fd6e624sm433599wmq.19.2023.02.24.13.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:23:44 -0800 (PST)
Message-ID: <8fe14d63-ebe1-4a1c-ab1d-ea96718e278e@linaro.org>
Date: Fri, 24 Feb 2023 22:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/13] testing updates (gitlab, cirrus, docker, avocado,
 windows)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230223155720.310593-1-alex.bennee@linaro.org>
 <CAFEAcA_bqLjiF6VHABTRop7HsdgTpd1KVJzTgpXvXgo+uuABtg@mail.gmail.com>
 <87sfeurgb4.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87sfeurgb4.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 24/2/23 20:52, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Thu, 23 Feb 2023 at 15:57, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:
>>>
>>>    Merge tag 'net-pull-request' of https://github.com/jasowang/qemu
>>> into staging (2023-02-21 11:28:31 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-230223-1
>>>
>>> for you to fetch changes up to e9969376f01180d7bcbee25ae8333983da7eda2c:
>>>
>>>    cirrus.yml: Improve the windows_msys2_task (2023-02-23 15:48:23 +0000)
>>>
>>> ----------------------------------------------------------------
>>> testing updates:
>>>
>>>    - ensure socat available for tests
>>>    - skip socat tests for MacOS
>>>    - properly clean up fifos after use
>>>    - make fp-test less chatty
>>>    - store test artefacts on Cirrus
>>>    - control custom runners with QEMU_CI knobs
>>>    - disable benchmark runs under tsan build
>>>    - update ubuntu 2004 to 2204
>>>    - skip nios2 kernel replay test
>>>    - add tuxrun baselines to avocado
>>>    - binary build of tricore tools
>>>    - export test results on cross builds
>>>    - improve windows builds
>>>
>>> ----------------------------------------------------------------
>>
>> So I've been applying pullreqs relying on a combination of the
>> private-runner CI jobs plus using the free minutes allowance
>> on my personal gitlab account, and ad-hoc local builds. I'm
>> a bit reluctant to do that for this one though, because it's
>> touching all the gitlab config and we won't be able test that
>> that is OK until we can do a full run with the standard config.
>> What do you think ?

What is the alternative, waiting 5 days up to March 1st?

> This was my run of the tag:
> 
>    https://gitlab.com/stsquad/qemu/-/pipelines/787068318/
> 
> The FreeBSD failure is the dodgy migration test and the openbsi/edk2
> builds fails as 18.04 just went EOL I think. I don't currently have the
> s390x runner on my config.
> 
>>
>> thanks
>> -- PMM
> 
> 


