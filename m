Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4EA6A1BAA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 12:57:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVWgp-0003WD-EM; Fri, 24 Feb 2023 06:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWgn-0003Vj-N2
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:56:37 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVWgm-0001UM-8D
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:56:37 -0500
Received: by mail-oi1-x231.google.com with SMTP id o12so8583844oik.6
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 03:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oK5jgkXfLOlZGh9Op3hLnDB+Q1/yLZm4tZKdAyxMuPw=;
 b=kj90ttjbQa1qgvn0WTzf+Q3MGkyOSWuvKIHsC5sS0jaBrb8DSQ8e64BVdWa1L0ZELM
 nveZv58pO0hkmQ/UJJV9rQds+P0hGzV5xA99nsG57Ic2uWKhoyjqRIhgetj/d1o/vDxR
 8+yBDvmFbC5UCPYfSGMexN0lBUpBMA36W7q3lm4TZTvyeH2si7Rk1KOlH9CTLyxyrPHH
 mvR6NWCXgZYu3V/6oehCbguSCDnVWMsBO2KdAtWOUGNg0YqR6iHTv035zAU5WwoD/jzl
 qbo83UQR2EtEUzz6nItiN9nu6erg8uf3ZRgAFUsixR//XupgzcHffMqIIqRrkx/mY3Zr
 LEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oK5jgkXfLOlZGh9Op3hLnDB+Q1/yLZm4tZKdAyxMuPw=;
 b=V+1Ndcaec5br/huLCyZE7BuShOUH42CvDw0tHcUOg+M6eoTgShD4Mc6w7ceFbSH1P4
 lQBgcU5uAcXpGsnrb04zVah+wT3SgrDS1MocAsgSMw16zyLdWoFgiykNYWLsA7kDIZDO
 Q5bS2p/8QBvmg41W3oCMTuAgMZcJaPDLXT+TcANOtKvhzNAgHpcn4TzKm9f8F4pc5U61
 qYFa8tAu2WA8jQKSF7AuGDtSRgXDqZvd1pO/aIZ6itIPedZZPA9rbog0nsaPTT+9GYCG
 kHQxIGV8OVW5VjNE3yZjC3CZtBJKCMf1Tyas+rIb5YCIsYNVtMRtWBVupj9YT0tRloyt
 Dq/A==
X-Gm-Message-State: AO0yUKUWWpVtpJs3B0Iq6tU+rCNWyc8eaoNzrY/1yKV5QefRqv88Iiar
 03uBlxgCXtShdMx7RN60/2dKxg==
X-Google-Smtp-Source: AK7set/qeN6a7NpndLA+ya5X6DARVsVSX4l/GrvYSsByQhUlRyxKx6Q4VSn9Ih5VNw1779NR/N7YvQ==
X-Received: by 2002:aca:f19:0:b0:368:a6f6:bfdf with SMTP id
 25-20020aca0f19000000b00368a6f6bfdfmr3014521oip.20.1677239795066; 
 Fri, 24 Feb 2023 03:56:35 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f?
 ([2804:7f0:bcc0:a2b4:12ba:56fa:c61d:cd8f])
 by smtp.gmail.com with ESMTPSA id
 s66-20020acac245000000b003785996ef36sm3510890oif.19.2023.02.24.03.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:56:34 -0800 (PST)
Message-ID: <e6a4d870-4491-e748-27e2-53b3dfe43574@ventanamicro.com>
Date: Fri, 24 Feb 2023 08:56:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 6/6] target/riscv: Export Svadu property
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
 <20230224040852.37109-7-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230224040852.37109-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/24/23 01:08, Weiwei Li wrote:
> Set it default true for backward compatibility
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b81ab65de5..d7c4c747dc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -107,6 +107,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
>       ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
>       ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
> +    ISA_EXT_DATA_ENTRY(svadu, true, PRIV_VERSION_1_12_0, ext_svadu),
>       ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
>       ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>       ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> @@ -1104,6 +1105,8 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>   
> +    DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
> +
>       DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>       DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>       DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),

