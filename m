Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC42B1077
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:31:25 +0100 (CET)
Received: from localhost ([::1]:44838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKBh-0001NR-1Q
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK8c-0007HW-NF
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:28:14 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK8a-0001Hh-75
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:28:14 -0500
Received: by mail-pf1-x444.google.com with SMTP id x15so4411519pfm.9
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uDqiIBkxGi66n/kIq1HVXowgI0TgnJBKvyyq+64Kc24=;
 b=nLxqqsxKb1IwzUf8ODTVQ/IPxc+2h3exQSpGZwwmHwPWf2CkSB/dYHILn5ym61BTrg
 1hRXJ1Xr9E0XBX1T3jecoOWRaUgWfUoBl8i6XnikO0sepnxFgcGue6aE3uEmM/quN3/d
 fXWiQxJY1RuRbvNwAK2PGi/mTsDaEjld7fvhP6Jc1seZCrssh8WlDMWIlLlme/LRT7Qv
 vEhcccEbVWqbB0PS+m/54glMnSxsokIp3CET0yJIL8ImTVa4TXPHit1n18jkIDa7KUnt
 JE01Spe05Cbt9IEFv/gQGyqP7uK3wUL4A0aYKUzRdy++c3yuJtWLiLDc5mDVpgGO+OxE
 ONeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uDqiIBkxGi66n/kIq1HVXowgI0TgnJBKvyyq+64Kc24=;
 b=fTvGCtetp4/bYD1EAB1uwigk+ga/TV+gjFV46BhLki/zQN0nkLTV1g5eo8e4JSAlxs
 FmRkqHjD7rjodX7NCz3wzdr+7w1ML1upIfYJtd8NEJTUaCr4+C4XMuwRN2ppgs/zvMsT
 oZOAWoFlYLak/OtLczdUOqKBzx5aBWW34Vk/vwnVVfebaJ1wyPlGvGFvZyImStizIxjE
 LAi8gyWUJuRHXzMK3NCvnLqWxpgvsfetA8ABfjVvBJmCXFNG6YzauIoh7WqxBK5Q38Le
 Q9o8Ws/+5CoPpnAMkcIA1/4cnozWKCkEvYPhC/INfCSwzb/oIW3ZnPvYRgx8Cd5/9sdu
 D0VQ==
X-Gm-Message-State: AOAM533XR8LD1N+ZGLLL6rWWIjO2W+9+DdGmWQDEQi7caGJp2JCn/b++
 iO4K9aHmo46nPAz2AU+TNvRqOw==
X-Google-Smtp-Source: ABdhPJxO6oVKJ38sC7JjlS5vBZHOzaZLZu1pxJjQQvIDR0qB2P7hw3c3pbbc4qR0CeSheC4vDjBX5A==
X-Received: by 2002:a17:90a:e615:: with SMTP id
 j21mr1232066pjy.74.1605216489891; 
 Thu, 12 Nov 2020 13:28:09 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gk22sm7697867pjb.39.2020.11.12.13.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:28:08 -0800 (PST)
Subject: Re: [PATCH v2 3/4] ppc/translate: Delay NaN checking after comparison
To: LemonBoy <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <20201110105321.25889-1-thatlemon@gmail.com>
 <20201110105321.25889-4-thatlemon@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3a56f92a-1415-7831-803b-25fca18b8691@linaro.org>
Date: Thu, 12 Nov 2020 13:28:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110105321.25889-4-thatlemon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 2:53 AM, LemonBoy wrote:
> Since we always perform a comparison between the two operands avoid
> checking for NaN unless the result states they're unordered.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  target/ppc/fpu_helper.c | 82 +++++++++++++++++++++--------------------
>  1 file changed, 42 insertions(+), 40 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

