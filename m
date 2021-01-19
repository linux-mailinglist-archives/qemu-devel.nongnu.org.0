Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669732FC35F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 23:27:02 +0100 (CET)
Received: from localhost ([::1]:38470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1zSn-0003AO-GD
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 17:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1zRH-0002bn-Ji
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:25:29 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1zRG-0006c6-5p
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:25:27 -0500
Received: by mail-ed1-x531.google.com with SMTP id u19so23477807edx.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 14:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W1z5N4vLrsfzMUqkxSLfFaEcPSt5MDo4GMUxJLVNqOs=;
 b=i/n1hjfN3hgmoKJv49/C47xViz4BuJHGgDprfoZdt0hn3BT9MxqL205qPZimxHjOzn
 xEUWJrhuDdcqTJboPAPMmbhmTJC5Mm8GPwyIr0q1WFjKFqT9oyIZk0vl+BSwGUUqA8pt
 3qoJFGv6k1pS7SgEGZiIGUNF69kYOdvzBM8S3hU9jJ6dN5WoX6RB1gRSmdHmcKnFghBh
 mgiPr2Ors0WF24McwqAm3FFAUPCp4D37eKMZ0CTEecplNbDSq8Ih9w2c6erHSk6qWnyP
 EM76MjXAcqoQkqWoY/818wHEF9f4DRGIPqR33DZmIvjoUg0nmgwtSGwBntpwqWIA7HZp
 QxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W1z5N4vLrsfzMUqkxSLfFaEcPSt5MDo4GMUxJLVNqOs=;
 b=TKBkMYB0Fqo4L77JfQpiSR/aUtu09O+fJeLNe917ZcFwFEweyM5XCsiz9ywIqlc89k
 17FbWqO/V6+5LiwQKNiGX8HtwtYx0eYiqGur3IDggnYRFpcV4DVhZEXZENp5BMxvRklp
 ARkMMj2mmf7YjiM5d2Xn2SG4+saXad926+kkRmtDmlCJ5TUo8suPZ7msW0GtVQYozigu
 k2DQQJ+35UtMQ+GKwhVe23qwzBVI/KlZPlllPGjjnhZ56zqwvq/VgisZQGB2w62HlgYr
 8nCsNXn9UwSNFm2KQViPFUMlIOBgbbAMXUskdLdV9lMdeZ3j9gAOotrr8LtiRDa30qhq
 KDtw==
X-Gm-Message-State: AOAM5311Ohx0sZZp1rTtCDFLqxew/JD69GR7/MZHPzRMqRUny/uDSrCu
 FF1FrOfT8A6nvN8OplfXcmXpB2xdiEk=
X-Google-Smtp-Source: ABdhPJwoK6iXSX14+zfT2gc4l2ev5AGfTftHHSkpPoWZEE+aHtOulU8Iii6JRUiVZAtAqDl9zKIW3w==
X-Received: by 2002:a05:6402:46:: with SMTP id
 f6mr5069216edu.163.1611095124553; 
 Tue, 19 Jan 2021 14:25:24 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id bc6sm92361edb.52.2021.01.19.14.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 14:25:23 -0800 (PST)
Subject: Re: [PATCH v2 08/22] tcg/mips: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <53f4ba73-cab9-08e5-4137-0bd231d80ece@amsat.org>
Date: Tue, 19 Jan 2021 23:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115210456.1053477-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 10:04 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target-con-str.h | 24 ++++++++++++
>  tcg/mips/tcg-target.h         |  1 +
>  tcg/mips/tcg-target.c.inc     | 72 ++++++++---------------------------
>  3 files changed, 41 insertions(+), 56 deletions(-)
>  create mode 100644 tcg/mips/tcg-target-con-str.h
> 
> diff --git a/tcg/mips/tcg-target-con-str.h b/tcg/mips/tcg-target-con-str.h
> new file mode 100644
> index 0000000000..e4b2965c72
> --- /dev/null
> +++ b/tcg/mips/tcg-target-con-str.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Define MIPS target-specific operand constraints.
> + * Copyright (c) 2021 Linaro
> + */
> +
> +/*
> + * Define constraint letters for register sets:
> + * REGS(letter, register_mask)
> + */
> +REGS('r', ALL_GENERAL_REGS)
> +REGS('L', ALL_QLOAD_REGS)
> +REGS('S', ALL_QSTORE_REGS)
> +
> +/*
> + * Define constraint letters for constants:
> + * CONST(letter, TCG_CT_CONST_* bit set)
> + */
> +CONST('I', TCG_CT_CONST_U16)
> +CONST('J', TCG_CT_CONST_S16)
> +CONST('K', TCG_CT_CONST_P2M1)
> +CONST('N', TCG_CT_CONST_N16)
> +CONST('W', TCG_CT_CONST_WSZ)
> +CONST('Z', TCG_CT_CONST_ZERO)

With the cheating comment Peter requested:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


