Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C5B32EC44
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 14:34:26 +0100 (CET)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIAb3-0006W7-C4
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 08:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIAYQ-0005yM-VZ
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:31:42 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIAYP-00046a-JC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:31:42 -0500
Received: by mail-wm1-x329.google.com with SMTP id e23so1449159wmh.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7yOJrOXmjdT8STkdp76CLgtlLJMPZpbisEqPInANAaI=;
 b=NFpLqkCA6ebNA1jEWiakU+7U7L1dC+ORKPdP0hfG57ZqJxFXsuESOmUOPTumKBU1QY
 Eb9ennjSW4RUp/4XuJTHQeVej3ALgrHFXHI9EZT41+T5DrfvezeUWaj1QAwiFeBZYnSg
 JxJTB4OqCYIJ/2t/mQ1ZsC3s6spta0VNmUtM0U/CSn2Qo4Zf/tX1rdh/UK6qf43258xd
 b6IhEH6ZqP8D7kPWXLB4TlpF9LXFwNLkMIlEZxzeonID08XfgvKXiCwBPWU1XlYfbrwX
 8L8jKipBN3zEPP1pgRe2/KtqxhDSmSVDzH5PIb0z+4/ccdEY/hFXkKRKWWKSktk31qUQ
 SZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7yOJrOXmjdT8STkdp76CLgtlLJMPZpbisEqPInANAaI=;
 b=s0E6Z+0meozIH9HbJ8d/nzH7Cf13Yo0TOr/fZSPMZA1JQzMVV//sMDkJ4gJrnKDcY8
 agawtqXQTJeZGDgmNdp1aFsP4IEZ7zm4hWBIUJTcmZRQmNrJr4fi4NgOgKqZ9dhOXHHT
 Nz8Ej6ipdYj3orwAa2sXzvzLUlG9SmA+p6EHxlJ31wEA57yYv5o+jDcofMBWKdRvEYU+
 9S5chviSJfpk8k95ZhIfHhZxMDFdnKpbwKVIURyLc0h9PvvEmbWQ5o4w8QNQWH/3Y85G
 EQWiYisgFiDJ3qULNhxC8ME4atj1k4sBmbhq+W09lBUSZ0KJLabxYF0z2kDPWSZigXLC
 MIwg==
X-Gm-Message-State: AOAM532V46o/x343q6IHGOrz/zosVqy37pgawnSqXpX/SYCdIQR6fDw1
 wasw+49FJQPCTyNQ7CU4Az8WPEieWM4=
X-Google-Smtp-Source: ABdhPJyYVj1UElff7/rP4Q7z6O6aSycFRE5nNhlkBz1mZsfi90QbjltXFM4KIFFLlPp8Z7tEhuTb4g==
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr8726066wma.55.1614951100279; 
 Fri, 05 Mar 2021 05:31:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c128sm17446096wme.3.2021.03.05.05.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 05:31:39 -0800 (PST)
Subject: Re: [PATCH 2/2] target/tricore: Fix OPC2_32_RRPW_EXTR for width=0
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20210305132629.755627-1-kbastian@mail.uni-paderborn.de>
 <20210305132629.755627-3-kbastian@mail.uni-paderborn.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f71e8c24-740a-969a-8d86-1c1e48b483a8@amsat.org>
Date: Fri, 5 Mar 2021 14:31:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305132629.755627-3-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: david.brenken@efs-auto.de, georg.hofstetter@efs-auto.de,
 andreas.konopik@efs-auto.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 2:26 PM, Bastian Koppelmann wrote:
> if width was 0 we would run into the assertion:
> 
> qemu-system-tricore: ../upstream/tcg/tcg-op.c:217: tcg_gen_sari_i32: Assertion `arg2 >= 0 && arg2 < 32' failed.o

Maybe strip "../upstream/"

> 
> The instruction manuel specifies undefined behaviour for this case. So

"manual"

> we bring this in line with the golden Infineon simlator 'tsim', which
> simply writes 0 to the result in case of width=0.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/tricore/translate.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index 67a7f646a2..d8b773ab37 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c
> @@ -6998,10 +6998,16 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
>      pos = MASK_OP_RRPW_POS(ctx->opcode);
>      width = MASK_OP_RRPW_WIDTH(ctx->opcode);
>  
> +

Spurious change?

>      switch (op2) {
>      case OPC2_32_RRPW_EXTR:
> +        if (width == 0) {
> +                tcg_gen_movi_tl(cpu_gpr_d[r3], 0);
> +                break;
> +        }
> +
>          if (pos + width <= 32) {
> -            /* optimize special cases */
> +                        /* optimize special cases */

Spurious change?

>              if ((pos == 0) && (width == 8)) {
>                  tcg_gen_ext8s_tl(cpu_gpr_d[r3], cpu_gpr_d[r1]);
>              } else if ((pos == 0) && (width == 16)) {
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

