Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A352D3727
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 00:52:14 +0100 (CET)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmmmD-0007FA-63
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 18:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmml1-0006kM-U8
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 18:50:59 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmml0-0006DT-30
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 18:50:59 -0500
Received: by mail-oi1-x244.google.com with SMTP id f132so444217oib.12
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 15:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Va5tIvz5klhbM0eSOapJxNaZnZNjBNHgXI+/qV2O0oA=;
 b=vYUbIJdfQKTO6jtttJiGouy+q8bOkUy/Y43lUmeLKhe9Cis487PitSGZSsRsGBgSlW
 6wS3QsH4n1W5qaYBqkWae1/ngibBxgmNiWyfxH2eTcCoaoRmQ+7cmWRwwG6p5L7c3EfO
 9ZMrvehXLxCS3jxcP0azKQ8Cx39Hk1qgcWt/lN3ikivrODMEPpBWfI3FuaB81BrJveGD
 O+k2YfljjDbh1ON5Mj+8KFDyfSr2coWZ56wK0SnamPmU5EXd3XRXGKsi2HrWS9EFzVrr
 NZijfh4vVpnj3xAa94KpFfyghlx1t4ogdsoqAh0h+DHauthW7TEw94Ljn6FrUV2SCKJn
 DKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Va5tIvz5klhbM0eSOapJxNaZnZNjBNHgXI+/qV2O0oA=;
 b=PggwNmqRHN1TCYWrOQMFAKU3fx3UbSSpqE8bGJzQJp+xIeZNigLn8mi2xB+N1s3PQE
 NFijTFy+TLr6II+Ib55yrR3h7FkwP8lHSX9Qg5KCLAwrrOWxBycLBdMwu8Ea1g3DZYsX
 JreLZFQ7ldApAtAyLfetf4K6+QxLzS5eszBYMkkUreP6fhtcbLwZdVhGuEwQ+HA6uJc7
 IIhtBvRDPYZIr0p24tn6tafjz9Zeoh/fTrDDDvBstZQkA61HhS2w4cXWj5B2F5/6Kkco
 VSnu3hPkh/nveTy2KkV6/JpkhktsR7sK+EbFCSzE3UbJQsaUX7R7bNhZdT01obgBUqKz
 Jz5w==
X-Gm-Message-State: AOAM53255xk1bn0wiHVhxiTs8TMigEQQj6/WeclvUsq4sI64nmPhwiug
 6SP53miCYEpheAWIe2iadCCd+w==
X-Google-Smtp-Source: ABdhPJzAaoS/6a0eDMMlllIJCQ8EpGBb3Jvq3i9hJvOA+AN10+rECI7P51n704iv9j2H7UKl0kMFUA==
X-Received: by 2002:aca:498e:: with SMTP id w136mr253244oia.147.1607471454861; 
 Tue, 08 Dec 2020 15:50:54 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t186sm89937oif.1.2020.12.08.15.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 15:50:54 -0800 (PST)
Subject: Re: [PATCH 4/4] clock: Define and use new clock_display_freq()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3884544-4571-adb8-f576-e8d0bd90cb20@linaro.org>
Date: Tue, 8 Dec 2020 17:50:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208181554.435-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 12:15 PM, Peter Maydell wrote:
> It's common to want to print a human-readable indication of a clock's
> frequency. Provide a utility function in the clock API to return a
> string which is a displayable representation of the frequency,
> and use it in qdev-monitor.c.
> 
> Before:
> 
>   (qemu) info qtree
>   [...]
>   dev: xilinx,zynq_slcr, id ""
>     clock-in "ps_clk" freq_hz=3.333333e+07
>     mmio 00000000f8000000/0000000000001000
> 
> After:
> 
>   dev: xilinx,zynq_slcr, id ""
>     clock-in "ps_clk" freq_hz=33.3 MHz
>     mmio 00000000f8000000/0000000000001000
> 
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is based on Philippe's patch
> "qdev-monitor: Display frequencies scaled to SI unit"
> but I have abstracted out the "prettified string" into the clock API.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

