Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D6030BD17
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:31:22 +0100 (CET)
Received: from localhost ([::1]:55286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ttx-0006sX-Lv
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tsO-0006Bi-II
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:29:44 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tsM-0006hK-U2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:29:44 -0500
Received: by mail-ed1-x536.google.com with SMTP id s5so9602881edw.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 03:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zALBmpnGgo0d/DDiUZKTAM0QqzlB5QbytAECdBFd0RQ=;
 b=tyeD8txQZtiDMk6lY0q9mMzIHAMQP0GTH41WWyItVXIkzjPmlKG26ZYrCWLjkRSJS+
 WBf3eg8hSKdEEJ0FAbPT5xTmhnyCpN18lhPjs9wpojzCroitW43rX3d6Ag3qlyPPTdHV
 BhpiUW1N+zZ3anEyU7EtqG2oy16/NJ1B3BGnzf5XXprtjCeC9JT5/dV7R8aBlMX8Qt4P
 vJ0XShlZrhF9X7G6q88bUTpiLJemDyKOKvrbMKMR5Cn0rRBVpZyS52Z7hNxhrXQBXf5j
 pYR0H9O/UhCIj8xMt1FNyEb6aq5CTQDG9cjCtbhXS6naBJbLGvXi7PaGCiaYAF7arZh/
 Sy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zALBmpnGgo0d/DDiUZKTAM0QqzlB5QbytAECdBFd0RQ=;
 b=DA9TqS4w3TLaD8sRowWHhnWyy9oM0eNQU+VFdPOcwYPIQhfdQfd14lmfO9RVGWS5aN
 gjbaJFIijPR1ej5tQpjYeM632bfNhg47bQLBgR3T+oqMToYO1XvHcWA9Qww/1PDjyZUI
 2FGSVQjX5YF5TqYvIc6G5to7V8V6B11SpOcBE6nhgtxJgc/9b8xCTgVuAFeCycMNanOJ
 TXe5seItDui6bpbzFxR19BuOD7xr70pG/uSYfLNZ35ntlY+qlJBCIyLyuO5nPwGHh7np
 0AgF5thQt2QL0mtvfxRlfz7UNY5mry42d3BakHdxJy6Fxmm0MvdjdHosB7pQ8B+bHPDN
 oiRA==
X-Gm-Message-State: AOAM533eav3hQy4BbuA6tj/C39mUu9I1wC9HuM2tDYel9F3mgRO38gX2
 lMCfsJP/T+930iYuxF1of3k87+dENmEGqr8T7SwloQ==
X-Google-Smtp-Source: ABdhPJyjZM4aFzH0q9v5g3/drSnmZO4253RheGqQ0avZ9Owh+e2UR2BXvY56tKWvEFUZyoCBeYZTPk74nqyVavjXvNs=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr15242663edc.146.1612265381036; 
 Tue, 02 Feb 2021 03:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
 <20210128143102.7834-2-michael.nawrocki@gtri.gatech.edu>
In-Reply-To: <20210128143102.7834-2-michael.nawrocki@gtri.gatech.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 11:29:29 +0000
Message-ID: <CAFEAcA9Wi+jSPEZa2Thft1Q899VW0YyHB8Cb+U86m+WbB-Ns=w@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: Add raw_writefn to SCR_EL3 register
To: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 14:31, Mike Nawrocki
<michael.nawrocki@gtri.gatech.edu> wrote:
>
> Fixes an issue in migration where the reset value of SCR and the value
> produced by scr_write via the writefn for SCR_EL3 mismatch.
>
> Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d2ead3fcbd..e3c4fe76cb 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5785,7 +5785,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>      { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
> -      .resetvalue = 0, .writefn = scr_write },
> +      .resetvalue = 0, .writefn = scr_write, .raw_writefn = raw_write },
>      { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> --

I think the problem here is not the lack of a raw_writefn,
but that we're not handling the RES1 bits [5:4] in SCR_EL3 correctly.
Specifically:

 * if the CPU is AArch64-only then the resetvalue for SCR_EL3 should
   not be 0, but 0x30 (but if the CPU has AArch32 at all then it should
   still be 0)
 * scr_write() should not be saying "force the FW and AW bits to 1 if
   written as an AArch64 register". It can, but is not obliged to,
   do this if the CPU is AArch64-only; it must not if the CPU has
   AArch32, even if the register is being accessed via its AArch64 form.

This is because RES1 has some complicated semantics for bits like
this which are "RES1 only in some architectural contexts" (this is all
defined in the Glossary entry in the v8A Arm ARM), which basically
means that if AArch32 is supported then the bit has to be reads-as-written
from the AArch64 side.

thanks
-- PMM

