Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C324841FE1D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 22:54:09 +0200 (CEST)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWm1I-0001Iw-BN
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 16:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWlzI-0008N7-H6
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 16:52:04 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:40787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWlzG-0006n6-Pf
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 16:52:04 -0400
Received: by mail-qk1-x736.google.com with SMTP id 72so12662631qkk.7
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 13:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cFIwRhWGX1lXEgIcRz+DPIBOWznev3PQHLvgo6Hsunk=;
 b=XnG2qbOygQ3FL9fI6rc9wp1cNPhtQmbOjxw5291xoXbNf/F+CTxMaEyB+w4xno2uqO
 siOhcM097KcCZGHIfcKciSK2/QJGBCgqbCD/MNk9Qo17oV7FAgs4tQZmsd/YVdWyfO/9
 BHxtkDeWhdo7q2cWxeJK5vdl9rQJnIs4NnYm4LJhZZHORKB8Q7xglGRSotQXFCix/JHP
 55TmoyhV8shLZzB1m8Nu8pdIHFL6mM254Ynu+JG9iDGiwUhWLKz3ks6fzCgd5zJDFL7h
 w5gCsKBZeS1nsuN44BtHUEsphvSOTujdIL+4/EZ6MXmJ9AJDzROQ6Qr8aFPo9fsoUihk
 zQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cFIwRhWGX1lXEgIcRz+DPIBOWznev3PQHLvgo6Hsunk=;
 b=YbsGJ03RwuUPNQPlIoE5Ue7K9ANp0ky/x0gyDtYzML5QWZcWia5j4ROvRnprDjlJ+5
 yEXZ4r45rQrJ2pq2sBjm17xguY9RtRu/cdJtLUTLsjXNInkzdxy3Srq6ROYYP8yhIUHX
 kunHcm0FeoJefLezrqQBPSBHCmy+eqjlUMf+W9iMHvSaAwiKOSEUG2tJJg4d39Xt+r+7
 tNuVLJ9tqfY+zAgiHkMg62QuRCUtc8SCYKlh5cAsXv+5mR5z3txlRgi/B6rm2o/dH1th
 5TJJxxlbPwXx1JO4iCAYtNF4bMX2GZUNWhdnShWSVBifdarvvS+VlRjHSkrWi5G6dDpI
 ajdg==
X-Gm-Message-State: AOAM532LUv7S7U1CrZzkz5Y4Xii65wuCoxAE/YoWORBJX/wyj7GfAz27
 DD1tJTUqpCGSdhlxLXA7l10C8g==
X-Google-Smtp-Source: ABdhPJx8BQ3v5ggQma7qUkqHOQtMZoLc0F8C7exPP7moTvEOgmu8ahgZBKfcy+MqkF+I68f52TiQmg==
X-Received: by 2002:a37:6558:: with SMTP id z85mr3843241qkb.310.1633207921256; 
 Sat, 02 Oct 2021 13:52:01 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id l3sm5971425qtu.47.2021.10.02.13.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 13:52:00 -0700 (PDT)
Subject: Re: [PATCH] target/mips: remove gen_mfc0_load64() and use
 tcg_gen_ld32s_tl()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211002133753.3432668-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6c20416-46cf-b927-4d97-f5e040572d80@linaro.org>
Date: Sat, 2 Oct 2021 16:51:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211002133753.3432668-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.413,
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
 Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 9:37 AM, Philippe Mathieu-Daudé wrote:
> From: Leon Alrae<leon.alrae@imgtec.com>
> 
> Remove misleading gen_mfc0_load64() which actually loads 32 or 64 bits
> depending whether MIPS32 or MIPS64 and also replace the pair of
> tcg_gen_ld_tl() + tcg_gen_ext32s_tl() with single tcg_gen_ld32s_tl().
> 
> Patch partly generated using the following spatch script:
> 
>      @@
>      expression reg, env, ofs;
>      @@
>      -tcg_gen_ld_tl(reg, env, ofs);
>      -tcg_gen_ext32s_tl(reg, reg);
>      +tcg_gen_ld32s_tl(reg, env, ofs);
> 
> Signed-off-by: Leon Alrae<leon.alrae@imgtec.com>
> [PMD: Rebased and used Coccinelle spatch to complete]
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 68 ++++++++++++++++---------------------
>   1 file changed, 29 insertions(+), 39 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

