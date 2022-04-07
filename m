Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92CB4F8049
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:16:05 +0200 (CEST)
Received: from localhost ([::1]:35682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncRzY-00036q-E9
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ncRtl-0007AU-MF
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ncRti-0004o7-Kd
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649337001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RSPsTKewFzeGGptvWX+bfujw+SGmreZbMKS4KROMUNk=;
 b=LAi6cPQMShvorNHttYQPYgmeIf4rBx5j2fqfDono5Lpc7rwZ/ix/Chi+z7v2ksQfPTs1Jv
 qt5usePGAJBtqLzrX45Dmj5k6/yxDmSGl7vZYzWOEUy91kHmeWczzTJjswIAVV5w832V2N
 k6Zi0g5028VzB48AbArbHPXazFXYCk8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-cAJh3i8TOO-kyPdLXQ67lg-1; Thu, 07 Apr 2022 09:10:00 -0400
X-MC-Unique: cAJh3i8TOO-kyPdLXQ67lg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D04D23C37F25;
 Thu,  7 Apr 2022 13:09:59 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.8.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45AB4404776B;
 Thu,  7 Apr 2022 13:09:59 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id ED3FB220EFF; Thu,  7 Apr 2022 09:09:58 -0400 (EDT)
Date: Thu, 7 Apr 2022 09:09:58 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PULL 09/12] virtiofsd: Create new file with security context
Message-ID: <Yk7ipp68vW9AOVQN@redhat.com>
References: <20220217172500.60500-1-dgilbert@redhat.com>
 <20220217172500.60500-10-dgilbert@redhat.com>
 <CAFEAcA9m2U2fcUYXpRJwt09UgGqDA2K3BDt1xgXZL63jc1EWEQ@mail.gmail.com>
 <Yk7cs6xSImIyDqpZ@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yk7cs6xSImIyDqpZ@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, slp@redhat.com,
 sebastian.hasler@stuvus.uni-stuttgart.de, qemu-devel@nongnu.org,
 groug@kaod.org, virtio-fs@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 01:44:35PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Thu, 17 Feb 2022 at 17:40, Dr. David Alan Gilbert (git)
> > <dgilbert@redhat.com> wrote:
> > >
> > > From: Vivek Goyal <vgoyal@redhat.com>
> > >
> > > This patch adds support for creating new file with security context
> > > as sent by client. It basically takes three paths.
> > >
> > > - If no security context enabled, then it continues to create files without
> > >   security context.
> > >
> > > - If security context is enabled and but security.selinux has not been
> > >   remapped, then it uses /proc/thread-self/attr/fscreate knob to set
> > >   security context and then create the file. This will make sure that
> > >   newly created file gets the security context as set in "fscreate" and
> > >   this is atomic w.r.t file creation.
> > >
> > >   This is useful and host and guest SELinux policies don't conflict and
> > >   can work with each other. In that case, guest security.selinux xattr
> > >   is not remapped and it is passthrough as "security.selinux" xattr
> > >   on host.
> > >
> > > - If security context is enabled but security.selinux xattr has been
> > >   remapped to something else, then it first creates the file and then
> > >   uses setxattr() to set the remapped xattr with the security context.
> > >   This is a non-atomic operation w.r.t file creation.
> > >
> > >   This mode will be most versatile and allow host and guest to have their
> > >   own separate SELinux xattrs and have their own separate SELinux policies.
> > >
> > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > Message-Id: <20220208204813.682906-9-vgoyal@redhat.com>
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > Hi; Coverity reports some issues (CID 1487142, 1487195), because
> > it is not a fan of the error-handling pattern used in this code:
> > 
> > > +static int do_mknod_symlink_secctx(fuse_req_t req, struct lo_inode *dir,
> > > +                                   const char *name, const char *secctx_name)
> > > +{
> > > +    int path_fd, err;
> > > +    char procname[64];
> > > +    struct lo_data *lo = lo_data(req);
> > > +
> > > +    if (!req->secctx.ctxlen) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    /* Open newly created element with O_PATH */
> > > +    path_fd = openat(dir->fd, name, O_PATH | O_NOFOLLOW);
> > > +    err = path_fd == -1 ? errno : 0;
> > > +    if (err) {
> > > +        return err;
> > > +    }
> > 
> > We set err based on whether path_fd is -1 or not, but we decide
> > whether to early-return based on the value of err. Coverity
> > doesn't know that openat() will always set errno to something
> > non-zero if it returns -1, so it complains because it thinks
> > there's a code path where openat() returns -1, but errno is 0,
> > and so we don't take the early-return and instead continue
> > through all the code below to the "close(path_fd)", which
> > should not be being passed a negative value for the filedescriptor.
> > 
> > I could just mark these as false-positives, but it does seem a bit
> > odd that we are using two different conditions here. Perhaps it would
> > be better to rephrase? For instance, for the openat() we could write:
> > 
> >    path_fd = openat(dir->fd, name, O_PATH | O_NOFOLLOW);
> >    if (path_fd == -1) {
> >        return errno;
> >    }
> 
> That looks OK to me; please send a patch.
> 
> Some of the cases look like they need to just be a little careful that
> 'err' always gets set to 0 if there are later cases that might set err.

I think use of "err" to save errno pattern is used because in some
cases we can't return immediately after error. Instead we have to
take some actions to restore some state and then return.

So for this specific case, it looks fine because we don't have to
restore any state before returning.

Vivek
> 
> Dave
> 
> > and similarly for the openat() in open_set_proc_fscreate().
> > 
> > > +    sprintf(procname, "%i", path_fd);
> > > +    FCHDIR_NOFAIL(lo->proc_self_fd);
> > > +    /* Set security context. This is not atomic w.r.t file creation */
> > > +    err = setxattr(procname, secctx_name, req->secctx.ctx, req->secctx.ctxlen,
> > > +                   0);
> > > +    if (err) {
> > > +        err = errno;
> > > +    }
> > 
> > > +    FCHDIR_NOFAIL(lo->root.fd);
> > > +    close(path_fd);
> > > +    return err;
> > > +}
> > 
> > thanks
> > -- PMM
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 


