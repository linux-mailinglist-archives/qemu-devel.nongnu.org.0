Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E01A30588E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:36:36 +0100 (CET)
Received: from localhost ([::1]:58130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4iBf-0003en-33
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4iAJ-00036k-Ny
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:35:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4iAF-00025B-Ly
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611743706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eCO07lsxQVMYMsEqiRgY+fjMXs/AyKmDDu4sFx1GIc8=;
 b=HPa7Am4tjq9XcOcfBHrXiQmenQTvxqXQlaV0Zgi0Brus8ckL43/984XkK41XqaBusf07ym
 4NqNj0k6J8Y05FldDVoAgJza+f+48K+0BG7weA1YK8S1EE7VmW5N5ejalIA4apVw4IHhtE
 r0T1TlD88bikeVkekugJXB2mii0vBNU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-RncZ2ZoNPtywR_EcmG_aHw-1; Wed, 27 Jan 2021 05:35:04 -0500
X-MC-Unique: RncZ2ZoNPtywR_EcmG_aHw-1
Received: by mail-qk1-f200.google.com with SMTP id y187so1092236qke.20
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 02:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eCO07lsxQVMYMsEqiRgY+fjMXs/AyKmDDu4sFx1GIc8=;
 b=TenIqliwuaoRB9L2gOOoFC5h25ufyMHkRmYm5SBQaiQKWv+3MRCplTO44n/VmJmnRG
 Li2WV9+PHBIMAQuFhGNqw7qDIsqjLEmvxL4AlI4kPqsv3xJgUsCj1O7DrvMHOj6nN77V
 yEvHS1Ea3afSwCKB/IgAXnKPTfJZ2FQEwoYJPqXf+YvYHzAHXkEKnEntBfETMmef/hDQ
 01YGStJjR/ZaT35cREUTy6ZDM/NR3Irfqs2SrLwD7wc+0WGls4FfLDE4cYAMECoxOwDf
 0cacBaAzX7aZWXtXYpJJWYuDXlC6sl+WPlne5nRaeM9nHg6mkU48UD6hpOIKlqgDB+pD
 BK7Q==
X-Gm-Message-State: AOAM530UFmGl0yKDZWHNi6aBkfLwNsjaRrJvRmmog3fGskG+0B44q/KD
 zACTtbYDR0Nfi9wlm88xAnbQd4GG5oH/vSwv7AeHxypyH3DVSJG0vyqvQgBgqcsWnoBjM1UsIdl
 ykkk+gFLToO9WvE2njyQVxa0lPNXsGec=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr9698862qkn.273.1611743703822; 
 Wed, 27 Jan 2021 02:35:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBGmHDFrSvR5TuUUSXcjUf7hAOlX/McwWEL70TWsbwSNUhDXzasTM69/BOKXgqMTYAijMJCo1y88PKMfG8y1g=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr9698842qkn.273.1611743703613; 
 Wed, 27 Jan 2021 02:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20210126103502.260758-1-stefanha@redhat.com>
 <20210126181604.1a4c69c6@bahia.lan>
 <CAOssrKdh3kqKN4uGE=s5eiymd2MXKsRXUegqRH-TFhqYOK7WOA@mail.gmail.com>
 <20210127112023.0e97f909@bahia.lan>
In-Reply-To: <20210127112023.0e97f909@bahia.lan>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Wed, 27 Jan 2021 11:34:52 +0100
Message-ID: <CAOssrKfezsvcECQ=mO_4T2B09e+2S4LA3=_U6TQyiTtPbE=OYg@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: prevent opening of special
 files (CVE-2020-35517)
To: Greg Kurz <groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 11:20 AM Greg Kurz <groug@kaod.org> wrote:
>
> On Wed, 27 Jan 2021 10:25:28 +0100
> Miklos Szeredi <mszeredi@redhat.com> wrote:
>
> > On Tue, Jan 26, 2021 at 6:18 PM Greg Kurz <groug@kaod.org> wrote:
> > >
> > > On Tue, 26 Jan 2021 10:35:02 +0000
> > > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > > The patch looks pretty good to me. It just seems to be missing a change in
> > > lo_create():
> > >
> > >     fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
> > >                 mode);
> > >
> > > A malicious guest could have created anything called ${name} in this directory
> > > before calling FUSE_CREATE and we'll open it blindly, or I'm missing something ?
> >
> > Right, this seems like an omission.
> >
> > Also the "& ~O_NOFOLLOW" looks like a copy-paste bug, since unlike
> > lo_open(), lo_create() is not opening a proc symlink.
> >
> > So that should be replaced with "| O_NOFOLLOW"
> >
>
>
> Yes, I've realized that later on. We should definitely enforce O_NOFOLLOW
> to avoid symlink escapes.
>
> Then comes the case of special files... A well-known case is the FIFO that
> causes openat() to block as described in my response. FWIW, we addressed
> this one in 9P by adding O_NONBLOCK and fixing the flags to the client
> expectation with fcntl(F_SETFL). But this is just a protection against
> being blocked. Blindly opening a special file can lead to any kind of
> troubles you can think of... so it really looks that the only sane way
> to be safe from such an attack is to forbid openat() of special files at
> the filesystem level.

Another solution specifically for O_CREAT without O_EXCL would be to
turn it into an exclusive create.   If that fails with EEXIST then try
the normal open path (open with O_PATH, fstat, open proc symlink).  If
that fails with ENOENT, then retry the whole thing a certain number of
times.  If it still fails then somebody is definitely messing with us
and we can fail the request with EIO.

Rather ugly, but I can't think of anything better.

Thanks,
Miklos


