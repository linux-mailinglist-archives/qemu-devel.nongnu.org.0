Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1474C306C97
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 06:08:50 +0100 (CET)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4zY1-0006de-5c
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 00:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4zWS-0005q9-7Z
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 00:07:12 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4zWQ-0006MX-MR
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 00:07:11 -0500
Received: by mail-pj1-x102c.google.com with SMTP id g15so3577166pjd.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 21:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d/yS+nXjAS6ftvTIVhPoJ1abnGdrW5B0BqdVpOYb4K4=;
 b=gGGqYfR3kMwWnQdlKlWgr64zaF4snlLw9INEWPt4n93My9UGb1LAXJ3C6noVDDFiMf
 z7KwrOacvlYVwfOfXgMBcX85+Bo1VaJSIrT4BGB5CdIhdnbZ9CLRMUkwdL7B+kSvAeXs
 zfwqBC/Vw+CPMLqnhmM6ru9CLmkg0fyRDSbvpLn1uMpCcLzDlXIbGIWmL1M8mUiqyoD+
 cR1ykN6i5apgwRfZyqCx0TJKwh/YlvIEsaFN9PUMYp89gBpkjY8kcXQkS+TDZ3eoLqbp
 W5nGJ1/vVXHK+fvl4VSfFsgVdCTxvCwBKwF8WPBfKppPSxN6ncpRkOg0nEEV7dn7PrFV
 3l+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d/yS+nXjAS6ftvTIVhPoJ1abnGdrW5B0BqdVpOYb4K4=;
 b=inFmxiiLYP7fV6o+UL+GpNC5Q8rcLcd8EBe+dkMS1z/V5CFFtN4BfaoE0MKIckDE3P
 gJesydAcxs/eXSG1iGOPScnEdXBw0FpLWkqmpW2Zan4UzdeTogCUA+6iEfusoTN7hxSZ
 D9Yyo2kg6uBVxLOC+uZzo3v3yMsFrV8jYn7ZcSorc3DrKSACoWf1uxitrOsnPxhA/c14
 xZIe+gYlxgDTednL2tbntxGnwBY4KU3ApadZgdNKTSAIQBu4gphUFu3XB5pa7haSIrxO
 BYDXFzfSCHusqrueJ8st2cgKhDrqTsQFK9S6ZSNLZtNwL3N5svIGBxRKsZN7JvEhGi9e
 Ws2g==
X-Gm-Message-State: AOAM531UEoVTTf158MgPFgbVEPCI5Af3sGl5bZJHTfpbi8iobD/yN2k+
 13V4Y2NyVhwonnzfnhiyoi6YWA==
X-Google-Smtp-Source: ABdhPJxKDYsfqk4VuQdKcdb3SNdui56mY9Wpk2ASVbF/PYRwEAnGU4QPdnf+naCZYGIBpBrbxK5e5g==
X-Received: by 2002:a17:90b:710:: with SMTP id
 s16mr9079444pjz.46.1611810429402; 
 Wed, 27 Jan 2021 21:07:09 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id bk18sm3781667pjb.41.2021.01.27.21.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 21:07:08 -0800 (PST)
Subject: Re: [PATCH v3 4/4] target/arm: Set ID_PFR0.DIT to 1 for "max" 32-bit
 CPU
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210128044529.1403-1-rebecca@nuviainc.com>
 <20210128044529.1403-5-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f475fad-4af4-24bb-f1b2-1c77c18cd40d@linaro.org>
Date: Wed, 27 Jan 2021 19:07:06 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128044529.1403-5-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 6:45 PM, Rebecca Cran wrote:
> Enable FEAT_DIT for the "max" 32-bit CPU.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

