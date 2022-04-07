Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFB4F7F6D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 14:47:31 +0200 (CEST)
Received: from localhost ([::1]:42290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncRXt-000431-R1
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 08:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncRVH-0002z6-0H
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 08:44:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncRVD-0000i6-PX
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 08:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649335481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X+AQGml92zzY4afKgRkhm++X3C/hdxbNE0FILlqvuIA=;
 b=ilX1MkiTp1S4Z/XgWxW7Xlkkl2cfz4OuPD7vmU/T1Asy5YHx3qMJpggrJTznuOC8XxF/Fy
 fpk08td6ST2VyyviKVimm+VGcnrx9v8h/vfN2QULRGaMjWz0OMmzTW0WVMn2OdzORs+D0H
 ntQjmk26YhqngoWf1Ka1/YhCqW49AMk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-XkZAK3R0O4aPBRW9LacDAw-1; Thu, 07 Apr 2022 08:44:38 -0400
X-MC-Unique: XkZAK3R0O4aPBRW9LacDAw-1
Received: by mail-wm1-f70.google.com with SMTP id
 189-20020a1c02c6000000b0038e6c4c6472so4537756wmc.1
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 05:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X+AQGml92zzY4afKgRkhm++X3C/hdxbNE0FILlqvuIA=;
 b=JENsGkKI3BSUILEcvhuRYfjkhcYza3WjIwr46BmcMQSR81ANvg+mHay7/KUOIZ03E2
 668dku8fMi5XvaJUlKXBQDJJQHX940ZGNfvbg93ReMXrqumwxlDnj9yy4mBVLXvvjdaN
 js3WeK3/Ofx60fIye6lS6Syvcl/vVBcBYknto6Y9VMW3UAxz+KwPRiJhbY7LyIORm7Er
 AO0PSIZ/NFAf9J6UFHX/qE5yM8ZPjq0pnDJ8EOyKvBTq4zI55lRYZFvaVfeXJOMm4J0o
 dD00y8vpkFjQ4XSQtSbP5IVeCk3I6H66s+E1fa8cvV4P/OhKYLaxxSm6rrVyASYcwVLL
 SVTQ==
X-Gm-Message-State: AOAM532KobUJoPAbZ9MubvnCE6iOasbfOgV89hL6iwJlpmKiI0Oq+c3G
 KdS6LAfcuQQS8ETJ+JCp5fRYPJ/SlW1Z65gZZ7bPWQ7Y7YzzpjqnTEHXiW4Plhft45wOonRbfTG
 Wg78hA241kT2+CLY=
X-Received: by 2002:a1c:f413:0:b0:37b:d1de:5762 with SMTP id
 z19-20020a1cf413000000b0037bd1de5762mr12246095wma.108.1649335477625; 
 Thu, 07 Apr 2022 05:44:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw28qA8ha7VWgBTkHWShGze6rExHD5fXQNNkJi3QyiG0u5ZsA1mQmS+2NHk/wAKykZNnvEdDQ==
X-Received: by 2002:a1c:f413:0:b0:37b:d1de:5762 with SMTP id
 z19-20020a1cf413000000b0037bd1de5762mr12246064wma.108.1649335477357; 
 Thu, 07 Apr 2022 05:44:37 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0038c949ef0d5sm9332503wmq.8.2022.04.07.05.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 05:44:36 -0700 (PDT)
Date: Thu, 7 Apr 2022 13:44:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 09/12] virtiofsd: Create new file with security context
Message-ID: <Yk7cs6xSImIyDqpZ@work-vm>
References: <20220217172500.60500-1-dgilbert@redhat.com>
 <20220217172500.60500-10-dgilbert@redhat.com>
 <CAFEAcA9m2U2fcUYXpRJwt09UgGqDA2K3BDt1xgXZL63jc1EWEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9m2U2fcUYXpRJwt09UgGqDA2K3BDt1xgXZL63jc1EWEQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: slp@redhat.com, sebastian.hasler@stuvus.uni-stuttgart.de,
 qemu-devel@nongnu.org, groug@kaod.org, virtio-fs@redhat.com,
 stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 17 Feb 2022 at 17:40, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: Vivek Goyal <vgoyal@redhat.com>
> >
> > This patch adds support for creating new file with security context
> > as sent by client. It basically takes three paths.
> >
> > - If no security context enabled, then it continues to create files without
> >   security context.
> >
> > - If security context is enabled and but security.selinux has not been
> >   remapped, then it uses /proc/thread-self/attr/fscreate knob to set
> >   security context and then create the file. This will make sure that
> >   newly created file gets the security context as set in "fscreate" and
> >   this is atomic w.r.t file creation.
> >
> >   This is useful and host and guest SELinux policies don't conflict and
> >   can work with each other. In that case, guest security.selinux xattr
> >   is not remapped and it is passthrough as "security.selinux" xattr
> >   on host.
> >
> > - If security context is enabled but security.selinux xattr has been
> >   remapped to something else, then it first creates the file and then
> >   uses setxattr() to set the remapped xattr with the security context.
> >   This is a non-atomic operation w.r.t file creation.
> >
> >   This mode will be most versatile and allow host and guest to have their
> >   own separate SELinux xattrs and have their own separate SELinux policies.
> >
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > Message-Id: <20220208204813.682906-9-vgoyal@redhat.com>
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Hi; Coverity reports some issues (CID 1487142, 1487195), because
> it is not a fan of the error-handling pattern used in this code:
> 
> > +static int do_mknod_symlink_secctx(fuse_req_t req, struct lo_inode *dir,
> > +                                   const char *name, const char *secctx_name)
> > +{
> > +    int path_fd, err;
> > +    char procname[64];
> > +    struct lo_data *lo = lo_data(req);
> > +
> > +    if (!req->secctx.ctxlen) {
> > +        return 0;
> > +    }
> > +
> > +    /* Open newly created element with O_PATH */
> > +    path_fd = openat(dir->fd, name, O_PATH | O_NOFOLLOW);
> > +    err = path_fd == -1 ? errno : 0;
> > +    if (err) {
> > +        return err;
> > +    }
> 
> We set err based on whether path_fd is -1 or not, but we decide
> whether to early-return based on the value of err. Coverity
> doesn't know that openat() will always set errno to something
> non-zero if it returns -1, so it complains because it thinks
> there's a code path where openat() returns -1, but errno is 0,
> and so we don't take the early-return and instead continue
> through all the code below to the "close(path_fd)", which
> should not be being passed a negative value for the filedescriptor.
> 
> I could just mark these as false-positives, but it does seem a bit
> odd that we are using two different conditions here. Perhaps it would
> be better to rephrase? For instance, for the openat() we could write:
> 
>    path_fd = openat(dir->fd, name, O_PATH | O_NOFOLLOW);
>    if (path_fd == -1) {
>        return errno;
>    }

That looks OK to me; please send a patch.

Some of the cases look like they need to just be a little careful that
'err' always gets set to 0 if there are later cases that might set err.

Dave

> and similarly for the openat() in open_set_proc_fscreate().
> 
> > +    sprintf(procname, "%i", path_fd);
> > +    FCHDIR_NOFAIL(lo->proc_self_fd);
> > +    /* Set security context. This is not atomic w.r.t file creation */
> > +    err = setxattr(procname, secctx_name, req->secctx.ctx, req->secctx.ctxlen,
> > +                   0);
> > +    if (err) {
> > +        err = errno;
> > +    }
> 
> > +    FCHDIR_NOFAIL(lo->root.fd);
> > +    close(path_fd);
> > +    return err;
> > +}
> 
> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


