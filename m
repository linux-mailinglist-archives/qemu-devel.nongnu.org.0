Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC52633C885
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 22:35:41 +0100 (CET)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLusG-000677-Ss
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 17:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLuqp-0004kL-Lo
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:34:11 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLuqn-0000Xz-O9
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:34:11 -0400
Received: by mail-ej1-x62c.google.com with SMTP id e19so68854640ejt.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 14:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wW0TY5cNRlAXLeZu8LS2tVVAmkhSoYofq4U5TeLr6V8=;
 b=c1LA5No7hehQpuF9wnvEynOuUpD1ib47WFV60WlwauMki9JT26zo5PNf0Xcfo/gn9D
 Wes12BRA+h1HIm4dIlCzs9CmzVVI095+mconH1kyz48afb2lez5Y4bSb3FpLrnrzdH9l
 d/1f3mLmbGRb1qYE++4DrPQZ6ewWl6jz/+iQlbfibtMI/eJD0u5FfEokxxC5hySHoRx1
 hvqHu/9XkAbcyooQF/ugh8WAPABG+PaByGfEWIP897nTVwrM7NbndFEr6518P2+ACc/A
 vWq+Jzi0jK2TG6zeTghhBPSm8WqyUU3pa19KaabAx1jtKwy3lJ4MGl9Bp/Yvp0TKQS2v
 9jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wW0TY5cNRlAXLeZu8LS2tVVAmkhSoYofq4U5TeLr6V8=;
 b=LpN1giYyddra+7kt+eRJminekayWjJUMcXAgCHqNawWUcuy5mEbPv56eYP+4NtF/n0
 BJUMtNh4ow36zqCzVJV6F+CIyHgbJ4TF1Bq5IOlsjFWWn1ZEaaVuLrtcXT3aGh7FBJYy
 yZm7U4EJgrQQk+8IGieIJK9sWvc1w18442JygUJIJo16ikRGOojCLk9Wc8qhpOpw8CK9
 BnELF84NRyX9WuEJN9RKMsfkdQLtiRwEzv1k5bh3B0322DRSJi95kga+f3g4q/yXhPI6
 3hVqd3HZcJhpIx04O4JKNeZP65fxf1niZGYi2+IQvOJgZymVr9VnD4rYdXqSGFvQ+Hp1
 qe8g==
X-Gm-Message-State: AOAM530L8SqAgx+6u6WLcHOGNOjBnQNBIpr+G+vGwhvYa7R4Pg+JoEZZ
 U3fNuUTwTTInEjxFL/bqcDIl6Q4nvTzGrGylHkWv5A==
X-Google-Smtp-Source: ABdhPJxta+2Gc1fB6yA19p9CFsSYCU5nbKr73AHrLgHu8Qhgo2QKGtBq/y+3NOMhI9ORxnAyis95A37daVZCTLz7zxI=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr15831731ejc.407.1615844047720; 
 Mon, 15 Mar 2021 14:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210313194829.2193621-1-f4bug@amsat.org>
 <20210313194829.2193621-19-f4bug@amsat.org>
In-Reply-To: <20210313194829.2193621-19-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 21:33:45 +0000
Message-ID: <CAFEAcA-LtcZCUo1Vu2fVCJRqR99117ewFTZAePuYc-wrTGe2XA@mail.gmail.com>
Subject: Re: [PULL 18/27] target/mips: Extract MXU code to new mxu_translate.c
 file
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Mar 2021 at 19:58, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Extract 1600+ lines from the big translate.c into a new file.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

This code motion caused Coverity to rescan this code, and
it thinks there's a problem in this function (CID 1450831).
It looks to me like it might be right...


> +/*
> + *  D16MAX
> + *    Update XRa with the 16-bit-wise maximums of signed integers
> + *    contained in XRb and XRc.
> + *
> + *  D16MIN
> + *    Update XRa with the 16-bit-wise minimums of signed integers
> + *    contained in XRb and XRc.
> + */
> +static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
> +{
> +    uint32_t pad, opc, XRc, XRb, XRa;
> +
> +    pad =3D extract32(ctx->opcode, 21, 5);
> +    opc =3D extract32(ctx->opcode, 18, 3);
> +    XRc =3D extract32(ctx->opcode, 14, 4);
> +    XRb =3D extract32(ctx->opcode, 10, 4);
> +    XRa =3D extract32(ctx->opcode,  6, 4);
> +
> +    if (unlikely(pad !=3D 0)) {
> +        /* opcode padding incorrect -> do nothing */
> +    } else if (unlikely(XRc =3D=3D 0)) {
> +        /* destination is zero register -> do nothing */
> +    } else if (unlikely((XRb =3D=3D 0) && (XRa =3D=3D 0))) {
> +        /* both operands zero registers -> just set destination to zero =
*/
> +        tcg_gen_movi_i32(mxu_gpr[XRc - 1], 0);
> +    } else if (unlikely((XRb =3D=3D 0) || (XRa =3D=3D 0))) {

In this block of code either XRb or XRa is zero...

> +        /* exactly one operand is zero register - find which one is not.=
..*/
> +        uint32_t XRx =3D XRb ? XRb : XRc;
> +        /* ...and do half-word-wise max/min with one operand 0 */
> +        TCGv_i32 t0 =3D tcg_temp_new();
> +        TCGv_i32 t1 =3D tcg_const_i32(0);
> +
> +        /* the left half-word first */
> +        tcg_gen_andi_i32(t0, mxu_gpr[XRx - 1], 0xFFFF0000);
> +        if (opc =3D=3D OPC_MXU_D16MAX) {
> +            tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
> +        } else {
> +            tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
> +        }

but in these smax/smin calls we're clearly assuming that
XRa is not zero.

There seems to be some confusion over which registers are
the inputs and which is the output. The top-level function
comment says XRa is the input and XRb/XRc the inputs.
But the "destination is zero register" comment is against
a check on XRc, and the "both operands zero" comment is
against a check on XRa and XRb, as is the "one operand
is zero" comment...

> +/*
> + *  Q8MAX
> + *    Update XRa with the 8-bit-wise maximums of signed integers
> + *    contained in XRb and XRc.
> + *
> + *  Q8MIN
> + *    Update XRa with the 8-bit-wise minimums of signed integers
> + *    contained in XRb and XRc.
> + */
> +static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
> +{
> +    uint32_t pad, opc, XRc, XRb, XRa;
> +
> +    pad =3D extract32(ctx->opcode, 21, 5);
> +    opc =3D extract32(ctx->opcode, 18, 3);
> +    XRc =3D extract32(ctx->opcode, 14, 4);
> +    XRb =3D extract32(ctx->opcode, 10, 4);
> +    XRa =3D extract32(ctx->opcode,  6, 4);
> +
> +    if (unlikely(pad !=3D 0)) {
> +        /* opcode padding incorrect -> do nothing */
> +    } else if (unlikely(XRa =3D=3D 0)) {
> +        /* destination is zero register -> do nothing */
> +    } else if (unlikely((XRb =3D=3D 0) && (XRc =3D=3D 0))) {
> +        /* both operands zero registers -> just set destination to zero =
*/
> +        tcg_gen_movi_i32(mxu_gpr[XRa - 1], 0);
> +    } else if (unlikely((XRb =3D=3D 0) || (XRc =3D=3D 0))) {
> +        /* exactly one operand is zero register - make it be the first..=
.*/
> +        uint32_t XRx =3D XRb ? XRb : XRc;

Contrast this function, where the code and the comments are
all in agreement that XRa is destination and XRb/XRc inputs.

thanks
-- PMM

