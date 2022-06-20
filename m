Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C65521DD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:07:52 +0200 (CEST)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JwM-0000yL-4A
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3JqG-0005E3-5z
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:01:32 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3JqD-0000Xn-3k
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:01:31 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y6so10153934plg.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 09:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a37T/Ly5FJOyP7L1hXsESc7y+OGSzlTq37C6kS3mt6g=;
 b=KfKlkV6jZH4PmLHy0bX9nUStirljfihy4u4G8bk12Ij1e0hgIJ7VnUcQ6VZPt+waS6
 kihhf+DOINrqpDtPvKviNTY1GjF5e7Gw5MsA9X+Gku/XVnxAZwt7tQd2zVmioHUjY80q
 LYP1DVW449yDwMGhfZYp3FlisMlTd2mirIv1Rw8/JG6/YE6mhtrC5cShW472yYsjh/0m
 Zj1o3cz+DTyzK1C2EcuXodwCqtqOBiY8EX4Uk5qSjcNZWGugUrJTi9dPeUjbxaMRJ+Bv
 4u1SfqNxy4nPFXojrtGegnKRpkufHGJDr3GA/yYMYYtaqj2zo6u/WazZ7EzydQ3kdRs6
 dD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a37T/Ly5FJOyP7L1hXsESc7y+OGSzlTq37C6kS3mt6g=;
 b=zGx/pPskLQxV7KPvvn/xvi51V190olSLYlqvVkZVc1SHJC9DCgSNSwaKX0kiDoD/3n
 7eH/PBZ7Y0L4Gwn3HikeABn2AujCLFCB8kcSpn69XuW4MNWVezqH0oygHHREGgXbeeyE
 doFd3oSo1FG9PNYgX8UhFzlTWljSUH/9lDUZAC3RAehdVO+EgaLg6k7/uZaIDIdYypN7
 zMeF/G96osPslfRJR5LvVOdCYNFLHK4V3kkMfv1jSH8LnYQq/Np7KiTW49CF/AN3T3l/
 fsSBjncHIjpg0r36j6R770my+TVaDq6tGcgFpZb/pcZ6C15+MmdFE+uPLYPgGLKLhqbk
 wDOw==
X-Gm-Message-State: AJIora+9zo5H3zoLmUqtwEHsr7lkvbtWW2lkdgcJM5XeB5Vb/LIQ9BTi
 kQhs0IlM4fee8iVmeBitAALz3g==
X-Google-Smtp-Source: AGRyM1uTny04iWiYLBhcIAlHogP6ldIS7CqPzlHeQUNoL5uOHxh9WS0o4sT55OfF4lw/Ol16AAnxXw==
X-Received: by 2002:a17:903:2310:b0:167:5310:9f03 with SMTP id
 d16-20020a170903231000b0016753109f03mr24097968plh.48.1655740887579; 
 Mon, 20 Jun 2022 09:01:27 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 u202-20020a6279d3000000b00525161431f5sm4292007pfc.36.2022.06.20.09.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 09:01:27 -0700 (PDT)
Message-ID: <f621101c-f45f-a44b-2f8e-7514579428e0@linaro.org>
Date: Mon, 20 Jun 2022 09:01:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/4] target/mips: introduce decodetree structure for
 Cavium Octeon extension
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com
References: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
 <165572672162.167724.13656301229517693806.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165572672162.167724.13656301229517693806.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 05:05, Pavel Dovgalyuk wrote:
> This patch adds decodetree for Cavium Octeon extension and
> an instruction set extension flag for using it in CPU models.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   target/mips/mips-defs.h            |    1 +
>   target/mips/tcg/meson.build        |    2 ++
>   target/mips/tcg/octeon.decode      |    6 ++++++
>   target/mips/tcg/octeon_translate.c |   16 ++++++++++++++++
>   target/mips/tcg/translate.c        |    5 +++++
>   target/mips/tcg/translate.h        |    1 +
>   6 files changed, 31 insertions(+)
>   create mode 100644 target/mips/tcg/octeon.decode
>   create mode 100644 target/mips/tcg/octeon_translate.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

