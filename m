Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B82BBFEA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 15:33:01 +0100 (CET)
Received: from localhost ([::1]:43408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgTwg-0002cI-ET
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 09:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgTut-00022u-5Z
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:31:08 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgTuo-0006L0-Qp
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:31:06 -0500
Received: by mail-wm1-x344.google.com with SMTP id a3so13108237wmb.5
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 06:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7vpws+wntxmKJTcADknBMrfLuboanQwLEZvXgliAPB8=;
 b=XE3S3lYvRcoc+lYoUsbC0QFewMpWkyTjVGRCAf3PwrT2zBy1DPvnakXii1ycW2cAn7
 FzJ4YGbOBtqmbIX4DKqe9m2qe+AdNbCqvxDo4I9wplGQ0qOoQJz0JXsNIn0uQh/92aex
 nBEeiAIkQYisCpj6GIMca+E10DzYwAnaupCv/dG8NEDC+75bpyacypFooK3MHkgTni79
 M9HtNC2Vn7HZt7FsPHTR6Tm2bHBuNR0R0XXpGs0wvJhWroURTT5P5mw6+k/W6nhcnzyZ
 qnfQU6oowOGIaE6SD7fU7z/iebkWiOUBHt0Y5+Rt/ccpyCJiiTcBSTJ78cfCLg9Br5Ye
 UyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7vpws+wntxmKJTcADknBMrfLuboanQwLEZvXgliAPB8=;
 b=HZQAnDhQjwTsQzJ+waZ2U9oguRiPEEQLT2GHmVLRpvtCRSNZUiutrxP4Dzoy95kA/H
 VbdOUmQ3FSVH6IIuPyrUDQHABHSDMVNSfWpyC/Isac55QEYOGxJ0jrvN3yZgbdeJlMWz
 SMKSpsmWVpPFKhpV96KIBoXynkgprKjCpplk+AoqOkrOug8Cmn+ji2I6vy03wmI90S9P
 cqh456pROfF8OabPbmzhuo4OjCgJAJOFWcYWq+MxPcWcSUZM/gts6RhPu3j9Hp3LYM9F
 sSk+CnFc9V7JAKSSrxdiTkwBACdcLPL6L4xvjphKJu6Jb+msluru0kF5glAFYxtcZpo3
 zNsg==
X-Gm-Message-State: AOAM533ktwswaHRWzHUjts08Unnn/A8T5/IQnKBs15hHgvR1hrtEXBIC
 07OmgH9Y3lDdbHfmSD1dDFs=
X-Google-Smtp-Source: ABdhPJyLk2VfxSm2Al7YfMH1JORApJnwjXERy8f7zqJt/E/WQzDhVVNs1yZxRfRI1B8Z6Cubp4oIeQ==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr3024162wmi.97.1605969059502;
 Sat, 21 Nov 2020 06:30:59 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t74sm7766530wmt.8.2020.11.21.06.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 06:30:58 -0800 (PST)
Subject: Re: [PATCH 18/26] target/mips: Extract Loongson SIMD translation
 routines
To: qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-19-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2aa2dd99-fb46-0466-bd13-3ea8aacdc697@amsat.org>
Date: Sat, 21 Nov 2020 15:30:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 10:08 PM, Philippe Mathieu-Daudé wrote:
> LoongSIMD (formerly LoongMMI in Loongson 2E/F) is the
> 128-bit SIMD extension from the LoongISA.
> 
> Extract 600 lines of translation routines to
> 'vendor-loong-simd_translate.c.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                       | 598 +----------------
>  target/mips/vendor-loong-simd_translate.c.inc | 611 ++++++++++++++++++
>  2 files changed, 612 insertions(+), 597 deletions(-)
>  create mode 100644 target/mips/vendor-loong-simd_translate.c.inc
> 
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index b01a16e9da4..105a104bb0c 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -330,19 +330,6 @@ enum {
>      OPC_MUL      = 0x02 | OPC_SPECIAL2,
>      OPC_MSUB     = 0x04 | OPC_SPECIAL2,
>      OPC_MSUBU    = 0x05 | OPC_SPECIAL2,
> -    /* Loongson 2F */
> -    OPC_MULT_G_2F   = 0x10 | OPC_SPECIAL2,
> -    OPC_DMULT_G_2F  = 0x11 | OPC_SPECIAL2,
> -    OPC_MULTU_G_2F  = 0x12 | OPC_SPECIAL2,
> -    OPC_DMULTU_G_2F = 0x13 | OPC_SPECIAL2,
> -    OPC_DIV_G_2F    = 0x14 | OPC_SPECIAL2,
> -    OPC_DDIV_G_2F   = 0x15 | OPC_SPECIAL2,
> -    OPC_DIVU_G_2F   = 0x16 | OPC_SPECIAL2,
> -    OPC_DDIVU_G_2F  = 0x17 | OPC_SPECIAL2,
> -    OPC_MOD_G_2F    = 0x1c | OPC_SPECIAL2,
> -    OPC_DMOD_G_2F   = 0x1d | OPC_SPECIAL2,
> -    OPC_MODU_G_2F   = 0x1e | OPC_SPECIAL2,
> -    OPC_DMODU_G_2F  = 0x1f | OPC_SPECIAL2,
>      /* Misc */
>      OPC_CLZ      = 0x20 | OPC_SPECIAL2,
>      OPC_CLO      = 0x21 | OPC_SPECIAL2,
> @@ -4569,590 +4556,6 @@ static void gen_cl(DisasContext *ctx, uint32_t opc,
>      }
>  }
>  
> -/* Godson integer instructions */
> -static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
> -                                 int rd, int rs, int rt)
> -{

This isn't part of the LoongSIMD ...

[...]
> -}
> -
> -/* Loongson multimedia instructions */
> -static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
> -{
[...]

... but this part is.


