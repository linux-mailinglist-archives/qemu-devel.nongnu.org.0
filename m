Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C10931DC18
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 16:25:58 +0100 (CET)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCOiD-000737-Fc
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 10:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1lCOgU-00065f-7Z
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:24:10 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:38320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1lCOgR-0002iR-U5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:24:09 -0500
Received: by mail-vs1-xe30.google.com with SMTP id l192so6751473vsd.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 07:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nN7jya7fChsML9MEHG3PnvzmEDHji9tedC6c5+Y2oD8=;
 b=OkYPJCCYQRPx4CJviYQnV1NkHd3ofJ519Qs0wAt4shrQMe/Y4ZZF65b3PRh0vpHAAX
 QqI/oAVjfluVtlG0qtbFbdpjCNNj237r9hK2kCOjDeRWVr4PR3RnDEBMu/3Uy9jRQM8R
 gVTOV43bsG1ugJHU/qNHxbGXhziUIpQO6/7zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nN7jya7fChsML9MEHG3PnvzmEDHji9tedC6c5+Y2oD8=;
 b=Tzfhfg9GaEQ+Fa/E4PG5JRoh0MmJTWuZR6ZPmtQ5NeVTzqE0cuO8zRL9uX87DEmnip
 dtVr4v8RMk3Y5JMcR826yyajh2V3ZTtZ8tgcHGgiEsTReotiOtUqhTsYU/ijGstP563e
 ovcwSv3jAbtyv71OvFoSwKzocqB0HgqnO/u5G/VJv+3wpW+622j258005VYKfrZCEtAo
 iTj3cbzAEoQXwR/e0yMoRPqNNNz7oWX+jl1HxZd5+9Xt41QBqXAYk/246ipSOmOW77Od
 wmV4xhRQ5uTmQ6oNmnyhoX4Faura9SeU2d+BXu2ksJJt3NDNjcH0gUAjayQgf9b9AckQ
 mthQ==
X-Gm-Message-State: AOAM531KRKX0pfoCTqGxABN6uv4MbV6KXO5TuUYSZu/gHpvVVzsHofjU
 Pdu7ojbCSAsjjmQDYoBv/4VLFRaAdkgZpeAO2Dyj0g==
X-Google-Smtp-Source: ABdhPJxXa6VsnxMfjQCx4f6EVexOjVKvI6j08V+qkHz5USTUXEDkTM9kY7xY+CFVOdfYnQFokFDrjjw+YQYYuzTp858=
X-Received: by 2002:a67:c992:: with SMTP id y18mr15336430vsk.7.1613575445560; 
 Wed, 17 Feb 2021 07:24:05 -0800 (PST)
MIME-Version: 1.0
References: <20210216233611.33400-1-vgoyal@redhat.com>
 <20210216233611.33400-2-vgoyal@redhat.com>
 <CAJfpegspJGL_W+8zaXyHfuAhtB_Q7V0YyOZJEhpCd=KaL_W71A@mail.gmail.com>
 <20210217150721.GB31184@redhat.com>
In-Reply-To: <20210217150721.GB31184@redhat.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 17 Feb 2021 16:23:54 +0100
Message-ID: <CAJfpegvTav=VZM-x5gWWg==Zpcp1NtGjo=jh2XyxVOROPG95mQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] virtiofsd: Add an option to enable/disable posix acls
To: Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=miklos@szeredi.hu; helo=mail-vs1-xe30.google.com
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, Luis Henriques <lhenriques@suse.de>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 4:07 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Wed, Feb 17, 2021 at 09:53:04AM +0100, Miklos Szeredi wrote:
> > On Wed, Feb 17, 2021 at 12:36 AM Vivek Goyal <vgoyal@redhat.com> wrote:
> > >
> > > fuse has an option FUSE_POSIX_ACL which needs to be opted in by fuse
> > > server to enable posix acls.
> > >
> > > Add virtiofsd option "-o posix_acl/no_posix_acl" to let users enable/disable
> > > posix acl support. By default it is disabled as of now.
> >
> > If I read the code correctly, then no_posix_acl will still result in
> > system.posix_acl_* xattr ops being passed through to virtiofsd, which
> > will forward them to the underlying fs, resulting in posix acls
> > appearing to work, but doing so incorrectly (i.e. no change from
> > previous behavior).
>
> Yes, and this is confuing me a lot. fuse server has not indicated
> support for POSIX_ACL, still user can get and set ACLs. fuse_xattr_get()
> and fuse_xattr_set() must be kicking in.
>
> I do see that we have fuse_no_acl_xattr_handlers and that should
> be able to block setting/getting acls if acl support is not there
> but we register it only if we are not mounted in init_user_ns.
>
>         if (sb->s_user_ns != &init_user_ns)
>                 sb->s_xattr = fuse_no_acl_xattr_handlers;
>
> So question is, should fuse client be fixed as well to block setting
> and getting acls if fuse server does not support ACL? Or we now need
> to keep it around for backward compatibility.

Yes, this is a compatibility thing.   User namespaces don't work
without actual ACL ops, so this was disabled in that case and no
backward compatibility worries in that case.   We should have disabled
this for virtiofs from the start, but at this point we are again stuck
with a backward compatibility issue.

Alternatively make posix_acl the default, hence fixing the bad
behavior is unlikely to cause a regression.

>
> > Possibly better would be to have three different
> > modes of operation:
> >
> > 1) no option: default fall back to broken acl support for backward
> > compat (this could be removed in the future)
>
> What about FUSE_DONT_MASK in this mode. ACLs are not enabled but
> user can get/set these. Should that mean we still honor default
> acl and not apply umask?
>
> Probably I should opt for FUSE_DONT_MASK only if posix_acl support is
> enabled. Given this does not work even today (atleast for virtiofs), so
> it is not a backward compatibility issue. And its confusing anyway.
>
> > 2) no_posix_acl: really disable acl support
>
> That is block getting and setting system.posix_acl xattr. Will do that.
> I think we will have to block it even if somebody has remapped xattrs
> in virtiofsd.

Okay.

Thanks,
Miklos

