Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADA669D344
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:51:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBFx-0008NT-AG; Mon, 20 Feb 2023 13:51:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBFr-0008Im-AI
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:51:15 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBFp-0006JO-NX
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:51:14 -0500
Received: by mail-pl1-x632.google.com with SMTP id t14so2837619plo.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ngagxltp/pj0L5xJ7citQRxeVgJMhPUIstQCvSUy3Q=;
 b=NPWW1BOy08zzMgt1ss9rlbJPmDzu66Lw03gIAwxUQh2/c3X8AKvTbAcbsxNjMMnzBy
 H638ZpCEyEB6qOSYE3gqKL3sE8h836yu4hqeiX/K/TqpK6j0UQMqVUI967MLy7cEmdes
 nQ1e5GThVb/lWYv7WWO5tJ6PFnC1//RINk9Ok1mE7MQK9eO17HXI8aSRk46EvF0FSykp
 6+4ihNDOPo2S2jFVTb665n+CETPAeU8ylhIK7n0sGg2N+FozzcewcRULuVBcVeZbUiSR
 mQo23DzsmJ8ozq4K0keL0scy09zYwrzzKvoSbOBUK8bmpCIkIAdRyAvYIiyAotkuQNck
 BvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ngagxltp/pj0L5xJ7citQRxeVgJMhPUIstQCvSUy3Q=;
 b=ZFcA+IwMNzGROMWY9V7tV5rBNuBDX860DlRWTF79YorOkZm5ey/7ouTIyA/GaJKB5r
 ti/lXpBXJ2Xv9pPsGGXE4egni9QMb+GHyLZJlkbLg5QNzsRuKMu4z0QtbuiyjLWzKXFe
 SJxC/gDFo8OKQg4uYPW/54+0ZEgF5PMr3aUogFHjMfg550kCZfnnTA5Xp0ez1tj0VgnF
 2X5OcYBNiUMELd1Q7SgSHXisYAl2bcul5TP4EMcy3d5a+5pdDXSUyVBEoKPwL9rm1W4z
 ZTZTM3yuXfjFFhPMvQ7CBzRH2oUe9hbO/iQ7noTo5IHIngootgHPq2bcT5mvxLRpd/Ln
 E7pQ==
X-Gm-Message-State: AO0yUKXrs3eXroS91C2P/ddqhpxRc2XIxcx7T94SkPWs4KGA84OvtWuO
 j8KjjjnUcrKIgQiijpeyqNMFCw==
X-Google-Smtp-Source: AK7set+0swR+0JOvFzflb397G3AUPKvwaxjjBC9VcjLatL7KaZC7RmlXMXyJuRLaKeQDqbflZ9yqLg==
X-Received: by 2002:a17:903:28cb:b0:19a:a43c:41a3 with SMTP id
 kv11-20020a17090328cb00b0019aa43c41a3mr3768256plb.42.1676919072201; 
 Mon, 20 Feb 2023 10:51:12 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 s2-20020a170902a50200b0019926c77577sm8273010plq.90.2023.02.20.10.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:51:11 -0800 (PST)
Message-ID: <300c815f-fc69-4aac-c1b2-81526419623d@linaro.org>
Date: Mon, 20 Feb 2023 08:51:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/8] hw/char/pl011: Open-code pl011_luminary_create()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220115114.25237-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
> pl011_luminary_create() is only used for the Stellaris board,
> open-code it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/stellaris.c      | 11 ++++++++---
>   include/hw/char/pl011.h | 17 -----------------
>   2 files changed, 8 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

