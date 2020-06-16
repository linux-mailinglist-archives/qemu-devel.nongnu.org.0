Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7291FBBCF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 18:33:53 +0200 (CEST)
Received: from localhost ([::1]:45182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlEX2-0003JD-6w
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 12:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlEW4-0002qO-ED
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:32:52 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlEW2-0000CC-HE
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:32:52 -0400
Received: by mail-oi1-x241.google.com with SMTP id c194so19817635oig.5
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aAi5RV1R740hxNCi1K+iPeak5ZkS52Lw4UZUupXN/38=;
 b=sxwpAlY7NRiNCBK4BqEl49z+wmEF4WvSBuplSyEwR+RzsaduYhwq8wyvlpg2cPRejQ
 BsEweDs7Jdpp/i3YnbtjTKFAADRqWLJp0laruk2mBd5PsrWzyx6QlT3jXqt/mNqDJuTy
 wZUo0JF17cvtiOC3O/NY1ZbimXqeo+SDXMOnnPvpwN2Yap5J+Q1D17ozzONW7dHLYhIb
 ND83LgvsjuJFFJMkcEMha3SFA1Xnv6HFXGJl+FQuWIn60s2Qya9Vhzu5RhjL0Iy2r91n
 mf8f+BaO3TXnNCovy9ZO4WWtJH6YsUnfxz94tqldPoGXwmoPAv20J0DdxHFXQH1aWtE6
 B+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aAi5RV1R740hxNCi1K+iPeak5ZkS52Lw4UZUupXN/38=;
 b=ul1xrMWI+OvKRKf0EAKNqWczr73VSDq+JxVD8V/lfYtPwUKoM+hp/kmh/wSWGdAqvv
 /mWADVCYrytMtbJQuwfFBbOTCUmdy/kM2AMygpI4HPOASvozmaPlIktpxnLPvrEyiW9h
 i9W/fNBYKZB+gWw4pT8dtVR7RwhMYcdScvAjx+bSry65+O8aRow63twB9fy7YWfzcmNg
 YfddyLMTxs2S9WeECS0DPa3zYGv+bVeNWLU80pCWNEeyVqgqEWT4hKHf+iZIWYl/JJ0k
 wFlvStbmJt1NsLVRwuCFqXieV+AiYEdFdGx0RlGFo6tF0GoSXBtN70Sruxv+1S8sZOVx
 INig==
X-Gm-Message-State: AOAM531Y5J35cYnjz1xmMBipiV39asY/ex2K4ZXA/YEMI2T9VwDlnhIy
 aUcvBV9qsEDqVnIVY5DYu85+zh1ntdgG0kuFRzjzhA==
X-Google-Smtp-Source: ABdhPJzmiZbz17bF8S3CBcrTjC9GY2Y29s2vL5lzkdP/wkvErYRJ/6BB2x0Lp0AEAFDclZyvFdTKpFRM2/TuxDN1b2U=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr4045456oia.163.1592325169132; 
 Tue, 16 Jun 2020 09:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200612014606.147691-1-jkz@google.com>
 <87k107yp6p.fsf@linaro.org>
In-Reply-To: <87k107yp6p.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 17:32:38 +0100
Message-ID: <CAFEAcA86xAJDmoDBrz5etKYGLye2qxf4idPXUWUAYMLcQy_+Yw@mail.gmail.com>
Subject: Re: [PATCH 0/5] linux-user: Support extended clone(CLONE_VM)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Josh Kunz <jkz@google.com>, Riku Voipio <riku.voipio@iki.fi>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jun 2020 at 17:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Apart from "a more perfect emulation" is there a particular use case
> served by the extra functionality? AIUI up until this point we've
> basically supported glibc's use of clone() which has generally been
> enough. I'm assuming you've come across stuff that needs this more fine
> grained support?

There are definitely cases we don't handle that cause problems;
notably https://bugs.launchpad.net/qemu/+bug/1673976 reports
that newer glibc implement posix_spawn() using CLONE_VM|CLONE_VFORK
which we don't handle correctly (though it is now just "we don't
report failures correctly" rather than "guest asserts").
The problem has always been that glibc implicitly assumes it
knows what the process's threads are like, ie that it is the
only thing doing any clone()s. (The comment in syscall.c mentions
it "breaking mutexes" though I forget what I had in mind when
I wrote that comment.) I haven't looked at these patches,
but the risk of being clever is that we end up implicitly
depending on details of glibc's internal implementation in a
potentially fragile way.

I forget whether QEMU can build against musl libc, but if we do
then that might be an interesting test of whether we have
accidental dependencies on the libc internals.

thanks
-- PMM

