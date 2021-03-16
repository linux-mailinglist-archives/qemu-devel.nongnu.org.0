Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915E333D231
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:54:23 +0100 (CET)
Received: from localhost ([::1]:60374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7LB-0006eD-Qw
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM7IZ-0005iY-4m
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:51:39 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lM7IS-0002Xe-O9
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:51:38 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ci14so71170289ejc.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bk8sReOIYXQF1YtjKG4O+sTcWXGOp12b/abr/eAoF4Y=;
 b=suFzCwTN24kPiCUo7VH3fwux2LvSLcmB1y5UU3Qqzw+LHO1hMZpzNpo/z5L6QR7OuA
 j+qM9XxvuFmyNtXE/bQVFdEAY6zF4nVZrO1Ap1B2mpIUf+84sn5uiP8Wjwv9lcogibB/
 +TakwSLiso70Gd8DwPYO5SU+YicTjEcM99APrieEN/swAm2kBaVToz3Q/0G1AnEVTfHt
 OaTwOZ9cFGE+jgCfU49uAze2Srix/K3EWZNANbturxWI+saMu8h/vCeq9Z3WEYMxoN+H
 98plnA4CG2Z/gzkHPRNY80bNPjh/oEe7VRSbGazb6GIii4UZMaJeF8Ir4WWAzb6bcOzU
 DXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bk8sReOIYXQF1YtjKG4O+sTcWXGOp12b/abr/eAoF4Y=;
 b=WcH2gLyi0Uaz3FHA9uvhyyHzx0Fra26y2wuPFZlgADZrKr5GkCNDftlVRfVNFuBEsQ
 2AZVuwpmBfD/Ic890d3kOv+E2bC1HdVr/YAvruXQu3RA/JSBcE25ktG/b0v5QA8nl4Pu
 0JqkpW6WIHjnY+szyMGpxEpha+6OUP+gfrmVQAupuHX1CzxSphIUcAMrBqPo0EYvI0Tb
 qUfO+/UAyWLyIoefGBh3KEbSSJ1AHJ4J36qTHeoHLA9daDgY8sd2gHQMY5zW5FQJE0uG
 d6Xdm81X6qAQbh1XyimKgsCDE0H9lcHjO36vsJVpVJvHUVhuzXeq2EAIWGoZl34GM/sG
 N9ng==
X-Gm-Message-State: AOAM533Gy7Ae2XY2eEtZ+a3i4QQZteXyeJd9n3Ro6ElHPdHedbpTudRP
 rhLm4PW9c0dwD4mIs+w907dPXn8OUk7auZwA9PJuOA==
X-Google-Smtp-Source: ABdhPJyKcoUFPI1XBP14aPU9uMhnmmvSMxuywvpd4FoPFPRer01HlxwBpvAZSB+idsdKlXK+3NiDnn30TsJiPWtPDfc=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr28326952ejz.382.1615891891182; 
 Tue, 16 Mar 2021 03:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210315223745.2953548-1-f4bug@amsat.org>
In-Reply-To: <20210315223745.2953548-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Mar 2021 10:51:08 +0000
Message-ID: <CAFEAcA-+m-eADtYini-2Mscom-RiuvzG4cXndMcuSKR80O8dow@mail.gmail.com>
Subject: Re: [PATCH] target/mips/mxu: Rewrite D16MIN / D16MAX opcodes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Craig Janeczek <jancraig@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 22:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Coverity reported (CID 1450831) an array overrun in
> gen_mxu_D16MAX_D16MIN():
>
>   1103     } else if (unlikely((XRb =3D=3D 0) || (XRa =3D=3D 0))) {
>   ....
>   1112         if (opc =3D=3D OPC_MXU_D16MAX) {
>   1113             tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
>   1114         } else {
>   1115             tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
>   1116         }
>
> >>> Overrunning array "mxu_gpr" of 15 8-byte elements at element
>     index 4294967295 (byte offset 34359738367) using index "XRa - 1U"
>     (which evaluates to 4294967295).
>
> Because we check if 'XRa =3D=3D 0' then access 'XRa - 1' in array.
>
> I figured it could be easier to rewrite this function to something
> simpler rather than trying to understand it.

This seems to drop half of the optimised cases the old
code had. Wouldn't it be simpler just to fix the bugs
in the conditions?

That is:

>      if (unlikely(pad !=3D 0)) {
>          /* opcode padding incorrect -> do nothing */
> -    } else if (unlikely(XRc =3D=3D 0)) {
> -        /* destination is zero register -> do nothing */

This should be "XRa =3D=3D 0"

> -    } else if (unlikely((XRb =3D=3D 0) && (XRa =3D=3D 0))) {
> -        /* both operands zero registers -> just set destination to zero =
*/

This should be "XRb =3D=3D 0 && XRc =3D=3D 0"

> -        tcg_gen_movi_i32(mxu_gpr[XRc - 1], 0);

This should set mxu_gpr[XRa - 1]

> -    } else if (unlikely((XRb =3D=3D 0) || (XRa =3D=3D 0))) {

This should be "XRb =3D=3D 0 || XRc =3D=3D 0"

And everything else in the function looks OK to me.

thanks
-- PMM

