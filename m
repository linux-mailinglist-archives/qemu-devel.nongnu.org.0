Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073B26964A3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:25:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvJS-0002oI-KW; Tue, 14 Feb 2023 08:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvJM-0002eo-0H
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:25:33 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvJF-0006X3-ED
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:25:27 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-16e353ce458so1417892fac.9
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tE4tFB5Y660tcZ7sCDrcSbo8rRk7Zw5VuL1GFC65CXo=;
 b=KW0MDt1phzOOd6pijySfwegMKfA45JFF/3gg9QGWc6nUc/UEi5RnseWCIDJqkdrAXN
 PHK1XzqO+V2T9xFeIMrC9aYJEmeCltdfZ9L0Pp3+N4x6RGeGbHThNysURwzlc9NvBENY
 7q59SQ6HnBlFV3M6+uROZNgfO43TXfHDCEX8hs3Yfm8kGzc8YR07wyGJixpjG0Zm7dKx
 KXpiUVnO2TNS+2WS6JnPZgQ0jhvB/5pgMyLjCZaSG8qaYdJ4YefSLs98JijX+1BD3Jpn
 a5D6z94RtkMKLCjlg9XArl0JJe9cQdAcpYd6XnNh25MLU7ebR4SnlfZ5zwVdbN7GaBlR
 CqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tE4tFB5Y660tcZ7sCDrcSbo8rRk7Zw5VuL1GFC65CXo=;
 b=gGHvtRLU9IQEoCg6aTGuYYC/nQSQkBZoN366e3uSLD9ZnIcLBI45DTIj/+YZtcHDTQ
 M2CzWgtLg/YWkXVVkuoE5kOfStrmm4VHMf4QFvkihZ0Q9vNw0vqd8+C+6TCd2mmPSkof
 RzAqwlDCYyJmrVt8Z8cqVSknd0P0xeMTSyBFR5j5kzgyBAC+3iNC9ifghLr6sc5+XEIZ
 cMegxNwieuUlVi5JVECgG7eZ0djwsvMefVT/R9UKZQgAFNharFjhXMUia4uShAe3IDqX
 oaTvGMCMSJ/qcRoX10LCCmW4EKkQya5eBbHglJ5TXJDvSlN5hBRVKqIWCUpWnI7/c3mS
 thig==
X-Gm-Message-State: AO0yUKWMy/1IGcnD4Fnq1FIbjr3ErUn7yAmN8nZKtHbrVc5cN89WgMrf
 Hq9pvCuRcG6/kZnOCSbFlXIshA==
X-Google-Smtp-Source: AK7set8bzPeUrVZEowlL7AAdbcfDQ08T1toyFGWUaDx7DvGD3l88JGwcoC8OGAXn5YVcV6YrOXpAPg==
X-Received: by 2002:a05:6870:5251:b0:16d:dd0e:df24 with SMTP id
 o17-20020a056870525100b0016ddd0edf24mr1221160oai.27.1676381124185; 
 Tue, 14 Feb 2023 05:25:24 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056870198200b001600797d1b5sm4111034oam.41.2023.02.14.05.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:25:23 -0800 (PST)
Message-ID: <ce12ea57-9955-90fa-7fc9-a487f3b6161f@ventanamicro.com>
Date: Tue, 14 Feb 2023 10:25:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 08/14] target/riscv: Simplify check for Zve32f and Zve64f
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-9-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-9-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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



On 2/14/23 05:38, Weiwei Li wrote:
> Zve64f depends on Zve32f, so we can only check Zve32f
> in these cases
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index bbb5c3a7b5..6f7ecf1a68 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -173,9 +173,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
>   {
>       TCGv s1, dst;
>   
> -    if (!require_rvv(s) ||
> -        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f ||
> -          s->cfg_ptr->ext_zve64f)) {
> +    if (!require_rvv(s) || !s->cfg_ptr->ext_zve32f) {
>           return false;
>       }
>   
> @@ -210,9 +208,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
>   {
>       TCGv dst;
>   
> -    if (!require_rvv(s) ||
> -        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f ||
> -          s->cfg_ptr->ext_zve64f)) {
> +    if (!require_rvv(s) || !s->cfg_ptr->ext_zve32f) {
>           return false;
>       }
>   

