Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED03BE0A5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:46:31 +0200 (CEST)
Received: from localhost ([::1]:58984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wdy-00025s-Vo
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wcL-0000jr-P0
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:44:49 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wcK-0006nQ-4S
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:44:49 -0400
Received: by mail-pf1-x430.google.com with SMTP id f17so723811pfj.8
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yrHo5o7rcShqTTDZS6yFljVJNJtCxm/qovoAPldzbWE=;
 b=J0gXLRWcByNFPRpAUpdJLTktpts1ha8TzbchVt0gsEj91X/HfbW6CPLEYIfEkY+KRB
 lrBI7IsY9d+1zsQFhBPsNxHhElVj8fwst3fvqpn4JN2wSg4hnbA/NjsbwKMVlQDll0CL
 IKcpqhyXmEESAk4DGKoz1Vmge3tZx/O4ONgpiAisUlxEUwNpyERDW5/VaJep9X3v96B8
 39gtWgLp+P4PllaRGG7QKEkVrTtxLjw9n48qfmJc9Ntwulwqmf0OF/U5lxRTGcwHnYtq
 m1zXCgoBTkIShhdneKYi1wvUNwtrGg1CF5PdKclFiaVPQA9YVVZ6fp7Db2JsMG3OW3gv
 ckPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yrHo5o7rcShqTTDZS6yFljVJNJtCxm/qovoAPldzbWE=;
 b=CxD1lj54E4cb+KRF6xkZ86FAOvlczYCz4CEwZZy9pZ01QQUB0OMPyq8SFMnSFmXKxF
 FhsKrCSuENEjBDGOVZ5O0KfBq+HZTXw0iQ3JWHLxBrpDhqboHpBHQfEmn6GqoUAT/xNV
 itRUV+gYF4St9MvZsSRWdQgk/60aZVaeUTxOiq8CInM6t2GsSS1zXN6ozxvBFePo5PYj
 kZB/iYYwfBrs8uiKPKoMwCP3QmouB/kS6V7QB/qNeZsIsKaM/RUFgu7YASY5PLO5Ep5g
 0wy80pNA1VZCyW2bWdjlpboiFUWZf85YpWpckjzMTZT5WrHRlWFXV43xepXPjOrYBlUq
 MUXg==
X-Gm-Message-State: AOAM531WNwyaqnARNDG3X/SX6Gh8wIkCZVtvsklElgy82fVsU+WUAMKb
 LjQgxhoS881FPBbPPGWja99Brw==
X-Google-Smtp-Source: ABdhPJzDQXrJBvlbVhuvst5VLd+xChTgagJqbA+phgysJQ3tE9IMPQ4ZpeFlgOegUa/JGq+vdEOabQ==
X-Received: by 2002:a63:ee45:: with SMTP id n5mr23426494pgk.405.1625622286931; 
 Tue, 06 Jul 2021 18:44:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 194sm17756371pfy.51.2021.07.06.18.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:44:46 -0700 (PDT)
Subject: Re: [PATCH 02/12] linux-user/hppa: Handle TARGET_EWOULDBLOCK as
 TARGET_EAGAIN
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e96ce72-7b18-f47e-3a10-927f05334c39@linaro.org>
Date: Tue, 6 Jul 2021 18:44:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 11:37 AM, Philippe Mathieu-Daudé wrote:
> Linux kernel defines EWOULDBLOCK as EAGAIN (since before v2.6.12-rc2).
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/hppa/target_syscall.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

