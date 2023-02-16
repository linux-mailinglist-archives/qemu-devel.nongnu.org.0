Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A910A699A5F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:43:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShLG-0007Dl-N7; Thu, 16 Feb 2023 11:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pShLE-00072s-S0
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:42:40 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pShLC-0000f4-KE
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:42:40 -0500
Received: by mail-oi1-x233.google.com with SMTP id t5so2246974oiw.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N61/jdtUNa6YvL11lBLL6VkS4Kjjs8VD6BwNJMmVut0=;
 b=a05IcgPhCZP0tr3B21KwmRDQe8cr9yJO2pAP6gPcA70TlXBI4HiTeetklsmCUclC8A
 JgT1fQ5PCALvLT3YgwIA7CErn4nXk66NCJc4qwAWtUBkbs2tU26BUMECktPhuIZFCb1h
 OVoqrF1RUwX5Ck3gVVmXsiUy+MQuQiz9dmi/YLjGjmmD7MOOsETMRPn/Ka/lAHj/9oKS
 hwZ7SP8Yws5DeOaGz+yMghM1ILkyC46jiFud2szERBzyadRw8rAkc6bJqa7pzkjRFCl6
 /z2Rb7wwPO9hyGQS+6hfIP6oz1FL0M2ypKeqviV7b1HaZUmAqdnPXYEV3AsNdcQueGTX
 qbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N61/jdtUNa6YvL11lBLL6VkS4Kjjs8VD6BwNJMmVut0=;
 b=xAqwnOAC/SAIohkhH9Jiq0S/2peySjre+TIePjNord6iHr1qYyZj2LKYYoBZ7h2XiX
 q7lFQDz58X0gP3Y3kyaNffVtQRkv5bSBC20SwMJ6KroTqZoVo8UJr5A1o7jgDlv55bdB
 FDX4XRMsFPkBeMwK8owdC90QbzmvJ9P+S1jQN/fg2Fc/aU1rzmqUoxKZBOxUYC7jRupS
 hQDDiV0f3DUSwsGr4XOp4GY0cy7jUvfedytaDpXJ6KrtYrq9k1ur/knKHc1yAc3Zipr8
 Q3FkWynNR5AR/BpPUhMSjb+KrTtwugsTQJLxk/qhSoGpMH1x8T9kIBAA4UNV0Zk7PK1x
 tR9Q==
X-Gm-Message-State: AO0yUKXXpC1PZr+pd0OxUu8C5zKKhwHgq6W3/Rq70gpFjrf8Rrq+3JkX
 F2i48sjTr7DyBN6K5tM/ytB/sw==
X-Google-Smtp-Source: AK7set8ti2oRy+S98NAdpxPVpYTgsqMjB6Qxf+nH9K7F5FOGNeEbHlGWaEYYm/hkSjCW0B3Zc1dNxA==
X-Received: by 2002:aca:2114:0:b0:35e:bc08:35f6 with SMTP id
 20-20020aca2114000000b0035ebc0835f6mr3431515oiz.8.1676565757192; 
 Thu, 16 Feb 2023 08:42:37 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 i132-20020acaea8a000000b0037d7f4d0890sm724001oih.26.2023.02.16.08.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:42:36 -0800 (PST)
Message-ID: <be0fe084-6b5e-d4db-16e2-2ad760d25267@ventanamicro.com>
Date: Thu, 16 Feb 2023 13:42:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 05/14] target/riscv: Fix relationship between V, Zve*, 
 F and D
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230215020539.4788-1-liweiwei@iscas.ac.cn>
 <20230215020539.4788-6-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230215020539.4788-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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



On 2/14/23 23:05, Weiwei Li wrote:
> Add dependence chain:
> *  V => Zve64d => Zve64f => Zve32f => F
> *  V => Zve64d => D
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/cpu.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9a89bea2a3..c5c60d9e4d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -743,12 +743,27 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
> -        error_setg(errp, "V extension requires D extension");
> +    /* The V vector extension depends on the Zve64d extension */
> +    if (cpu->cfg.ext_v) {
> +        cpu->cfg.ext_zve64d = true;
> +    }
> +
> +    /* The Zve64d extension depends on the Zve64f extension */
> +    if (cpu->cfg.ext_zve64d) {
> +        cpu->cfg.ext_zve64f = true;
> +    }
> +
> +    /* The Zve64f extension depends on the Zve32f extension */
> +    if (cpu->cfg.ext_zve64f) {
> +        cpu->cfg.ext_zve32f = true;
> +    }
> +
> +    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
> +        error_setg(errp, "Zve64d/V extensions require D extension");
>           return;
>       }
>   
> -    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> +    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
>           error_setg(errp, "Zve32f/Zve64f extensions require F extension");
>           return;
>       }

