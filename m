Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4826409A60
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 19:09:06 +0200 (CEST)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPpS5-0000yv-UH
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 13:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPpQi-0007uR-JY; Mon, 13 Sep 2021 13:07:40 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPpQf-0005Dc-Dh; Mon, 13 Sep 2021 13:07:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id g16so15827132wrb.3;
 Mon, 13 Sep 2021 10:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZGjQnCyc1u73B+FqcwGlcd5nhEX47RQTRxdVxdjhe/A=;
 b=fu5IU5nfu4+kfJ/5thItbDVsadJmoOCiDP3tWncE+TwJCnjbJSJZ7Z4ltLJ5OS4VI6
 0MvrAYwVbIPd4WZbiH1PyOSQrh0dYBQDWRUHLvBa61/pRpY+aKu9dKahrwagg63udfaP
 PLAN25LMJfJNqnBuEtQtc+dB4zwKJioB6r/Ctq9ayV7Jyaaq7kaxbPcABSpDy71O7v5A
 LwPab9uq9Gx+JkVVFbYj0OAbeJNlugTHBMi3jfMn/1MriWcEnIz0DCRB5WnaRWfW8J8U
 V4Wi1RL8bpsbYMcRZSibDyS9RcRDcFY9n1Nne91LblBapmCCB23ywcPz0crHjr88BzPe
 Ajtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZGjQnCyc1u73B+FqcwGlcd5nhEX47RQTRxdVxdjhe/A=;
 b=hYjlMdLFSLK3nk+AJY8oi8pjk6yRRU2RD42POdRCpu3Las9Ar7OeQlty5KNgR+Nv8a
 Xgz0WgCL+352jylAYMRn6Rg+cw3ovwWwIh54dHl9/7N6n1a0NiXDu3nv+Z41l8zF0lec
 Z7lLpehs0YvIoOkWuvjN6mS670wlfSakw9VkRtXxl9t9aOZLO9HTCoGjyjtHb2awZ7ki
 b/V+9bb9jSa5t70fXhMyiApIC2tRr1BZ2LjoncCRXXx+g0T5Au7rjIPixHPKwkmQkYP1
 Idf6ygDKbOEQGri/3eN6KyP92rQW6i7Awrx/Jm3HQ7TFXIDyco9NUK9zMySCJLWFsCjz
 nloQ==
X-Gm-Message-State: AOAM530PP0Wis5W0SxetP/EUB8Gl3RK5qjc4JxL7SS8XDcH0DIshwMyW
 XrJLg+wbfvRVGMUYrUwIP4aOqmug/zM=
X-Google-Smtp-Source: ABdhPJwRimjL8wGjMlUWu8rl7qqi284c45ssa627VHXIK1bGXt9BvYGJviGgrqRKIdtMJjo3kj3NlA==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr3347148wrs.262.1631552855203; 
 Mon, 13 Sep 2021 10:07:35 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j98sm8178283wrj.88.2021.09.13.10.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 10:07:34 -0700 (PDT)
Subject: Re: [PATCH] target/ppc: Fix 64-bit decrementer
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210913162758.3806730-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1a8d9768-7763-91b6-5faa-8e984370adef@amsat.org>
Date: Mon, 13 Sep 2021 19:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913162758.3806730-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 6:27 PM, Cédric Le Goater wrote:
> The current way the mask is built can overflow with a 64-bit decrementer.
> Use MAKE_64BIT_MASK instead.
> 
> Fixes: a8dafa525181 ("target/ppc: Implement large decrementer support for TCG")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>  This was found with the QEMU Microwatt machine which uses a 64bit
>  decrementer. Here is an experimental tree:
> 
>    https://github.com/legoater/qemu/tree/microwatt
> 
>  hw/ppc/ppc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 7375bf4fa910..a86125c50ff9 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -876,7 +876,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
>      bool negative;
>  
>      /* Truncate value to decr_width and sign extend for simplicity */
> -    value &= ((1ULL << nr_bits) - 1);
> +    value &= MAKE_64BIT_MASK(0, nr_bits);

What about:

       value = extract64(value, 0, nr_bits);
       if (value != sextract64(value, 0, nr_bits)) { ...

>      negative = !!(value & (1ULL << (nr_bits - 1)));
>      if (negative) {
>          value |= (0xFFFFFFFFULL << nr_bits);
> 


