Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579FD362549
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:13:38 +0200 (CEST)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXR68-0000tY-Tv
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXQzj-0002Tp-Oe
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:06:59 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXQzh-0007an-9p
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:06:59 -0400
Received: by mail-ej1-x634.google.com with SMTP id l4so42861112ejc.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 09:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zoxxo4HldSkZ1gqc5kBkjBHOS87a3eWa93bTMsHIzUQ=;
 b=yifA/OMmcEzdBZt/LMxb1W+foc2mE4Vh9rzla0deE3gQ5T2LCfb/SBYZcnb+YDot7P
 p+mQGROEbNMTYa8r1FirmKI6WzUhkqhK5hEPH6Eb8KSDhH2UjfFDrj7LsVMoJZ1EA9Qs
 lyjIhnm+NIImmWQRvmw0MjbmipXUf9zxAPkL/hYhB3Kh4o9cT/XE7cYB2FdUpPCFbiId
 tAHtWoZYd4tblqCWmdeK3J6BBg7/TEN1qufO+0VOLbMMbWakto0J5cruTFwmv44oklP1
 5k358cwOFUCdBccx1gXbNr0INHxo894QfyXzzqhU6prbf0rS23wqd2G4nerFJBNZ3F/R
 XyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zoxxo4HldSkZ1gqc5kBkjBHOS87a3eWa93bTMsHIzUQ=;
 b=uMwTQwG7E2Ebw+yxVhYYnla2NHacsUoV1rA0RMrFDbcwtYKJm8gzMmHordCTrdCisp
 ILgbcx+i5x6XGoIrcmHiNFjagNL4tsFmFnj4Ezu4esKJAtoTEXogq2aTp1FgFolRh9iM
 lI9IyopFukNi0t4WXHQbW/R0QA1B4EULXZqlIv8wemBbUbFkF2NOrhvroId2o5FVXo8Y
 LfWT4LqF2n7ysWzHS4rOnAULL22ylMOxaUiS6Xfy0OMLssVpBe/WnjfvnUfh9JkkZYuO
 kGpW/iT8MNSmhKW07jrtPj+Ssr4hRpAjTqb7auFf4J5L5DVi/fHWsy8mZZOo0xVxkN60
 f4IA==
X-Gm-Message-State: AOAM530sCoawT9fR5dGRwpcM/J63kE+/6B3DN1PFFtRVvtkK18aC/3VP
 WZNuUSvNrkS6NsWcvQ1IWJdVup6ThSMlgkd2B0SvXg==
X-Google-Smtp-Source: ABdhPJwM2ias87249zz9diZ1jelihuM3AL1UkkBjIGsz0UTnljHe/ohRsAbgI6wKqivqxI65zjBnI338PWsXTxv3btk=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr8995333ejc.407.1618589214863; 
 Fri, 16 Apr 2021 09:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210416154908.21673-1-alex.bennee@linaro.org>
In-Reply-To: <20210416154908.21673-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Apr 2021 17:06:06 +0100
Message-ID: <CAFEAcA-kO0Zs8eDQHheJyf2Top9GWYTW66XUw_aknx2DSYtf4g@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: drop CF_LAST_IO/dc->condjump check
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 16:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is a left over erroneous check from the days front-ends handled
> io start/end themselves. Regardless just because IO could be performed
> on the last instruction doesn't obligate the front end to do so.
>
> This fixes an abort faced by the aspeed execute-in-place support which
> will necessarily trigger this state (even before the one-shot
> CF_LAST_IO fix). The test still seems to hang once it attempts to boot
> the Linux kernel but I suspect this is an unrelated issue with icount
> and the timer handling code.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>

Here's some expanded text explaining why this is safe to remove,
which I think would be useful to include in the commit message:

=3D=3D=3D=3Dbegin=3D=3D=3D
The original intention of the cpu_abort (added in commit 2e70f6efa8b9
when the icount stuff was first added) seems to have been to act as
an assert() to catch an unhandled corner case where the generated code
would be something like:
    conditional branch to condlabel if its cc failed
    implementation of the insn (a conditional branch or trap)
    code emitted by gen_io_end()
 condlabel:
    gen_goto_tb or equivalent thing to go to next insn

At runtime the cc-failed case would skip over the code emitted by
gen_io_end(), leaving the can_do_io flag incorrectly set.

In commit ba3e7926691ed33 we switched to an implementation which
always clears can_do_io at the start of the following TB instead
of trying to clear it at the end of a TB that did IO. So the corner
case that this cpu_abort() was trying to flag is no longer possible,
because the gen_io_end() call has been deleted. We can therefore
safely remove the no-longer-valid assertion.
=3D=3D=3Dendit=3D=3D=3D

> ---
>  target/arm/translate.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 62b1c2081b..7103da2d7a 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9199,11 +9199,6 @@ static void arm_tr_tb_stop(DisasContextBase *dcbas=
e, CPUState *cpu)
>  {
>      DisasContext *dc =3D container_of(dcbase, DisasContext, base);
>
> -    if (tb_cflags(dc->base.tb) & CF_LAST_IO && dc->condjmp) {
> -        /* FIXME: This can theoretically happen with self-modifying code=
. */
> -        cpu_abort(cpu, "IO on conditional branch instruction");
> -    }
> -
>      /* At this stage dc->condjmp will only be set when the skipped
>         instruction was a conditional branch or trap, and the PC has
>         already been written.  */

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

