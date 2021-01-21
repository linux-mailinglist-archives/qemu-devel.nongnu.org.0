Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B99E2FF547
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:01:23 +0100 (CET)
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2g8v-0004oq-1J
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2g6K-0003cr-OI
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:58:40 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2g6G-0002c7-OB
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:58:40 -0500
Received: by mail-pl1-x635.google.com with SMTP id 31so1879000plb.10
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o89aTtBFV94G4SAAAlI28lXH+peFou04kb1rRZHsVSg=;
 b=N2RzhNj6uxLx+KxuXywzSZq3URlHU+aZOI0lzYk8kOktmhlEpq0D0/Tvul1eb16//W
 NDvMv89+KfENfnmT1AVRzuoYDLFqBewcvieHU3k5ymvFJ23TKCYAqW2LOvk5LFRlxvFa
 E1WzV8RNhjMBMfXNAUe468/mQh2b+yU29cykpHYDsujLBmyVjX8l+DrUsEuiO8RAxARO
 WSCRbBunx+m5FQKjh/tS13YoTvIJu3DXViA3OH+tXKGypQDvf1uAb2DkOalhxovPo1U6
 NXP+DBUh3WYdrUmGbFoN/uC4QzC/9zDK20mgP5PFs4TaIy9XPoHnLx63L/CMtcBrvGCT
 49jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o89aTtBFV94G4SAAAlI28lXH+peFou04kb1rRZHsVSg=;
 b=cHd5vin5nrDqXuUTJTx1TpelGl9rjTBCl4oSHYtKqKv5ownsPUm1tTQ1f3OQW50IwT
 VMU+b5rfVrL/GPE5r3jhRNplj8RA0IIy55rfdEFo9rpNyHzrFw+ra+EOai+f25JqGeW7
 OghoUFFVXgl5Kj61VzP2raK94zRGQ7dnOt5RhcghlHzeymGosKE5JBSq9h+aFPeVgwfm
 p27HX2EWgGDLJmVlw0FTOiAjsqC87voFVzXfOoDwIOF+AqtBnrgQxs8Prz1dWfBv8B6p
 EmXlqWWCfConh08PcHl47wHLVEVxXw8tyf6i11haCPeWPLxuMq5r6i74RD81jy9xohU2
 i95g==
X-Gm-Message-State: AOAM5332+jtddG2f7W02eQXSIy/vG8oElaiU7Jm9Eeqx7qtGAiYJRPzp
 I8/d8OBs1WCtlEibgDHEXUSjHQ==
X-Google-Smtp-Source: ABdhPJze0uTC7R2uo/sXL7UdUlAVcEBtK4j+bJKaHBYIlmg/Rv1BcThDeYvou+QsyIvg3a4nlde8+Q==
X-Received: by 2002:a17:902:b706:b029:dc:3817:4da5 with SMTP id
 d6-20020a170902b706b02900dc38174da5mr892996pls.23.1611259115193; 
 Thu, 21 Jan 2021 11:58:35 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id s73sm6491617pgc.46.2021.01.21.11.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:58:34 -0800 (PST)
Subject: Re: [PATCH 4/6] target/mips: Convert Loongson [D]DIVU.G opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <20210112215504.2093955-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <141e2343-1018-bba7-754e-abace2a646ee@linaro.org>
Date: Thu, 21 Jan 2021 09:58:31 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112215504.2093955-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 1/12/21 11:55 AM, Philippe Mathieu-Daudé wrote:
> Convert DIVU.G (divide 32-bit unsigned integers) and DDIVU.G
> (divide 64-bit unsigned integers) opcodes to decodetree.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/godson2.decode    |  2 ++
>  target/mips/loong-ext.decode  |  2 ++
>  target/mips/loong_translate.c | 55 +++++++++++++++++++++++++++++++++++
>  target/mips/translate.c       | 37 -----------------------
>  4 files changed, 59 insertions(+), 37 deletions(-)
> 
> diff --git a/target/mips/godson2.decode b/target/mips/godson2.decode
> index b56a93a1999..0d5a72064d2 100644
> --- a/target/mips/godson2.decode
> +++ b/target/mips/godson2.decode
> @@ -14,4 +14,6 @@
>  @rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &muldiv
>  
>  DIV.G           011111 ..... ..... ..... 00000 011010   @rs_rt_rd
> +DIVU.G          011111 ..... ..... ..... 00000 011011   @rs_rt_rd
>  DDIV.G          011111 ..... ..... ..... 00000 011110   @rs_rt_rd
> +DDIVU.G         011111 ..... ..... ..... 00000 011111   @rs_rt_rd
> diff --git a/target/mips/loong-ext.decode b/target/mips/loong-ext.decode
> index 331c2226ae3..2e98262b81d 100644
> --- a/target/mips/loong-ext.decode
> +++ b/target/mips/loong-ext.decode
> @@ -16,3 +16,5 @@
>  
>  DIV.G           011100 ..... ..... ..... 00000 010100   @rs_rt_rd
>  DDIV.G          011100 ..... ..... ..... 00000 010101   @rs_rt_rd
> +DIVU.G          011100 ..... ..... ..... 00000 010110   @rs_rt_rd
> +DDIVU.G         011100 ..... ..... ..... 00000 010111   @rs_rt_rd
> diff --git a/target/mips/loong_translate.c b/target/mips/loong_translate.c
> index 634d4ba8031..7b3304ec749 100644
> --- a/target/mips/loong_translate.c
> +++ b/target/mips/loong_translate.c
> @@ -92,6 +92,61 @@ static bool trans_DDIV_G(DisasContext *s, arg_muldiv *a)
>      return gen_lext_DIV_G(s, a->rt, a->rs, a->rd, true);
>  }
>  
> +static bool gen_lext_DIVU_G(DisasContext *s, int rd, int rs, int rt,
> +                            bool is_double)
> +{
> +    TCGv t0, t1;
> +    TCGLabel *l1, *l2;
> +
> +    if (is_double) {
> +        if (TARGET_LONG_BITS != 64) {
> +            return false;
> +        }
> +        check_mips_64(s);
> +    }
> +
> +    if (rd == 0) {
> +        /* Treat as NOP. */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_local_new();
> +    t1 = tcg_temp_local_new();
> +    l1 = gen_new_label();
> +    l2 = gen_new_label();
> +
> +    gen_load_gpr(t0, rs);
> +    gen_load_gpr(t1, rt);
> +
> +    if (!is_double) {
> +        tcg_gen_ext32u_tl(t0, t0);
> +        tcg_gen_ext32u_tl(t1, t1);
> +    }
> +    tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
> +    tcg_gen_movi_tl(cpu_gpr[rd], 0);
> +
> +    tcg_gen_br(l2);
> +    gen_set_label(l1);
> +    tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
> +    tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);

this extend should be conditional on !is_double.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

