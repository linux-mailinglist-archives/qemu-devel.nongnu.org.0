Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0851DF1D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:28:33 +0200 (CEST)
Received: from localhost ([::1]:54402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2gq-0000gY-Ak
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2V8-0004UY-KV
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:16:28 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2V7-0006VM-26
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:16:26 -0400
Received: by mail-oi1-x22b.google.com with SMTP id w194so7114270oie.9
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Amt3S1iohugZ8K2mdODjMgH/bnRr1ue0EBc80EXJw00=;
 b=RVtrQYXsMXd3PxGUYyA5UHZKOpCpczQ6R5gyua1+MMhX6rxonVQUxR/X8ccX/PNiGs
 78/ooEShF+6MB6/97PpgLTdeQZwGuapA88ur/AhgLYP9SCe/QrMoeRep2O2ZyauycOU8
 UDEu07fGTCJCl5uIOIbmieHiaMGwYhOI/UWzBF0WyO3WnYLhE/n3jkDCcbq21bWAymgP
 UBmxyQwD1cBFWw9V5lclxftQ5nn4hPJSulJ6mbD/MWt5hJmcict4CFmosSVl4igmS/ZH
 OJV4AK1TJd7lSzc3yEKwYL2ezU5CnUd++T6mn264mlZHhRl7x25haYfEyyFUS0msXKgV
 WWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Amt3S1iohugZ8K2mdODjMgH/bnRr1ue0EBc80EXJw00=;
 b=ayiTN/dNK17KAZrUKHWQZdXcVt97LFkGxpBluA33RlehEB/MfX1n3Q62ZphsiQc6bR
 ac3dSVRIl0/GeaCWGMWBsSWqsoVwmNzFTAXfP1M/eoYW0RmjdMHGMzfr9wjF2elwhjg6
 hufPR72ZKbUWKk4wgM4Xyiq163KN6ANRjrPbC77QuV536X9It7ZGxDZ66IT1F0n/fMEg
 it3uifDO2TFc+oQ9tawuDwZFX3H620WJKaQjyG9QvJVA5rhyybzFhZayB57m+lpys6fC
 yvFjMLKL8J+Om4GhiZ/e1O8DI1r2NXetvbm4tK2BTljx+dbmbK6S6VNEUIZMlfauXBr1
 s1Kw==
X-Gm-Message-State: AOAM531otRlXTb5vGEAuQ+ZBFdD23M1AYz9kL1mueEpE6M7tIa/sOMIT
 VDsEHNyLBy83z1nKP/PRO661tQ==
X-Google-Smtp-Source: ABdhPJxThjOHUYMhzEovMwNvlEaXJUcmD4LN0svItqpjcOWCPhjEJMGZ8INGBVfOe4Ipx6fT29Fh5w==
X-Received: by 2002:a05:6808:1309:b0:324:f014:80c0 with SMTP id
 y9-20020a056808130900b00324f01480c0mr2144596oiv.190.1651860983930; 
 Fri, 06 May 2022 11:16:23 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2?
 ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 eh4-20020a056870f58400b000e686d1387csm1811790oab.22.2022.05.06.11.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 11:16:23 -0700 (PDT)
Message-ID: <17fb75e1-b159-1021-061e-43e003dcd9f9@linaro.org>
Date: Fri, 6 May 2022 13:16:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/4] target/arm: Factor out FWB=0 specific part of
 combine_cacheattrs()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
 <20220505183950.2781801-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220505183950.2781801-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/5/22 13:39, Peter Maydell wrote:
> Factor out the part of combine_cacheattrs() that is specific to
> handling HCR_EL2.FWB == 0.  This is the part where we combine the
> memory type and cacheability attributes.
> 
> The "force Outer Shareable for Device or Normal Inner-NC Outer-NC"
> logic remains in combine_cacheattrs() because it holds regardless
> (this is the equivalent of the pseudocode EffectiveShareability()
> function).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 88 +++++++++++++++++++++++++--------------------
>   1 file changed, 50 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

