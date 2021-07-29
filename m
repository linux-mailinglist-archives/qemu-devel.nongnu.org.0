Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266043D9DBE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:38:42 +0200 (CEST)
Received: from localhost ([::1]:38984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zgn-0000wb-7b
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zdc-0005Ki-Kx
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:35:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zda-0001FJ-MS
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:35:23 -0400
Received: by mail-wr1-x432.google.com with SMTP id h14so5410948wrx.10
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7l3dL2houKiq9KlAWcEHP9jMAy1caqD2flyu402eE94=;
 b=ig4UcQ3AapaMFoHyYb6XwXaoiKLdl/QXBT9KFb3IUMxo360tB0WDXuGJLTUit/EPve
 Qe8aghfMk7AQKk5dKfZ7BVAgbhDA6twtGHh9Q+YMs5n0yIpEXdXolNop+ePSg7DyNqWP
 wlPUeOXMjhnC4QU8D6grqxB2L+0HBsCDVw2xEEGoosVpvOxuHdD3/eFjXIrX0Wgr0zZZ
 1fRh/0BkbfHXZE/OmGiLUCR9B7vxHWFPLm118olYcXpBiFdyc2T1+pS8fY62/KQ/Knxg
 PV3ekQsjffnnC8RQuODq8//qhOm62Fy4tszR/rksjnRqvMxptmH/UG8Rs0Czia5Ay2T3
 JbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7l3dL2houKiq9KlAWcEHP9jMAy1caqD2flyu402eE94=;
 b=SDpJC5kkUmYd5d3z8HolQcSyAYBhdrcvDWiWtAZ33VNtp8CrRGpv8LWiLGFDzBVzko
 3GT915h3D6rEEsXe+Dp22Q824vxfQZPHQtbvfuJP2CMtsy8x+Xtcq0Ogm7aQXLyA2mHB
 AEIIryD5uZoZ7nhcQf2z5EnzfU0hIPZ0vTkki4h4pCvdIu90GA4NMsQ0qTfmyynTdKNn
 JijsGR0YQgjrbfZ5o5hevw9NzbOE9BmyGn+UuuLksN6iMChElBefoeTSgzr48gv3WOhs
 gFzhgbUFKnbTXnl5DJP8J7Gg9t8mTUfeQcRTgcU/Byk4Yu9INUYpWiJWGkHOSj11VJ+A
 JaqQ==
X-Gm-Message-State: AOAM532ARoJG5gyiXGFQ4+bUxZUKG6/Wmd/Np+QRTewOfHNFdqdQK4Wi
 sG9UHp9EAiqpOGOOMmqYA7U=
X-Google-Smtp-Source: ABdhPJzxb68PBYl58I+AeasV7r4HuQVLe0/YF2w40aBFxDfnZ7Tbpjx09at1ozCqbpXLsT+YmQR7bA==
X-Received: by 2002:adf:9e01:: with SMTP id u1mr3016658wre.12.1627540520900;
 Wed, 28 Jul 2021 23:35:20 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id w5sm2645685wro.45.2021.07.28.23.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:35:20 -0700 (PDT)
Subject: Re: [PATCH for-6.2 31/43] target/hexagon: Implement cpu_mmu_index
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <692f4518-e711-bbdf-3c78-d87d2949433a@amsat.org>
Date: Thu, 29 Jul 2021 08:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> The function is trivial for user-only, but still must be present.
> 
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/cpu.h | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

