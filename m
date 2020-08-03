Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E9C23AB58
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 19:07:23 +0200 (CEST)
Received: from localhost ([::1]:59176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2dvm-0003qN-P9
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 13:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuanzi@google.com>) id 1k2dug-00031J-Mo
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 13:06:14 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:39162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuanzi@google.com>) id 1k2duf-0001zZ-0i
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 13:06:14 -0400
Received: by mail-oo1-xc44.google.com with SMTP id x1so5238189oox.6
 for <qemu-devel@nongnu.org>; Mon, 03 Aug 2020 10:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+a5PKmeTNCX3hGWsbOAVGY6wwBmQT5kjuEC8Dl41+a4=;
 b=ueHj6qBj/Wfzn6M7EYxmZlF13+VVKTnep/MN0yCfkmbg4flsgJKdVVpRahzREHmoLr
 VvV9ahSoHeiFNs+r8FLPeYIwTjHU8guSLreFBIxZr5N5bs6uL36ODhf8wkiwYyesytVd
 h5smgZJWt3beK1ezMod0a+iTaa8rE3TEF3Xf+46WhB1LM2+IbLZUDCjGfDChu7B2OM1f
 VNitqBekPzBawCzoot5QaGJx1haakpQeiTrzKDe79QrIiNEFtAKDAwpPgxxGJ4TB9cXf
 T7VlVtkVYfWcsX3syxugq+DVJ8dgPhVO07qaSkNPa8i+faLfypY3jgpQPRH8bHiXcDdm
 TuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+a5PKmeTNCX3hGWsbOAVGY6wwBmQT5kjuEC8Dl41+a4=;
 b=j3YQUCnErkCO0wEQyEpGIYK9dpIoACzr2Y40FqpXEu8zGj18MuyvpMQXzcPoe95VuS
 Q20bePT96i9ExMrfKSo82y5RzdlSUNEgEaJ61W3KFzbIXPE9sD19FDNceWlchU3MUdE0
 /LW8OvBMABjf+Scmr16bWrpo3nd9Ch4MKCLOEJvXrsvCFqi3ItftLLm/so/Jt9Qnagf2
 dnbsQEB3+nmGDIU4/pLdbpxf37eCi/Y1oIfLRKg65RiljMjXTudBG6SyG032a+1HSWxE
 X+BFpFmgHHHqu4YH7d3gY9GRzkRt8IkHl1wbJjKkif+RVyNMRTIYSheqHz7W7O6Dbmrp
 XlSQ==
X-Gm-Message-State: AOAM532iAT+bu9W89HUAfOR8vOsv0InTwJB6QU/CJ8xTdnWpunJ25kFF
 Fn2WZDnzA7rOkYevw+k7GBYrgSh1VCmfqR5aaby+Gw==
X-Google-Smtp-Source: ABdhPJytO3lkjHL/7LmFg8UYGppPd/PHpzI8qw9cTCj9oQFCjuaF6fokGaioiHCCyOXx5EpUV4xJ/EZZiFMM6tktcro=
X-Received: by 2002:a4a:d62c:: with SMTP id n12mr15060622oon.38.1596474369896; 
 Mon, 03 Aug 2020 10:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200730193932.3654677-1-yuanzi@google.com>
 <87bljsnf5p.fsf@linaro.org>
In-Reply-To: <87bljsnf5p.fsf@linaro.org>
From: Lirong Yuan <yuanzi@google.com>
Date: Mon, 3 Aug 2020 10:05:58 -0700
Message-ID: <CADjx4CJOGbYa_8W7f1KDF8qwTJhVwV75SA1G3TGHv+Mz3cXvFg@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v2] gdbstub: add support to Xfer:auxv:read: packet
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=yuanzi@google.com; helo=mail-oo1-xc44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 3, 2020 at 4:27 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Lirong Yuan <yuanzi@google.com> writes:
>
> > This allows gdb to access the target=E2=80=99s auxiliary vector,
> > which can be helpful for telling system libraries important details
> > about the hardware, operating system, and process.
> >
> > Signed-off-by: Lirong Yuan <yuanzi@google.com>
>
> I cleaned up the test a little:
>
> modified   tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py
> @@ -22,13 +22,9 @@ def report(cond, msg):
>  def run_test():
>      "Run through the tests one by one"
>
> -    cond =3D True
> -    try:
> -      gdb.execute("info auxv")
> -    except (gdb.error, AttributeError):
> -      cond =3D False
> -
> -    report(cond, "Display the auxiliary vector of the inferior.")
> +    auxv =3D gdb.execute("info auxv", False, True)
> +    report(isinstance(auxv, str), "Fetched auxv from inferior")
> +    report(auxv.find("sha1"), "Found test binary name in auxv")
>
>  #
>  # This runs as the script it sourced (via -x, via run-test.py)
>
>
> Queued to gdbstub/next, thanks.
>
> --
> Alex Benn=C3=A9e

Awesome, thank you Alex for the review and cleanup!

Regards,
Lirong

