Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600892F2E94
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:02:56 +0100 (CET)
Received: from localhost ([::1]:59394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzINz-0007ZR-DO
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzIJH-0004Ol-I5
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:58:03 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzIJC-00031L-WC
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:58:01 -0500
Received: by mail-ed1-x52a.google.com with SMTP id g24so1974678edw.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VMMw09GdGZoCxxvVBLTcEqEk/ba+EdXnfJmz5lC2Sxg=;
 b=DcwctnUMsv699E0WOu4qAqEZVhsQD3dptDpSMTgdSBRzh6lfAWY4prZSGaXZhuZDo1
 XaLAPf8XLcDmelv4e4kljrTterh7gCelX9QI8VMLaW3LOIBruvMKawW6BPWw53uj7ueG
 6UJaXBcCNDPSYc+jWwKPredIHyDz4YLjBs0+lbncB4PSx1LZCO3MGSsLt8js9rlrN3bb
 tkMrWvm6QdJfQOV7FZH+lBtkNzCfqOHPeYa0UhCd8V3XeXHyUuw6LKYw6HBoYqvbgznY
 uxIWXAwEUQ5a2qnKFJaOHiJ6uoywlRy16aKvY+ERWymCTICwTEHvsnxgqrKCbIOdGkL2
 9zEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VMMw09GdGZoCxxvVBLTcEqEk/ba+EdXnfJmz5lC2Sxg=;
 b=X1MWg6yyIsjxoqlWY9wgGP8m0C6DqUvXDpQXO10ZLgiuO3tVEHCrzFV3Mukb+Wzu5t
 5OmaVd1DCMalVYQjq06GbNrtqDFClC+qohywI7reKdrlKUUCsGx5h91+ig6/+VAggNCj
 sBuG0qb+rVg/Pos5yDRHL777vJtoTvp1k/qYHDvp22AW5xFVjZ8IhU5pFZ/mUdB/0Ipq
 V0jE/uKVD4zgFQtCt6elFiOcmMxtol49XG9Szcsc4DKIgrfcZmWEmMRtLLXWQ5RQTcGX
 XeETErpErvexFWUp7LsNr1zISWBn1BKMMKCl9wUBa8KM+HMZsE+p7VS3J5DHCSInHjWo
 hbOg==
X-Gm-Message-State: AOAM5304sQ6F1pNX6Ctkrg3iRYl1t7XqiZjbADM3qerNj3mxfUaLTWme
 wXxEgSSQ0Ybwl3SW8vB+WbtWPzaimoZ0G0MbTlCPqgviINE=
X-Google-Smtp-Source: ABdhPJxj5sb5nr9Y4oVN8uyN/SepEOcCsf5lPRno4VyCGqJ7oivnUO+R3CBNEwWV5mmoVkY5j6JQ9foezOrE+LZUB+Y=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr3060757edw.52.1610452676329;
 Tue, 12 Jan 2021 03:57:56 -0800 (PST)
MIME-Version: 1.0
References: <20201223060204.576856-1-richard.henderson@linaro.org>
 <20201223060204.576856-4-richard.henderson@linaro.org>
In-Reply-To: <20201223060204.576856-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 11:57:45 +0000
Message-ID: <CAFEAcA9WvBRWwcZOD0sTLn=aUM+vVcio6pz5nLDZY9tEePttNg@mail.gmail.com>
Subject: Re: [PATCH 03/22] tcg: Split out target constraints to
 tcg-target-constr.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Dec 2020 at 06:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This eliminates the target-specific function target_parse_constraint
> and folds it into the single caller, process_op_defs.  Since this is
> done directly into the switch statement, duplicates are compilation
> errors rather than silently ignored at runtime.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target-constr.h | 26 ++++++++++++++
>  tcg/i386/tcg-target.h        |  1 +
>  tcg/tcg.c                    | 33 ++++++++++++++---
>  tcg/i386/tcg-target.c.inc    | 70 ++----------------------------------
>  4 files changed, 58 insertions(+), 72 deletions(-)
>  create mode 100644 tcg/i386/tcg-target-constr.h
>
> diff --git a/tcg/i386/tcg-target-constr.h b/tcg/i386/tcg-target-constr.h
> new file mode 100644
> index 0000000000..e4a4886b6c
> --- /dev/null
> +++ b/tcg/i386/tcg-target-constr.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * i386 target-specific operand constaints.

"constraints"

> + * Copyright (c) 2020 Linaro
> + */
> +
> +REGS('a', 1u << TCG_REG_EAX)
> +REGS('b', 1u << TCG_REG_EBX)
> +REGS('c', 1u << TCG_REG_ECX)
> +REGS('d', 1u << TCG_REG_EDX)
> +REGS('S', 1u << TCG_REG_ESI)
> +REGS('D', 1u << TCG_REG_EDI)
> +
> +REGS('r', ALL_GENERAL_REGS)
> +REGS('x', ALL_VECTOR_REGS)
> +/* A register that can be used as a byte operand.  */
> +REGS('q', ALL_BYTEL_REGS)
> +/* A register with an addressable second byte (e.g. %ah).  */
> +REGS('Q', ALL_BYTEH_REGS)
> +/* qemu_ld/st address constraint */
> +REGS('L', ALL_GENERAL_REGS & ~((1 << TCG_REG_L0) | (1 << TCG_REG_L1)))
> +
> +CONST('e', TCG_CT_CONST_S32)
> +CONST('I', TCG_CT_CONST_I32)
> +CONST('W', TCG_CT_CONST_WSZ)
> +CONST('Z', TCG_CT_CONST_U32)

This is a little bit less obscure than the conset.h macros,
but it would still be nice to have some documentation of
what's actually going on here.

thanks
-- PMM

