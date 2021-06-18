Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D433AC6BD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:04:03 +0200 (CEST)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAPx-00060m-5h
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1luAKv-0002kj-48
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:58:49 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:41666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1luAKs-0008TX-Ki
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:58:48 -0400
Received: by mail-vs1-xe33.google.com with SMTP id c1so4560770vsh.8
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 01:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsf/bfPHFa0nxrG88lLbzUlXVP06mycj+u9DZUUwd9c=;
 b=SuzeIOnZn4xAykXuJTdnLum22ItvjPl1rfGk40MJlo/kFmxh0DCyOQK+Z7zpH1r0Kg
 AyRn/RvEFu1/rHAMH1SyjyqZENen+63lBnZBCaDNUuPmXNpeh6AeYVgN9C+D/s1lNTxm
 iGm/5xtNHCEIvtRXafYATtur1vCqDKk11KTno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsf/bfPHFa0nxrG88lLbzUlXVP06mycj+u9DZUUwd9c=;
 b=FnBqG+UgZymTh3PC4KVRExXbzmwEhxKC248udG8Eq1ThsLebp5ddlg5zySMoz9xSK5
 Tb/3XlSlXlVLRw56fXJLOq+MWZmo/bz3L/vNiimWmfL8KXR4thJLpV9flEnvpD0wANzv
 Gwx2dWhU2/xAArrQq/G7TvpcqPisi5XIm1i94zyNjRWdjWw67EcwMhxQkT6yWzROnuNh
 IxDo/xsg+nz1ZS7CvQP3J9yh0iT+DwUU9bIfdUk0nQa9bKYoZN+HQyEnBYRiNbX7UjTU
 No3wCt7p5GkwoIEH55/RybOeCqz6aig3z6ibWvCB7DnL5IlUCJadg6qzX/ZDddha+NkW
 quTw==
X-Gm-Message-State: AOAM53325F6iRnq/r3Z8Q2Qk7uO1ufdeC5FGbmP2pcxWpDiLaKKt3Vtv
 FkGfzixFwqOv4hlZfkD35V64DC395DhDgrnef9s+nw==
X-Google-Smtp-Source: ABdhPJz43ffJAPfBiijNBx2TgvtcYOvQKX6/zAjJq//1GDsX04lu3oJYTfHPqJICr+mE3n1cUShVPZTbBBUNO1Wyjns=
X-Received: by 2002:a67:f659:: with SMTP id u25mr5503423vso.9.1624006724137;
 Fri, 18 Jun 2021 01:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210617141518.304659-1-groug@kaod.org>
In-Reply-To: <20210617141518.304659-1-groug@kaod.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 18 Jun 2021 10:58:33 +0200
Message-ID: <CAJfpegtpvU6Z6hQ-NKh-shN+Pux7+XzXwNK_Ro8YpfA-3tCOkg@mail.gmail.com>
Subject: Re: [PATCH] virtiofsd: Don't allow file creation with FUSE_OPEN
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=miklos@szeredi.hu; helo=mail-vs1-xe33.google.com
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

On Thu, 17 Jun 2021 at 16:15, Greg Kurz <groug@kaod.org> wrote:
>
> A well behaved FUSE client uses FUSE_CREATE to create files. It isn't
> supposed to pass O_CREAT along a FUSE_OPEN request, as documented in
> the "fuse_lowlevel.h" header :
>
>     /**
>      * Open a file
>      *
>      * Open flags are available in fi->flags. The following rules
>      * apply.
>      *
>      *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
>      *    filtered out / handled by the kernel.
>
> But if it does anyway, virtiofsd crashes with:
>
> *** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: terminated
>
> This is because virtiofsd ends up passing this flag to openat() without
> passing a mode_t 4th argument which is mandatory with O_CREAT, and glibc
> aborts.
>
> The offending path is:
>
> lo_open()
>     lo_do_open()
>         lo_inode_open()
>
> Other callers of lo_inode_open() only pass O_RDWR and lo_create()
> passes a valid fd to lo_do_open() which thus doesn't even call
> lo_inode_open() in this case.
>
> Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
> in lo_open() and return an error to the client : EINVAL since this is
> already what glibc returns with other illegal flag combinations.
>
> The FUSE filesystem doesn't currently support O_TMPFILE, but the very
> same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
> that as well.
>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  tools/virtiofsd/passthrough_ll.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 49c21fd85570..14f62133131c 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2145,6 +2145,12 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>          return;
>      }
>
> +    /* File creation is handled by lo_create() */
> +    if (fi->flags & (O_CREAT | O_TMPFILE)) {
> +        fuse_reply_err(req, EINVAL);
> +        return;
> +    }
> +

Okay.  Question comes to mind whether the check should be even more
strict, possibly allowing just a specific set of flags, and erroring
out on everything else?

AFAICS linux kernel should never pass anything to FUSE_OPEN outside of this set:

O_RDONLY
O_WRONLY
O_RDWR
O_APPEND
O_NDELAY
O_NONBLOCK
__O_SYNC
O_DSYNC
FASYNC
O_DIRECT
O_LARGEFILE
O_NOFOLLOW
O_NOATIME

A separate question is whether virtiofsd should also be silently
ignoring some of the above flags.

Thanks,
Miklos



>      err = lo_do_open(lo, inode, -1, fi);
>      lo_inode_put(lo, &inode);
>      if (err) {
> --
> 2.31.1
>

