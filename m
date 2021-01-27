Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945C305DF1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:11:25 +0100 (CET)
Received: from localhost ([::1]:49668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4lXY-0001Pg-4I
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4lWK-0000zk-2p
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4lWH-0000HV-2q
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611756603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=apkZ2LygClKwRAMGKQRf7A7KKdzTzxb6rmf6RY3sIm4=;
 b=PCrJJE0zweX3LBpSC8rkGwfH/6aDjMC0KpQGCpsKKFK4xE9aAFpjPascioWXiGZoRc/P7J
 ImI/8BK12X9PExS7Ee5ruF6KlXXP7NCZnkKKLiNwHfquX/DjAKKErPZKSvkQqH12WxDKs1
 l3BsKHILSlhB9AuHOJe7qzF4RrNd14w=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-yVufXS9yNhqA-R8gVjOAlQ-1; Wed, 27 Jan 2021 09:10:02 -0500
X-MC-Unique: yVufXS9yNhqA-R8gVjOAlQ-1
Received: by mail-qk1-f199.google.com with SMTP id y79so1036441qka.23
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 06:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=apkZ2LygClKwRAMGKQRf7A7KKdzTzxb6rmf6RY3sIm4=;
 b=CI8ZG+VYc2v1VSuZYvgX/m5LSJOxKecpGFqIqFBv1YBr4IavMOjFQjKV6cFcJO9WrQ
 bwvWWsR8v6CZnJC6Ezop/g7xdIT7bS/z3dZYy4FVeMI5admDIT0twF9qnxVC7SlZYe5W
 +WSudCCklHL6fYqnVmAS/931D+Cw8oPkOZDFgn3bwA/zHik6Er/dxELUntuqpWzDVORT
 GFWMQou9NsEUqK9joxqqtjUdwb8+Dv32REqiF0Kk97GRDHoMQ8r4bdPumqbDR3X37xYA
 4BPbnd9nDYFP5JnGoKKDeDDowkcaQwFX3IXihYNpgO86Rp1n2WtU6ohIEN3p6WP7XtjH
 JlSg==
X-Gm-Message-State: AOAM530oEmKJTD8P3USO5egUxaBezlaDDp1F3Q58nQK2ow+TjLGXNWQN
 pamvmiLkxTeeObSLiP+DBldSgyL9eoCKx1FnZHoISXQNkbwAS01LYRxB1lSpY90fr2CDpSGRB+n
 JKbi9JPOihgeBoa6x7Qz+SeXGI7HA8j8=
X-Received: by 2002:a37:788:: with SMTP id 130mr10812666qkh.390.1611756601495; 
 Wed, 27 Jan 2021 06:10:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0f8jCOHi/Udxtk8bj2ymEjBR09y/KDMJx29DAY8qiCwipQn0Nli9o3l9wRKBKAa5POVwo6Yka3Nac5Jos8Xo=
X-Received: by 2002:a37:788:: with SMTP id 130mr10812639qkh.390.1611756601261; 
 Wed, 27 Jan 2021 06:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20210126103502.260758-1-stefanha@redhat.com>
 <20210126181604.1a4c69c6@bahia.lan>
 <CAOssrKdh3kqKN4uGE=s5eiymd2MXKsRXUegqRH-TFhqYOK7WOA@mail.gmail.com>
 <20210127112023.0e97f909@bahia.lan>
 <CAOssrKfezsvcECQ=mO_4T2B09e+2S4LA3=_U6TQyiTtPbE=OYg@mail.gmail.com>
 <20210127144909.22dd778e@bahia.lan>
In-Reply-To: <20210127144909.22dd778e@bahia.lan>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Wed, 27 Jan 2021 15:09:50 +0100
Message-ID: <CAOssrKeN9iYT-Z46FVtzdKnWcTLfMqK77b1faf78m3XTXnEVGw@mail.gmail.com>
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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

On Wed, Jan 27, 2021 at 2:49 PM Greg Kurz <groug@kaod.org> wrote:
>
> On Wed, 27 Jan 2021 11:34:52 +0100
> Miklos Szeredi <mszeredi@redhat.com> wrote:

> > Another solution specifically for O_CREAT without O_EXCL would be to
> > turn it into an exclusive create.
>
> Would this added O_EXCL then appear on the client side, e.g. to
> guest userspace doing fcntl(F_GETFL) ?

No.  Guest kernel keeps track of open flags.

> > If that fails with EEXIST then try
> > the normal open path (open with O_PATH, fstat, open proc symlink).  If
>
> open(O_PATH | O_NOFOLLOW) + fstatat(AT_EMPTY_PATH|AT_SYMLINK_NOFOLLOW)
> would indeed allow to filter out anything that isn't a directory and
> to safely open the proc symlink.
>
> > that fails with ENOENT, then retry the whole thing a certain number of
>
> Indeed someone could have unlinked the file in the meantime, in which
> case the open(O_PATH | O_NOFOLLOW) would fail, but if it succeeds then
> we cannot hit ENOENT anymore AFAICT.

Right.

> > times.  If it still fails then somebody is definitely messing with us
> > and we can fail the request with EIO.
> >
>
> Not sure what the retry+timeout is trying to mitigate here... why not
> returning EIO right away ?

The semantics of O_CREATE are that it can fail neither because the
file exists nor because it doesn't.  This doesn't matter if the
exported tree is not modified outside of a single guest, because of
locking provided by the guest kernel.

However if we want to support shared access to a tree then O_CREAT
semantics should work even in the face of races due to external
modification of the tree.  I.e. following race:

virtiofsd: open(foo, O_CREAT | O_EXCL) -> EEXIST
other task: unlink(foo)
virtiofsd: open(foo, O_PATH | O_NOFOLLOW) -> ENOENT

To properly support the above the O_CREAT | O_EXCL open would need to
be retried.

Thanks,
Miklos


