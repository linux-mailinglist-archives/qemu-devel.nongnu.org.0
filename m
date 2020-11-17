Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AACC2B728E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 00:41:32 +0100 (CET)
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfAbJ-00071Q-Rb
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 18:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus.walleij@linaro.org>)
 id 1kfAYr-0006AJ-5d
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 18:38:57 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:40234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <linus.walleij@linaro.org>)
 id 1kfAYp-0006Pp-CP
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 18:38:56 -0500
Received: by mail-lf1-x142.google.com with SMTP id u19so296855lfr.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 15:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PgbGhxXCXE3uvLAMGWkjJK4WmB/v6iS8EBQqNl2pLPI=;
 b=OBJfkgzQBj9kHYb1L6tM3RsVNEtxEjS8ET0Oh9YK0275YFj9QadFCAwWSCozN1QtCo
 +8Zz4vWkjpcxgMUMVDIsC7IboLPaOi0ADF1TZADraVsZmRwj/NsiImqyAR/KgSYJNR8X
 ueDXr5NVFB/NX7+PUdIQbuXJ0/Xn1IKQaTgwH0JlwVPOQ4U7BNCy8dygFfyfSFbzvMPj
 KNBOrDZJk2o+gWAICmNIT3BDdwL6xbmjbK4mnEg0HnMpBfrKjfO9/sARAlJuRLBusV0N
 +r735iTU1GwDxFrw8cviIxYPtfyPzaG3pqHLpRgNqOVbnYc1FdyiqF3KfAPDV2bJ3VxT
 v8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PgbGhxXCXE3uvLAMGWkjJK4WmB/v6iS8EBQqNl2pLPI=;
 b=mR2r5naH2mc/e1uMcv983rH4Qto15VT9wUXf+XWhwGBkMP5Jm4eJwPSP9+7DERc6ex
 kSSmW8aMmOh5nuSSIgwu0Ej6yNfh6DC/xo/yP8MlftBTGzHzyT/p/9A0Jb+yB6KvrGpz
 AAks3l79RtOGSJ+HZHCNAR5+zfIAVQhb6JqDpJPHrIW870UixjFEV72wYq+LFuFIrFvM
 0g0I/Afo3+Wb9wp1YufzWQUz47lh52TFmmpnhQKSFDWuWAX3xSKavDWr4ZWOgho4T74X
 BwaMH6KM5zs9u8PrSckc4sq0wJZ9fDAn/VyGLe10pGFIQse1ssX9Hdbu+mFkL2U28q4M
 SKnw==
X-Gm-Message-State: AOAM531ua14GMQi1H6Cl2qVN2Ct/+Gz2kznPNop5S1C12JQgZSTgsn+C
 BTAuzOaqBhVHqO7owOPe6pLlk8raiZFPaNolJ1rUHA==
X-Google-Smtp-Source: ABdhPJyodrlIwxvXj9j6gGI51r9cXRj8xfoOFdh+vq78US7qyWBMu+ApjS1npnI+qftmyyjBQOFSWsXXnoO8nCD8tvg=
X-Received: by 2002:a19:e08:: with SMTP id 8mr2417659lfo.441.1605656332549;
 Tue, 17 Nov 2020 15:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20201012220620.124408-1-linus.walleij@linaro.org>
 <20201013092240.GI32292@arm.com>
In-Reply-To: <20201013092240.GI32292@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Nov 2020 00:38:41 +0100
Message-ID: <CACRpkdZoMoUQX+CPd31qwjXSKJvaZ6=jcFvUrK_3hkxaUWJNJg@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] fcntl: Add 32bit filesystem mode
To: Dave Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=linus.walleij@linaro.org; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
 Linux API <linux-api@vger.kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Florian Weimer <fw@deneb.enyo.de>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 13, 2020 at 11:22 AM Dave Martin <Dave.Martin@arm.com> wrote:

> >       case F_SETFD:
> >               err = 0;
> >               set_close_on_exec(fd, arg & FD_CLOEXEC);
> > +             if (arg & FD_32BIT_MODE)
> > +                     filp->f_mode |= FMODE_32BITHASH;
> > +             else
> > +                     filp->f_mode &= ~FMODE_32BITHASH;
>
> This seems inconsistent?  F_SETFD is for setting flags on a file
> descriptor.  Won't setting a flag on filp here instead cause the
> behaviour to change for all file descriptors across the system that are
> open on this struct file?  Compare set_close_on_exec().
>
> I don't see any discussion on whether this should be an F_SETFL or an
> F_SETFD, though I see F_SETFD was Ted's suggestion originally.

I cannot honestly say I know the semantic difference.

I would ask the QEMU people how a user program would expect
the flag to behave.

Yours,
Linus Walleij

