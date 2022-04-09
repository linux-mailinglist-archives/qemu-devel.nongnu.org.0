Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8C4FAAE0
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:57:30 +0200 (CEST)
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndI9B-0007sd-2s
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndI7Q-0006Zy-BD
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:55:40 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndI7O-0006IZ-OX
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:55:40 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so12909864pjk.4
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aV7olfjUKb4aLyRerxOq0O8Mms/Yy9rpbRgqdtoxO2I=;
 b=EXgvMvsjtnX8QrVzLci0yesZRN309U8qlYtDPoqbxnB7iArMYiR5dcwlx/dZo8/ewc
 wuhffcDHKBzdwwySe733QbynRLI5P1CNRH+5r/ZoXJfYakoOT9j8zFg4c/N4oqNXUxL2
 yIiILU4PWlOmul24arr93ph+cmY3GWFaLS+8zHxmHCwbWzXkOT2U/tfZZMWLkwQ15BbL
 GH8d+wfYHh/wkRqWPk6t3nX4H18Nu7HBi7OKOoWGh2EPC55rtl6OKw+SuK1GAFQInz4t
 rAd3ZlwcDK5aypH7htF9/48Xgyx2lpi1UH7CokC2ft/ys+KEtM455vphNwsEzlq/YLcJ
 dpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aV7olfjUKb4aLyRerxOq0O8Mms/Yy9rpbRgqdtoxO2I=;
 b=pOynnQsKTOesq7RKXKZgy6c3cEz/WdvSO1hY2jc913dy8z8XreKaBpTtpSz+CwfvrT
 xcLI6Rww0g/J4z3+bG0zQ9HYzuKHyHv+RNipUPGdUQp25k1r3k2XK4wUxOvVvs2+mXEP
 lJwA8abeB88dg2acQHMSPvwc0v1vW+viN3X9rb/CioXZiKeWEwUK5ZOR8Cl4t5hTgFOw
 TabxT1ENdizXhYTmrxs/ih/A/il/9Kywnmasa/9n/GWvK/ynaHWlt3wtmg2e8pApUbwn
 UqnBUahgoweZmupJh8diWxqV+dK+IB3gdRVLIoGdLCX/ACxqQRW1Mz6OEvVgNgmHKbPj
 PpEA==
X-Gm-Message-State: AOAM532J3LbVNJgNEFoeGFov7h1m2WwRoo4RHFJyEq82cSfhUSJVUKiM
 iQh7hoPJELNo7KsjyO6lPeIBegDQZn69GQ==
X-Google-Smtp-Source: ABdhPJyBcl8OzeoDErt2ny6V2GP0jGBw+WTwWINk8IT1cjT7t+xvPvNCl58KHb/QN5eZm883k0Um0w==
X-Received: by 2002:a17:902:7684:b0:156:25b3:ef6b with SMTP id
 m4-20020a170902768400b0015625b3ef6bmr25296568pll.39.1649537737213; 
 Sat, 09 Apr 2022 13:55:37 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 md4-20020a17090b23c400b001cb66e3e1f8sm2523139pjb.0.2022.04.09.13.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:55:36 -0700 (PDT)
Message-ID: <70faae86-0eef-7f00-f629-e29b6159b934@linaro.org>
Date: Sat, 9 Apr 2022 13:55:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 41/41] hw/arm/virt: Support TCG GICv4
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Add support for the TCG GICv4 to the virt board. For the board,
> the GICv4 is very similar to the GICv3, with the only difference
> being the size of the redistributor frame. The changes here are thus:
>   * calculating virt_redist_capacity correctly for GICv4
>   * changing various places which were "if GICv3" to be "if not GICv2"
>   * the commandline option handling
> 
> Note that using GICv4 reduces the maximum possible number of CPUs on
> the virt board from 512 to 317, because we can now only fit half as
> many redistributors into the redistributor regions we have defined.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/virt.rst |  5 ++-
>   include/hw/arm/virt.h    | 12 +++++--
>   hw/arm/virt.c            | 70 ++++++++++++++++++++++++++++++----------
>   3 files changed, 67 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

