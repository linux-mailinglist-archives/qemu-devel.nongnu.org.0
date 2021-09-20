Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECAF411805
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:19:46 +0200 (CEST)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSL57-0000gC-Q1
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKd6-0001Bl-LN
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:50:48 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKd5-0000rg-6Q
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:50:48 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f129so17602687pgc.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=D0gZhI59+6oJVVDyPdd/HklFEJiHfuBzGGWri7qyTrE=;
 b=qGUnIqOiM7zI3AQyupuMTBuI/2TePzUxJre4is2uHdJDFqWdKoY1cVeHiJabNVAmC4
 2e1K8ElkzG9iXa1FFWu6YwIS0Whfl/p6zH72f6zMG7tPOzPeTh9jaiZRBns9J35qPs22
 IW4R9wKhKHXX9Ruyr0gKAZoE66fGekLhyFIkCox4EZD9HWuYEFycZBJUtHALR7lQNe5W
 LoYatkS+JHGE0iPa/o1w6ExMLulsOdsDdp/1IqP0vvzGqVpE0UBfeVYkUWlGVHoynVnc
 ZwSWLEJ3501CtbdWyrBEhriloZEjMhzLGTJRzXO7wklD4J9/IXbXt7uw3khLchX3mRE9
 KjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D0gZhI59+6oJVVDyPdd/HklFEJiHfuBzGGWri7qyTrE=;
 b=guwJzIu7AlaEEWmv7TsCtmjdv9uDpJYrtBQJn0qpZESkbecbtX+W2br0hExBAEwPOB
 yo+a02T+4zbrDE0dWWFX5r2CD/NiEXcBvF05e/wQR5bXr6uY+4EA33ovYJjSsQSvdDKH
 39xeTov20S3NqRKqWL+X0+yZjDyH655I2MLvOLBDMK9Zrno0pqVXgE8/r980+LF2GZNv
 EhYtP2xDIfatHy+dBjg3J8xu2UMiCjhtYlP0gi89w1w5+KfMY+h3nNV+lFvi2KekH5WW
 2lKDQoHDociWilblE7KWrVPpg/2UTdMthTJbIAh/kQdaHYV2CvZvtId4PWAd34w8rvKx
 HG4w==
X-Gm-Message-State: AOAM5300maK5BjHnjqogPO3UrZxuaX3HzrU716fpki/mGTgjiIuAO0gJ
 KnzawvbUo58xwB7iOKZ2FoBC7/e/ozfLRw==
X-Google-Smtp-Source: ABdhPJxOSZMYASkYnKx9SyAyAlDuEUjsgRI0bjGa5rxsPFmlhA3MfAi8cwImo23g+r8dlWhcm18G7Q==
X-Received: by 2002:a63:1e16:: with SMTP id e22mr23532182pge.153.1632149445850; 
 Mon, 20 Sep 2021 07:50:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o16sm16212933pgv.29.2021.09.20.07.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 07:50:45 -0700 (PDT)
Subject: Re: [PATCH 11/30] tcg/loongarch: Implement sign-/zero-extension ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-12-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03295a06-4358-fd28-92ea-3df18d950814@linaro.org>
Date: Mon, 20 Sep 2021 07:50:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-12-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch/tcg-target-con-set.h |  1 +
>   tcg/loongarch/tcg-target.c.inc     | 82 ++++++++++++++++++++++++++++++
>   2 files changed, 83 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

