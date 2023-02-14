Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A01696325
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 13:10:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRu86-0006LJ-CR; Tue, 14 Feb 2023 07:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRu84-0006Ky-N8
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:09:48 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRu83-0008Kr-3n
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:09:48 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1442977d77dso18712457fac.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 04:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7zw5GtDoBq87++elYvejxgi4TKOfvq2OTDo6Zj+B2VM=;
 b=X52ek2pdPAfEIAkbiNq6iulqWTEGwk8TMxlV9ENx6OnkxR+xT55aEJ0TXFq9cUYtLl
 FQsQqp+oF0Z7prYF0/yMa878nL8tVfsEsjbxjUxDA67FkdurYDOjG29SgqpMRYV+TR5p
 bD4WuhVNBp5Z+yEQL2BqzgdfuDy8oUR9HO0yIPWOi/8mVF4iK+cP2kjRHi7/6zkWcNAQ
 9RjNCf7rzrvGk1s8GeqpCjTy1d6eTXk8CsH880uMPVj8OM/vlAtUzcm66B4DMc/CwQ4X
 3adtR+tMqlheLdWnbfBDeml+7mxSed0l30M6lNzkY4e+NJ2N5TKMBRjaifi3MurodeQB
 Q8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7zw5GtDoBq87++elYvejxgi4TKOfvq2OTDo6Zj+B2VM=;
 b=2zPBMWUtrONo2tdUQNQ5PyzmoQpDslFMSxWG+CcLe0w4TwR4Nx4dCvJy0wz8venDwr
 FYaoiJ5ToodMG4051faofomfl1VDQdP//q5uEhcjFrLxRYGd7p1MgjBmAh64Pl0KrfkE
 WMxtK3Hw8aECsdqf4om38p1TArt33zd3jFpluaspQVIYMUs8kQ79iitBtXCqogcoh2oW
 +lsRovDM4rO+/idYARUixLmTSKJ2oi2zJFlzjThIQ1kuL+g325J+diGLL5uvbHgFxU8Y
 qCBGnW4T8hutx6fKZUuDb+87f/DdT43Vszl08odW1qweZidXPlihxypzdhQjBvo8bcNT
 /45w==
X-Gm-Message-State: AO0yUKVfq2AKC4febmhwBpVfApDRpCyvYXwLgBRtdhSo9/RX/pFI1B/r
 QkGbqTAs7ijfx8TVPU2Mya6+GQ==
X-Google-Smtp-Source: AK7set/DNilWWH56ipCC7xpALQCaMp6kgCOfmiGjub8JXr3EkbILbU3FGUUprXFGdC+NDgGfhynQiw==
X-Received: by 2002:a05:6870:41d5:b0:163:1ea3:2151 with SMTP id
 z21-20020a05687041d500b001631ea32151mr909206oac.40.1676376585747; 
 Tue, 14 Feb 2023 04:09:45 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a056870948500b0016ac517cfb4sm5469437oal.37.2023.02.14.04.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 04:09:45 -0800 (PST)
Message-ID: <c556fbce-8e16-be16-1600-aae60e021c6d@ventanamicro.com>
Date: Tue, 14 Feb 2023 09:09:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 01/14] target/riscv: Fix the relationship between Zfhmin
 and Zfh
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-2-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
> Zfhmin is part of Zfh, so Zfhmin will be enabled when Zfh is enabled
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0dd2f0c753..eb0cd12a6a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -729,7 +729,11 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
> +    if (cpu->cfg.ext_zfh) {
> +        cpu->cfg.ext_zfhmin = true;
> +    }
> +
> +    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
>           error_setg(errp, "Zfh/Zfhmin extensions require F extension");
>           return;
>       }

