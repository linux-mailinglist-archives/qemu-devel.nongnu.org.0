Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D596C440032
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:17:35 +0200 (CEST)
Received: from localhost ([::1]:60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUZS-0005H0-TK
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUVh-0002XF-9A
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:13:41 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUVd-0005SW-Hm
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:13:41 -0400
Received: by mail-pl1-x62e.google.com with SMTP id l13so2112998pls.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0DJb7HuuM/3gf5JYfFGMPIphLO6ih4OHfyQlhr44KnE=;
 b=qo492diUopFwh6uqLhR8PrsLEEES0/JTsY+PMBiig7avK0hsfm3YMkSV2IvC2eBllw
 e5PWVI5+my4jLzJvImmTqAfCUb/i6YGyL2hHoZ4m7zEFghHZBc4JVKLb6k50iREIosYc
 BAE7sLme3KGhk0+ZTLo3wabxL8eufrnPm0AYXr8zdIjxhaKCP19YL4G8OfhJNTvk59kH
 aHYNiNr7dKLqKY1N2ZhSLbNoAsonmBWdyWcZ3xTq89P8R+u1CvGNhJTtKJgLedqjsyEi
 f6N8ZnnHNaukwHQMJLKVQ4ZVOaaLr4siA2GAmcHifKrOaLRCLrF81WC+HZF+wJJCtXlE
 D3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0DJb7HuuM/3gf5JYfFGMPIphLO6ih4OHfyQlhr44KnE=;
 b=JMCxcz3BaCQo/oRAmvKq/FUu6EhKcZ9XXa7ICDc0WNrm0el3Y4vnHoO3OYd1NTXG9z
 H7+DbGkIuWCumVX9A0flNAG3lH/BuxQ22kvLq55tQ4qPcYis/lLt+/Y7uXSlwYo2SxC6
 mhJHbAism06sjJszDLsq591X7Xo6h+pjjP7G7VyDL85Ql7OOHHWntFjX6/lsaHhWbdyu
 kF4mgjLtg76PzKD1n26wOMc7wQrKxIgFBHl2EHzDhqjukp0NI2RsWB/ZeL4T4ZUQzDjO
 dbh9sWgCaeJ60XxtcZCVVc6qv/z0OIL0Ci0wrLVVgjA9JG8/t6P+a8tmsGWaCeDFzRIo
 M6Gg==
X-Gm-Message-State: AOAM530eVeoJTIoEtSPiWKz0VBA7JFsZwj0Eo3djSf+ALVM2JQiepZrZ
 KiGuU5/eIt/i2ITcZi/cTfC0SA==
X-Google-Smtp-Source: ABdhPJwH5GYkjCcBnv4lnFBbCkL/MR2H3J70jQJqM91WBPFG7jAC/jwRj+sZoFpa/RDlDtjImlm9bA==
X-Received: by 2002:a17:903:32cb:b0:140:56fb:9ebb with SMTP id
 i11-20020a17090332cb00b0014056fb9ebbmr10449052plr.78.1635524015522; 
 Fri, 29 Oct 2021 09:13:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k5sm6382970pjd.46.2021.10.29.09.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:13:35 -0700 (PDT)
Subject: Re: [PATCH v3 04/32] target/mips: Use dup_const() to simplify
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ee8dd88-7059-c688-2641-4b711e5e36d4@linaro.org>
Date: Fri, 29 Oct 2021 09:13:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028210843.2120802-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
> The dup_const() helper makes the code easier to follow, use it.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v3: Fix eval_big
> ---
>   target/mips/tcg/msa_translate.c | 23 +++--------------------
>   1 file changed, 3 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

