Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630D3B66E7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:39:40 +0200 (CEST)
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuIN-0002rY-7f
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuHX-0001p9-5V
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:38:47 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuHV-0003ei-Hq
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:38:46 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 c7-20020a17090ad907b029016faeeab0ccso13281603pjv.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KE5PJeeyuuG8tznZZ9h+amhiuozpu9/0956X0sEepQs=;
 b=oLqPTYl/dPw0ILNlEXWSwOyenfOst0jQ1goOhosQ2FcI0Ouy1CS5lGKjqvUaZxPlfb
 Jj9XBfrEWZHpC9WoTBZq66sR+5OFjj6RlFfQclLKJgqjoETAgMnjrnCBUhGE0zWaq4BX
 /8vkp0UuCj0h/V5PkkVnUnZJ4YhMVFovOQFx6+F6dge5eNFYf/tQk7V6JII6NsN8jXmg
 BB7uSsg/9QUt3FKWQIgZfiip65Iz2UsArAvhVbim70mZu1vjuU+gRnqHIhWoPFNhJOtC
 c+0JgeZ1jBeydYb/s0hmF2bJpujDLmsXksLTw7am8HjvbL423JSE82+S6Y/uyLi/NNcX
 w2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KE5PJeeyuuG8tznZZ9h+amhiuozpu9/0956X0sEepQs=;
 b=j57BHXzcXC77O9fU530Eqg3lhiw5kRka8eNREYZQr4vZDFZ6oYUmpD7Xxc97ljoW4v
 rur8V6oPMbWsgb2gJk21LibO6VfYzozvUr6OBlBhilFFLsM6WuTgZerxGqTFL6LwA5gc
 rZe5gR/wQjiB7cZkkgPLtAyKNIJO5NgrP2Daq3HcCQGtfbLN3/lfNMc0eqwTCQ6OEDqO
 QVrDvHgi0/Dl5LdRD8X2i6RM2aC7IzqMyKZcBCi7OfeXhwCNMC6S4NNUPry78GtWMnna
 l2b9x10aq5SjE/knj1gv/5JPG6RHUxb71dUbwPvjxkPs7GjSdJ8LZCpoT14wo3TkUSNi
 ufuQ==
X-Gm-Message-State: AOAM530X25tXcGRIJeYzlliLCBnFTlNdMBRJu5T/NuuUmGM4UAsElnVI
 0FqxSxLG0Fgmr7xdmKddyWPAc2PUl9BIPw==
X-Google-Smtp-Source: ABdhPJzhLz+LVhDbfAMwElGzjn+rDoYu9+0gfydnaxRFeEt26Yz/qMiAN+vv6upYlpbVOarqnuRtZg==
X-Received: by 2002:a17:90a:a395:: with SMTP id
 x21mr28703572pjp.63.1624898323166; 
 Mon, 28 Jun 2021 09:38:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z22sm15458228pfa.157.2021.06.28.09.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:38:42 -0700 (PDT)
Subject: Re: [PATCH 12/18] target/arm: Implement MVE saturating narrowing
 shifts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc18500b-1663-25fa-d5b2-49929b033819@linaro.org>
Date: Mon, 28 Jun 2021 09:38:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE saturating shift-right-and-narrow insns
> VQSHRN, VQSHRUN, VQRSHRN and VQRSHRUN.
> 
> do_srshr() is borrowed from sve_helper.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  30 +++++++++++
>   target/arm/mve.decode      |  28 ++++++++++
>   target/arm/mve_helper.c    | 104 +++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  12 +++++
>   4 files changed, 174 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

