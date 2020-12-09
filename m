Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662B52D4470
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:35:12 +0100 (CET)
Received: from localhost ([::1]:44206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0Yh-0001CV-EB
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0OU-0004kD-4U
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:24:38 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0OS-0001xQ-Kr
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:24:37 -0500
Received: by mail-oi1-x241.google.com with SMTP id l207so1877020oib.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LU6gJVVMRmap31S/3ifeHQ6pY6su56mIc9t/BY2+jNo=;
 b=ETIkCA8PfAIZ1df9r+VPImIvTthUoejPCvC0IbyBiU3vRYUQj7cSkagfWUf7Ij82lC
 drbZUKyGWW9eFPjYhujqoI8LieCtlYXsfdkluYgvWPDQtIvUglJg8mjaEgOBuzpP9/KI
 APhX7hmYRvWrhJkQUblznKGelFRYAvLYLsQQw9KuRL6QnxZnuTfUM6rMJe8Q6224Y1Qx
 uDssZwTnWfNyABSDptTt7yfmSb80XwvJ6l/Yp+FO11k1mYg25wxQ1IdfZ0pgKFdG26wm
 9F5MIZxHeE0DDlFM8oLSTc2nUrDEx0qH8dE9typ4ZuXlmVlRrBFSxFqf/59VANAT4orW
 Nykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LU6gJVVMRmap31S/3ifeHQ6pY6su56mIc9t/BY2+jNo=;
 b=IF7txEWL8KZKRGfCeNvhmv8uEJ8+rIiZsglJbAGd21VhPju2n2rckGsNiwkIvMMupc
 XNsyaheT9KrG9G+acnPVef1sxXJJaf/GmOIFRbZf93GQe1hsuTLfiV39s+XhWt1i2YHt
 W3uZK3YvaPp67+4Iai/AFt2V6XB+B7x5stufXGOHv8xRyutdueXpMDcD2ODrJzHNVeVa
 2JPnzsuBtCSiGL7RWgVizUS/QhhO/2viBPz0z7HrmAEI0dofdqubKT/pfb1Wzfh0EJ63
 13yslWqW4Io5n5I27k4mbYjSLO76bfm4NJEzyrOycb0qbjMnvrNBrbo+mSU+gQNnRcAu
 DkVg==
X-Gm-Message-State: AOAM533RP0PK7kN5H0EBklHsinWbhMwQuEpL+Wp97Hf1rSos1/SonB3C
 /DA9ZRoaAW12cR6ucvg8g+b3jg==
X-Google-Smtp-Source: ABdhPJw8YGNfn2ri2WBMiZ7AtPmUI6xsyUYibBtXCfrdFfvEXRs0WJ2bdB7CAAC9jzS493hrntJOLA==
X-Received: by 2002:aca:f5d3:: with SMTP id t202mr1902436oih.25.1607523872255; 
 Wed, 09 Dec 2020 06:24:32 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e1sm334785oib.11.2020.12.09.06.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:24:31 -0800 (PST)
Subject: Re: [PATCH 08/13] target/mips: Convert Rel6 CACHE/PREF opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a93d098-c025-8903-34d4-7fbf5ee90534@linaro.org>
Date: Wed, 9 Dec 2020 08:24:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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

On 12/8/20 2:36 PM, Philippe Mathieu-Daudé wrote:
> CACHE/PREF opcodes have been removed from the Release 6.
> Add a single decodetree entry for the opcodes, triggering
> Reserved Instruction if ever used.
> 
> Remove unreachable check_insn_opc_removed() calls.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/isa-mips32r6.decode | 3 +++
>  target/mips/translate.c         | 2 --
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

