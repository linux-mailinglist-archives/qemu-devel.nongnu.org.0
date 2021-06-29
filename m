Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1643B7326
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:23:58 +0200 (CEST)
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDiW-0000kN-Iw
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lyDhQ-0008Ig-EZ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lyDhM-0001dn-Pt
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:22:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624972963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fBnUIlHrDNJlPB/S7fk4GArsg1oK5OrjCHAgW8M7V4I=;
 b=hDfb2toSKkKRR5VOLx7wFKSohoYl5TdK/WlvTZ72YNNDJnMAXWFOXuRnmSEucJ9z6xe+TT
 4vrpa3vagNynVz0Cy9/hBTyA9PNBJrBFlKzO+AVA6A9GzD67baM58M/LzDU/74EJbz0jYT
 BeJEQm5AcQB/u12GOmhJrndcbkL3Mr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-B44RAQwhNrmjqiz8bcoNXQ-1; Tue, 29 Jun 2021 09:22:41 -0400
X-MC-Unique: B44RAQwhNrmjqiz8bcoNXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6E1A804147;
 Tue, 29 Jun 2021 13:22:40 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-194.rdu2.redhat.com [10.10.116.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5E625D9F0;
 Tue, 29 Jun 2021 13:22:36 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 6FA0822054F; Tue, 29 Jun 2021 09:22:36 -0400 (EDT)
Date: Tue, 29 Jun 2021 09:22:36 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH v7 2/7] virtiofsd: Fix xattr operations
 overwriting errno
Message-ID: <20210629132236.GB5231@redhat.com>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-3-vgoyal@redhat.com>
 <YNnrT/mCw3w26/lT@work-vm> <20210629150343.5cf10a26@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210629150343.5cf10a26@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 03:03:43PM +0200, Greg Kurz wrote:
> On Mon, 28 Jun 2021 16:31:27 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > getxattr/setxattr/removexattr/listxattr operations handle regualar
> > > and non-regular files differently. For the case of non-regular files
> > > we do fchdir(/proc/self/fd) and the xattr operation and then revert
> > > back to original working directory. After this we are saving errno
> > > and that's buggy because fchdir() will overwrite the errno.
> > > 
> > > FCHDIR_NOFAIL(lo->proc_self_fd);
> > > ret = getxattr(procname, name, value, size);
> > > FCHDIR_NOFAIL(lo->root.fd);
> > > 
> > > if (ret == -1)
> > >     saverr = errno
> > > 
> > > In above example, if getxattr() failed, we will still return 0 to caller
> > > as errno must have been written by FCHDIR_NOFAIL(lo->root.fd) call.
> 
> This assertion doesn't look right.
> 
> From the errno(3) manual page:
> 
>        The value in errno is significant only when the return value of
>        the call indicated an error (i.e., -1 from most system calls; -1
>        or NULL from most library functions); a function that succeeds is
>        allowed to change errno.  The value of errno is never set to zero
>                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^
>        by any system call or library function.

Ok. So it will not set errno to 0. But it also says "a function that
succeeds is allowed to change errno". So that means a successful
fchdir(fd) can change errno to something else and we lost original
error code returned by getxattr() operation. Even "assert(fchdir_res == 0)"
will not kick in because fchdir() succeeded.

IOW, with current code we can still lose original error code as experienced
while executing getxattr()/setxattr()/listxattr(). So it makese sense
to fix it.

Vivek

> > > Fix all such instances and capture "errno" early and save in "saverr"
> > > variable.
> > > 
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > 
> > I think the existing code is actually safe; I don't think fchdir
> > will/should set errno unless there's an error, and we're explictly
> > asserting there isn't one.
> > 
> > However, I do prefer doing this save since we already have the save
> > variables and it makes the chance of screwing it up from any other
> > forgotten syscall less likely, so
> > 
> 
> Agreed. With this rationale in the changelog:
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > > ---
> > >  tools/virtiofsd/passthrough_ll.c | 16 ++++++++++------
> > >  1 file changed, 10 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > index 49c21fd855..ec91b3c133 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -2791,15 +2791,17 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
> > >              goto out_err;
> > >          }
> > >          ret = fgetxattr(fd, name, value, size);
> > > +        saverr = ret == -1 ? errno : 0;
> > >      } else {
> > >          /* fchdir should not fail here */
> > >          FCHDIR_NOFAIL(lo->proc_self_fd);
> > >          ret = getxattr(procname, name, value, size);
> > > +        saverr = ret == -1 ? errno : 0;
> > >          FCHDIR_NOFAIL(lo->root.fd);
> > >      }
> > >  
> > >      if (ret == -1) {
> > > -        goto out_err;
> > > +        goto out;
> > >      }
> > >      if (size) {
> > >          saverr = 0;
> > > @@ -2864,15 +2866,17 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
> > >              goto out_err;
> > >          }
> > >          ret = flistxattr(fd, value, size);
> > > +        saverr = ret == -1 ? errno : 0;
> > >      } else {
> > >          /* fchdir should not fail here */
> > >          FCHDIR_NOFAIL(lo->proc_self_fd);
> > >          ret = listxattr(procname, value, size);
> > > +        saverr = ret == -1 ? errno : 0;
> > >          FCHDIR_NOFAIL(lo->root.fd);
> > >      }
> > >  
> > >      if (ret == -1) {
> > > -        goto out_err;
> > > +        goto out;
> > >      }
> > >      if (size) {
> > >          saverr = 0;
> > > @@ -2998,15 +3002,15 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
> > >              goto out;
> > >          }
> > >          ret = fsetxattr(fd, name, value, size, flags);
> > > +        saverr = ret == -1 ? errno : 0;
> > >      } else {
> > >          /* fchdir should not fail here */
> > >          FCHDIR_NOFAIL(lo->proc_self_fd);
> > >          ret = setxattr(procname, name, value, size, flags);
> > > +        saverr = ret == -1 ? errno : 0;
> > >          FCHDIR_NOFAIL(lo->root.fd);
> > >      }
> > >  
> > > -    saverr = ret == -1 ? errno : 0;
> > > -
> > >  out:
> > >      if (fd >= 0) {
> > >          close(fd);
> > > @@ -3064,15 +3068,15 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
> > >              goto out;
> > >          }
> > >          ret = fremovexattr(fd, name);
> > > +        saverr = ret == -1 ? errno : 0;
> > >      } else {
> > >          /* fchdir should not fail here */
> > >          FCHDIR_NOFAIL(lo->proc_self_fd);
> > >          ret = removexattr(procname, name);
> > > +        saverr = ret == -1 ? errno : 0;
> > >          FCHDIR_NOFAIL(lo->root.fd);
> > >      }
> > >  
> > > -    saverr = ret == -1 ? errno : 0;
> > > -
> > >  out:
> > >      if (fd >= 0) {
> > >          close(fd);
> > > -- 
> > > 2.25.4
> > > 
> 


