Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5FA6A2B83
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 20:36:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pW0Kk-0001d7-CX; Sat, 25 Feb 2023 14:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pW0K5-0001QR-8O
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 14:35:11 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pW0K3-00070N-7H
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 14:35:09 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so4564034wms.2
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 11:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mUt+7csdBcW0Jh5paz7+EeQthvoQauOzZlQZQMKS4tc=;
 b=VBAbhzJL7O9G5vXera3mlv9hGpXAnyco29fQXUQlk8ovvBCBvsfbHOHSiqjDwC+BHQ
 0zclOt/CBcS7TwY/gvgw+OrdnmyitjMt5qdrq82guJBkh2Ig102+ti760zIZentjsr0G
 I04yP8OA6bKi01izp+g9B/1Ke9Q1Xz8jbMIXYkIpt2ER474bxQRnlFPi2/pJS+c/R3dT
 iqmPIcWSync820EWgH/0YYmI97bmJn7ve9mg52ilSf9tr+zOnpCEBj0B/GKxoemIVR4W
 EpkBAj5IrL5eaj93xEQO7kqPY4K7KoEzcMEPjrFRXX8ED8Podg+LOI0IaywPIn8RFZh0
 KKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mUt+7csdBcW0Jh5paz7+EeQthvoQauOzZlQZQMKS4tc=;
 b=Id9WbNf/Jh8SjuO/1YYfa4SEXGGz5IbIbjCWBDBolp89oBFZVKFv1bMPP/kVhElQ7t
 fCkEhSl+z8n9GmoSAU71wjIUBAfeAigxfzEZBGqtd4xRLkEd2axOKg5+IV9QxtUP8ba8
 Q6e8oKQBJCh4HLu2CL8A9D5cA14KYyx1rRTAJjskTkFC/nXcs+5F1u5CrIhIipt9/ArN
 fuodxedEkXn5xDpQ5nyidy7FsktdwhCd/ghyPKNUbBp+a+rearaR7osgrs3HnIiEGc1B
 CS75G18gJrUkFBLMn6lJoIrz8+ai+prKDEHDC0eQ7cUrgDm70MZ7BuyeES1i3SENQAFU
 hOAA==
X-Gm-Message-State: AO0yUKWELdakR6i50RFxOayiF2ikR1CpQVWMIuu80M5BhB0LQGmmNh6I
 nqiziUQqPhaL0aCbp8ExXVAqQbqebfXPoYLu
X-Google-Smtp-Source: AK7set92av06hvK6AnuGixzPQwQOvyYDm4p7M8VgBYh6Q9YN42V1NGVq3mQMyfIX2iU9M/EyTADzlg==
X-Received: by 2002:a05:600c:3088:b0:3d3:49db:9b25 with SMTP id
 g8-20020a05600c308800b003d349db9b25mr16212750wmn.26.1677353705571; 
 Sat, 25 Feb 2023 11:35:05 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c1d0800b003de2fc8214esm3707425wms.20.2023.02.25.11.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 11:35:05 -0800 (PST)
Message-ID: <b8a1b43d-3216-2194-5a10-5b515378bc18@linaro.org>
Date: Sat, 25 Feb 2023 20:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] hw/audio/ac97: Split off some definitions to a header
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, philmd@redhat.com
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <ca70d84e45ad465e2d8adeebe21b9fba99103858.1677004415.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ca70d84e45ad465e2d8adeebe21b9fba99103858.1677004415.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 21/2/23 19:44, BALATON Zoltan wrote:
> These can be shared with other AC97 implementations.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/audio/ac97.c | 43 +-------------------------------
>   hw/audio/ac97.h | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 66 insertions(+), 42 deletions(-)
>   create mode 100644 hw/audio/ac97.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


