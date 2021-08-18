Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75493EFF8C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:50:27 +0200 (CEST)
Received: from localhost ([::1]:42934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHHG-0005XQ-Vc
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHFx-0003fc-Fc
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:49:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHFu-0002DX-Qf
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:49:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id q10so2289728wro.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/cKZ40D+5kZmbdOe1ppL4wX1eatJ/0My2HMWeYadk7Y=;
 b=AHljbLfMBDEw91E56vmY8eotd0PEVF2AlAUlIFFeLnwv5NXyHsY886aSEaRZpAO7JB
 2i6R3rAiZZs37ve6PIzh6P2fw89emajR3Kzg4HtTmWt6cI0qZ0zuFi9Ol5VAfGXKwQFy
 Fl6l1VPja4Z+ZZ7qA2wbRlMzcSvTHCljbGUUPn3syA4FVCGVrWz3AK14uHC0FzyJ3cze
 YRosjH3pKtxHo7ym+p+orukT5QbE0fFht2G1Fwl7CxY20vFFT668AgvZI4PyTn73RtoQ
 LtUuEglHGGFQiEibsf6zplNqKYJ7NIs9QeUxloWum1QReqUgXvckIDEbth6uNP/wOp18
 i26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/cKZ40D+5kZmbdOe1ppL4wX1eatJ/0My2HMWeYadk7Y=;
 b=jufgaXxeS7iy9rS/yAki2KXpd3V0G+MFrJzeU1DzVvBuwqhYXff+mCwDW2BGjo4fTq
 /83QqfQU9GYH6+E2ahFBt2f3uV18xwcIFE+uyrXzC5iZSXF7m5Po/iHr/OPdnCYD7vS5
 /XcABDjGDq1vzbfnz7wamMlHLZ3oF70rLJ12BbH4Rm5YupeBLCj12R4sCWJpLr/kHUOi
 mkDRQa82FAE3OLs2QTXRPwQd0pf4fX8U4Fcyt3oqy/k2xgN+LmV4/yOaRchZ4oRHqsBr
 EqD28tq0aoDOC5nyFkE9nwZMpGvX3oXeJFSD2+g8r2/jm0ZqFfdnhu7ld3mlLtdp5DGd
 t7qA==
X-Gm-Message-State: AOAM530cqwJTWwKm2sEgUbApxyOKPv4pV0T0jVWUOiX21Ebunh/Hw1I6
 Un8Ousr1RqbXat9YtSYKJFg=
X-Google-Smtp-Source: ABdhPJz1pSZSPKO5aKL3o7MtXBi3pJmxQ+zTdDqXwvS7YrNwuw/RGqJNGEzUn9Cp2OXmKq6k/TJSNg==
X-Received: by 2002:a5d:6349:: with SMTP id b9mr9081364wrw.341.1629276541421; 
 Wed, 18 Aug 2021 01:49:01 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l2sm5292289wrx.2.2021.08.18.01.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 01:49:00 -0700 (PDT)
Subject: Re: [PATCH v2 19/55] target/xtensa: Implement do_unaligned_access for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b68c1616-7216-ad2a-721f-c5d4a567868e@amsat.org>
Date: Wed, 18 Aug 2021 10:48:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 6:14 AM, Richard Henderson wrote:
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/cpu.c    |  2 +-
>  target/xtensa/helper.c | 30 +++++++++++++++---------------
>  2 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

