Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64ED36AAFF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:12:46 +0200 (CEST)
Received: from localhost ([::1]:47058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larfx-0004P7-Oq
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laraB-0005ug-95
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 23:06:47 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lara9-0007qQ-IK
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 23:06:46 -0400
Received: by mail-pg1-x52d.google.com with SMTP id b17so2123823pgh.7
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 20:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PAHS6eFf6y/+LKGRsQZxmBciZYR1ljbOKq9AX8wPeLo=;
 b=rDgRVbiiqicI37Ljp++H5BvejGUJoZVtPm0I5yWWhDzxQenNh8kCtAhmHMWE9LOesd
 XB0IH7cTKZmF0liRO50PUpgimdNnY41hwuJSmxQYLBnQbgUL5laTZhPoneDvRPZ8jyTk
 0L591+b0ROolabQoT8XC5FgM/ONaLVO3s0ftj5So1iJUWuihdWSw6HpOzi4GWLOlxmE6
 nWwjPXPkdaM9a94XxTYpSkqzFNpjtz1VyYKNt9JAUKtyXot3yGyy8VckY6KTGdoOHf/K
 U2mCcLbjScc++eoro4OVANYLXXg+f8x59KmLhS6CR01Qn49TK147H/T40RxUbYZbaG+h
 +Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PAHS6eFf6y/+LKGRsQZxmBciZYR1ljbOKq9AX8wPeLo=;
 b=YEnHT+zaeQLUFmcoKx0pOMXEUGa6/m2wOuB/zNwHLB8SvW78fn3ZtpmNd7zi+5+pp5
 aHeBCPOtQNu9ZyfyiDnjx+9wO893+zOrW+D2QnmUfmuVGqc8Pl440vPsSGXA/lgFt9rf
 0SnZwdVeYIiNjI3v+NcSTeDJXh+C6OH/cokOeBCLb3BBLHdSPL2sKPsa14VYcYdfkYs5
 me2qDmbMIWH5qNruBpH/EyC/CzVO8dhbK0dQZ2qWjLMyyhq9DUfWlMh1VeWr+oLygT2a
 DTKWxw4GnkJ6VtEX/yktACPuYS5Jk4lrQ+KsAIMM/gjIOkZwNuIYoJ2nPeuHUncaEnmz
 +ZOw==
X-Gm-Message-State: AOAM532Jix96immlXwsmQWCt64+rHR6uDDE/VepPsQhmHm31Sup0LiSh
 t25ws/NAcFG7cSyHNhvZXgwGug6ghiAzCQ==
X-Google-Smtp-Source: ABdhPJy4jzjl2WWKErht3IBHZyK9zAa+QpZRvBzMWJPoDP9BZ6lnMdOXAwkScn2QddChSKTuy+XgCw==
X-Received: by 2002:a63:a62:: with SMTP id z34mr14595262pgk.189.1619406403918; 
 Sun, 25 Apr 2021 20:06:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n20sm10560160pjq.45.2021.04.25.20.06.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Apr 2021 20:06:43 -0700 (PDT)
Subject: Re: [PATCH v2 00/25] linux-user/sparc: Implement rt signals
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
Message-ID: <64701bfe-66c3-7221-a1ed-82e25a59837c@linaro.org>
Date: Sun, 25 Apr 2021 20:06:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 4/25/21 7:53 PM, Richard Henderson wrote:
> Supercedes:20210425155749.896330-1-richard.henderson@linaro.org
> ("linux-user/sparc64: Implement signals")
> 
> This time, in the lead-up, merge the sparc and sparc64 directories.
> Implement rt signals for sparc32 as well, since there are only a few
> differences between the two.

I notice that we don't actually have any sparc32 testing in tree.
I wonder if I can steal an old debian libc image to install along with our 
modern-ish sparc64 compiler to get this working...

Also, I've just had a look through linux/arch/sparc/kernel/sparc32.c, and see 
that there's more work to be done for sparcv8plus.  In particular, need to save 
the high-half of the global and out registers.


r~

