Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999AB2F27FA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 06:49:25 +0100 (CET)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzCYW-0008Jq-NS
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 00:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCWd-0007MD-MU
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:47:27 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCWZ-000586-9n
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 00:47:27 -0500
Received: by mail-pg1-x530.google.com with SMTP id g15so704731pgu.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 21:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q8QxIQHsHuPxP6eL6hGGKq2QhesS5z6WDNIeuQYABjk=;
 b=BAVN2kxDLR3BcDEJA6XBGmY/cd00ER1wVkl42h+nX4T0+C4pqBBJFzVR5CYHtm9rcY
 IK9RfSnJUaiRdC+/aqtitAtrFvECaSKOLLWwyeXMOsrNSrPm50Bqd6mXyksfFnn60s4a
 ICHNV5Z6pumkM8Sdjd9Na2lQRhJKSI3Kb1RrMH4fUzccFTsNJJ3RKmXPhYaPrUdoDHFQ
 s1tjG+9QoJhHUlRNSbctv5kScJaxC5DTiOSEM5pwBacShC+L8/8DQveI0cMJ7SwiPMFx
 ZxNHtTR7OOR2dNvg1PXRsuOjXUMqlEDvNGBVJgVLL4VHY+yaOmGe1ZTTQYE237pBcXL2
 cQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q8QxIQHsHuPxP6eL6hGGKq2QhesS5z6WDNIeuQYABjk=;
 b=EXma1jUVhVdGOJKmt+mFlAPD4eX04vokM5t0HbCt6MsMLd50zLcyR+49uwOQjKeu6M
 zujH09aesGA0ijGXt2Waac+P2DccdCkTkn6A2xsVgJQZvOwqOnGJBAKJxYX8eNa1+yVV
 IWYKUBW9xaXIeP3ujPD8hc3TvBPul42pAfIa2u92KceoNxH7tk5BLhn2zWIxfm6NloCn
 wyfk+r5A8wTCaRpJScz7lkdJy7o9i72QsOhiFFtuq9P+6bsSlI7E26P4Dop3VKJez4mN
 +U2tMjSGMqeg7ECsCEXO5tFvKdEQbKstH4RG2D1PLEhNLRtNa65eCFYtH8tiN6+JSc87
 sH8g==
X-Gm-Message-State: AOAM532rt6MnYJxiEmBzMwYIam+GdCFKTyGOfQTY8f6sm7QEJrtkJdxC
 ZHE/pPeE54XUcpdkzokWocqvUA==
X-Google-Smtp-Source: ABdhPJxpkrxTCZnAI1uismNrbFj/FZyB20FyxjIevgIozl0WGIG22Z8kZPPhn1OCexeMLMeACreT8A==
X-Received: by 2002:a62:1b16:0:b029:19e:238:8627 with SMTP id
 b22-20020a621b160000b029019e02388627mr3081699pfb.52.1610430441744; 
 Mon, 11 Jan 2021 21:47:21 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id p22sm1952947pgk.21.2021.01.11.21.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 21:47:21 -0800 (PST)
Subject: Re: [RFC v3 13/16] target/riscv: rvb: generalized or-combine
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-14-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8711dca9-7617-77d4-4aa5-368c3129f43a@linaro.org>
Date: Mon, 11 Jan 2021 19:47:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112022001.20521-14-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/bitmanip_helper.c          | 31 +++++++++++++++++++++++++
>  target/riscv/helper.h                   |  2 ++
>  target/riscv/insn32-64.decode           |  2 ++
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++++++++++++
>  target/riscv/translate.c                |  6 +++++
>  6 files changed, 67 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

