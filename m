Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B04662F211
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 11:04:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovyDY-0002Dr-MD; Fri, 18 Nov 2022 05:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovyDS-0002Be-39
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 05:03:22 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovyDH-0004aP-HK
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 05:03:21 -0500
Received: by mail-pj1-x1030.google.com with SMTP id b11so4091719pjp.2
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vJHSbecfHElT/9RaubhNbvT61TXsuX2A0QPk1VQBzWc=;
 b=HwoarAtaJxMSs2V+MVQ1n7g7sO1CYtGzE3X0xIpVLOeIVMuW/mAiI3MVIjVaIaXwkr
 zW3Cv8y7LnY9QDD9TMqH4hJhu+2cUoWt/dedGxa6zkiOvXbNHO9lZQ8Q5EjXCW3LqYcz
 AulXuZhKFl2eDqgIN0VH3KXoSAsLq2LNGddG+V58dw9jYwKsN+52hbJDnEwtgykYp96F
 kMdE84H7wOv7AZVeT+A0riUoh2iqhELyBplr9dumodf92TmBeLbPdK1FG6wNpEccjXhi
 t0wYH6t3Uk+GKTZDVlSyz4Qx5emW7IpVmvsPDtecf2HkKJnTRH4CRaZ5diSNg4Fg5wzY
 RuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vJHSbecfHElT/9RaubhNbvT61TXsuX2A0QPk1VQBzWc=;
 b=AGovj7ez3qHxhjlXoA/zoh+Chq6le9OISiMyita0ae+Vab5vPJbVhShMk/S0hvCLmE
 xoNNAX6t7RYF1m1hPCpCu6Qsr2Zsd3rEJnKuiCHHAtmB171dIk1VPnKtLBgJofEM23pc
 keGCcKuEfmuAGT2Y6LEghkr0DNxDZ0zrM8Nb7Lyk00eRrY92tLLlOVMg1Ks+X+6kDa7e
 eKFq7IljTfSxyvX2h4kBok/qvQTPmpN9LE4Zu2/S8T0AuXUIp27sJZiEvt/F1pAkjGF3
 1JNyyax5oysT2KR6xkwKBGgmFTvU9lalVIbY9qV+oLnElUsS2fNtvSrrPgA4olzZq/ok
 +43w==
X-Gm-Message-State: ANoB5pl5Tra52VCVawL5uZCbq0WiSe5DG4ubWWbpDClwrxwk4V8jbc+Q
 z0Vqp6Rtzk4d+zQC0z6SRZcjQw==
X-Google-Smtp-Source: AA0mqf7OKaYnNIpDM/DyuD5M8mpZ6fFAMRqbn+3UODbnjN2oST08gJM6pdzBDbinq6BstAymmq2iFw==
X-Received: by 2002:a17:90a:9c18:b0:212:fa9a:12df with SMTP id
 h24-20020a17090a9c1800b00212fa9a12dfmr13165248pjp.231.1668765781357; 
 Fri, 18 Nov 2022 02:03:01 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90b2:345f:bf0a:c412?
 ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 z6-20020aa79906000000b005613220346asm2684513pff.205.2022.11.18.02.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 02:03:00 -0800 (PST)
Message-ID: <9be5988b-8947-373c-3c48-6fd73eaa4653@linaro.org>
Date: Fri, 18 Nov 2022 02:02:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 6/9] target/riscv: add support for Zcmp extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221118071704.26959-1-liweiwei@iscas.ac.cn>
 <20221118071704.26959-7-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221118071704.26959-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 11/17/22 23:17, Weiwei Li wrote:
> Add encode, trans* functions for Zcmp instructions
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn16.decode                |  18 +++
>   target/riscv/insn_trans/trans_rvzce.c.inc | 189 +++++++++++++++++++++-
>   target/riscv/translate.c                  |   5 +
>   3 files changed, 211 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

