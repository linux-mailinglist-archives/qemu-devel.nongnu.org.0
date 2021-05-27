Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8C9392480
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:46:35 +0200 (CEST)
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm56Y-0004zD-3y
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lm55J-0004F5-Be
 for qemu-devel@nongnu.org; Wed, 26 May 2021 21:45:18 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lm55D-0008DA-2D
 for qemu-devel@nongnu.org; Wed, 26 May 2021 21:45:16 -0400
Received: by mail-pg1-x529.google.com with SMTP id i5so2527735pgm.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 18:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KeGkOYMLYyaL3db1WcrzJN6qIWBzigSB9kgH8c33+rk=;
 b=gUd3iXyvQhf60oWfTHX+ew4Cw/q5Ucgz60UdufmNE33y5rVxS33JiUR7JTLCn/P+Ud
 OZyHRqzOFftqFd6vOvUdZd2a6c09hU8Ga1H3XjPHUnDCF0DEFgJV0EO7bR+2jpdfLWc3
 hLOLT6jc4SZD4RyRvViD76/sGrGYlK9OjcCps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KeGkOYMLYyaL3db1WcrzJN6qIWBzigSB9kgH8c33+rk=;
 b=V8YQbI4oc8TRJcWxi6lEqQ853VepA8ItEbCrrdO2/X8IX1monuKQvs7WCsfMA3+31y
 8URQ5Ap5u42fJBGYNbSUoQpzfrwGCQG9BXE46jpsq1AEFk+OKyTfPo5dU9mTcbtsIEKE
 26TFQ4cpK6AwYXwxBhy4fcFftCTrLjx1zHoJEt4gF3CvEq9MEIel4Z+ViadaSrlTGYgn
 u93j+LfpfYbC1MIVFRZ0EOmA5FwB5FjMVImGD1ezhWjnoNSYt+rttU2BwblUoVQo9tJV
 vPHxC9b8DS3YLotYqx2CICSRR+eRrIFarKIR6pZEiV0ZidRifRuMoZDxI+7Tv6mndJ80
 YqjQ==
X-Gm-Message-State: AOAM533Tf9MmBw9//e35puhK9YWcgFBZL2DgSFZdMzWd4YMTEIWLVvzQ
 nmD+XoXqbZS6Tm1qtaugGmCh9OnAvXxaJ1qR9iNe5Q==
X-Google-Smtp-Source: ABdhPJw5A1qxum8ULYlD8sW/Yzb7cbXFhVmVCfaGDoY0vGvq37kHe4v/rs7LqemBlGCe4FMYtzCm0qCHuZeb/I7NJ28=
X-Received: by 2002:a62:52c6:0:b029:2e8:c684:b741 with SMTP id
 g189-20020a6252c60000b02902e8c684b741mr973718pfb.38.1622079905616; Wed, 26
 May 2021 18:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <87cztg3tv0.fsf@linaro.org>
 <CAH=wFzQjYJHN3xH1QhyxzZNDXGjQDw5UxhwH2NEiQoYjWcqh-g@mail.gmail.com>
In-Reply-To: <CAH=wFzQjYJHN3xH1QhyxzZNDXGjQDw5UxhwH2NEiQoYjWcqh-g@mail.gmail.com>
From: Takashi Yamamoto <yamamoto@midokura.com>
Date: Thu, 27 May 2021 10:44:54 +0900
Message-ID: <CAH=wFzR3=Q1ukE-5Wp1jQ47n0p2Y6wwv8vFVtycTJZYdajtctA@mail.gmail.com>
Subject: Re: [PATCH 0/5] linux-user changes to run docker
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=yamamoto@midokura.com; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 8:22 AM Takashi Yamamoto <yamamoto@midokura.com> wr=
ote:
>
> On Tue, May 25, 2021 at 2:49 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >
> >
> > YAMAMOTO Takashi <yamamoto@midokura.com> writes:
> >
> > > These patches, along with a few more hacks [1] I didn't include
> > > in this patchset, allowed me to run arm64 and armv7 version of
> > > dind image on amd64.
> > >
> > > [1] https://github.com/yamt/qemu/tree/linux-user-for-docker
> >
> > Might be worth posting those patches next time (even if they have a RFC
> > or !MERGE in the title for now).
>
> ok.

while RFC is mentioned in eg. git format-patch --help,
i couldn't find what !MERGE is.
can you provide a reference?

is there a nice way to express that some patches in a post are meant
for application and the others are RFC?

>
> > I had a little noodle around with
> > testing and quickly found a few holes. It would be nice if we could hav=
e
> > a unit test to cover these various bits as I fear it will easily break
> > again. Feel free to use the following as a basis if you want:
>
> frankly, i feel it's enough to cover the cases which are actually used
> by real apps.
> is "/proc/./self/exe" etc used in the field?
>
> >
> >
> >
> > > You can find my test setup here:
> > > https://github.com/yamt/garbage/tree/master/binfmt-aarch64-install
> > >
> > > YAMAMOTO Takashi (5):
> > >   linux-user: handle /proc/self/exe for execve
> > >   linux-uesr: make exec_path realpath
> > >   linux-user: Fix the execfd case of /proc/self/exe open
> > >   linux-user: dup the execfd on start up
> > >   linux-user: Implement pivot_root
> > >
> > >  linux-user/main.c    | 14 +++++++++++++-
> > >  linux-user/qemu.h    |  2 ++
> > >  linux-user/syscall.c | 43 ++++++++++++++++++++++++++++++++++++++++--=
-
> > >  3 files changed, 55 insertions(+), 4 deletions(-)
> >
> > I also had a go at cleaning up is_proc_self and Daniel greatly
> > simplified it.
>
> thank you for the info.
> unfortunately the approach seems incompatible with what i want to do
> eventually. (handle non-self cases as well)
>
> >
> >
> >
> > --
> > Alex Benn=C3=A9e

