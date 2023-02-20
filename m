Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDD369D340
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:51:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBFW-0005LW-Gl; Mon, 20 Feb 2023 13:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBEp-000585-TY
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:50:12 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBEn-00067R-Pv
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:50:11 -0500
Received: by mail-pl1-x629.google.com with SMTP id c1so2778716plg.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=he4FzNRAucaPCOV3nL7YNHnDOBFniHWFKVZyhdHNRpg=;
 b=kosbcWbWmHj/EJ3keID86oLwprdXfD72YxlPDVjDYoz2pUdiGduev3++85rBJwCf81
 BynMK2+kpQkNwtcAfohqYHj7SuWwomlZOvFTfFMWDjLO6nDefNUw4tcxM3oeiZql/xYc
 3cyKeUL8piTb6hoQ57Yq9Ygw2xlQEvlYRlLcrhyGuT8AlDRWskc1AGeZIoQk5/aD5Msr
 DLsmOw5RPNCtTKUMsAsZaJ8lpJ7gBk4d/gPaKyOPYDu5fHOuEDtEahMbI57GENICmenz
 BCcXEOGgs6D45E7FnsnHtR64bC4kZyu/FSo4Fo24b/5K3Dg2XbHXYd4GtADCAuxm+6MR
 ixOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=he4FzNRAucaPCOV3nL7YNHnDOBFniHWFKVZyhdHNRpg=;
 b=q/39FhKml9N1qXZzfoKnoVlPg/RtMAvg53YZzvZZWMMyayVaM9t4bcTa065UnzILxD
 6IF0lukSJ8H1NPVafnlLknS8DbN06Qd8oKJ5HjJnadMRnVLcFVTBa/VTMWBF3yFB3mlE
 WCjqWp7RM4Dt9fL3cJ5ZS2tkYEooA8ro8xfIAnAng4f0nuJ04nPc1LdUA7TzoTPRvbmc
 S+cR8IGs2RRIvp/vUkeEtl95cX1qrO/tltzWxTizxiyrCrhL+2DO2MVqV0uRfiezIDJE
 mHEZsu97jIfPi30TwQCPDgWYuNx1oDehEhETIUS3HRQLpjfL1cdpny2AS9PyfWmu2aer
 dXOw==
X-Gm-Message-State: AO0yUKU0PMsZj/3BpZUWnXlGrjZrHQAOJu2Jl/CU1JI0VN1poNZMhqdT
 woxkmdncyM1r6EkdZ+dHqLZ0Xw==
X-Google-Smtp-Source: AK7set/FxY4PSF1kBH2KRvKeCjol+ILi42juxE2DDDw5Kuha6OZvvu5pRXOfy8oLmyPSqNvBQWY2pA==
X-Received: by 2002:a17:902:c941:b0:196:2b0d:feb7 with SMTP id
 i1-20020a170902c94100b001962b0dfeb7mr4971509pla.13.1676919008272; 
 Mon, 20 Feb 2023 10:50:08 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 w5-20020a1709029a8500b0019a7bb18f98sm1313578plp.48.2023.02.20.10.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:50:07 -0800 (PST)
Message-ID: <0c0076ac-e82f-193b-cbd3-b77f52b082fa@linaro.org>
Date: Mon, 20 Feb 2023 08:50:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] hw/char/pl011: Un-inline pl011_create()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220115114.25237-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/20/23 01:51, Philippe Mathieu-Daudé wrote:
> pl011_create() is only used in DeviceRealize handlers,
> not a hot-path. Inlining is not justified.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/char/pl011.c         | 17 +++++++++++++++++
>   include/hw/char/pl011.h | 19 +------------------
>   2 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

