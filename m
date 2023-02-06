Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394E68C620
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:49:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6Xf-0003EV-9x; Mon, 06 Feb 2023 13:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6Xa-0003AV-Pk
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:48:36 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6XZ-0004ha-6w
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:48:34 -0500
Received: by mail-pf1-x42a.google.com with SMTP id g9so9072598pfk.13
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p1flEmWceucDraALO9IuYQe7kG3zwnYHJvlOPd0gXSo=;
 b=kL9Fi7Glt7Yo+WYMr9AdnYNa3wGaUBCJdj1OeTGo6pqCsSbA6ReO0BGrgIKrC+vZZv
 cLGavCXYoxMrz1DowpD64XXIt+N3RSjyQKpiCxo49rzAXd1pcs9KBvDbLN63ZBg+EUjZ
 zGlps9Xsy5peYc1+LRCK+pUTI6Afw15LJ3xKQrtDBCKC7eeH3SENiW2TIQ+nV5US8cqP
 +XAhezfPKlcu+iL2xhi89q2+Z6U5PxPi3cy3DaMcWVj2w+TVjs4NtK/kze+4qiJAqv89
 B5QvAAxWjzzZghKVi60gLhY/2oWhnKHr5I8tI5jsF7xohQZedFFBIygVPe8j3MZgz/V9
 RndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p1flEmWceucDraALO9IuYQe7kG3zwnYHJvlOPd0gXSo=;
 b=v3XgB40vRRwjGGLQnkuoK/YQgq4wMZIe39OLD9XLeFwiJyshvDtP+zaRB7+NRc8hBg
 CXsyMXnA+C+RwoTpRMQyBGS2RDmN2erUCAeJRsRyuoPlZ2HuMmFMYBdZnrj381PirLRB
 DTN/frdGc1iryCAfMAeHgRhqsLqHRvffIzfKayJb8uHfW+8x6U+on4KsBOpanuQ/Rs2W
 3ASD6WYCsZ3oKIyOBk9AupFG2y7xY9rUT3KoMSyzZtI9qQNzNgPsX02Xy222XIJnxziZ
 VrXYxU0o3z/9Y0vBk1OI6kr98/mtt/DIq6EryXO/jNQcgG3bAS8yzwAs7522iI23eyPc
 3U1A==
X-Gm-Message-State: AO0yUKULNV60fpp1nyR7nAzPbPnMqgTXLTJHT8AoJSNjq6KO0HJqy1Xi
 XLjMdwVsbmatOaN+b6SSoKzaYA==
X-Google-Smtp-Source: AK7set8b6cVAS5eq6Tzr7js9A5zN/92y7Z1TF89TNy7xTZ2HeFQZQ2SRKOZ6HMKx03Vo6VDB9uH6Zw==
X-Received: by 2002:a62:2784:0:b0:593:acbc:94ca with SMTP id
 n126-20020a622784000000b00593acbc94camr311550pfn.33.1675709311529; 
 Mon, 06 Feb 2023 10:48:31 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 u12-20020a056a00098c00b00580a0bb411fsm7657049pfg.174.2023.02.06.10.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:48:31 -0800 (PST)
Message-ID: <8947a8d1-755f-4794-2f96-0361cb2e6e05@linaro.org>
Date: Mon, 6 Feb 2023 08:48:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] target/arm: Restrict v7-M MMU helpers to sysemu TCG
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/helper.c   | 2 +-
>   target/arm/m_helper.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

This seems like it would break linux-user with -cpu cortex-m3, which is used for gcc 
testing, iirc.

(Real m-profile can't run linux, but using the same thumb abi makes testing easier than 
using semihosting and initializing a board model.)

OTOH, we should be able to hard-code the mmuidx for user-only:

     mprofile ? ARMMMUIdx_MUser : ARMMMUIdx_E10_0


r~

