Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D442147E92A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:39:29 +0100 (CET)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vo9-0000kL-0P
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:39:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VlO-0005kM-6n
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:36:38 -0500
Received: from [2607:f8b0:4864:20::434] (port=34414
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VlM-0003Zw-Ot
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:36:37 -0500
Received: by mail-pf1-x434.google.com with SMTP id c2so6270434pfc.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 13:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vWfWBxET5Z7BdbpRlU2IGPkYshRYKlLY7/Al9c+eMis=;
 b=INXlMFu2CvQKvW4cm/BBwSmaCafJ00O3E9MkFO5VyTR9K7A1p9knbDo5unlO9XiqCo
 IAoeVS1bpdyTdLtXc+0lA1y/4kVjxHwjR1AaHGNUcDkNLJgj6mlbrJia0Hv9a0Jd6P87
 LZJalprW6B7KlMErUAhCrbB7CrrfCgIOANqALN2/YmRupywJYdHInP9kGyBgzqcLjA7S
 TPQ45CcNTBtSS9d9jtFfcUDiOelIuJYNqj8Oihpc8HHSMW3xIDNA1cUw9E0kUIxQ+Un1
 r83q62V7YBxALCDm4NpooU3t2w55nRhnwPzLKiISAjLvXKrTw+VF0g7szl+vVV4W04p/
 JxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vWfWBxET5Z7BdbpRlU2IGPkYshRYKlLY7/Al9c+eMis=;
 b=ApViKq00TfjEW29ODP/51ciZsFV6VdXojquqoBOywQl6GHggftmToi4Cv00rzUitrr
 w/GCFf2ufuC6whdzYd67Th3Z01/pspY3vGBvNmFKP1N5NpX3w5az3CEnlkJB9IxmKK89
 lz0kN4xw/Xdh3TsRAG3yRhL9BdB5oT4ipVJFjttPurPrm12LLBia59Yx7sVvk2tIhFRC
 yZgIwgGfJYd8r6TDvLHTazXSNXD7SJprclhgziRzy6PAAKplFircu6oABX25HOnJvRbU
 x3zIc6CRa2sIaqUhmo3MtfNYS17KIXyjRYpEJED4L/3/YThU+X9ClsSGsFhYnJ5q55rx
 7X0g==
X-Gm-Message-State: AOAM531cQ5griSwYFzx9wuAGD94fo+mS2E9L+62gBY7he4np2oKVaVOS
 wPABTLrRiSJ9UQHmvS82HTRRAw==
X-Google-Smtp-Source: ABdhPJzmDk3yTzTMm0vQ9o+EPPVCV8iPO8EipgYRZHAUmffTkeu5BLOVZl7Fe8f6fogPxFJDOahxuA==
X-Received: by 2002:a05:6a00:1707:b0:4ba:ca4e:fd3f with SMTP id
 h7-20020a056a00170700b004baca4efd3fmr4254431pfc.16.1640295395420; 
 Thu, 23 Dec 2021 13:36:35 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id oa2sm10238273pjb.51.2021.12.23.13.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 13:36:34 -0800 (PST)
Subject: Re: [PATCH 4/8] ppc/ppc405: Restore TCR and STR write handlers
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-5-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c91d8ff9-47af-0715-5fe7-5d29ba6f0d69@linaro.org>
Date: Thu, 23 Dec 2021 13:36:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222064025.1541490-5-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 10:40 PM, Cédric Le Goater wrote:
> The 405 timers were broken when booke support was added. Assumption
> was made that the register numbers were the same but it's not :
> 
>      SPR_BOOKE_TSR         (0x150)
>      SPR_BOOKE_TCR         (0x154)
>      SPR_40x_TSR           (0x3D8)
>      SPR_40x_TCR           (0x3DA)
> 
> Cc: Christophe Leroy<christophe.leroy@c-s.fr>
> Fixes: ddd1055b07fd ("PPC: booke timers")
> Signed-off-by: Cédric Le Goater<clg@kaod.org>
> ---
>   target/ppc/cpu.h             |  2 ++
>   target/ppc/helper.h          |  2 ++
>   target/ppc/spr_tcg.h         |  2 ++
>   hw/ppc/ppc.c                 | 25 +++++++++++++++++++++++++
>   target/ppc/cpu_init.c        |  4 ++--
>   target/ppc/timebase_helper.c | 10 ++++++++++
>   target/ppc/translate.c       | 12 ++++++++++++
>   hw/ppc/trace-events          |  2 ++
>   8 files changed, 57 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

