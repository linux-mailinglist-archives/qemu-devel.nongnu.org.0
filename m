Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AF93B6464
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:06:08 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxspr-0002ZW-2K
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsop-0001sv-35
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:05:03 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxson-0002Ix-D6
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:05:02 -0400
Received: by mail-pj1-x1031.google.com with SMTP id kt19so2415518pjb.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PUywesX7lF2HuhE3R4LcaZPpZv75bs4yLUICjDbuMpI=;
 b=XuVHRNshn2kyoYoYv8gDh2uQQOaD6x1KlNrOUPnvxMK7BMsfqV4qQDyGzwEVfRhS7d
 oSGYbqqvq18iRT5cySbwyP+H4H2z84utu+Tv30j8ZZXrYIVFyvM41IUzIuicFdyuRERR
 b1cbc2yrBBvxWzuB5qyozrJHtY+Jo06Ll5TLYP2YTQLsLyDPQWVpKvEDF2ddMqffyo+C
 RQ3/xG6Z/e6k+rpopC11UGKa9BjcXDeyHY4NDh8kWeFRCcJ4wyGqhrgdoDwHGiS7HyDp
 6Y0vzHJqhFtEmkbcmbVwfADWu+LqZlguvDjylKqINVNsML4HKy/6doZyQfncdx4kynAP
 LUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PUywesX7lF2HuhE3R4LcaZPpZv75bs4yLUICjDbuMpI=;
 b=EQP6r9imAG1th2D8rWg3AZcahHw6Fr8z6xeL3VeQRZUWGznlpzv1qgGe8hJk3BveNU
 YFS9oKAyCifemyKQmF2/SexWUrMGfXOzEa1+7jSu+n9yeclCITJFW5joYUrz+TIh/Y1f
 P+2nWVoXngB8OGuRpkbpLpO8FQ+MVoeDGNtV6GNtAL+bnVZNjQ34xKRfj1rgdcmEqpi6
 z3CH2chu0pJ7WXUs+zKMIS6z6bLStF48dR2UaJYGnQ4MtMVbGAb4pNcY/QJyoJ+uW+2n
 lKfXCaXFzvqP7vNTEMgmA3sank2bIIXO+dR55fbu0m+mSiwoJVwiHfouCKj1v8thbNAX
 x9nw==
X-Gm-Message-State: AOAM5309yr5YnC0HgoExdpBvueAutpNNgiBuoHUAX6nnBU2XhDTUN9dB
 3nWOGpiAIgwc1FaPF/Vg4jACyg==
X-Google-Smtp-Source: ABdhPJwsaMI+jIE7OLAtv/p0bBSIJB14sjnRzdnI5bz6RUUSpEZkcLbtMQyTjZBl6nRukrCmS1m2KA==
X-Received: by 2002:a17:90a:fd11:: with SMTP id
 cv17mr6483464pjb.8.1624892699675; 
 Mon, 28 Jun 2021 08:04:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id o34sm16141257pgm.6.2021.06.28.08.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:04:59 -0700 (PDT)
Subject: Re: [PATCH 0/1] target/arm: Check NaN mode before silencing NaN
To: Peter Maydell <peter.maydell@linaro.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
 <CAFEAcA_vxA12WMi6qdV2_wNiNAKZ4j6-FTKnwfphT7nGznJoYw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <12d4c7de-1346-2aee-75f5-4db729b7f1c7@linaro.org>
Date: Mon, 28 Jun 2021 08:04:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_vxA12WMi6qdV2_wNiNAKZ4j6-FTKnwfphT7nGznJoYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 7:54 AM, Peter Maydell wrote:
> Richard, Alex: what is the assertion trying to achieve ? It doesn't
> seem entirely obvious to me that because we're in default-NaN mode
> (which is a property of the *output* of FPU insns) that we should
> blow up on calling float*_silence_nan() (which is typically an action
> performed on the *input* of FPU insns).

This was in response to e9e5534ff30.

My assumption in adding the assert is that it was probably a configuration error.  If you 
disagree, I suppose we can revert it, as it's not critical.

> If we do want to keep the assertion, somebody should audit the
> other frontends that use float*_silence_nan() (i386, m68k, s390x)
> to see if they also need updating.

Easily done.  None of them ever set default_nan mode.


r~

