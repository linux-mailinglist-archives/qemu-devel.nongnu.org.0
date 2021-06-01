Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E548397488
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:47:24 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4jr-0003C9-2k
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo4in-0002Io-4T
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:46:17 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo4ij-0004Gs-Ic
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:46:16 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 m8-20020a17090a4148b029015fc5d36343so1962955pjg.1
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=54yZOHxNfR4DECZV5kB7UF+cOPkKHq5gA/MvqW/n0f0=;
 b=Y6VM5FD6221jQTsIwW52/kaOVJyxATV2QEu8nvaOLEIuh/1kKY4k6wkqpjTZesx07n
 7P91P+Mv+GLrKYjvBKH346aSrWPADcZ53hZ5grrMjRmcL3TEWXGwBoC7nUbV3lKtKhVO
 NhvwbPzcmGmAOEUupczHftIHm8WLfjhFyNX7+Boz5LJo+tCGr/ZLeM8JHVbLNutF7Ysq
 CEjsrJ7cppZbvAKtZfdLTW70gOUWoWHUzxuaXvxS3qCS/3hLFDaworc6liSS7DfnTV4p
 sfhy9MUVIFx11JVOXzrMMWR9/9pGvQJV/yGj8gF1hsCapo6Q5metl4ajSlOglbpGlp4J
 zhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=54yZOHxNfR4DECZV5kB7UF+cOPkKHq5gA/MvqW/n0f0=;
 b=JsVtKPbWsCwqZ3JDHOzJ4WVXS41InPa6dogwC2zxUTGs13yOYjVg7ld2Pgk9AvLTjf
 NVoJ838csDXa0LQyNZFsP45xtE2ipg/zpnq7qn59mvCH0BFFRTSKzGonCJ/13i73oLiH
 a4hAlFtvwGAxXC2OaEwDMlGqvoktLKhJW73d2WUZr5HAcJGVABlZUx2XAr/KOSd956Dm
 5lg14BPrVkotIc7erUqEb1ZjBvTbMtKoFftwn3qKNM832t3vVnHPKJ246y4LMIM4pBC4
 37AneHfY7/GD307WuEbiv9+GDE2f6AOsnPFEoo2RctpEj/6JEhwQFNsSLiTjMNadBfaD
 5IHw==
X-Gm-Message-State: AOAM531VP/Zewf70TAlPeBMERCJ2f5kpT8Lsb3FadeCX8zCAwXFtwj4V
 PzEi7jMI6DL0/d6yUGEzUzMR3A==
X-Google-Smtp-Source: ABdhPJzUzNQeb1pLuvGXzjm1JYOqX1H7mYV5ZyCO7OTIPnXIjxZ9ceCWlv+lDVLaU9rf876pNB2QaQ==
X-Received: by 2002:a17:90a:880c:: with SMTP id
 s12mr25472348pjn.66.1622555171065; 
 Tue, 01 Jun 2021 06:46:11 -0700 (PDT)
Received: from ?IPv6:2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f?
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f5sm2301848pjp.37.2021.06.01.06.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 06:46:10 -0700 (PDT)
Subject: Re: [PATCH] target/nios2: Mark raise_exception() as noreturn
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210531093018.1641599-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce60d316-8c36-72df-1f00-895d15aa8969@linaro.org>
Date: Tue, 1 Jun 2021 06:46:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531093018.1641599-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: Marek Vasut <marex@denx.de>, Jeff Da Silva <jdasilva@altera.com>,
 Chris Wulff <crwulff@gmail.com>, Sandra Loosemore <sandra@codesourcery.com>,
 Yves Vandervennet <yvanderv@altera.com>, Ley Foon Tan <lftan@altera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/21 2:30 AM, Philippe Mathieu-Daudé wrote:
> Raised exceptions don't return, so mark the helper with
> TCG_CALL_NO_RETURN.
> 
> Fixes: 032c76bc6f9 ("nios2: Add architecture emulation support")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/nios2/helper.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/nios2/helper.h b/target/nios2/helper.h
> index b0cb9146a5f..9bf14c128ed 100644
> --- a/target/nios2/helper.h
> +++ b/target/nios2/helper.h
> @@ -18,7 +18,7 @@
>    * <http://www.gnu.org/licenses/lgpl-2.1.html>
>    */
>   
> -DEF_HELPER_2(raise_exception, void, env, i32)
> +DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_RETURN, noreturn, env, i32)

The noreturn is what you want for that.
For the flags, you probably want TCG_CALL_NO_WG.

>   
>   #if !defined(CONFIG_USER_ONLY)
>   DEF_HELPER_2(mmu_read_debug, void, env, i32)
> 


