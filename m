Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6932D43A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:33:57 +0100 (CET)
Received: from localhost ([::1]:45156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHo73-0006NS-2G
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHo5j-0005cA-2m; Thu, 04 Mar 2021 08:32:35 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHo5h-0006WV-J5; Thu, 04 Mar 2021 08:32:34 -0500
Received: by mail-wr1-x430.google.com with SMTP id u14so27675839wri.3;
 Thu, 04 Mar 2021 05:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rr+j0yjGaiXn42eNgBTUM0K6+ZGvQHvOS5/v8HhTnR0=;
 b=qXAr+mCHWblu8DVTT6wWPeb9jxAM4eK2VwslWgKOIPVhTRvUGl7Y1pqsHsVBNMhfhE
 vmlHtGsrSQ8vHnPot7LZMzdYsq/JXGC5abp/X00CDMPNNj9Lr5RISYTZgdyzcd+4QFw8
 sFEsRoipIJuK9jv/VnCQKx1tel82XDyHkj8AU9Hni41vaXvU0G7Pg+rmYjYHkrh2Jld4
 o2U26wZCUaKQilJMxfvtIylOWe/KSWzAu5vjKELeYStVePFPuhJr7PoUVrmAUlFxaSRA
 PYEwfSW0XO8wLnJWOqOoLL1Osn0WVQX7l5c9ZXpeHXCSdq/AfdiOevsA4QnGp5qb4TyT
 EltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rr+j0yjGaiXn42eNgBTUM0K6+ZGvQHvOS5/v8HhTnR0=;
 b=ekjLnOnGGBnRbLv0+kfPEZojrWYm5/qhMFtgR7oY5GjBqxYvWSPNRK8eaYOAJzW0Pd
 ZINRDdcB9IYsfpABUshC3vOqCXah3lCrSN4Ua3fUJCu3g2+f5BTzTa5aBdzwwYQGUieI
 GZAExQf2m6dkYBID1WvnhOwJ22S/InRWyKXwoPcF8oOWxfNd63cNHmR0vBBJxuWtrKJZ
 9yar54KLIPxAJHQgEJz/kcw+ChDYHy37TSIAcT5+Gh+vn+RgwNnLOl1eEsLiYh+x+2e/
 fGKKGb9hcOyaBIgkPzsWANvKaqAsdlzDYRLr6c8/wfJw/8jI6uq51BcqlUbISDoLxeOh
 lHyA==
X-Gm-Message-State: AOAM5319evG+Jf8JeBe0usnrW5HziWcStokaLeBuNxVifD2am2e+wUaE
 OCSjeX34YEHZEFhacFvsJ+sKT9ha3c4=
X-Google-Smtp-Source: ABdhPJx7v+CyUfLOxF9Wrii/n0M39XvRf57+BjKyjda/TnuJYP7gBwmLc3OROcFCZjPb6LltBfQrYA==
X-Received: by 2002:adf:fd48:: with SMTP id h8mr4043793wrs.229.1614864751171; 
 Thu, 04 Mar 2021 05:32:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s84sm10007905wme.11.2021.03.04.05.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 05:32:30 -0800 (PST)
Subject: Re: [PATCH] aspeed: Emulate the AST2600A3
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20210304124316.164742-1-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fa343c1e-6128-2000-2cb0-1231d8285ac2@amsat.org>
Date: Thu, 4 Mar 2021 14:32:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304124316.164742-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 1:43 PM, Joel Stanley wrote:
> This is the latest revision of the ASPEED 2600 SoC.
> 
> Reset values are taken from v8 of the datasheet.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  include/hw/misc/aspeed_scu.h |  2 ++
>  hw/arm/aspeed_ast2600.c      |  2 +-
>  hw/misc/aspeed_scu.c         | 32 +++++++++++++++++++++++++-------
>  3 files changed, 28 insertions(+), 8 deletions(-)

> -#define AST2600_CLK_SEL3          TO_REG(0x310)
> +#define AST2600_CLK_SEL3          TO_REG(0x308)

This register doesn't seem in use, still it would be
nice to mention this fix in the commit description.

