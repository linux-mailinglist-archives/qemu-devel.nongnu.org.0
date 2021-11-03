Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EEA443C02
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:50:30 +0100 (CET)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7ID-0003xd-FU
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7GM-0001hi-1O
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:48:34 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:35760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7GK-0005M0-B6
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:48:33 -0400
Received: by mail-qv1-xf33.google.com with SMTP id u25so1460532qve.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1RHgANsLha5acKk3AuePEVQmKob4ElrtfQOSBA/35vQ=;
 b=Z7avSCCWe9TSRK2uA+t7IXoCPJUKJNnvK8VyzgM3wg+ZiLVePV3nMMlmGEFaG/3gv4
 PzYHg5kHqgpwVDrIDoeUGAwssucMst8ORLfdFwOhnWoVVVKzLTTxMtt58dRrfiEYddrq
 L7YVcxKamJA7Bh0HtK/BUPM6OuJFdRxeC1vqWqXDi9ZChYs7AFPnzKtJRYvRUTQjnypQ
 e9op8idC1u1ZfgwZh3u90Jo0UDA9TaegkQRsZpaSLqCKJpxkFanSHL8zge/FTHfMBakR
 KgSm327I57oY9IX1eEDN3vdnpnXfG6i58a4WOSEo0litcBXdJxFvlss+AZoOq7/8Nh/3
 5KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1RHgANsLha5acKk3AuePEVQmKob4ElrtfQOSBA/35vQ=;
 b=n6ne/ot2BstKyordpjGncjIdPN85n4jkIwJi66A6D639sxx0oeq3BrRwdQYSXrsnka
 eKvjZGsAHU/c4Ee6Bi6aOPJ2O3eXzF11Tp5ATUqIQD9bNy/zKBx2tTRoid4uv8oapnI+
 8zYfhiMGVM48MUSFVPTgkdCsNVyZ21cuuJfNy/O+SoAFfCw2qtRye5w1s3Ye4RgxFjc9
 6tpuxv1gyL2/iA/e5G2LNvqPfnJxkmwxh6PBsDe/5W73Av/C+Ud2xji9GA5zrkZLIXwu
 cpo9m3HLu99N2seIjtkLmDPdof9jjhCSBIxMn2ct3N3sC8YxruTX7wtG74kG+GNQFrI8
 qUYA==
X-Gm-Message-State: AOAM533QbxZRn/zvkxaSwO+xtwapqWjdwEG4D3+F32lj4JYvANbeRjoG
 gTQq2GP8FC9jfXVxR1ikDJONig==
X-Google-Smtp-Source: ABdhPJw99CxM9y1ovLLPmIRk6V9jQgPjBlZ9eJrOV17harxO8tC3p/k9fOjLm8yHd/rNcD9BFdFC4w==
X-Received: by 2002:ad4:5f87:: with SMTP id jp7mr19027981qvb.28.1635911311470; 
 Tue, 02 Nov 2021 20:48:31 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id o5sm709722qtg.24.2021.11.02.20.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:48:31 -0700 (PDT)
Subject: Re: [PATCH v2 28/30] bsd-user/x86_64/target_arch_signal.h: Remove
 target_sigcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-29-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93097ffc-9571-6578-227f-eb15baf4403c@linaro.org>
Date: Tue, 2 Nov 2021 23:48:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-29-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
> Remove vestigial target_sigcontext.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/x86_64/target_arch_signal.h | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

