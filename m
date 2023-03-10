Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B06C6B3F8E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 13:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pac5W-0000Fr-Jo; Fri, 10 Mar 2023 07:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pac5S-0000EX-5K
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 07:43:06 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pac5P-0003U6-U0
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 07:43:05 -0500
Received: by mail-wr1-x435.google.com with SMTP id bx12so4886956wrb.11
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 04:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678452182;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iwJ6KP4qgwdAuCXE7G/5v1FQEfFrIi5j1Uvcr9rJKbY=;
 b=Vspqxqd4Gk8LECVh/Cu0jmLIKhYh1rd8mkkcH+6emtzRnv5VXqBYCXSogzpBjzL8H0
 AWO5dAw/2g7OCDy8BA97aD3OD4dKlas9OzwA0rsKDMGcAT59yfwh2b9MNIOK+L7hIsZc
 +jw5Yk/wzH4F5n4s8H+DwGQxLZUAyifF9JDVTNjqFpANvYy9CTGcRnMqEaZMdT+ySfdO
 6DRwxdWN/nyfYZ6cTllmru/fMJ4Hp0aI9hGzup5Xyc3BXh8xfRY4G9U9rnX7iXuEwrQm
 2BIg5IFyggfhqOCObXzF+MtJ8Yh1Rq8f+4Vkaj9YuAdyQSaSVAmUnJXC1bQbo6XQOYJ9
 bFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678452182;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iwJ6KP4qgwdAuCXE7G/5v1FQEfFrIi5j1Uvcr9rJKbY=;
 b=aZXnwl5rtHX+6Z4UrZUh6UP77NpskWFJXzdz4h2IWINFMszH/Xz5Vuiob2dlFuuqFQ
 vAlWS1piBiK1l0VSz0jDBdf6OAITRE6HYjfGegBUR5Yp/KfJdaTC5J/1NxCz8mNomMbR
 /6Ppv4Wmf5y+9O7kHx1J95XPXwqL90/zH9kDaLRTXbfIjDz4kKgmSaSa+TSPbX901gUJ
 pmdV3WaPdFmOLBpnRxVoJ5O+go75ZV1xzFhJLHsLFWnTVc0CtP9Vzh8402Mq1GX+5KAV
 nRSj61XMfec590yT/ZUuBpJHHtd0yF+kiMCTyR7nxxB7Z+zMCPE0axj6PNg9dsv+1kNr
 Fo0w==
X-Gm-Message-State: AO0yUKUHG2+CVrIlVJZp5s8YSBibEVNLwN10uFpRF8nMKkV3C14eJyiv
 E5zUrrJ6FCYfCgoa5qyeIHqo9g==
X-Google-Smtp-Source: AK7set/aEVcdVqGHS9nOa57VBe3dG32DdJb+uI5tVrKlL+yOVQCkuupMMp0OpSfv9v7WhS0hPlGodQ==
X-Received: by 2002:adf:eac7:0:b0:2c7:161e:702f with SMTP id
 o7-20020adfeac7000000b002c7161e702fmr17304499wrn.47.1678452182146; 
 Fri, 10 Mar 2023 04:43:02 -0800 (PST)
Received: from [192.168.1.115] (169.red-88-28-29.dynamicip.rima-tde.net.
 [88.28.29.169]) by smtp.gmail.com with ESMTPSA id
 s11-20020a5d4ecb000000b002c55efa9cbesm2069371wrv.39.2023.03.10.04.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 04:43:01 -0800 (PST)
Message-ID: <bccf80e1-d4ed-248c-5702-885951ffe730@linaro.org>
Date: Fri, 10 Mar 2023 13:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 11/11] tests/avocado: don't use tags to define drive
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310103123.2118519-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 10/3/23 11:31, Alex Bennée wrote:
> We are abusing the avocado tags which are intended to provide test
> selection metadata to provide parameters to our test.

Oh I missed that, good point.

> This works OK up
> until the point you need to have ,'s in the field as this is the tag
> separator character which is the case for a number of the drive
> parameters. Fix this by making drive a parameter to the common helper
> function.
> 
> Fixes: 267fe57c23 (tests: add tuxrun baseline test to avocado)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> ---
>   tests/avocado/tuxrun_baselines.py | 60 +++++++++++++------------------
>   1 file changed, 24 insertions(+), 36 deletions(-)

These also need to be cleaned:

>           :avocado: tags=tuxboot:armv5
>           :avocado: tags=image:zImage
>           :avocado: tags=console:ttyAMA0
>           :avocado: tags=root:sda
>           :avocado: tags=shutdown:nowait
>           :avocado: tags=extradev:driver=spapr-vscsi

Can be done on top, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


