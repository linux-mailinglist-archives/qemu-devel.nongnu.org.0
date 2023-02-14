Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B986696218
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:12:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtDP-0002ga-Vt; Tue, 14 Feb 2023 06:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRtDN-0002gL-Vy
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:11:14 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRtDK-0000Mk-T9
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:11:13 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so15146346pjp.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 03:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UX/IVOLpFVoTII2uYtrcJrTGbkI7WP9O/3umnK3nLZ0=;
 b=DTnyHS77bp389FkUlXDDvR3rULI/NTLmWzE85Aj6TfnPsvkhkwgRHPa1w/qWK9qLvd
 Lx1j0+gbRDtYF2UQTjs5LBYVhlfHp9UcsSldj4hyG+t05fY2ebIeqEy4OrrVBPrFfxpv
 80fcibP59foC/7xkp4izS/mVTtrgCnE4yCys68wWjLjf0jZcSz4HxecCEguOIGi4J5YH
 DNSjKhWDZBS78YgGdLRi2Sl2pnKVfKZxelQRjHICiT7jFDU5oNXQ0LkZqS/w3MRbZ+cY
 InShEc6lr83CG19buZCTyx9Rg7RiCN9+BxRjOj4LdYZryMls1dzGyBIeAJzxueWvsNrt
 gc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UX/IVOLpFVoTII2uYtrcJrTGbkI7WP9O/3umnK3nLZ0=;
 b=dGB7Y2TzVdnGQ/DSTH+7PaKb1ouM9aLw5JX5lkck1ElOdGW9+ng9AxLlz+b8s0qvH1
 +VHTtPYMaQhjzWS9CsHZ5kAMsIWtvDY5VFuiIS3Tbd8EgwlAclhZNADz9+ZIPTpB1Hq1
 E7ToqNKKVxHSzxtKJlrJECB0JQoiTrf6W/h18g/7Kn7VD83nKhAvHzegXjBn601oJmym
 M7EntGh5nNaz/axdTpp6EvXHyWX/G2UNcX1xc/CTagTZKLyoQ9J4Ilt3OB8Ja/XRO8bE
 dAhHbAQi5LvOkALJzCf62orHTGcp5hTe+Ve6P282VpqiMP5X9JkzUx9CMMhoBqNiU56G
 vGGw==
X-Gm-Message-State: AO0yUKXhU/Qq2hI/ALYGNvJCQe/BXKuBZaIzAs8L6ISKrnRJDSzzwV0m
 t/bi4fu3woT1ZKyccAX1uL+FWBbijZalCiPG2P26Tw==
X-Google-Smtp-Source: AK7set/zJMUaRgv1+q84N0PiGHWxtJKA8GvY2rrqwRoEK7cwZ+4NljkXuysyoi/dzNxfjzFBgJJ+WIw6VrAOnLAAqP4=
X-Received: by 2002:a17:90a:28a5:b0:233:dcb5:ee15 with SMTP id
 f34-20020a17090a28a500b00233dcb5ee15mr352148pjd.92.1676373069214; Tue, 14 Feb
 2023 03:11:09 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
 <CAFEAcA9kshowaoWFCPRmVy4G2dD+EqiG5cKAAgkJO63MNrEheQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2302131431430.4661@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2302131431430.4661@ubuntu-linux-20-04-desktop>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Feb 2023 11:10:58 +0000
Message-ID: <CAFEAcA8hQZ8uyF80o=fSykggQb929X=+NweLUG9VE=2JVpP2Wg@mail.gmail.com>
Subject: Re: [PULL 00/10] xenpvh machine
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Feb 2023 at 22:34, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Mon, 13 Feb 2023, Peter Maydell wrote:
> > On Fri, 10 Feb 2023 at 22:27, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > >
> > > The following changes since commit 90595cc9396bb910b148391fea2e78dd8c6c8b27:
> > >
> > >   Merge tag 'migration-20230209-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-10 10:50:21 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/sstabellini/qemu.git xenpvh
> > >
> > > for you to fetch changes up to 3f8ee848693872e3783cdcf2862be5421bb9cbcb:
> > >
> > >   meson.build: enable xenpv machine build for ARM (2023-02-10 14:23:47 -0800)
> >
> > Hi -- 'xenpvh' doesn't appear to be a signed tag:
> >
> > >From https://gitlab.com/sstabellini/qemu
> >  * branch                    xenpvh     -> FETCH_HEAD
> > error: FETCH_HEAD: cannot verify a non-tag object of type commit.
> > Does not appear to be a signed tag
>
> Sorry "xenpvh" was a branch name. Here is the corresponding signed tag:
>
> https://gitlab.com/sstabellini/qemu xenpvh-tag

Something weird has happened here -- I'm getting merge conflicts
in files in migration/ and in tests/unit/test-xbzrle.c, even though
your pullreq diffstat says it doesn't touch those files. Can you
try a rebase and resend?

thanks
-- PMM

