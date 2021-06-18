Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461D73AC7BE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:36:06 +0200 (CEST)
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAuz-0005Ko-CN
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1luAtS-0003wq-Tp
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:34:31 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:41651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1luAtQ-0002N6-9r
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:34:30 -0400
Received: by mail-ua1-x931.google.com with SMTP id r4so2270863uap.8
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ihY+Jish0l99qrEM7OyS4KVbnl0KDxrEDp3Kl2ai2bo=;
 b=OCrOT0LPX/pI5V9awJJfTwT1xTE8MHtRDvpC0vtBSUtTbHz6JIoX162e+RtgKJi6mF
 zeMNORG7TSFbankY2QFB4X8Xxw95WfIM5bCICpoWGURa4ndb65WOOclnwtGyNHArOnhh
 GrmTD2XjWoDOKLLAul9KpsJ88i1X3ADIWRV9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ihY+Jish0l99qrEM7OyS4KVbnl0KDxrEDp3Kl2ai2bo=;
 b=jD5Krz0yU0SD6SzOY/HeJOZQh4lIBMB5evJ2Pf7FmQ/74rXXxkxhKcrfpkuAemEfIJ
 5KjhjcT6A6B13S+eAw0O8O/oU3JVrukUQn588F8F+FqfVnafqBgQMAJYksZhfokLy/70
 SIUsR4/LIMwrExBSDD7q+jHQR/oBlxkSfoiKBpHIfWYZzsaTsncqcvSBggJv36oazSHV
 wHGAYYxcs1uiJ0i5u2itQW+xamb+b2fa2HsErnLO9XmlpmB7rn1OHEKXLAn26cOyDq4E
 EzHOtAXdD9Cm7JWINuUhQVXnGFk0bwf60tyOaSzKg+LWGR42hPEM8l03GxeBeIXEX67W
 SRUw==
X-Gm-Message-State: AOAM533ih4fpsamh/tix9ucbUiZMFHMnoDz0pEdLKQEtRnSi3PrAqPB/
 j1mMBfsq4AfaBwOjipAzXi4TcpSL6hSP7L9iEYX4EQ==
X-Google-Smtp-Source: ABdhPJxqSGO4iJKoSpudE5fu4T+rkaSOjGGtc8TN0FJsMzAW5B+pvw/NwmJu9ZrNdOG54Nx0P/lxhd/ZWkbGfAAKxzk=
X-Received: by 2002:ab0:2690:: with SMTP id t16mr10972373uao.9.1624008866337; 
 Fri, 18 Jun 2021 02:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210617141518.304659-1-groug@kaod.org>
 <CAJfpegtpvU6Z6hQ-NKh-shN+Pux7+XzXwNK_Ro8YpfA-3tCOkg@mail.gmail.com>
 <20210618112131.46ce0b2a@bahia.lan>
In-Reply-To: <20210618112131.46ce0b2a@bahia.lan>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 18 Jun 2021 11:34:15 +0200
Message-ID: <CAJfpegv30i7OnTO5mdNsVSDDoC9D_d06ni1sRrdrmGOgRsdS8w@mail.gmail.com>
Subject: Re: [PATCH] virtiofsd: Don't allow file creation with FUSE_OPEN
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=miklos@szeredi.hu; helo=mail-ua1-x931.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 11:21, Greg Kurz <groug@kaod.org> wrote:
>
> On Fri, 18 Jun 2021 10:58:33 +0200
> Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> > On Thu, 17 Jun 2021 at 16:15, Greg Kurz <groug@kaod.org> wrote:
> > >
> > > A well behaved FUSE client uses FUSE_CREATE to create files. It isn't
> > > supposed to pass O_CREAT along a FUSE_OPEN request, as documented in
> > > the "fuse_lowlevel.h" header :
> > >
> > >     /**
> > >      * Open a file
> > >      *
> > >      * Open flags are available in fi->flags. The following rules
> > >      * apply.
> > >      *
> > >      *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
> > >      *    filtered out / handled by the kernel.
> > >
> > > But if it does anyway, virtiofsd crashes with:
> > >
> > > *** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: terminated
> > >
> > > This is because virtiofsd ends up passing this flag to openat() without
> > > passing a mode_t 4th argument which is mandatory with O_CREAT, and glibc
> > > aborts.
> > >
> > > The offending path is:
> > >
> > > lo_open()
> > >     lo_do_open()
> > >         lo_inode_open()
> > >
> > > Other callers of lo_inode_open() only pass O_RDWR and lo_create()
> > > passes a valid fd to lo_do_open() which thus doesn't even call
> > > lo_inode_open() in this case.
> > >
> > > Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
> > > in lo_open() and return an error to the client : EINVAL since this is
> > > already what glibc returns with other illegal flag combinations.
> > >
> > > The FUSE filesystem doesn't currently support O_TMPFILE, but the very
> > > same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
> > > that as well.
> > >
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > ---
> > >  tools/virtiofsd/passthrough_ll.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > index 49c21fd85570..14f62133131c 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -2145,6 +2145,12 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
> > >          return;
> > >      }
> > >
> > > +    /* File creation is handled by lo_create() */
> > > +    if (fi->flags & (O_CREAT | O_TMPFILE)) {
> > > +        fuse_reply_err(req, EINVAL);
> > > +        return;
> > > +    }
> > > +
> >
> > Okay.  Question comes to mind whether the check should be even more
> > strict, possibly allowing just a specific set of flags, and erroring
> > out on everything else?
> >
>
> I've focused on O_CREAT and O_TMPFILE because they cause an explicit abort()
> in glibc when the code is compiled with -D_FORTIFY_SOURCE=2, but yes,
> maybe it could make sense to check more of them.
>
> > AFAICS linux kernel should never pass anything to FUSE_OPEN outside of this set:
> >
> > O_RDONLY
> > O_WRONLY
> > O_RDWR
> > O_APPEND
> > O_NDELAY
> > O_NONBLOCK
> > __O_SYNC
> > O_DSYNC
> > FASYNC
> > O_DIRECT
> > O_LARGEFILE
> > O_NOFOLLOW
> > O_NOATIME
> >
> > A separate question is whether virtiofsd should also be silently
> > ignoring some of the above flags.
> >
>
> Dunno on the top of my head...

Let's discuss this separately as this is mostly unrelated.  Added an
item to the virtiofs-todo etherpad.

>
> BTW, as suggested by Dave, I've submitted a similar patch to upstream
> libfuse:
>
> https://github.com/libfuse/libfuse/pull/615
>
> And I got interesting suggestions:
> 1) do it in core FUSE, i.e. fuse_lowlevel.c, since this isn't specific to
>    passthrough_ll AFAICT
> 2) print out an error
> 3) exit
>
> 1 makes a lot of sense. I guess 2 is fine this cannot be used by a
> buggy guest to flood some log file on the host. 3 doesn't seems
> to be an acceptable solution, and it wouldn't change much the
> outcome compared to what we have now.
>
> So I will go for 1 and 2.

Okay, good.

Thanks,
Miklos

