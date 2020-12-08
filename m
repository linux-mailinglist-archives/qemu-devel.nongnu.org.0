Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F512D3619
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:22:33 +0100 (CET)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlNO-0005OA-Kv
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlKR-0003Q5-KH
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:19:27 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:34509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlKI-0008GK-0H
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:19:27 -0500
Received: by mail-oo1-xc41.google.com with SMTP id t63so1842388ooa.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xDwpGT726xRhONIQmJXT523muASAVX9eu2F70HGWcbA=;
 b=WKFvmq3yj7KNStVoPvwp8EW1UxKQo/+nbYIZGO+Uz8aP8rTQzjxpkNeIKlBYC7OvPQ
 LiT3QrHV5aqU49z4I+Sol2r9TXasSyPoBCy3krkLIBcCevAnyqAzN4eCivZuVZvrG8Fn
 n0+bO+U+Kg08gD48KjDVlnBhj56b/vKMnfERDVoUhbwZAKuaBv+C2t0icWSi0K/BMcie
 wFCBENXPXIZzbnF3Zimleg7wzdMfSOiVbVdgI1gJAnad4sIohpLcaUUhpZLmAeuOaz+o
 /Gx5buFn4AL8yZv5jSq7l3w553TjOZKmDqktJLamcVfM06RxUlxhHFme5G/lfoRHU2gP
 0TYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xDwpGT726xRhONIQmJXT523muASAVX9eu2F70HGWcbA=;
 b=hUvEfLqOvcFh7LZohUGAYN6e+22A7sXf9BfggjovhIIoHOANIaSrjK5W7uX3JUt0OY
 /H1LzX0oYe4OoYqFHAdCgQMBV7cJ4CIo3YhjBJxGMgGuS59ifWBk6t6wYRvW9WB1ydPT
 F3Cb+rvmZjFvj+/Y5JaJu9eNwDCZmD/dJwjF7Lw3C2MWaP+gylueOQ/30n3IPNXStOGU
 /T7CK9G/OjfdjptyLNGcjrUrEWbZfmxRMjwKSeKsmjm+7bRo/MiGNQ5BWdyNJz+tBV3v
 OBDDTnWd8oND6yBDvxFydgnGAWUvUfP6TT9eRC3LLeIh85kK5NXNMXD1ukl5JZ9KDm2G
 IefQ==
X-Gm-Message-State: AOAM531R2NkvdtcyMCLNi/lFb+VdEF2wyyf6e3TkROZYtaHwDsXHaxTj
 rBFhEyRZv722YizkBbyARr7q3Q==
X-Google-Smtp-Source: ABdhPJypmq/3QKljpyXxtaI0epcFY9NspamoM+y0fpQMw/M3ONAHUme4ODDeN8AC699XzUZsFykXqg==
X-Received: by 2002:a4a:ded4:: with SMTP id w20mr103760oou.49.1607465956716;
 Tue, 08 Dec 2020 14:19:16 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v123sm29263oie.20.2020.12.08.14.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:19:16 -0800 (PST)
Subject: Re: [PATCH 14/19] target/mips: Move mmu_init() functions to
 tlb_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22e61d04-d118-1c25-40f7-476861c66825@linaro.org>
Date: Tue, 8 Dec 2020 16:19:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h           |  1 +
>  target/mips/tlb_helper.c         | 46 ++++++++++++++++++++++++++++++
>  target/mips/translate_init.c.inc | 48 --------------------------------
>  3 files changed, 47 insertions(+), 48 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

