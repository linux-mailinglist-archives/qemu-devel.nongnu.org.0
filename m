Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9A399315
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 21:01:50 +0200 (CEST)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loW7h-0001Fg-9D
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 15:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1loW5o-0000MV-F9
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:59:52 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:33664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <miklos@szeredi.hu>) id 1loW5l-0002Fp-Ow
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:59:52 -0400
Received: by mail-ua1-x92e.google.com with SMTP id l12so1923596uai.0
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xMqi1U/4bpogj8gL6xewokjUIUPhsnYxL1cEHg1o1oc=;
 b=NcJE4QcamePJdDIryGMgGdSp9Ai1Vhg2vbHUWFVIGOgB7WgMGvWS63hq4HJagMG2eZ
 ElohhIAt/HKl32J1tGXPasF/JPH7gGYt7d3M9lMLhspvz4lSOLSlKXDJ2NH6Ukl2C6DH
 jXOgkMUI3lbZIaHxpg7ZvJTT3fbID1vWPJRug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xMqi1U/4bpogj8gL6xewokjUIUPhsnYxL1cEHg1o1oc=;
 b=j/wD4h8FxHvPWlQcf3hfHJrO/jeefjy691zgFJ8ZUWnIzKBzFq3fa2fZuIbCMekb2h
 rplndn16s/EFhFbvwJPLrl4z8BIl7AjMeJL/RG3V2yMqeASB1OgLbhSpiSx/U9BoGEop
 TRNRIWFnyIwf7ws3fTYaXEkwb9v8SwPLmG1PpefjUoQqv2keOq+Y9y35BJEBOtqnn3ca
 LU2AFbTze8tREZllokxBiyuQYYOrpMR8FjfDvojieYRxxpuo1Oa2Jr7tuxoyV/pTOcOZ
 2Pdru4tku8hu6ShCoVTf6aFHwoZvDe215zo6X9WuFenD2quUd+j4Kj+Cwwmqm/94kOx4
 aZ+w==
X-Gm-Message-State: AOAM531VA0KOPM0x9poaXlMnergIJkOstwoL4ial/RYhPtKkZ+XGJj7f
 bSGJp1vEhShY45Tgsos3Kji4NnonD0XK4c6ML5RMQA==
X-Google-Smtp-Source: ABdhPJxy2GJOeKxYkm6qsjDojD2uCir1ffwJZA0qYVbWv1Mxofq7hCQCBrungszJNoAHkJeGb1l7I8Kj3SFLPDku/1c=
X-Received: by 2002:a1f:30cd:: with SMTP id w196mr24442445vkw.3.1622660386021; 
 Wed, 02 Jun 2021 11:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210512125544.9536-1-mreitz@redhat.com>
 <20210512125544.9536-2-mreitz@redhat.com>
 <20210602181958.GC115492@redhat.com>
In-Reply-To: <20210602181958.GC115492@redhat.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 2 Jun 2021 20:59:34 +0200
Message-ID: <CAJfpegtKjx7y8+bMQUivjxHuF0iiLYxKCtd0H3AisVymHHjtTA@mail.gmail.com>
Subject: Re: [PATCH 1/3] virtiofsd: Find original inode ID of mount points
To: Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=miklos@szeredi.hu; helo=mail-ua1-x92e.google.com
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 20:20, Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Wed, May 12, 2021 at 02:55:42PM +0200, Max Reitz wrote:
> > Mount point directories represent two inodes: On one hand, they are a
> > normal directory on their parent filesystem.  On the other, they are the
> > root node of the filesystem mounted there.  Thus, they have two inode
> > IDs.
> >
> > Right now, we only report the latter inode ID (i.e. the inode ID of the
> > mounted filesystem's root node).  This is fine once the guest has
> > auto-mounted a submount there (so this inode ID goes with a device ID
> > that is distinct from the parent filesystem), but before the auto-mount,
> > they have the device ID of the parent and the inode ID for the submount.
> > This is problematic because this is likely exactly the same
> > st_dev/st_ino combination as the parent filesystem's root node.  This
> > leads to problems for example with `find`, which will thus complain
> > about a filesystem loop if it has visited the parent filesystem's root
> > node before, and then refuse to descend into the submount.
> >
> > There is a way to find the mount directory's original inode ID, and that
> > is to readdir(3) the parent directory, look for the mount directory, and
> > read the dirent.d_ino field.  Using this, we can let lookup and
> > readdirplus return that original inode ID, which the guest will thus
> > show until the submount is auto-mounted.  (Then, it will invoke getattr
> > and that stat(2) call will return the inode ID for the submount.)
>
> [ CC miklos ]
>
> Hi Max,
>
> Though we discussed this in chat room, I am still responding to this
> email with the concern I have, so that there is a record of it.
>
> So with this patch for FUSE_LOOKUP  we always return submount's parentinode
> id and with GETATTR request we return actual inode id of submount. That
> kind of bothers me a bit as we are assuming that there is always going
> to be a GETATTR request after FUSE_LOOKUP. FUSE_LOOKUP itself has attrs
> returned with it and it might happen that after FUSE_LOOKUP, FUSE_GETATTR
> might not be called at all because FUSE_LOOKUP itself got the latest
> updated attrs with certain timeout.
>
> For example, if I call stat on a normal file (not submount), I see that
> after FUSE_LOOKUP, no FUSE_GETATTR request is going and
> fuse_update_get_attr() is using attrs from locally cached inode attrs.
>
> But same thing does not seem to be happening in case of submount. Once
> submount is created in guest, I see that we never seem to be calling
> ->revalidate() on newly created dentry of submount root. I am not sure
> why. And that means we don't do FUSE_LOOKUP and that means FUSE_GETATTR
> always gets called.

Yes, this sounds normal.

The lookup sequence for "/mnt/virtiofs/dir1/submount/file" will be:

LOOKUP(1, "dir")
    create inode I1 in sb1
    create dentry "dir" with inode I1 in sb1
LOOKUP(I1, "submount")
    create inode I2 in sb1, set S_AUTOMOUNT
    create dentry "submount" with inode I2 in sb1
    automount triggered:
    create sb2
    create inode I2 in sb2
    create dentry "/" with inode I2 in sb2
GETATTR(I2)
     fill inode I2
LOOKUP(I2, "file")
     create inode I3
     create dentry "file" with inode I3 in sb2

Notice how there's two inodes numbered I2, but in separate sb's.
However the server has only the notion of a single I2 inode which is
the root of the submount, since the mountpoint is not visible (except
for d_ino in readdir()).

Now AFAICS what this patch does is set the inode number in the
attributes returned by LOOKUP(I1, "submount") to the covered inode, so
that AT_NO_AUTOMOUNT stat will return the correct value.   While this
seems to work, it's not a fundamental fix to the problem, since the
attributes on sb1/I2 will time out and the next stat(...,
AT_NO_AUTOMOUNT) will trigger a GETATTR request, which will return the
inode number of the submount root.

Solving this properly would mean that the server would have to
generate separate nodeid's for the mountpoint and the submount root
and the protocol would have to be extended so that this information
could be transferred to the client.

Not sure whether this is worth it or not.

Thanks,
Miklos

