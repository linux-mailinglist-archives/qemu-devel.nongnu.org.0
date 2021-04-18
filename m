Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886E1363755
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:32:50 +0200 (CEST)
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDA1-0005To-4L
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYD7V-0004OQ-7V
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:30:13 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYD7T-0003oN-8Q
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:30:12 -0400
Received: by mail-qk1-x732.google.com with SMTP id x11so33893178qkp.11
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cg3u0jiayRSbG2uq/di/iOVNY9FMryevV02u+DEi2Iw=;
 b=ndGusWeEDocFkak4jHqa0DIVHT3k51MZB7qC6Fr7TEpyYIpH9vdNc3nJvF+ogoRW2l
 ZTQLPwcOzOjO0/QeGQATd6OEZYj/pd9dGmf5qodTwYq6zcYEMZ0hZBGVQa9wsENRMJ55
 sQckmOvwy0CkVlZjVP0h2fPyEy4/NL+x6kyTajs+P9Gy688vs8NHBxinBRpOskiUtHOM
 BoBidXvzCFmvMpnlbjZx3nlaVOVFb5Q6lo679QHwk2rNzRS+6QlxvAYf1ZREZWm+D/Kj
 h4rB/aY1AosEPNFMPBRkDSpTtrgaqCwUXf4kKHEsIMMKQ+OU8Ikykpxf1HrY1HwRmY8F
 Lzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cg3u0jiayRSbG2uq/di/iOVNY9FMryevV02u+DEi2Iw=;
 b=PSwkmS/O8ASNU6dooq69HZnqWib/iKuNVuESVASy+KiP6UiJUcakcmlrSyq+gLXzPq
 E0/X2jz2s/9xCjJLtsqjqJZfce0iomVo/5pCjOmMwb5rhDT/S+01qOCHdIa1wxptYiDx
 AGOW1ZXAbjbTH+MkzPG7Rg7T84Obe1AOYnn0MDoRo6rysAf+LFqVty/0BJcKcDK2+Kg/
 XpIPDvCUE2PGWTazPCaZpoHXu9fKIBVypqlI3qFfuA3gAKdh5xuNswgX5RQfCVECuahZ
 6JvNani9VErXrc6ScVOsWSyVrCkArvMXkRx5XA7LIHA3BpEuJ0pOzQ7JfhB+dR/QMpeT
 qQFA==
X-Gm-Message-State: AOAM532QH48QmvI/eA/klRz1DBsyhn2urKj7nH3bMvbx0whKabzOqfuu
 FOJN2+Lbpw8/u08yBQLuCkQjhg==
X-Google-Smtp-Source: ABdhPJyMSIBlMPFtnadfeMw5Jcd+mqOFOH5p1LUYRgEFl+X1QuZ9/LSGQqmfYpOnqw7iVDqEv2TtVA==
X-Received: by 2002:a37:b82:: with SMTP id 124mr97506qkl.212.1618774210236;
 Sun, 18 Apr 2021 12:30:10 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id v4sm1798453qto.50.2021.04.18.12.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:30:10 -0700 (PDT)
Subject: Re: [PATCH 13/26] target/mips: Move code related to physical
 addressing to sysemu/phys.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dacff85c-95c0-8875-852e-4b49333e94db@linaro.org>
Date: Sun, 18 Apr 2021 12:30:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Declare get_physical_address() with local scope and move it along
> with mips_cpu_get_phys_page_debug() to sysemu/phys.c new file.

You used physaddr.c in the end.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h         |  25 +++-
>   target/mips/sysemu/physaddr.c  | 257 +++++++++++++++++++++++++++++++++
>   target/mips/tlb_helper.c       | 254 --------------------------------
>   target/mips/sysemu/meson.build |   1 +
>   4 files changed, 282 insertions(+), 255 deletions(-)
>   create mode 100644 target/mips/sysemu/physaddr.c


