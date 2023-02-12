Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AAB693554
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 01:01:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQznS-0005rO-2C; Sat, 11 Feb 2023 19:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQznQ-0005pE-0X
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 19:00:44 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQznO-0000Al-Eb
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 19:00:43 -0500
Received: by mail-pl1-x636.google.com with SMTP id v23so10241271plo.1
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 16:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xTrcLB1do0E5yfI+fqAWUeefbBzHbkoDmONeyXQw/6U=;
 b=Vxb35Fql4CCH2u7jRsNwNYKtk9JvbmPURaX4wl+d3v9aqqzKFA7lZasrF7y+Q2DHtC
 wB+HjKS4mes7gq4QU+M57evNY37QwqZVf7Q2lhJoyDs95LplUj6rTQ7HIJ4Ytn0Ig+mJ
 hskncNVk5Dn0mqN8g1Z40vR3/Wy1vQA8hN06SXGabbiuFdSGwr6TZoE30juN0335mLtM
 3VmgqMk1mdaD0afhP75QfezZ+dW1WwOCHHfO34fHeXdrZ6AJt71IMZ8QDijV5jENE5QJ
 VBlT2PEH0bqX/+NKLEk9ItcVTtzDFKWJtRj6XOu3AVaXvtHOsNWUxFBQiuYJ3u68zKUh
 Vk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xTrcLB1do0E5yfI+fqAWUeefbBzHbkoDmONeyXQw/6U=;
 b=Pa8SqRCjTzSd0UI7vx5luZ6Tg9Q0DVnQzwk5yh41AMFwOAaP9nZI5lZTbCQa5hi0XU
 +jnhOEStfhUbQEGJ6iWKezGhuHSkLn+VF1HIz/FaX44yI4ed7dHQ51HhalF4VLp+2V8b
 xA4QYqL4ur8jp+H9Hotu51S7Ud48VqTWpeHThzYxkbL45xRwI2lPLhhUkzTJjj9DWBfm
 PHLe5EkqEuXZ3A4Z6pKbVR7jiSs0MGW4MZcCyrVPsDl/Jm92glZhb5I1frhQJHy33IOO
 22a2MpJ/19n/s9FwBNfn3DI3QrcZsP/pLbt02pFzv9jn7JHOanbZm+pR4F9S6vKtMx3S
 GsSQ==
X-Gm-Message-State: AO0yUKWV5+WFS/mCA0sL38ZhDXZNnj4aU0gBqPu8y3v2Okl66Beo/UHo
 K1gEoV8a5xBmWNpwpOkjycg+Vw==
X-Google-Smtp-Source: AK7set/QS4rzq5K3A27bO41ExgjazZT21pTZmkAsqEF7tnAW+TKkbo8BTLzfOoiLJ3r6FNam7BemMw==
X-Received: by 2002:a05:6a21:300b:b0:bc:d4cf:d647 with SMTP id
 yd11-20020a056a21300b00b000bcd4cfd647mr14892063pzb.6.1676160041006; 
 Sat, 11 Feb 2023 16:00:41 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 v19-20020a637a13000000b004f198707cdbsm4898988pgc.55.2023.02.11.16.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 16:00:40 -0800 (PST)
Message-ID: <b82afa34-3290-668d-fa98-7a0e6042397d@linaro.org>
Date: Sat, 11 Feb 2023 14:00:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] hw/rtc/mc146818rtc: Rename RTCState ->
 MC146818RtcState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230210233116.80311-1-philmd@linaro.org>
 <20230210233116.80311-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210233116.80311-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 13:31, Philippe Mathieu-Daudé wrote:
> RTCState only represents a Motorola MC146818 model,
> not any RTC chipset. Rename the structure as MC146818RtcState
> using:
> 
>    $ sed -i -e s/RTCState/MC146818RtcState/g $(git grep -wl RTCState)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/isa/piix4.c               |   2 +-
>   hw/isa/vt82c686.c            |   2 +-
>   hw/rtc/mc146818rtc.c         | 116 +++++++++++++++++------------------
>   include/hw/rtc/mc146818rtc.h |   6 +-
>   4 files changed, 63 insertions(+), 63 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

