Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA52DA32F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:19:01 +0100 (CET)
Received: from localhost ([::1]:48042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kowBI-0004xq-Fz
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kow9Q-0003gp-3z
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:17:04 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kow9O-00053J-1f
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:17:03 -0500
Received: by mail-wr1-x441.google.com with SMTP id 91so17946446wrj.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 14:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TA1XwSXRGUMZFuXnosSaL6i24+FW/dFUTdxK/MC2Bqw=;
 b=WjzHWJ/3LfANZOkr6JOQjo4liQpR8RlP8bBQ66GRE6eGIBYduq8zdtqW9ypIQI5djQ
 wSrSl3wrxYLocLj1xuffvmCGCze5flAq62G9qPPbGEfelJVQYFDIU7a3sYJMCfZujWqP
 AuJnqf+yNSTbz0Uhm41LMd8p8T7Eia9cnc/x71c4QZGnzIhxiLV5eVZcMITsn66clBcT
 qqr95q8HIGRieZv6Ff8PNG9udNJn6NhR0RJk1j/c83U68UVdp9HKQm13tuhCC90u2Sk5
 kkWkWZ9yn6s+VH71AK06eVKT7pP+1wtq0/tx4Z6dZalycryRNVRZFqxGITioIoMMD+JI
 B8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TA1XwSXRGUMZFuXnosSaL6i24+FW/dFUTdxK/MC2Bqw=;
 b=c3D2YA2ISH3j1e/4u5e3h7GYvkXDmCcgUTXHitVUMgZ6bB257YTPXCsF5T/uKxiWE1
 fqqWrvKvxK9GCXpW/2AJT/p+XY+PSA5aNtvjZ7d///f+l4AddU9Af5GfyG+72wR+RFZJ
 V2GbaQGnJdPL3DE4PtYUReKVxN//fjq+nQjEsztqOBIg5Vvdv3bFOhquI7U/kWr1f+C+
 aNd63l93Wc5pXi4KEV+gjf9MpZvcftblLRENtzzVoy3TPXNi0f994dhXUXO8JYGJe/SD
 ndfz3daGk2mIIeBzgzkzp/HuqEzbVlTQb8ZKcdcTcRVHO4eU7U8cYY40RzFLXMKDWJqa
 HvZQ==
X-Gm-Message-State: AOAM530181KEGgh0EUshPOOFI27ff8svUinZLT1pVyZaJpyMLeOXROw3
 WVBf3nZ3fAED0ZpKVfvSk0LdeedJRuk=
X-Google-Smtp-Source: ABdhPJyJ9ssgJiE2G6XD/jsAC189XLvHFQYjKkBsYckiHPFVs/FGQ4TTiova2NmUBlSdftFIG+bQ3Q==
X-Received: by 2002:adf:a29d:: with SMTP id s29mr30766683wra.329.1607984220412; 
 Mon, 14 Dec 2020 14:17:00 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id k1sm5476217wrn.46.2020.12.14.14.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 14:16:59 -0800 (PST)
Subject: Re: [PATCH v4 10/43] tcg: Adjust tcg_out_call for const
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5604f2e6-7df0-e57e-05d6-08e007d3b3d2@amsat.org>
Date: Mon, 14 Dec 2020 23:16:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214140314.18544-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 3:02 PM, Richard Henderson wrote:
> We must change all targets at once, since all must match
> the declaration in tcg.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c                    | 2 +-
>  tcg/aarch64/tcg-target.c.inc | 2 +-
>  tcg/arm/tcg-target.c.inc     | 2 +-
>  tcg/i386/tcg-target.c.inc    | 4 ++--
>  tcg/mips/tcg-target.c.inc    | 6 +++---
>  tcg/ppc/tcg-target.c.inc     | 8 ++++----
>  tcg/riscv/tcg-target.c.inc   | 6 +++---
>  tcg/s390/tcg-target.c.inc    | 2 +-
>  tcg/sparc/tcg-target.c.inc   | 4 ++--
>  tcg/tci/tcg-target.c.inc     | 2 +-
>  10 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

