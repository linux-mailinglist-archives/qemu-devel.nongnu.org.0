Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCFA3DDFDC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:10:34 +0200 (CEST)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdKb-0005fw-Ah
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdIP-0003eb-Cc
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:08:17 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdIN-0002yw-8b
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:08:17 -0400
Received: by mail-pl1-x62b.google.com with SMTP id i10so20789665pla.3
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GZq3AJ7KLpkSgaiXH1Ef8r8owQPG8psxcsJdfnUrVUg=;
 b=vWRoF/MwqA43W1EIXUtcdDcX5baCLO3h7KQKdSeyQLMFW8X7/dfwFPl9UDTVwu6ZVt
 FD8ioZlkLeCAShnpx5hIy3uS6z2vOaXpK9DoQPLeihpOlyiOOPXIrB77VOudDPM0z8tm
 WH0oX8k3eFv5a7KY51+oskz45kcV3ptAdnSXOebDTpm6opDFac8Woh8WjRKN06n4lWX/
 R1N0l910zen6czYE2EZ+ZZN4Duk5dfEr4VzNQz0Chfji+UCFxyv/0RM4R0aUfv7YJYQ6
 Cpl2W3X47eUgaocxUTXyY535ZVYbWdnB5xY81RQsPuEInj2cijUVqMV3ABVISd9zZZGJ
 gAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GZq3AJ7KLpkSgaiXH1Ef8r8owQPG8psxcsJdfnUrVUg=;
 b=LG82PKCak4Rl+rI2wYl1SyNcslHYIUlWUQHBW0xKtXJBi0XZBWXO4sOaqimFdGW/K2
 l3tDyKRPkA2uPZ6kmJ+3dX0gw79sfoYbTjJqd9ZufeuFdAtxytDv5I7DZjXIROMvrO/w
 RUlNYe33XOs5sQZgGKm8w2rSlFPkQW8t46JG+8cr0sYbKbQJXJHpYVTgQMrivpOH7dsR
 vyKmt3arnBbhtIrkXjf5xyTc5clXS9HRNueR0Yh+rDFDqiZUMnxL0nZWcblP337kVy96
 gjDG0a6VBgY8UBMWSd6XD0lQs6WXV6/T31c2iHU/Uoqwn3bs0YpRfocOnR3EwPssQR2G
 KLmA==
X-Gm-Message-State: AOAM530GrkPy+aU/g2BX06Yt2htHieqfTZH6J6RK4t5c50+jquIgKHEf
 rvlq6yumoWQ8BbG/ipqI98/Rjw==
X-Google-Smtp-Source: ABdhPJzM/zNZJY1OiFzSANp61BV0mvgx19KcpKRLIf+rdmavbR7ghatIlpMISLDOHYI82gob4N67Sw==
X-Received: by 2002:a17:90a:b00f:: with SMTP id
 x15mr18191358pjq.59.1627931293923; 
 Mon, 02 Aug 2021 12:08:13 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id j185sm12863097pfb.86.2021.08.02.12.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 12:08:13 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 2/4] target/mips: Decode vendor extensions before
 MIPS ISAs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210801234202.3167676-1-f4bug@amsat.org>
 <20210801234202.3167676-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b696f96f-100a-bfed-0522-51fd9f7e8a3f@linaro.org>
Date: Mon, 2 Aug 2021 09:08:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801234202.3167676-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 8/1/21 1:42 PM, Philippe Mathieu-Daudé wrote:
> In commit ffc672aa977 ("target/mips/tx79: Move MFHI1 / MFLO1
> opcodes to decodetree") we misplaced the decoder call. Move
> it to the correct place.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

