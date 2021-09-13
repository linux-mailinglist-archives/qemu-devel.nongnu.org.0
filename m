Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD204094FA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:40:12 +0200 (CEST)
Received: from localhost ([::1]:60452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPn7z-0005im-CN
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmZt-0006qA-FV
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:04:57 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmZo-0002W1-NY
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:04:57 -0400
Received: by mail-pg1-x52d.google.com with SMTP id g184so9542116pgc.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C3U2iNltkBAtK+iMGgBQB0y6DFLI8AXbAnTmRf35R3g=;
 b=V4Z87v8vOTacUsCZ/1O8DKPBLdJMcGth98wQoUTpf93xMwmYnGB+LuaVOhyKaOGXNf
 wFDX/wD7wIvn0f4NTXf+18yfqVcSAMF/1TUoOPm9nrFmwtUHEogx8oxBmEUOUJDnCNcg
 p1JSrMH0Ik2En0ZuX9U4LxBe3idKlTM6w3RLhJD3x4L1pRbd3GAGOXlAziTrUGGITi9b
 wIp7tvmThZzzaNCpqiEKkFeyzbDexZwjQu5+kfSxeEmXBjOEgg4IMsfRcE1BwgWMVkq0
 UAuGC2lmgAiIZuLnUIiOXRm3Z2MLSrAoFOdJNBxvKvtVG7LfsL9gFQ0zK5wKqSuJdrgN
 qNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C3U2iNltkBAtK+iMGgBQB0y6DFLI8AXbAnTmRf35R3g=;
 b=Lhua8iWhd2n2d/AnH15EmcoMGnRpV6/OD5UiZrymLX8BlE19wBMGUxbyJdA8T/Wj+Q
 LN/torfBFP4EzGs9jmPL2eX1Rc0j6bvMqsq2aF8aJYMGeLKMLPs3mYC17WRnkdlM4AO+
 yTBFx8CHb10yv2JINO3zzGrbDivFPn28r6SDVFVUtBTuWLWzG1ldpdCBP9N37eqjK6nR
 EjoIDJxaS8rZsD6qLXZZ1GUuOQ6y9JSSEGKAmr+RGu0+VUMhgXV+/sI71toEWA1MkT4m
 hDRWpsC6rky5EPcCEeUC+GN1+T8t0IiRkn+2iz4ZVxty0b9h5+2NqODUwVfhpGBI84tR
 GzrQ==
X-Gm-Message-State: AOAM531UacVHnZtSTBQ2SD99ny/pa6QwxuqttNgiRmgbWblrhrtYR4Sr
 Qp1viptcITWoVH557hLQ4YwoiQ==
X-Google-Smtp-Source: ABdhPJzB8hHGFob30eWMJIzKVSi6hIcsRGm16n4fIFrBh4emqw6wtg8WtNuu7tp6wMAVNCII+DCJtQ==
X-Received: by 2002:a63:5f8f:: with SMTP id
 t137mr11160288pgb.420.1631541890068; 
 Mon, 13 Sep 2021 07:04:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d5sm7477157pfd.142.2021.09.13.07.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 07:04:49 -0700 (PDT)
Subject: Re: [PATCH v2 11/12] target/arm: Optimize MVE VSLI and VSRI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11157474-24e7-093e-bf8e-43dee299a333@linaro.org>
Date: Mon, 13 Sep 2021 07:04:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 2:54 AM, Peter Maydell wrote:
> Optimize the MVE shift-and-insert insns by using TCG
> vector ops when possible.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

