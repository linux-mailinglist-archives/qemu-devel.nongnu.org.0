Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21153355F3B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 01:08:57 +0200 (CEST)
Received: from localhost ([::1]:42334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTuoZ-0007Rc-Mz
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 19:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTund-00070X-Lr
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 19:07:57 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTunb-0008NQ-9z
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 19:07:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id z12so4300507plb.9
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 16:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8zCFd+34bO/Zd/0fL1P18PDObZdIcSJPZJMgh9LZxHU=;
 b=kzMK2+BeJ5SB/WroWW/nWfiGWCqM4KrQcd1d/GfX1MjYtVI2kbBq1JhDcSUQMyM+KJ
 jG4l8lYQQRvIS4vOr41ynmTFx4dMavW93Yu/Wd9geZGS78CU3agSKGHkTtc9iOW94ket
 Z1J8lLPYz1a001Qh2YHazSoTzgo4ZO0qnFYtQYANBX4few5zUNXQw2NAZtQh/emvNhDn
 uMsLzTlm0XSbDcSZo4TJWkKrUODHipXBkFHJjbM3HWIAZV/i9LXzykxirbWu0NTVCaxO
 MtQYOYLbKiJgjXSerLSfwEd91Yd+8F06Y1uHEPL4PMfsdrSxDIIyiAcoHnjbfqmb1LkN
 +CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8zCFd+34bO/Zd/0fL1P18PDObZdIcSJPZJMgh9LZxHU=;
 b=lyrPkejPT/wDgyG9/c3pkHgy1bAWZcRe0qd53IsSC/WlN0kzStsilBFSMTFvvCViK0
 dfJO9dsECfQzw3sEohjgn+WVAshd1zAiVhgMrh6ADQMvkLtLCGIDdrMlTXZ1MeV4qM9F
 cE5Yi68aFfTXRvqo7d+bZSnt10YtHk7ufCZZ0SVMkRJVC83A5Gf1hQMRfHskvupF1IwS
 XABDD3FxFq2bOjWP/ARNNtNtiA+YP2uQGCczm/AYyGm+okn01e549Q3H8IBoBMBA6fWm
 eCurUVCj3hPwlAnXJ5gEBVysa8WvBsoD7fWo90jrvjS0clEmqHrXrlgQrmlTHVpKhBxs
 n0xA==
X-Gm-Message-State: AOAM533lp5TRn1k49qSdlz3zEawrDWW8EC/zoX7v9Fv1EvwC5F5gfPU0
 40tmiI1cPBKpaUDOnoquaWxZwQ==
X-Google-Smtp-Source: ABdhPJzJa1iOsz12+O28e+NRxFSp5QeUHWksZZrIov7BRgLjY2c6rK5IFtviu+12sQsx4XLhCSsnJg==
X-Received: by 2002:a17:902:e5c8:b029:e4:c22d:4da6 with SMTP id
 u8-20020a170902e5c8b02900e4c22d4da6mr388363plf.10.1617750473588; 
 Tue, 06 Apr 2021 16:07:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b17sm18889748pfp.136.2021.04.06.16.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 16:07:53 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] target/mips: Fix TCG temporary leak in
 gen_cache_operation()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210406202857.1440744-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <314906bd-46b2-67d3-7689-fd323a426515@linaro.org>
Date: Tue, 6 Apr 2021 16:07:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406202857.1440744-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/6/21 1:28 PM, Philippe Mathieu-Daudé wrote:
> Fix a TCG temporary leak when translating CACHE opcode.
> 
> Fixes: 0d74a222c27 ("make ITC Configuration Tags accessible to the CPU")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/translate.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

