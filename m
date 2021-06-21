Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7643AEB5B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:33:04 +0200 (CEST)
Received: from localhost ([::1]:33064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKz1-0000YZ-J8
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKxc-0007df-9L
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:31:36 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKxY-00047N-VX
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:31:35 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h2so5736989edt.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QCrJC8uyXOF8ThFri7HbMeahpSfQ2yXa2GNJrbHZbQw=;
 b=muzbApO01EOoKoNZm116sQdeGqzaDcjq8SxLjva0sZ9oX0dzjcVDOuvnAk16hZdcs6
 Vq/WPb4rAFlxWgbD4ofmhpN4IoOugxMduaS5dnFlZZw4Tdi/bHfXI8dOv7+3QHhK0rQN
 hjjRZX5oD7KYVxmqnqhfE0Tfrc5wFWOKgmWi1iBc/NIXaQa0S6L7KOK1kcjov18Yw7Dr
 38DF2U7kFRroV0/0dH0FTCbRoU/FA40fu3g0sgT9zIqkHJwsoRUOWnQR3aFpnuZ3imwN
 On9X1u7NX993WUoeJANr/Jp/O6vIk1ZHrln+9v3qUUXD31DhAQQ9OcSZaK6XN+Tc4ZtH
 VvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QCrJC8uyXOF8ThFri7HbMeahpSfQ2yXa2GNJrbHZbQw=;
 b=GLTNBoNDpukE6Ro2N8eScaLRXGQc7l0i1zdR8Jwx3uz5EBzohESRtONSzaVQKjB0rd
 gSyjqtvhtPWUMYZp0ucVZLIasYIq/4WJqjffCNs6rtDW6MryUuEwf8V7YLlqolbGI48U
 PhLhcvcfiahxcikDgQRABtK51lDLCAs+vZIp2s8WFLGUcbd/1JfrHA9ar6RiV773ejc9
 8QoA9zQ231WE76PfZJDA1DrAtJhKbBZc7Rg/qBbHOuGcqVKtE2R5wAw1/dGSTFgNozMk
 sZWHPJU+FwAuIwxVVT1guyYU1rdz2wGaiXHVBezR5KloO6UKige5xk27P8aZ2ixxWp6u
 MZiA==
X-Gm-Message-State: AOAM533W3zS48FGMbI2HRBPiU4pgx9TAINNoe+qA+MUeKOXKMm5kG2EP
 4XZ+l01qX1ogm9HvvexzW517eckzOKNnfCRZu7j41A==
X-Google-Smtp-Source: ABdhPJwVmdkc5/698xZL7SijjD2jv2eNpDkY1a1JVKE/1k/9TvtVgvvyFeGSEt8uhsCVu/atnj6r6oXY3l/BX/xMQkQ=
X-Received: by 2002:aa7:da14:: with SMTP id r20mr20727176eds.36.1624285891542; 
 Mon, 21 Jun 2021 07:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-9-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 15:30:55 +0100
Message-ID: <CAFEAcA9zAv55kq-knPJ1bF=vxwcvdfvZ2EZy+w7rK-_Acm=mBg@mail.gmail.com>
Subject: Re: [PATCH 08/28] tcg/ppc: Split out tcg_out_bswap32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Mon, 14 Jun 2021 at 09:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 64c24382a8..f0e42e4b88 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -798,6 +798,17 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
>      tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
>  }
>
> +static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
> +{
> +    TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
> +
> +    /* Stolen from gcc's builtin_bswap32.             src = abcd */
> +    tcg_out_rlw(s, RLWINM, tmp, src, 8, 0, 31);    /* tmp = bcda */
> +    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 0, 7);    /* tmp = dcda */
> +    tcg_out_rlw(s, RLWIMI, tmp, src, 24, 16, 23);  /* tmp = dcba */
> +    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
> +}
> +
>  /* Emit a move into ret of arg, if it can be done in one insn.  */
>  static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
>  {
> @@ -2791,24 +2802,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>      case INDEX_op_bswap16_i64:
>          tcg_out_bswap16(s, args[0], args[1]);
>          break;
> -
>      case INDEX_op_bswap32_i32:
>      case INDEX_op_bswap32_i64:
> -        /* Stolen from gcc's builtin_bswap32 */
> -        a1 = args[1];
> -        a0 = args[0] == a1 ? TCG_REG_R0 : args[0];
> -
> -        /* a1 = args[1] # abcd */
> -        /* a0 = rotate_left (a1, 8) # bcda */
> -        tcg_out_rlw(s, RLWINM, a0, a1, 8, 0, 31);
> -        /* a0 = (a0 & ~0xff000000) | ((a1 r<< 24) & 0xff000000) # dcda */
> -        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 0, 7);
> -        /* a0 = (a0 & ~0x0000ff00) | ((a1 r<< 24) & 0x0000ff00) # dcba */
> -        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 16, 23);
> -
> -        if (a0 == TCG_REG_R0) {
> -            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
> -        }
> +        tcg_out_bswap32(s, args[0], args[1]);
>          break;
>

Same remark about keeping the comments; otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

