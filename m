Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114431F2FA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:22:10 +0100 (CET)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCscb-0007n3-DS
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsaJ-0006RL-Ac
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:19:47 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsaF-0007HK-88
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:19:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id b3so4764280wrj.5
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5meu9BIX1Sysw1BQGzZKoKl2iuQpyfQNdRtwOv5gA/A=;
 b=HB4LZzdPDpgyH4YFqj9JDWGSIfThvTUEvpTsrDqpgsyF3CD/lAzVfwmCtXulGlTVYO
 Ad1U7hO6M1nKUcqbY7oH11BLRMWQ4RmKAaVAa0mTupzX+6nI+ZkBSx0Ge6rHnbsKkn6k
 ZeNnw50dWfDI/+PHMETQKTqKYmqc0Q57tvVYggJW/Y0gGtLZ15vH+cLFV9tfW6+KB7v0
 akBzWpcCIudaS23eaa4f0XNGX1Xj1vYoT0N0okOTnpVYL63yTu8Ar1zD7P5zPaZoE/PR
 0KYG8+yKrq12lwKP4+5Z+znpKnZlIKR3Wui1FmwzsTahKnSguMgo2/XkU7EV4A+YNA/z
 pRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5meu9BIX1Sysw1BQGzZKoKl2iuQpyfQNdRtwOv5gA/A=;
 b=EkEW2/m9YuOIhwZeSkJ6KhU0xicvYa6nWrjrlYELGjxhdlGw1xB6no55gtLjQ/yTfU
 OAzZwRRtkueTDa74gsi2LJ0Vc43DIohXhrigg5133gqb8HUK2xDYEnG4yFq9oXwNplqe
 PzrPtn4vg65V1IPI2BZ8+3FyNSUU3iZIcreCr6IRVAVxiu0uy4Tz6S+Kzh9inU9NmcCz
 GBwVoHdP1nqmRg9hPGLUCFV7x1taQte6L/7pYHQVaDOhSe8H2SITJf2nDfo90W+ZFoqN
 YFXqv2Fp8NBktqioNNpuowY/YoOVCgoTxX8akzFuZR+cwG+3uGDF4+IKHdY3hcpH5WJu
 DqsA==
X-Gm-Message-State: AOAM532fqYe9Xqt7txPUTg89MY6QKMrpv3er0bALpFrXCMerZn5tqh1U
 X4qDGnidd8FE5ncREqQnrrs=
X-Google-Smtp-Source: ABdhPJzdxld1le5kGWfW7iwo05YiQ4Vflqwgd/UwIxZAsT3YtUxm8WTiwLFai2fwiz5wRHd5sUcKhA==
X-Received: by 2002:a5d:4903:: with SMTP id x3mr6287857wrq.95.1613690381701;
 Thu, 18 Feb 2021 15:19:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k81sm9957687wmf.10.2021.02.18.15.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:19:41 -0800 (PST)
Subject: Re: [PATCH v4 15/71] tcg/tci: Merge bswap operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <392eb174-0a38-49c6-ca6a-74251cda62eb@amsat.org>
Date: Fri, 19 Feb 2021 00:19:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> This includes bswap16 and bswap32.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

