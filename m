Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A32C8CB7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:25:29 +0100 (CET)
Received: from localhost ([::1]:47904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnrc-0005eN-L8
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjnpB-0004ip-64
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:22:57 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjnp9-0001hy-CA
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:22:56 -0500
Received: by mail-ot1-x341.google.com with SMTP id k3so12213864otp.12
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 10:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aFTZv17egHO89peHesTFEHOaYb1DPwUEAYyGl/DTYr0=;
 b=XVEab8/7XpDtdua1ePYZCzFrhggDCNc3U13g1+HFoxxINDnMNPJaA6zStDenPs/FMw
 Iy0u2glzDCPjOIh2iM9RlbHBG7WVqCmzLOTf3jEQYDnoqILbVRfyDc+hY8pU8zv65duz
 1OHlVj0UcyXm9p43X2vwY7Sy5FACNelrE2sJYoUppry7vg/UxkXGNHtIcLI5ApePDH6b
 wNrFCrvBz70uvgyt1C0/RbIHCvutwWfRR9g/MyYnBkuF4Z2mVTsPdJIaCXyg83r7mzcu
 +C50PQPDXoZi3T0PWrUX7zyGGvBE3kWrxjs1qDVW9ZvTE/EVPerNYdVGFwvH7wy+Ajl2
 LV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aFTZv17egHO89peHesTFEHOaYb1DPwUEAYyGl/DTYr0=;
 b=WdWZ5qW3nKWd7e3StcSkY+OUsXkQMGKpBTTUYoikH/WxoQBFJH2DAmbjMp/G1/Ihbl
 opgoyxgVcZ8BM6cKk/IBhddfmKRlS4kA11YwUcjTfu2dA4InsIWSOokxR+ljfAjBbQOS
 0oNnNaz0/mPmGX93//0Qw6wJp8/QRssGCn4hJ8vfZbPlkr70q+gpLcfN1IUh0FATNQSr
 YAapOzwNU4pFgncPoaG4Ec4pmaXzvVnCBOW693+gY3nAklGEgXLPml5Lkm2jrC6dezUW
 a1gQut0y9o2JfNbIISBl4OYKsWxvvz02X1kcyTL4ykNrCoODuvxsSh0/bByB+SFCk16b
 EAnQ==
X-Gm-Message-State: AOAM533DnGIffT0mx4biY4fU2ThG1CfcZw1Sv21O2LvkighQDF59hBJM
 zwwImz/1nKSS4uFgF/haoBCbiMBepx6V+S8F
X-Google-Smtp-Source: ABdhPJzO7KpLop8SnG8S/u0nSegH/6TX1t4ccgTA4ZWyZif78t22Hq8RooqgBx2MFIT4z02ccVhMTg==
X-Received: by 2002:a9d:3f49:: with SMTP id m67mr18008536otc.78.1606760573191; 
 Mon, 30 Nov 2020 10:22:53 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j16sm10091178oot.24.2020.11.30.10.22.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 10:22:52 -0800 (PST)
Subject: Re: [PATCH] target/mips: Allow executing MSA instructions on
 Loongson-3A4000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Huacai Chen <chenhc@lemote.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20201130102228.2395100-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e59e0eee-16b1-7ed1-c5e0-30fa8781f772@linaro.org>
Date: Mon, 30 Nov 2020 12:22:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130102228.2395100-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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

On 11/30/20 4:22 AM, Philippe Mathieu-Daudé wrote:
> The Loongson-3A4000 is a GS464V-based processor with MIPS MSA ASE:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg763059.html
> 
> Commit af868995e1b correctly set the 'MSA present' bit of Config3
> register, but forgot to allow the MSA instructions decoding in
> insn_flags, so executing them triggers a 'Reserved Instruction'.
> 
> Fix by adding the ASE_MSA mask to insn_flags.
> 
> Fixes: af868995e1b ("target/mips: Add Loongson-3 CPU definition")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Buggy since 5.1, so probably not a big deal.
> ---
>  target/mips/translate_init.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

