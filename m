Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADFA6FB0AB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:54:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0Mp-0007Sp-Pd; Mon, 08 May 2023 08:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0Ml-0007SZ-63
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:53:25 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw0Mj-00049P-6g
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:53:22 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-192a0aab7dfso3561730fac.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683550399; x=1686142399;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kudm4YrMUpiVHOcmk9iOvxPnD07hAqhHoOtHrrjTB8g=;
 b=nFrcDDiwCUeqE7rxHKVhoVkdGXwon4Qve8sdFLlrzvgAsp6pOBVGIfO7aH32OfSojm
 I3vd/VCQwl79vmapyT2RiQmQDxFzm6RkWHzinWH9UdOXUsRScMnmMm6lfG4WMtzRNaK0
 TWm14NaaHnxzRQ1L04V/7teqoz8+y3WMMaGD3xuWz1usdVN8qE9uWasGPHat70CZyTYF
 QdDCZt/iGoR+F4O89e8MbGRcPd+6Pt7TIgWS0z8GAMqPjyIXXaWTiZv/kbcaQ2Zr7I3o
 7RrRrqBhQe/uDpxhO9W4H41wB7063Uimnl7qYezsloAOpeLgKq5HB0wTHsYcUGwjvVWQ
 1tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683550399; x=1686142399;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kudm4YrMUpiVHOcmk9iOvxPnD07hAqhHoOtHrrjTB8g=;
 b=D8Z1xiCX9Keq1Z5dr85s/wqnQhCgXHDzoYWODE67puEtSJkW4VJoHsvB57tTuP69Pj
 X/FBCdqQhESMErGhNx/hgAkkxjcF5hpP+g6/JX8tDPYeBA8o35LOcKBPPT75q/tS4DGm
 xlDn9u25Dp/+GhjMJvYh/WGrKMhPYVzaegtWd/OrtGt1TLCUtnwL84P1KCCY74Ah47/+
 4qlssHPJgSFQh0B8EF+0AyDpu28geu/d0b8q2lTtsEu4ffGbRgDYMvAlX6xPhmmJeNEl
 lhkVoP/Ft9VzvQPLxTYBYne/92I5yK1VtNGGd5TAT0ZyxX1QMhhZRqjvrVBZ0Q7a4oVt
 iF8Q==
X-Gm-Message-State: AC+VfDwRqoc0XyPVkP6bAPHxsS91JNvFeIiQnusNH3ZVubEx4xP3Ef4q
 EYPlNxafCw/Uh/tYl5IPAlB37A==
X-Google-Smtp-Source: ACHHUZ6mtES1/58wQBGsfjCtN9g03Vzq+k+6UfDZbjop6HFnOTI06ZWjvQWicTeE75SerZkJXzKUYA==
X-Received: by 2002:a05:6870:8704:b0:192:5d3c:25fe with SMTP id
 k4-20020a056870870400b001925d3c25femr5181907oam.29.1683550399676; 
 Mon, 08 May 2023 05:53:19 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 s3-20020a05687087c300b0017243edbe5bsm4883456oam.58.2023.05.08.05.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:53:19 -0700 (PDT)
Message-ID: <90c12a52-a2f9-1c13-1aa2-d6362820cb2a@ventanamicro.com>
Date: Mon, 8 May 2023 09:53:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/11] tcg/riscv: Support for Zba, Zbb, Zicond extensions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 5/3/23 05:56, Richard Henderson wrote:
> Based-on: 20230503070656.1746170-1-richard.henderson@linaro.org
> ("[PATCH v4 00/57] tcg: Improve atomicity support")
> 
> I've been vaguely following the __hw_probe syscall progress
> in the upstream kernel.  The initial version only handled
> bog standard F+D and C extensions, which everything expects
> to be present anyway, which was disappointing.  But at least
> the basis is there for proper extensions.
> 
> In the meantime, probe via sigill.  Tested with qemu-on-qemu.
> I understand the Ventana core has all of these, if you'd be
> so kind as to test.

I'll run this series with upstream kernel on a real HW as soon as able.
(hopefully this month).

I think this is good to go regardless of HW testing though.


Daniel

> 
> 
> r~
> 
> 
> Richard Henderson (11):
>    disas/riscv: Decode czero.{eqz,nez}
>    tcg/riscv: Probe for Zba, Zbb, Zicond extensions
>    tcg/riscv: Support ANDN, ORN, XNOR from Zbb
>    tcg/riscv: Support ADD.UW, SEXT.B, SEXT.H, ZEXT.H from Zba+Zbb
>    tcg/riscv: Use ADD.UW for guest address generation
>    tcg/riscv: Support rotates from Zbb
>    tcg/riscv: Support REV8 from Zbb
>    tcg/riscv: Support CPOP from Zbb
>    tcg/riscv: Improve setcond expansion
>    tcg/riscv: Implement movcond
>    tcg/riscv: Support CTZ, CLZ from Zbb
> 
>   tcg/riscv/tcg-target-con-set.h |   3 +
>   tcg/riscv/tcg-target-con-str.h |   1 +
>   tcg/riscv/tcg-target.h         |  48 +--
>   disas/riscv.c                  |   8 +-
>   tcg/riscv/tcg-target.c.inc     | 612 +++++++++++++++++++++++++++++----
>   5 files changed, 587 insertions(+), 85 deletions(-)
> 

