Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0A33B738D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:56:11 +0200 (CEST)
Received: from localhost ([::1]:53966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEDh-0002lf-1C
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyEBU-0000QE-AM
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:53:52 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyEBS-0004Mf-2z
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:53:52 -0400
Received: by mail-pl1-x635.google.com with SMTP id v13so10940498ple.9
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WAZ7oVW5l0mkrfBa+14ILALFZbLX+okPFrF53yLjnwY=;
 b=RBhFsYfJDvfQuFUr+3bXo+NIuYWg5ViMkrmngA8HpBBuRvfsHhyMFJu8gjn9oJ2hwr
 Kh4++vo3w9AK0kfVzOpVyStG1JIIznkUbq0DwprA4ut2iXvQACplY32ww/XwB1Kemq91
 zaQIJZYCIELTtaP4T3Z2JHjqP9HSdLHcvdpDnwatdXbkq6aHs9BUNqoqBwRqPcOJUBab
 tFScHZQwTzVmAY5uZc25RN9DR4zx5x/7Wt8+QQDCV6ObvukhMWSzAh6JD+u4W17YJzAH
 yWMbaC6ThfGClxRDUboir39d+hn47zjX0mw3w1WM22+4avyophJVCvoLTcmh4uYYtSgu
 idQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WAZ7oVW5l0mkrfBa+14ILALFZbLX+okPFrF53yLjnwY=;
 b=tYDG72EFVbaWf8faN/sd2dtGHxAGYEoHVYuV9/SJFFjOwAXSjaqgWpWxm7BuZYOgXY
 IHZNL/EuZd8dovEHPtCNrApqyRvqKoADTd82mQH8F4kiMzxOEH2cBWEj0y+AuRs5ibUS
 YIapXhMZo71GKJLDglb6VJcxQCLs7EJuHr34lcvAy3kqGoMDEnR8oG1WiPY5Qdjcqd7C
 WzyJxU9L75vGB4Wdp+3x5lCd9mv0Z+JbcPBxmsD/Ms9jl3vncuE8v6fR1niEX+LKOJjs
 MTCBlw2Yadd2cVjw7JKQv5AM3Dov8KC+OZhqpiaZrs45n26fk6wJNBU2BULWi20fDPjp
 0WUQ==
X-Gm-Message-State: AOAM532XB6LQ4AkiPnxlLlBEriuOPAsWTHWY3kxgFG4c6tdusVav9Sch
 uYxQ6AiH7V6Zv45+OGIeJ2McUw==
X-Google-Smtp-Source: ABdhPJwVTWrPvfOlapQMf22/uufzgzmOv+KHVR5wJbhEoGFEzb2imHDeqcATqyW82zS6chXCrxUOJg==
X-Received: by 2002:a17:90a:ea88:: with SMTP id
 h8mr13188791pjz.147.1624974828012; 
 Tue, 29 Jun 2021 06:53:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h24sm18427996pfn.180.2021.06.29.06.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 06:53:47 -0700 (PDT)
Subject: Re: [PATCH v3 8/9] target/nios2: Inline handle_instruction
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
 <20210628220810.2919600-9-richard.henderson@linaro.org>
 <CAFEAcA8jOHKcCqFhZ=M+qt-WBguiqv7j+Jwi0tAVKtYajVBN=Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c92ee048-3f17-a5fd-a2af-8e07734aaaca@linaro.org>
Date: Tue, 29 Jun 2021 06:53:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8jOHKcCqFhZ=M+qt-WBguiqv7j+Jwi0tAVKtYajVBN=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 2:27 AM, Peter Maydell wrote:
> On Mon, 28 Jun 2021 at 23:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Move handle_instruction into nios2_tr_translate_insn
>> as the only caller.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/nios2/translate.c | 66 +++++++++++++++++++---------------------
>>   1 file changed, 31 insertions(+), 35 deletions(-)
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Side note: I think we could replace all the handling of dc->zero
> by having load_gpr() return a tcg_constant_i32(0) for R_ZERO,
> which then never needs freeing. (We never try to write back
> to what we get from load_gpr().)

Quite right.  There are several targets that could benefit from that simplification.


r~


