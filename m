Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1897474D20
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 22:14:27 +0100 (CET)
Received: from localhost ([::1]:36132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxF7y-0002Iu-FV
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 16:14:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxF6G-0001SR-LL
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 16:12:40 -0500
Received: from [2607:f8b0:4864:20::429] (port=44753
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxF6F-0001SN-1x
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 16:12:40 -0500
Received: by mail-pf1-x429.google.com with SMTP id k64so18848636pfd.11
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 13:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mNOZ7yMTAX/qwuKncETnh9VRBF52WijU9ADfqkFNlLI=;
 b=KfH4YtY2J2t9LytwMSiisil3jz1A5mjsDj/bx6Ew7+4DjmyEOOuIML7B+G0SdgUKXz
 flEhPyWBo/EjrBtjliNEJcGizX0HTXSsbs6J04T9fsAvpmRSdgfgGf+N7+tpg3b4V64V
 hlM2Lra1lBvS1aCPUZenpVCTQmaFNcsqI2smafha6fJi6yNbzmnOzQ5FiLR3HkyFcdlk
 J3vGXxMVbs/I3feTxAzm6Kxlf0iiGODOaqobyOQ3jjT4HEoMAIPGdo7TgBXQ/vmNnXpn
 8Sa3oXMfbO9kV++t3WQlVoAtsDi8pyPGE0U9ZUp0GG8Vk9sH1TA4nlB0WYYdY1bWbx9P
 iTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mNOZ7yMTAX/qwuKncETnh9VRBF52WijU9ADfqkFNlLI=;
 b=Fq7iRKC4/8LiHmccujEvcHdjbrkk/F2e4LlbZKIyHJyj60kouikXHvpc7e0FDv3O9z
 a84XtIOrfQJRXakxGm7HIv9EzOFlrSuntMmfQtw6YTwPfNK0DALaZ+7o3/xr0VciBYpu
 wg2erBRntJmyHPmQhbCNImgouTVdxI7xuEbZLJszs3Ah2ScSKOgmFG4sxUUWLYdG6OwB
 C1lSzGXgJdcO+iUC+/a/UuiBEcs2ZK5U7RZDMQwsjPPv6VhTG4zEYBR0dmxlf3ClC5bq
 648591FRBB4TRB1KmxOL+b2WKJhWG4t1DWP2qQmTfw4dWBq/Xp8X+tzjIctoAhVjDtjf
 gW+w==
X-Gm-Message-State: AOAM533n3zd/PSdLgP85J3EZk9o/azksHJift4rxxij94903x7RNUGfU
 rW6nE4ES6AYRpe15JtKq6abk/A==
X-Google-Smtp-Source: ABdhPJzTbGcrj0ic75BveFaUNGPv7U95pJj6phCdSvOLNdGXCryvYf5W8fKGOv7wBjnODjdnu6EjBg==
X-Received: by 2002:a65:4bc8:: with SMTP id p8mr5296376pgr.119.1639516355003; 
 Tue, 14 Dec 2021 13:12:35 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y4sm8824pfi.178.2021.12.14.13.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 13:12:34 -0800 (PST)
Subject: Re: [PATCH] target/riscv/pmp: fix no pmp illegal intrs
To: Nikita Shubin <nikita.shubin@maquefel.me>
References: <20211214092659.15709-1-nikita.shubin@maquefel.me>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a13ed88-e109-93e4-9254-62b6b04f5913@linaro.org>
Date: Tue, 14 Dec 2021 13:12:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214092659.15709-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Nikita Shubin <n.shubin@yadro.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, atishp@atishpatra.org,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 1:26 AM, Nikita Shubin wrote:
> -    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
> +    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> +        !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {

When would the number of rules become non-zero with PMP disabled?
When does this test make a difference?


r~

