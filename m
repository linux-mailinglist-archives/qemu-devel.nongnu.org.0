Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B34E5AD701
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 17:58:36 +0200 (CEST)
Received: from localhost ([::1]:47144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVEUd-0000Rn-2w
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 11:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVERl-0005et-Jl
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:55:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVERj-00051w-SB
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:55:37 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 i188-20020a1c3bc5000000b003a7b6ae4eb2so8024505wma.4
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 08:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=6IlA9IPNCZce0OBwmvW5y+GLTxoWYImHATPP7MFxXm0=;
 b=DFFnplYXetm9cOZbUJrx5NBoABQF07q1+ryNBROBxQNNFbuA7wbr6fCu7vrZ7xskxT
 mdRTiNYU7bNvvYjc8/HIia5ke+lN9VSvrWvq7Ia1yBXUIGnyckxpVJLJJVFYLiHZsduJ
 hN0yccoYexqKR+xDT509TGr2IaAMik6YlHIS71cRePhwm11A0bfGLaPK1shG+K2gNSDN
 k2z0bza0EibcIiQxxEuXZ0KIRuWT9go+MVg8JzuexPPb+mcUEas+W8O8+Y45d6EgSt7W
 Yl99pw4ox+rDcSSaeWClevDjIfzrkRhHN6sSmmupubNF1SBge7fpS6o5IvxK+ZY/a7UM
 99vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6IlA9IPNCZce0OBwmvW5y+GLTxoWYImHATPP7MFxXm0=;
 b=2WRbUNZapinivgx6aona/7h8pYguDGp/iMj19/bvRsKNT9XHvjAThHKBNGsy89dv0v
 /VpLU0t+CP86nEXn26B0U1fWgj/TDjeuo7gqki6/NGw3DwUcd1hlN7l8pXUNYEhbuW6v
 7fUO7agi8nLdb4/o4tX+Odw+XQ7aC2xcsXcaN9GyJ1WqFrsVUYZlT4WSaxWVVE0NrA67
 RYQ7MbqsLJXScxdzttVJggoywae60WHR2VK1fF8X+zVNAIBxHaFssze24ZBLc0iznDOV
 xaPGVdI47Fo9o43YIcZxD5pViosH9xBwO0hmpfffWoz+VgClGU3R7kcl2QkegKdm1434
 1TVw==
X-Gm-Message-State: ACgBeo0MbTtF98+ZpZLu4u0/q9ElDpMAA53Kjww2lmcy7t4h/FEYdkNq
 0xcRoSBBApuoAeelwz/HTW/Sug==
X-Google-Smtp-Source: AA6agR727ycgajUAPxyGTvvoI7j6SOKvQcI7eJwZyk/CLPg66Kf1ukvOjuS0DDue7lmL3fgbtkHGgw==
X-Received: by 2002:a05:600c:4fc2:b0:3a5:c491:5ee1 with SMTP id
 o2-20020a05600c4fc200b003a5c4915ee1mr10871584wmq.62.1662393331941; 
 Mon, 05 Sep 2022 08:55:31 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 bg15-20020a05600c3c8f00b003a4f08495b7sm19805650wmb.34.2022.09.05.08.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 08:55:31 -0700 (PDT)
Message-ID: <348de268-eeb9-3fea-5d56-91b41d235b5c@linaro.org>
Date: Mon, 5 Sep 2022 16:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] target/ppc: Move fsqrts to decodetree
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, matheus.ferst@eldorado.org.br, lucas.araujo@eldorado.org.br,
 leandro.lupori@eldorado.org.br, lucas.coutinho@eldorado.org.br
References: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
 <20220905123746.54659-3-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905123746.54659-3-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/22 13:37, Víctor Colombo wrote:
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode           |  1 +
>   target/ppc/translate/fp-impl.c.inc | 23 +----------------------
>   target/ppc/translate/fp-ops.c.inc  |  1 -
>   3 files changed, 2 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

