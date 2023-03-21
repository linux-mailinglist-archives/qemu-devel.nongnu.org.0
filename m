Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19536C2E5C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 11:02:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peYnd-0004Df-CJ; Tue, 21 Mar 2023 06:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1peYnS-0004AN-9a
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 06:00:59 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1peYnQ-0003n8-G5
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 06:00:49 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-177b78067ffso15688189fac.7
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 03:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679392847;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7isQY0Gf/ZKpAQJZikZ2n5MpvW1BpR3pcSkScuhygic=;
 b=aeCgFUovkTh2ig6GHRBxcLO5FZbd6wieuPf0upkiGCfd8QiMLkshNzuXnY6o/FLm/n
 D8HJIxbfvhYjkumDSx282JfGGMrgKslPl/tEIcXWbe8/GZTO1slROSb8JVpYI+98ZOFr
 hZwAWssqjxkOCyiRIzouWPeeWjaAcB9gQAVVeprNkY/0mjx2h4ji+2DGw23jEnyPog6T
 RskAPsgBxoKwbkMKo0KbQJ2zF8q3CxHhx7+u8ZimbtjDbCP9AYZhhQNAENr++xQ6rl4w
 beysquLgHjV7zqUUIXi36tt+i/FRRlCVQWxGm8L8lsJwDQ1zEyA9mIvhNs99dX92pqIQ
 EFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679392847;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7isQY0Gf/ZKpAQJZikZ2n5MpvW1BpR3pcSkScuhygic=;
 b=FfHzhtoAXEUCIeCwx4MmGEqpk2gUEKokCNcjTUwTt8ta5AjS7eck07g8vOVc2yD9kn
 edZrCn1vIZdKpFGt/BSDXSKvcFC/rnLYfT5sLmfKb2DeQsI9GKzGff56rsYOQxTlIbiw
 PFnGD2a5ffLYKb6BhqorZm0keP0o14PtOEw2+FBx5fsgi2PYGGTN5WAkEKfvF1dJG+h6
 VEWLooh8xyEu6TVX4qkyMVGPvkHS2Jf6QlyJk4s7PBEjTXT8kWcKQhUcA4J8is232VEn
 6+1pQEmkHhxpGNhGCjvYEYQyEi3abzT7uFscS6hCyPJfPRwn2TRJz+Tennc1M9ekCszp
 QscA==
X-Gm-Message-State: AO0yUKUutTq3jcga3oKpZuAVRreIT6nHM6JBSY5iBi5ZFP4vCkD7SP8S
 Y3J2/SprH6Br5ROrhn3xvDB1RQ==
X-Google-Smtp-Source: AK7set/HqbG+BdIAyE/NYMyaNWf8P2qp2rl51NyV60cTEOQgfDV4rO+VlSZhUfc++WY9ixLPQm0fsw==
X-Received: by 2002:a05:6870:9689:b0:17a:a7af:6cee with SMTP id
 o9-20020a056870968900b0017aa7af6ceemr901562oaq.51.1679392846801; 
 Tue, 21 Mar 2023 03:00:46 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 ui4-20020a0568714e0400b001718e65a5d0sm4050075oab.57.2023.03.21.03.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 03:00:46 -0700 (PDT)
Message-ID: <e1abc83c-ff54-e752-9ca0-f0f97c4e67f4@ventanamicro.com>
Date: Tue, 21 Mar 2023 07:00:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: Fix priv version dependency for vector and
 zfh
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org
References: <20230321043415.754-1-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230321043415.754-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



On 3/21/23 01:34, LIU Zhiwei wrote:
> Vector implicitly enables zve64d, zve64f, zve32f sub extensions. As vector
> only requires PRIV_1_10_0, these sub extensions should not require priv version
> higher than that.
> 
> The same for Zfh.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..eaf75a00a6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -84,7 +84,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
>       ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
>       ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
> -    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
> +    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_11_0, ext_zfhmin),
>       ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
>       ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
>       ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
> @@ -104,9 +104,9 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zksed, true, PRIV_VERSION_1_12_0, ext_zksed),
>       ISA_EXT_DATA_ENTRY(zksh, true, PRIV_VERSION_1_12_0, ext_zksh),
>       ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
> -    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
> -    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
> -    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_12_0, ext_zve64d),
> +    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_10_0, ext_zve32f),
> +    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_10_0, ext_zve64f),
> +    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_10_0, ext_zve64d),
>       ISA_EXT_DATA_ENTRY(zvfh, true, PRIV_VERSION_1_12_0, ext_zvfh),
>       ISA_EXT_DATA_ENTRY(zvfhmin, true, PRIV_VERSION_1_12_0, ext_zvfhmin),
>       ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),

