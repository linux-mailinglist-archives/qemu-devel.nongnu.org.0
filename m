Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705BB62DE76
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 15:42:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovg2z-0003q9-NB; Thu, 17 Nov 2022 09:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovg2w-0003pt-3w
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 09:39:18 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovg2p-0005W5-II
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 09:39:17 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso1927266wmp.5
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 06:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Z2yMoxwJqfO8CgJseTWmkltnNsVcju6Iirm4iV07Yc=;
 b=Wxd2X+J9kZCgomJTB5UyVuVmqRUblCM5DenGzs7M5Gu2tRxbJGKOK7Gjw0F8CAfVQv
 IX6lh9xHEx6k5mLms2y07GhFdyYSKo5L5bassWvz3NEXRuG8B8Ps1wQUXGs7touEZvrK
 DRG6ZYayGsSiAmzkSzlvsoqfXPzte5qc4yGEDx7j6Dr/0oWx3SQoKmK+pJISE19yGF0Y
 JUDAl/FcPIxddbxbiWxwdCxzz97UTPPNdeihusQ4YM4k6cUF6t7BiB/vj9qDwvet4iVd
 4gAlfxTXVIaey2rWeV8f5LxezYHNvwTPwG7TFkoMqnggQt0/hBxbYacjuMkZ20dEvY8c
 MMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Z2yMoxwJqfO8CgJseTWmkltnNsVcju6Iirm4iV07Yc=;
 b=waeZ1BDpEcwthti8JqM0MRD5FmGd/jflTqvGW6t9ICHtHR9CmtFhWUV/0zJbIFcxg0
 IFqJP8BurRucZ1NjaJSYVkLuNyi8wV7PLa/MCbZmO85UQKk6BgfKu6mERrglM1V85D7/
 t9d/5zw///1AzSciqacJgfs82G0Lw4lJl1mD5OkqtvIYGoUdOeCih2X/0rZfcq9+XnjB
 BEc2bXxcXP96dwk7kPD3OjJ4gGDhcjO7mlvLm2ZhNdHAnGfHdSU0E41OBXMERNJSJP9G
 lGM7FSYDhpK8nmZT6r8PB41a0UKm0/pULjAo6DoU0//sdrjnnCM94RTEffwSWVvtT6Xc
 1psA==
X-Gm-Message-State: ANoB5pl9y+bqG/1FvlYwvzeF5TGd96xsKKiPfbjnryt2YK4abzivmqQ2
 U42L34OMJVwWJgooFO50M1O+WA==
X-Google-Smtp-Source: AA0mqf6WlpAlkK2ngNII9Xm1U/PsynPQW4Fq0Qr4nPKszZJsX+aFbH84yLod5jlIWf7+sDH1YAFKqw==
X-Received: by 2002:a7b:ce8c:0:b0:3cf:8b2d:8cbc with SMTP id
 q12-20020a7bce8c000000b003cf8b2d8cbcmr1993694wmj.89.1668695949448; 
 Thu, 17 Nov 2022 06:39:09 -0800 (PST)
Received: from [192.168.189.175] (58.red-88-29-172.dynamicip.rima-tde.net.
 [88.29.172.58]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b003cfd42821dasm1502259wmb.3.2022.11.17.06.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 06:39:09 -0800 (PST)
Message-ID: <5dd7eb50-3d80-81f1-7e40-f75a258852ec@linaro.org>
Date: Thu, 17 Nov 2022 15:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] ci: replace x86_64 macos-11 with aarch64 macos-12
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20221116175023.80627-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221116175023.80627-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 16/11/22 18:50, Daniel P. Berrangé wrote:
> The Cirrus CI service has announced the intent to discontinue
> support for x86_64 macOS CI runners. They already have aarch64
> runners available and require all projects to switch to these
> images before Jan 1st 2023. The different architecture is
> merely determined by the image name requested.
> 
> For aarch64 they only support macOS 12 onwards. At the same
> time our support policy only guarantees the most recent 2
> major versions, so macOS 12 is already technically our min
> version.
> 
> https://cirrus-ci.org/blog/2022/11/08/sunsetting-intel-macos-instances/
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus.yml                              | 12 ++++++------
>   .gitlab-ci.d/cirrus/{macos-11.vars => macos-12.vars} | 12 ++++++------
>   tests/lcitool/libvirt-ci                             |  2 +-
>   tests/lcitool/refresh                                |  2 +-
>   4 files changed, 14 insertions(+), 14 deletions(-)
>   rename .gitlab-ci.d/cirrus/{macos-11.vars => macos-12.vars} (74%)

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


