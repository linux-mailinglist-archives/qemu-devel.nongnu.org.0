Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D75C6F840D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:29:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvTz-0000eD-KA; Fri, 05 May 2023 09:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvTv-0000dG-Je
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:28:20 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvTp-0001Sk-Px
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:28:19 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so26987770a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683293288; x=1685885288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G1dhCNyDbz/C/k2Zw97YFzuMEVZFBNEZLBtUVP0klfs=;
 b=iTaNlcCZmH66puyNQtP7ho9mqjb5qc0/l+qmppyEuY/Lf35YGwMHFubNi/mZAJOFlt
 OHV9wmux/Oawc6FvxNVILNGN/ScOlqE9fi+xv/11/v0IT4afb23icq3xLantJERuaqI4
 CXVpAzuT80A7URBobIwreaPrvFiQQz0hoTmwTaFbfhsgPS9UdmUsQbR2SxMzWi644w/+
 vEiEXJCmXXIiJhcaPm3R8f+o6l+//MOyZbiUggieLfMsFNr7BXF7Dk6L/8iuWRqgEW0x
 iulIvjrRWw5nLhAaVhT598tEQbE+DHol+YqO+uYjgXPT9ZOS2vEItMJUji2bom9TOLuV
 eKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683293288; x=1685885288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G1dhCNyDbz/C/k2Zw97YFzuMEVZFBNEZLBtUVP0klfs=;
 b=YW/y5HOMW78XzvxS/4d9xFXy3WgqYNieSRWxasuJgIUh62STHtusR/S6Sef6oHYUpm
 pINlQz2u2lhETMjBNGfLLyyrmXbp9ldJQ61064SBVMmLMLa8Yy+YWPWOfvAEVlTAnyhD
 JPvLvCzM47zBEj7P9g5Z+xVqc8nhhaO9g4EkR7hCgrxqktl/fRDo8Q5h7vhTYVDXTpNe
 oqLzvRK8h8IBqxS48sgAME/bwONOW3o9A2yzdSl5UN5puIyQRLSXq+OlJVlR4wl+i97k
 JPOb+i5/wgHUytv8z2Yp2EOfhrSyg3dDFKUYhqn3zHVfL4wYoM95N+oi7a3tuln8IJ+q
 KVOg==
X-Gm-Message-State: AC+VfDyWm+7OFVBEKFSuGxedGd1kgVkH5dtes8RNmrK/cseFdX31T21+
 cUyVHEbK2lcGORCtO3IkaxgKe0bBFy5aq7wsAthODQ==
X-Google-Smtp-Source: ACHHUZ6Aqy7IQvmH4bSOZGhpcER003QFtFhULrY+2n08ICeGUjAiIF8n5otrWruQm0VdOreVX/6xWQPhXZCmMCe+q6g=
X-Received: by 2002:a05:6402:2794:b0:508:3c23:ae95 with SMTP id
 b20-20020a056402279400b005083c23ae95mr2135595ede.3.1683293288053; Fri, 05 May
 2023 06:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-53-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-53-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:27:57 +0100
Message-ID: <CAFEAcA8XQ2_GFyBCqW4N7p32dvkWe6B21bpHhOf48xHyc_petw@mail.gmail.com>
Subject: Re: [PATCH v4 52/57] tcg/i386: Honor 64-bit atomicity in 32-bit mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 3 May 2023 at 08:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the fpu to perform 64-bit loads and stores.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -2091,7 +2095,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
>              datalo = datahi;
>              datahi = t;
>          }
> -        if (h.base == datalo || h.index == datalo) {
> +        if (h.atom == MO_64) {
> +            /*
> +             * Atomicity requires that we use use a single 8-byte load.
> +             * For simplicity and code size, always use the FPU for this.
> +             * Similar insns using SSE/AVX are merely larger.

I'm surprised there's no performance penalty for throwing old-school
FPU insns into what is presumably otherwise code that's only
using modern SSE.

> +             * Load from memory in one go, then store back to the stack,
> +             * from whence we can load into the correct integer regs.
> +             */
> +            tcg_out_modrm_sib_offset(s, OPC_ESCDF + h.seg, ESCDF_FILD_m64,
> +                                     h.base, h.index, 0, h.ofs);
> +            tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FISTP_m64, TCG_REG_ESP, 0);
> +            tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
> +            tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
> +        } else if (h.base == datalo || h.index == datalo) {
>              tcg_out_modrm_sib_offset(s, OPC_LEA, datahi,
>                                       h.base, h.index, 0, h.ofs);
>              tcg_out_modrm_offset(s, movop + h.seg, datalo, datahi, 0);

I assume the caller has arranged that the top of the stack
is trashable at this point?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

