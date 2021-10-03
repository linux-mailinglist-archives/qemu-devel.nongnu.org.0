Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4604203C3
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 21:29:37 +0200 (CEST)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX7B2-00012R-Fs
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 15:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX79h-00086X-5H
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:28:13 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:36678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX79f-0003jA-Le
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:28:12 -0400
Received: by mail-qk1-x733.google.com with SMTP id p4so14468603qki.3
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 12:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q8aa1TwYDln5rt/xNMj0WdZN63pmX/jQsE5G0wTZDTg=;
 b=sSreT9/tbaAinSqFxMQ0oN7yW/zIf/dRyB1v8pCLp76FmI2IuYvOPeRC7GlvJChhY1
 h8YLr3UypgQ50HjZIOUyCPIGjyT4QIlt98YaeQxVJGYI5qUzb0XGnCKc98I6acTtkWRw
 hNU8JvJXFBB4drASel4dZrJMogZ9hYa9Ss0bkGyxNAZ+Z/KVhs+C3X+lph5o3ftIcOIy
 PgbCYwxnOCyP9AQYCaCZKPjMvba8kTitB/hXXQvTieuKueMeus4crY9WOGbouWYRUygq
 VdjX2xElx5lZCjVqT6wcGgnMcx9KIMyOsVKYCMNlwDX0RKt8tueHKkRxjKpCRO6iBjGY
 jdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q8aa1TwYDln5rt/xNMj0WdZN63pmX/jQsE5G0wTZDTg=;
 b=mdxfWhksfLrqcIpqXUX1nD7kCViDi9KiMeRqhbJWBTxW57ZexixH9mXlkiwJ5CUl9H
 cPzeFMJXWqBtGcfQGdoDoRQOOlOqSSJO5RBm/rRptigeZx5q3ELwvkZ5zBJYdhQxSYM2
 KZnMLdzL4TKBb0BvC8jmbma5ae63tUVSZA7lNk0lf9eRL3TUo+NJ+CIH7LKYiKSzYjS/
 0RQ20lRcjlFDM4T9+PmPGbRjamipsrKuCRq7AFUvvtkaY5qyCEu1CGAe4Uft1GL3YSv+
 /T960DjNwR0GW2hToei9eQbtxLuxTooABA96fyVG+eMiz7iC72jZF1no8oINwxI5fqNT
 L/pw==
X-Gm-Message-State: AOAM532EJJp15NWM38/j3wJXNNnvbXkLnMsO02Ct1jM2K8xQb5bL6swz
 vRWRwC4cItqYaz+X5fDEOiFaLg==
X-Google-Smtp-Source: ABdhPJw2w9HUC/jgam6f129n1GGcTtCvmXrEm1epZPz35Iqz1V9YLkgn6153XBV159firofnfnypsQ==
X-Received: by 2002:a37:a7d3:: with SMTP id q202mr7049912qke.418.1633289290702; 
 Sun, 03 Oct 2021 12:28:10 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id h17sm8232808qth.42.2021.10.03.12.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 12:28:10 -0700 (PDT)
Subject: Re: [PATCH 4/8] target/mips: Use tcg_constant_i32() in gen_msa_2r()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003175743.3738710-1-f4bug@amsat.org>
 <20211003175743.3738710-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae7ab831-e632-e4b7-5501-7a2346a898c8@linaro.org>
Date: Sun, 3 Oct 2021 15:28:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003175743.3738710-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 1:57 PM, Philippe Mathieu-Daudé wrote:
> Avoid using a TCG temporary by moving Data Format to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_translate.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

