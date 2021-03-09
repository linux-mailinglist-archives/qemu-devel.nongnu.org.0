Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9171D332F85
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:04:19 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiaY-00072D-Iv
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:04:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJh1i-0004oC-VE; Tue, 09 Mar 2021 13:24:15 -0500
Received: from mail-il1-f181.google.com ([209.85.166.181]:36124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJh1h-0008JT-4A; Tue, 09 Mar 2021 13:24:14 -0500
Received: by mail-il1-f181.google.com with SMTP id g9so13067711ilc.3;
 Tue, 09 Mar 2021 10:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Yiv96Q1LyyBLt78n51xwVCMAh+v0w6kUAIirgO6bps=;
 b=YvvvNBJlaSedsot+/i71GdBCS0djkVgbZmToA5SrYKMrnA6qSPZcpsYOaPMKfnrx85
 X58AeSuKGvKacv/TOOftL2RpoCGDKh9tKu7bHB03zv3mD0c7pgLCB1rWVLOPMTB7JuKO
 Jugjoc3FiNEUSps+2sfcMaU9rivJP6JhtGY2Aues7bE8MmquaHdsBWfJ1LtmFPycdodq
 ENfburm+3OU4gbVUwOx2Hd/Zg5Q6bc3mwU5CZxnQ55ylAVlO7xVEC00orsFntycRe6I1
 8XhD5d5rOH3kxDNFa8uYnHmC25NT8D36mcgPlsYnDUSIibk2N8b5a+ohvcBqrOShfBwq
 Bjbg==
X-Gm-Message-State: AOAM533+LvTWNOFLUYOSD+tU8baQgl3p83f+IC02qrPf8xvdFHBvRgoj
 qsQcg4bbu3gR4nFm2yhdmyBWqBBK1K4=
X-Google-Smtp-Source: ABdhPJzpYTjpRlCIuXXTJVicQr8Z7DqOMWWq9mKXAmwKlLABQGV5QbmhkDH+fDvbe42vm+9tXMvT6Q==
X-Received: by 2002:a05:6e02:1845:: with SMTP id
 b5mr25999954ilv.11.1615314251587; 
 Tue, 09 Mar 2021 10:24:11 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41])
 by smtp.gmail.com with ESMTPSA id a5sm8175170ilk.14.2021.03.09.10.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 10:24:11 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id o9so14992355iow.6;
 Tue, 09 Mar 2021 10:24:11 -0800 (PST)
X-Received: by 2002:a6b:b5c2:: with SMTP id
 e185mr24210030iof.204.1615314251178; 
 Tue, 09 Mar 2021 10:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20210309032637.41778-1-j@getutm.app>
 <YEeWimKd1QVd176N@stefanha-x1.localdomain>
In-Reply-To: <YEeWimKd1QVd176N@stefanha-x1.localdomain>
From: Joelle van Dyne <j@getutm.app>
Date: Tue, 9 Mar 2021 10:24:00 -0800
X-Gmail-Original-Message-ID: <CA+E+eSBiPAYtWyhMx07g8+ovON8hfF1kaoOLhUTUc0vWpYOtYA@mail.gmail.com>
Message-ID: <CA+E+eSBiPAYtWyhMx07g8+ovON8hfF1kaoOLhUTUc0vWpYOtYA@mail.gmail.com>
Subject: Re: [PATCH] coroutine: add libucontext as external library
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.181; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f181.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Joelle van Dyne <j@getutm.app>,
 "open list:raw" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 7:38 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Mon, Mar 08, 2021 at 07:26:36PM -0800, Joelle van Dyne wrote:
> > iOS does not support ucontext natively for aarch64 and the sigaltstack is
> > also unsupported (even worse, it fails silently, see:
> > https://openradar.appspot.com/13002712 )
> >
> > As a workaround we include a library implementation of ucontext and add it
> > as a build option.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  configure                 | 21 ++++++++++++++++++---
> >  meson.build               | 12 +++++++++++-
> >  util/coroutine-ucontext.c |  9 +++++++++
> >  .gitmodules               |  3 +++
> >  MAINTAINERS               |  6 ++++++
> >  meson_options.txt         |  2 ++
> >  subprojects/libucontext   |  1 +
> >  7 files changed, 50 insertions(+), 4 deletions(-)
> >  create mode 160000 subprojects/libucontext
> >
> > diff --git a/configure b/configure
> > index 34fccaa2ba..5f225894a9 100755
> > --- a/configure
> > +++ b/configure
> > @@ -1773,7 +1773,7 @@ Advanced options (experts only):
> >    --oss-lib                path to OSS library
> >    --cpu=CPU                Build for host CPU [$cpu]
> >    --with-coroutine=BACKEND coroutine backend. Supported options:
> > -                           ucontext, sigaltstack, windows
> > +                           ucontext, libucontext, sigaltstack, windows
>
> This approach mixes the concept of the coroutine backend (ucontext,
> sigaltstack, etc) with the optional libucontext library dependency.
>
> libucontext is not a coroutine backend. The patch had to introduce
> $coroutine_impl in addition to $coroutine in order to work around this.
> Let's avoid combining these two independent concepts into
> --with-coroutine=.
>
> I suggest treating libucontext as an optional library dependency in
> ./configure with explicit --enable-libucontext/--disable-libucontext
> options. Most of the time neither option will be provided by the user
> and ./configure should automatically decide whether libucontext is
> needed or not.
>
> > +case $coroutine in
> > +libucontext)
> > +  git_submodules="${git_submodules} subprojects/libucontext"
> > +  mkdir -p libucontext
>
> Why is this mkdir necessary?

That is a typo, will fix.

Thanks to all the feedback in this thread. I will shelve this patchset
for now and see if it's possible to fix ucontext on Darwin. Or if we
go with gcoroutine that would work as well. Either way it seems like
this isn't ready yet.

-j

