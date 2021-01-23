Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0702F30122A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 03:06:52 +0100 (CET)
Received: from localhost ([::1]:46848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l38KB-0007P8-8M
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 21:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <briannorris@chromium.org>)
 id 1l38JG-0006wj-Fr
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 21:05:54 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:43476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <briannorris@chromium.org>)
 id 1l38JD-0006Qx-HC
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 21:05:53 -0500
Received: by mail-oi1-x229.google.com with SMTP id q25so8214313oij.10
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 18:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uzBeLr61Qh72JVC826pr/SsPk/4PgOIOkysSaXxupnk=;
 b=QGCjNZBeoGHex/JM7P7KG6oGS7ZlsegUjMWwJbqqxbey+QwegfCpzOaWCLKiWe6qaF
 079dhLKThF+zaa9U9zPpZWj9yuz6nJlCLJzsZ6ChqQbX5uKrCxvcrMObOfYsdki2Kkoc
 Mj4nYpDf1crR+YLvE3ZugVMl7oNrlq20FIUiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uzBeLr61Qh72JVC826pr/SsPk/4PgOIOkysSaXxupnk=;
 b=uYxJbFKc7svLcwTpPvfM2x/PriifX+VKZlc6fmxMmwaFDL/uyr+tllIY6aa9jFs2LG
 1ChQlK3anncqImBHG0Tg6sU0PYAnNt7KOsSGFIseQugi8s2YAZcf5VE/uBTtalUiQgXW
 PdXzPB0X0Esoa/srbPLgzCBnxI3KUyqqsalXcjMjY9urBFykYCWvX83ZE8jzqW1oNdQN
 Zr45kTi+qs0v69hC7obkCqjw8NgibglsIJtDxlSVzQlTs3wxZiQJiq4aFqGdBcuIgaT9
 T8sWSsgimMtg0r8l//G3rsDQsxzQ5211+/i22AHzBO7mj1X5JH9QvN8sr1we58xRm97I
 PJHg==
X-Gm-Message-State: AOAM530kobb/cjKFDFgqCl3qyLIQn4W6VTJyDNGhMXdacDNdM/djR8c2
 9mQ9lTBq0+qYloQ7Vb+ZJetgBGxlLhdPNA==
X-Google-Smtp-Source: ABdhPJyrgNOgmh+Y0vlYkj+rx79xQ4OperVtCNjZ4x3cYpUTIy3//0p8j+O3MIfacYRp6uIZbl9h6w==
X-Received: by 2002:a05:6808:25a:: with SMTP id
 m26mr5302436oie.179.1611367548356; 
 Fri, 22 Jan 2021 18:05:48 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
 [209.85.167.172])
 by smtp.gmail.com with ESMTPSA id w11sm2052814otg.58.2021.01.22.18.05.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 18:05:47 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id w124so8242869oia.6
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 18:05:47 -0800 (PST)
X-Received: by 2002:aca:df02:: with SMTP id w2mr5092186oig.77.1611367546649;
 Fri, 22 Jan 2021 18:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20200615225827.183062-1-joe.slater@windriver.com>
 <CAFEAcA_ZU_w7PaYFVVaW1vzGySOLaNaThVcNQFNmd_GV-hG6Qw@mail.gmail.com>
 <CAFEAcA8BtVkBbHtLt-kB-AcZnN9YWtBahKTQ0wSvHWojF9CinQ@mail.gmail.com>
 <CAMxuvaxUqrq77_io9j6k7EU91vm7iEEBaTwLNsKd9YJ9NVR7rw@mail.gmail.com>
 <20200808013531.GA166030@google.com>
 <CAFEAcA__4GwKKe9rY4ut41f-S-u_AnSkdwHvSX0YoaPwjO3ARw@mail.gmail.com>
 <CAMxuvaw1Rpah2ErvGQWdD+K+KU=PFpfyNnM-95s5UUSXY6zj6Q@mail.gmail.com>
 <CA+ASDXMFw_-EH0Rt7AfLRHxent3o0ephp+GehZQkKbUioHMhBw@mail.gmail.com>
In-Reply-To: <CA+ASDXMFw_-EH0Rt7AfLRHxent3o0ephp+GehZQkKbUioHMhBw@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 22 Jan 2021 18:05:34 -0800
X-Gmail-Original-Message-ID: <CA+ASDXOSR5ueNpwKRzuEEu9emS=yfkaLZiPt8Va_ZNx5vLRbgg@mail.gmail.com>
Message-ID: <CA+ASDXOSR5ueNpwKRzuEEu9emS=yfkaLZiPt8Va_ZNx5vLRbgg@mail.gmail.com>
Subject: Re: [PATCH 1/1] os_find_datadir: search as in version 4.2
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=briannorris@chromium.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joe Slater <joe.slater@windriver.com>, "MacLeod,
 Randy" <randy.macleod@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just to follow-up here, since nobody followed up for months...

On Mon, Aug 10, 2020 at 2:41 PM Brian Norris <briannorris@chromium.org> wro=
te:
> On Mon, Aug 10, 2020 at 12:29 AM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> > On Sat, Aug 8, 2020 at 7:34 PM Peter Maydell <peter.maydell@linaro.org>=
 wrote:
> > > On Sat, 8 Aug 2020 at 02:35, Brian Norris <briannorris@chromium.org> =
wrote:
> > > It's just missed 5.1, unfortunately :-(

And it missed 5.2 too :(

> > > Marc-Andr=C3=A9, did you want to review it ?
> >
> > I tried an alternative approach, and ack his version instead:
> >
> > https://patchew.org/QEMU/20200716141100.398296-1-marcandre.lureau@redha=
t.com/
> >
> > (I am going to do this in this thread instead)
>
> FWIW, you already provided your Review a month ago:
> https://lore.kernel.org/qemu-devel/CAJ+F1CJmMV6pY6r0P6ukNZA_q+w6yLvAxekGn=
usgXYuuip6gZA@mail.gmail.com/
>
> But I see you've now repeated it ;)
> https://lore.kernel.org/qemu-devel/CAJ+F1CJdHo7R9rnmoD1cLEzsYLFsFVVjcAr5U=
csYFgfcW3z2LA@mail.gmail.com/
>
> In any case, thanks! We'll likely carry this patch in Chrome OS, until
> it gets applied to a proper release.

It turns out that Paolo inadvertently (?) fixed this issue by
refactoring, in v5.2.0:
ea1edcd7da1a vl: relocate paths to data directories
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dea1edcd7da1a375ef7ccf=
8aa93b72827b518ad8e;hp=3D63c4db4c2e6d221cecb5aafa365934bb05724cb4

I tested that out here, and the new find_datadir() is able to track
relocations properly, by looking for a common directory ancestor of
the running executable. Thanks Paolo!

Brian

