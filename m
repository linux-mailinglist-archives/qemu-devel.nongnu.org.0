Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE3438656
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 04:27:37 +0200 (CEST)
Received: from localhost ([::1]:46968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meTEV-0008D6-Qx
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 22:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meTDg-0007Wy-Fr
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 22:26:44 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meTDe-0000s3-JF
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 22:26:44 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so5757478pjb.5
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 19:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lop/KM0VngAqDWTfuJc43GsON8br3Xt+2PKJPmLP8oE=;
 b=sLFFWKy89cyIaaNhGFfbkWLDuCTYyt4jjpRoj1EGXO9N+rXPAtBbjZ5Ev205B7I8pB
 YZ9bowLbscwiulgMjPhCdBhwyooBjlusBjCgnyNleOXPPCJ1m7Z9Fokd9IC7ZhosTEoW
 f322VhxDCn5JEkARv9jtr0cB7zCFfs/ktpTQ5+3H8uq8GNYqHrh6T6F5sp8CfRZsGs1c
 DFg2DYy7fCWfDp0RfFUH3g9M8I9oZnlh5GTmPHlAl87JhiRnPZriDH5zrw3TVlETCn9j
 ENAJ5Slov4u5DWhjtppxfk2gK0RbJRefG1HgyBspS4w1mSv0sm3ZExY7w7sSZRQRGzp6
 u9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lop/KM0VngAqDWTfuJc43GsON8br3Xt+2PKJPmLP8oE=;
 b=LzlLPC7KFVwAgeNbueq+UEsKCsLPGaJM/pWam1SMSFntCfAhO9j+s7mBO/IXjJ2B58
 Rqz1JyPtoLoA3r85P/klpYNXWhRCCDXHuxxwhPQoCOdhdUexTznB+UnlhbEPw+M/8JRw
 A4RQc0WFdS8oadDieI36HJXxQs7PT1K3BOjCTRcMug6zvuVuNqAJTcbL9HS6ogpCK+MK
 THzerZ0U6E7+JQJG+Tv1hGg5gJVRnaxmlVce4rOTP5Kp0LfkaVpUarlcy6m088DjfTOw
 rS9HrMK8M0N7MHh1y3yLe8jGN7djU7ONJC7KCBHdNjNOEnir4lJAIwgTbCjX3ucaV70G
 rdFw==
X-Gm-Message-State: AOAM533Vd6p1Wp6cTpdlzs6MeTIYeoLtu2VZAakLEVGBb+Pr8mQf+UH0
 MLDjJF+jQzYJcHaMh3fffxpK8w==
X-Google-Smtp-Source: ABdhPJxVyxbPNiXzTsCSeAzEmYiPkkIrVLnKwaplfD1PDKcI9Eig/geTBe7fdtsB6X1DB+B+Ae03Lg==
X-Received: by 2002:a17:902:b907:b0:13f:ccaf:9ed8 with SMTP id
 bf7-20020a170902b90700b0013fccaf9ed8mr8944802plb.46.1635042400530; 
 Sat, 23 Oct 2021 19:26:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m2sm12266877pgd.70.2021.10.23.19.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 19:26:40 -0700 (PDT)
Subject: Re: [PATCH 10/33] target/mips: Extract df_extract() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9663df06-4e84-3c74-142a-b6c2439743e8@linaro.org>
Date: Sat, 23 Oct 2021 19:26:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> Extract the common code which parses data formats to an helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_translate.c | 68 +++++++++++++++++++--------------
>   1 file changed, 39 insertions(+), 29 deletions(-)
> 
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index 3b0dfcca69d..7c1bbfaec61 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -272,6 +272,40 @@ static const char msaregnames[][6] = {
>       "w30.d0", "w30.d1", "w31.d0", "w31.d1",
>   };
>   
> +/* Encoding of Operation Field */
> +static const struct dfe {
> +    enum CPUMIPSMSADataFormat df;
> +    int start;
> +    int length;
> +    uint32_t value;
> +} df_elm[] = {
> +    /* Table 3.26 ELM Instruction Format */
> +    {DF_BYTE,   4, 2, 0b00},
> +    {DF_HALF,   3, 3, 0b100},
> +    {DF_WORD,   2, 4, 0b1100},
> +    {DF_DOUBLE, 1, 5, 0b11100}
> +}, df_bit[] = {
> +    /* Table 3.28 BIT Instruction Format */
> +    {DF_BYTE,   3, 4, 0b1110},
> +    {DF_HALF,   4, 3, 0b110},
> +    {DF_WORD,   5, 2, 0b10},
> +    {DF_DOUBLE, 6, 1, 0b0}
> +};

Possibly clearer as separate declarations instead of the comma.
The df field is redundant with the index.  At which point perhaps a

typedef const struct dfe dfe4[4];

might be helpful, both for the two declarations and...

> +/* Extract Operation Field (used by ELM & BIT instructions) */
> +static bool df_extract(const struct dfe *s, int value,
> +                       enum CPUMIPSMSADataFormat *df, uint32_t *x)

... the parameter.

> +    uint32_t df, m;
...
> +    if (!df_extract(df_bit, dfm, &df, &m)) {

How does the type of df not match the parameter?
Incomplete rebase?


r~

