Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9046B67FBE5
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 00:54:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLv0o-00025L-MS; Sat, 28 Jan 2023 18:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLv0m-00024Y-53
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:53:32 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLv0k-0007EI-CU
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:53:31 -0500
Received: by mail-pl1-x632.google.com with SMTP id be8so8316921plb.7
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 15:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jdOnElpCFj6MsMkQRPQl98clFlpQQdgYnOmLXHUH9pg=;
 b=sGhMeLcR1VFRo8eKH/1gtrthxcskFFiqHtYcsRr8xXG9pCGc1Lcxz6cfKP/1sofNis
 Ms3z+mxWyxUQhpIjmc7Y96EVsyrkmzoK9KNqxsD8yzb689ultoY1heJ51qPCxwSIfIGS
 iqRdDYhR20uwS3jH4o2tXKVWQSmscoApOYF1/bkydMhfAwjghjqDePYkaZHtmfu2ZH2e
 JBCHr3g9tCXN4sKeo6TOZ4S+nIDBzePFmqE5kgokV7GSb6/3kYF7nGWgvB0BCWY6P5wS
 4LKVx8HkJ3KrS5gG4ChzGR5kK553Wtf9IRtPdYHRy16qEdQkI6vkyLpsMM+xfHDB2MuO
 XVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jdOnElpCFj6MsMkQRPQl98clFlpQQdgYnOmLXHUH9pg=;
 b=UZR0X6jaBXJTHdfEwa5hbu+NyNrGyirBwigZLFT8l0bR0S+T8s2ef4Bw3CCBA6D75l
 Y3Q+f4JQSgHv/nxX6oOfefUBbLlmtEyT6aiL8HGQlxMF0RR5FstF1Q6e99649S7pALJl
 4+Dazj5AW/ltknfwpOsJsaCIBPW9yMXp9lOxtBkeY4LpQzrg2kjyi1fcdg+RRvpdmhpM
 nvb943wEdA9Zt9kvNbLQilF5BV5dFwBqtdpL3ULpSwO0u+SIwwP6EEHY97btxs3KpCvW
 fmi4c8N9v9+ka9EQ9gw2frT1J1MX8PmjzHvJjpt7gUJFl0nHr6Aun9C3PPmqgi6cZK2D
 +TXA==
X-Gm-Message-State: AO0yUKUHrpCEXMYMpgZpfu28YbRjbxKxQmajP0SrLf01y/ham9zoFxLm
 LDUIKSsMbcZs1NCTjbEFDTiK2g==
X-Google-Smtp-Source: AK7set9hfpT/q48dlrbwjpbLnmgwAWQpvgc4XigOSlMIhVNKWGAH36Fa2XJnnRthQpkr1RCCM3qphQ==
X-Received: by 2002:a17:902:f682:b0:194:d1eb:7a39 with SMTP id
 l2-20020a170902f68200b00194d1eb7a39mr3986551plg.14.1674950008612; 
 Sat, 28 Jan 2023 15:53:28 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b001960792dfe9sm5035682plh.135.2023.01.28.15.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:53:27 -0800 (PST)
Message-ID: <13f35551-f07a-7dc7-ad15-410702a4f980@linaro.org>
Date: Sat, 28 Jan 2023 13:53:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 20/23] target/arm: Implement the HFGITR_EL2.ERET trap
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 1/27/23 07:55, Peter Maydell wrote:
> Implement the HFGITR_EL2.ERET fine-grained trap.  This traps
> execution from AArch64 EL1 of ERET, ERETAA and ERETAB.  The trap is
> reported with a syndrome value of 0x1a.
> 
> The trap must take precedence over a possible pointer-authentication
> trap for ERETAA and ERETAB.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h           |  1 +
>   target/arm/syndrome.h      | 10 ++++++++++
>   target/arm/translate.h     |  2 ++
>   target/arm/helper.c        |  3 +++
>   target/arm/translate-a64.c | 10 ++++++++++
>   5 files changed, 26 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

