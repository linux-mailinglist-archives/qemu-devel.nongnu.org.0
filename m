Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EAF681E01
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:25:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMca5-0000ER-Vt; Mon, 30 Jan 2023 17:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMcZt-0008V3-VV
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:24:45 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMcZs-0004cQ-Cu
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:24:41 -0500
Received: by mail-pg1-x536.google.com with SMTP id q9so8723477pgq.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 14:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Jr8yfdDn/1RoRpGTXIIP69vauCb9D6slfl3UqxlgfI=;
 b=xuSlqJvLD5rbGclZ+UMVGTymkGHUhokF6PDc19xYbqvSljKrnCVGmi9Qx1ohaqSViw
 aEFu3KIi1r8tpcaLAmLRQZh+PyGG3+6Jjx9mCl8CkuYCeKRfQPBYp4PD0nQFBPdQ4W+n
 GkZTSwTGNhBl+uhb6tJve5M1tbnLG+F03ma2vkAm0VY4i2h7R4+Y8G8QbIrMioSvQ9LP
 POWNCIkh6v3nXPNdelpkhQjc+e97mKotnkd9D9v9Mh7pNIArMGt5v2bAl8hYAtXqOkCI
 zOjk4jLMHNduMyPQluTqZbk4kBAprbRSarTJTRUVL4YDRCI9dxZ7wDib4P3uERq1dQ9S
 ccIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Jr8yfdDn/1RoRpGTXIIP69vauCb9D6slfl3UqxlgfI=;
 b=IeVqTGGnNoDfZK3/P98mrQYYI9Eo5QJ2V0WbPrayx1JR3KOlrI5zrbzAOIPBYoLR75
 PHbPHO8ulAXTsVdAWtDuoKFCwypr6bkkXlhtFwl9rZOsfIeCMvfz7CLvwsP4kiL75fCK
 hOPFybkRF9TlmtA3qUEPI0MMfPLYVXdlhXgH9MA30R9hZSqw+XpcBfAkOFhsAUzVvF12
 XUqlwCJ3DTlJgGIbYrXKLDwMACSv/EozeFqzvheCX4sx83gsqt0+0xX/BOpcz/Bx7uOr
 VtAztiJvnDVQkj+Q+EmScWRwuEN49UfUrDtAzkrLLXyMCOE9VfnyvcS//GOX1i2Hh1Uw
 JUYA==
X-Gm-Message-State: AO0yUKWQOBFOmTD1U0IG2zOCAInfowBgpt/ZcmJ4tXmqyF9jFQXX0WdC
 5dPolBfoMZoufsWOxIrdirJJK+wCbKVySY0o
X-Google-Smtp-Source: AK7set+YW9iz/fz0KesCcIbn5WkUuw/UKpxJC2dgji9lIOAi2uD8KI6RRJpJTt/pcJT9tQsq2Sj7Iw==
X-Received: by 2002:a05:6a00:338b:b0:593:cdc7:5dd3 with SMTP id
 cm11-20020a056a00338b00b00593cdc75dd3mr4037209pfb.4.1675117473578; 
 Mon, 30 Jan 2023 14:24:33 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 c11-20020a62f84b000000b005828071bf7asm3140778pfm.22.2023.01.30.14.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 14:24:32 -0800 (PST)
Message-ID: <74c21fcd-529c-f9a7-b607-3ab0011a203e@linaro.org>
Date: Mon, 30 Jan 2023 12:24:29 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] linux-user: Show 4th argument of rt_sigprocmask() in
 strace
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
References: <Y9hCxdvdM1o+/iHC@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y9hCxdvdM1o+/iHC@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/30/23 12:20, Helge Deller wrote:
> Add output for the missing 4th parameter (size_t sigsetsize).
> 
> Signed-off-by: Helge Deller<deller@gmx.de>
> ---
> v2: Use %u instead of %d, as suggested by Laurent Vivier
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

