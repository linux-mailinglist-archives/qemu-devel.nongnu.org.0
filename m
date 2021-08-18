Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968543F0A01
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 19:11:52 +0200 (CEST)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGP6T-0007Q6-Fp
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 13:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGP4Y-0006Xo-CN
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:09:50 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGP4W-0000jt-Kw
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:09:50 -0400
Received: by mail-pg1-x52e.google.com with SMTP id k14so2907063pga.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 10:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iEiCQvuVmXLshx9Y/MKVjygE1XpJe+FsjSCpB+4rVg0=;
 b=SjfUrSbbyL9CTKQUOrel2gw8NopfQ9nRUQ+oyw64cAsDW93tmO5RxWlS51osHkOHTA
 Px6NkhYYmZV+oPyDh6iN/iKYVW6dPEVaMSr0Q7RY+srH335uVLH/IjBqOAprorFl6JcC
 wRE0L9vgk/A4PGlI6C9+Q0zHMWlgh4ErfszlxCpOtXaYNwuU4zmpx32F6WkIbfkQPwmK
 obINy3rEzouszNbOxduwJ00W8mzWjf1J8yP78aUPbG5eQ7g6yJlYpTF4G6ZSnejBgbAN
 vqLQjOAjittiwebpOjW5enBHEaaT9TgCjZoqvvzn6AyYC+KybVWdXYefGYCRzkxcc8pb
 sYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iEiCQvuVmXLshx9Y/MKVjygE1XpJe+FsjSCpB+4rVg0=;
 b=Tc9JCgX7GIWL2eLSGzlgN90aT1Po9L5N3sAsar073lX/O3TGf8SjGjf+HJRyGJFTXV
 Y9MvpfQ7ziyYuq4Ff1YW4v8b8mYD4w4cI71FGJHDIb/nQ1Mp+Z/iKIeSHlRcql+dGg69
 PtNmt8zIOJKIuPMS/bffltU0JLlB6LhcciylFN1XC+YvQbmzQ1StXUUQsb2BLij/NCVT
 VxL/DtF8FF+Mbikq8HyAuvKMnqEyHAMCE1W3TwTlTeYETxz/iizfZK1D7xTI7wRwMOOT
 U+qiQlBzi3Kstm/RVlFXyYNnV/c3Qovpwr5WxkoQvPh8rk1Ufibjc89AoKYVqlFWzKEo
 MW3A==
X-Gm-Message-State: AOAM531bx5yBsgsJ6tJ0OIf5kF37rp1x9k0mMPiVhJGE1/aSJGgbqBoG
 CdsTxk1cF6Qz/DTe7Iiudj5BfA==
X-Google-Smtp-Source: ABdhPJz3aCr1yjqt/JNuicRaTYMRs4Sr2RkPhoEohdz7sNvj66G5JaqmEra+vs+0lPQZJIgyOr+TMQ==
X-Received: by 2002:a05:6a00:1903:b029:3b6:7918:7ddf with SMTP id
 y3-20020a056a001903b02903b679187ddfmr10432225pfi.53.1629306585501; 
 Wed, 18 Aug 2021 10:09:45 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm353644pjl.44.2021.08.18.10.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:09:45 -0700 (PDT)
Subject: Re: [PATCH 2/5] target/mips: Replace GET_LMASK() macro by
 get_lmask(32) function
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210818164321.2474534-1-f4bug@amsat.org>
 <20210818164321.2474534-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20f15f25-42c1-7f05-9ccd-53b0d796c201@linaro.org>
Date: Wed, 18 Aug 2021 07:09:41 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818164321.2474534-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 6:43 AM, Philippe Mathieu-Daudé wrote:
> -    if (GET_LMASK(arg2) <= 2) {
> +    if (get_lmask(env, arg2, 32) <= 2) {

Whatever you decide to do with respect to the previous patch, the result of get_lmask is 
constant across the function and should be computed only once.


r~

