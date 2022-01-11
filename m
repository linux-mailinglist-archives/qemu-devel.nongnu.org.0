Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6187B48AD65
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:14:59 +0100 (CET)
Received: from localhost ([::1]:55170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7G3G-0007oS-GT
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Fvn-0001OD-4t
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:07:15 -0500
Received: from [2a00:1450:4864:20::329] (port=51894
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FvX-0003Lf-Df
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:07:09 -0500
Received: by mail-wm1-x329.google.com with SMTP id e5so10844814wmq.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Py8BnHEbaVvC5NmAxdRsQe++4h/F7y6gzHS/KqS7W0U=;
 b=QRt6cTf8UkxdJyOyk4T6tG9/1AanlET5We3uhSH34FpIMFJ1ikwAHEcBv8r812QIQ6
 Mdh2YJp5rMFD09eAhbG+c0EwkyBvto5kMriQZXLI+VgqWfZe0bwKLxkEFATE7DuLMKVW
 HTD5wbNukDCRQczUhoLSlX8hBq1VWYbnTBWBQUtj8gYVTpfr4GjtObULcr+iNK05lNZH
 Baj8nOXa2VtM1HVAmdO9niup+/9jQJWVDTF3Tn90nPpDetzs4xg/dPVYmuDReWIAk54H
 +4cuzQkS/II8+f2P1rXjhy8PonkYqrsjDjwL3izY/OcBEyCoN02O0wG9aG2Ib+DQHxYa
 qpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Py8BnHEbaVvC5NmAxdRsQe++4h/F7y6gzHS/KqS7W0U=;
 b=r2uh36zWHRCB9fJvp/5wkwx8fg3Q5381htY9IznOFYSQx2HyYxc3AdVtSZobFnaweu
 lqzOoWuJuQ7vgenz/FpiPipVCmBY9m2hb8sD9sYGGqxYw/nqi4D82ucmUx+Gpb0O3bzZ
 D1oShmvho8q7bFXDf0enVjD+9K4Yul86ITu5Itiyz95QNsgRuMlTa4cRA5qNI1PkOJyY
 ypOM2b6XnBpMX1F/bKaY8gcg8eUXt6oyGnbGtsMwDD7bhSSw0hT2uQrfhyP5epTuFrle
 czDGOJkYG4Xpi1G10JVJJAfvJ22Lxd2b16XCEb2VwnTWG5OHThZAst5Aw9aq9AWbvbUO
 Cy+w==
X-Gm-Message-State: AOAM531EtS1G3jPzDWX8llF3aP0Y1HLgrqYIr3E/xhRJ3pkwMnsZnvBB
 FDdgxvz2shoTfAuwQjaFy+cEgeGRazO6SYn95wFo3g==
X-Google-Smtp-Source: ABdhPJzxIvt5cj1lFcCEWVBAfig6/LGgl26MNgLNQL7mwU/KLAjuPXXb9/yrVIw/2W3Xy/L6r+NrzS4naGEZRHjhuco=
X-Received: by 2002:a05:600c:28c8:: with SMTP id
 h8mr1899787wmd.37.1641902800883; 
 Tue, 11 Jan 2022 04:06:40 -0800 (PST)
MIME-Version: 1.0
References: <20220108063313.477784-1-richard.henderson@linaro.org>
 <20220108063313.477784-8-richard.henderson@linaro.org>
In-Reply-To: <20220108063313.477784-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 12:06:29 +0000
Message-ID: <CAFEAcA8Td4wscbYb3Le3FuFSwrcOikfqjLX56PXy2n=G_ks1cQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] tcg/arm: Support raising sigbus for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 06:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> +static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
> +                                   TCGReg addrhi, unsigned a_bits)

> @@ -1709,6 +1778,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
>      add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
>                          s->code_ptr, label_ptr);
>  #else /* !CONFIG_SOFTMMU */
> +    a_bits = get_alignment_bits(opc);
> +    if (a_bits) {
> +        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
> +    }


> @@ -1821,6 +1896,10 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
>      add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
>                          s->code_ptr, label_ptr);
>  #else /* !CONFIG_SOFTMMU */
> +    a_bits = get_alignment_bits(opc);
> +    if (a_bits) {
> +        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
> +    }


We pass is_ld == true from both the _ld and the _st functions --
that doesn't look right.

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

