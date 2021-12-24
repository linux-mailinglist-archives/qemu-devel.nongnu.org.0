Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D645C47F156
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 23:35:13 +0100 (CET)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0t9c-0001QZ-Oa
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 17:35:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0t7C-0007fq-Ba
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 17:32:43 -0500
Received: from [2607:f8b0:4864:20::629] (port=36552
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0t7A-0001ls-R1
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 17:32:42 -0500
Received: by mail-pl1-x629.google.com with SMTP id p14so7355760plf.3
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 14:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tq1OxEwLLycubPx5xI0peBbyRqoKzJ/bEvPvhp6uHYA=;
 b=yrzLWLIhKBSuLK8W6njA5vViEWC6Uje32++QFUal71sHGtkVHsRXAF+zuoLEbSezcA
 tFGv13zFSHMy2CVC0/nZJJkijyJNSXsSurCmQ4mvtjcg4ElwN2ensXxQrIN6vOE2WptM
 arGhODlGThfDMd3YMFH9CLwCQ0p/KuFCuKGYQw74O3dDJpGNLm34Y25nc1Ck1F7WcBbP
 a3yK3DtayRIjJSUS8h1Si4ZLzvLpDyrBQ6yGE0OdUkcPSrP9BTjbgnVRkpI8umYFttoh
 h6CnjeUmBfEIajRHsOuPGUPIZOAKR1cJPO1sD1JZp5HmJCZdzCoFd+B6Ga/HNxsX6SX7
 Fo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tq1OxEwLLycubPx5xI0peBbyRqoKzJ/bEvPvhp6uHYA=;
 b=mDrs1OmxElD7YDLbRpOLLnM+BYMttYoad9bfrUmH0F5QyUbdCMmYZvAOfuCX+ZbNQs
 l21ivAMPaD/WBidebVrYMXBNprZuJvefxDmkn36lFSoQWxmLAdOzFSh9UfzvMxrH72ok
 hEETTPLW3EsM0u3YHo+oABgIrGGI7K624iKM8JjYLu7vZ5jIrTz7/6FTWjiW9x+5hbL2
 SIqLii0QwlF2ujBnfvcolrQZQI1TiZljqUlNOayuf5FYBBJrxmqvHGtQ9hR5k+LPodUf
 mmW9nnyjx6eAKthth7z3tZfKlvSdv50XTTewf3TP3Kl6Owjn2ZVDMXcth1aBTWHJoLLE
 GcGA==
X-Gm-Message-State: AOAM5330YwEKDVaEbOxVBJR0pctlJAIGBru3TeZHhC6BVmfD67WtPbiR
 aq/mnl7nP3qv5oQUxj1cMJN6FGIoNFvuiQ==
X-Google-Smtp-Source: ABdhPJyRaKyQ8Ou+a72L2Eap8CiRe6wElsXNA6SkqeEzd9f2wBZVYujMkbz5tDHK7l6ZikZxnwMGeA==
X-Received: by 2002:a17:902:b712:b0:143:72b7:4096 with SMTP id
 d18-20020a170902b71200b0014372b74096mr8314475pls.25.1640385159654; 
 Fri, 24 Dec 2021 14:32:39 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id 15sm399121pfy.151.2021.12.24.14.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 14:32:39 -0800 (PST)
Subject: Re: [PATCH 6/6] target/riscv: expose zfinx, zdinx, zhinx{min}
 properties
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-7-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2209460-1592-e6fa-18be-54a7f66c9387@linaro.org>
Date: Fri, 24 Dec 2021 14:32:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224034915.17204-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 7:49 PM, liweiwei wrote:
> Co-authored-by: ardxwe <ardxwe@gmail.com>
> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a5fa14f2ac..dbd15693be 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -657,6 +657,10 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>       DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>       DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> +    DEFINE_PROP_BOOL("Zdinx", RISCVCPU, cfg.ext_zdinx, false),
> +    DEFINE_PROP_BOOL("Zfinx", RISCVCPU, cfg.ext_zfinx, false),
> +    DEFINE_PROP_BOOL("Zhinx", RISCVCPU, cfg.ext_zhinx, false),
> +    DEFINE_PROP_BOOL("Zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>       DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>       /* ePMP 0.9.3 */
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

