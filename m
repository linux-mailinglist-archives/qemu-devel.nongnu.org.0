Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D36314218
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:44:08 +0100 (CET)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EKF-0006hm-AO
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Are-0003Oh-Vj
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:02:22 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Arc-0005dn-JZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:02:22 -0500
Received: by mail-ed1-x529.google.com with SMTP id s11so19610244edd.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HShvVCnvrLBanEQhpleZ8hyDOFhNWEucCQJAvEaS69w=;
 b=wvXvmIzBezZZOJMIc5de335R9h+sfRGqHeVP5jhl74Lf3gWWH6WS5JxUBG34w9Fckg
 0DnP0muIa+AbXezA2agqLL5OiOqWKf+s1pSuOhdfcn6EIju2OjRVDu3uqeUP5+Ny9QTU
 Mz79RAhJjXqSLzWNGoTF45oOFG1bVRCgBYRDtSnMqU7g5btwYP3mOOSQ8Ad0taHAxsJ7
 v2G1LTH28k5xKVZ2dJAXajjmyZ04cqRteJd0AorZyeCA7IoB95MWqPZ/bKQ/ksNLt73E
 FdxUM4XetDp0HSfLny9FGjh/klXknmkSX1nd9Qpy2kaF7gdbu7XQ4saWcZTEgAHb/xTP
 Y1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HShvVCnvrLBanEQhpleZ8hyDOFhNWEucCQJAvEaS69w=;
 b=DxXbdRGKTQVHGZcUuyw8MeAyYvrf6YuqIxp3gQpi8qLk0om9Fjk0WtpgdTItRTxvli
 qXxay292DJGtInV19+oc+9RLgiDPpPEufEddGmecmunQoqRaGsTKO2Dgpy5ErdVgL3z/
 U0amS13+m8J9+9pg9xjsoHniRwV9wiyyhigaYO9226waYDclqMjsIseT7kq81CkXk3Qy
 Uht6ZTm75rQsVotmSyCS4pDDeU8HDwKMy/fa9B34nl0BGOKI8/CWhVoE9XKQqveAvsXu
 o/2Rlj8erojDvF4XWQahI9Gwvh4A6NaSAdCOnuje4+ymdUjag7ct/YfKV2/iFRtkEKXD
 Q59Q==
X-Gm-Message-State: AOAM5305BzyvLlGn/5iCftmgoFuXHCk+oKXPABwih2hEdNd9Qx0uJch+
 7zAzLpcMfC4R0oOATjySKXrbTKo8EeV4DGqUadOfBA==
X-Google-Smtp-Source: ABdhPJxJaJIhrj0iLyeGc7AY4sbTGLO91kTEqmmasgsuaHPqVES/wTq3MJ+l3IVdKvaIgC15pjXWI10dHDapqVH9It4=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr17973835edn.251.1612807338967; 
 Mon, 08 Feb 2021 10:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-5-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 18:02:07 +0000
Message-ID: <CAFEAcA-rQ5BsNOQQa7S5EG3VprNqUw63=fSjMSTYfRUUkbFDQA@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] tcg/arm: Implement tcg_out_mov for vector types
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Mon, 8 Feb 2021 at 03:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 50 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 44 insertions(+), 6 deletions(-)
>
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index ca9a71ca64..20088ac61a 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -178,6 +178,7 @@ typedef enum {
>
>      INSN_VLD1      = 0xf4200000,  /* VLD1 (multiple single elements) */
>      INSN_VST1      = 0xf4000000,  /* VST1 (multiple single elements) */
> +    INSN_VMOV      = 0xf2200110,  /* VMOV (register) */

This is VORR, really, and given that you use it with 2 input operands:

> +        tcg_out_vreg3(s, INSN_VMOV, type - TCG_TYPE_V64, 0, ret, arg, arg);

I think you might as well call it INSN_VORR (perhaps with a comment
at point-of-use that VORR is the standard way to do a VMOV.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

