Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E283B80C2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:18:39 +0200 (CEST)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyXIk-0003hP-3e
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyXHX-0002eq-Gx
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:17:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyXHU-0008QT-Gi
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625048239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lbB2hk9h3MfzxjLEmOAJgWjpVYSK8Gi7bUQhPpdZAHQ=;
 b=NFCZlTfZdX5NAEO9eWQzgTp2EdhhB9+F6oStKW5djoCluXNF60MZ3T0zgikeQdFLUji5t6
 iz0Wxx1J7WuOq17tataUbjayZPgwvVYiZtyv6YKARA+7Lyi1tEeXZx9CMTE0naAnWR6HVz
 1ehtmkAIawc6SXXpNwBog/PhejLxzRM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-SB8tmIg-PBmuBularWg34w-1; Wed, 30 Jun 2021 06:17:18 -0400
X-MC-Unique: SB8tmIg-PBmuBularWg34w-1
Received: by mail-wr1-f72.google.com with SMTP id
 g4-20020a5d64e40000b029012469ad3be8so699576wri.1
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 03:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lbB2hk9h3MfzxjLEmOAJgWjpVYSK8Gi7bUQhPpdZAHQ=;
 b=VDEp7GWw7NOi3BS7GIl7ZCD9Jm+iObYDr9131XEfQ+v6DAqvyAJ8Rv768vixyZ1+Iq
 ICA4pgcSGX/pZbyzEq9CGyk1ro+VJpskdcp3aOAJEJcoffavoWRRlE+0hVm7gNSjGiKw
 zR6WKwjTtjJjKHaDVmFb9MbHZO4VGrOAogo7FvVYwQ6my45csjArJV0rQ73u7q1vPT9Y
 BV/1QDEVfqc5j8i8tC1jJ91od0DM0XTZmIvpWYlD8y+yPVW18bvQAqCLY79JYjb63lfd
 cymHn1l21asZ1KtDuoUoh3y0D5Nx2u6iYZFjwdFnjca2lr386L5la+Pja2lh4MVuDncU
 idNg==
X-Gm-Message-State: AOAM532onchDCYQjWxXivvXZGTi8Z6E+C5WJb/VLMvCtu61R/J75DnZO
 FDb+PT1YZrD9NIRzlRnWucSwEoJTSNOfI9du9SqYSpld0+BbQ4+9AOQjJUZq0Er5LbJL5IUFkI5
 jsnUG6MLTShD16l8=
X-Received: by 2002:a5d:6dd2:: with SMTP id d18mr10714865wrz.94.1625048237570; 
 Wed, 30 Jun 2021 03:17:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQVChOCASoDoRHgozebqDKVTF1vUWrWkir6zes0lHbnLppKrqWjFxOAN5Z/6ccWdw/qOlHBw==
X-Received: by 2002:a5d:6dd2:: with SMTP id d18mr10714839wrz.94.1625048237375; 
 Wed, 30 Jun 2021 03:17:17 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id w8sm7800507wrt.83.2021.06.30.03.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 03:17:16 -0700 (PDT)
Date: Wed, 30 Jun 2021 11:17:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH v7 1/7] virtiofsd: Fix fuse setxattr() API
 change issue
Message-ID: <YNxEq0GfQJ+0tEl1@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-2-vgoyal@redhat.com>
 <YNng0CPIFHxDIE3a@work-vm> <20210629144431.02e2ce0c@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210629144431.02e2ce0c@bahia.lan>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
 Vivek Goyal <vgoyal@redhat.com>, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> On Mon, 28 Jun 2021 15:46:40 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > With kernel header updates fuse_setxattr_in struct has grown in size.
> > > But this new struct size only takes affect if user has opted in
> > > for fuse feature FUSE_SETXATTR_EXT otherwise fuse continues to
> > > send "fuse_setxattr_in" of older size. Older size is determined
> > > by FUSE_COMPAT_SETXATTR_IN_SIZE.
> > > 
> > > Fix this. If we have not opted in for FUSE_SETXATTR_EXT, then
> > > expect that we will get fuse_setxattr_in of size FUSE_COMPAT_SETXATTR_IN_SIZE
> > > and not sizeof(struct fuse_sexattr_in).
> > > 
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > 
> > Yeh it's a bit of a grim fix, but I think it's the best we can do, and
> > we need to get it in since the headers have already been merged.
> 
> You can also add:
> 
> Fixes: 278f064e4524 ("Update Linux headers to 5.13-rc4")
> 
> because this is basically what happened : this commit exposes the API
> breakage.
> 
> This is kinda problematic : linux kernel headers are updated globally,
> i.e. an header update merged by some other subsystem will unknowingly
> break virtiofsd each time we face a similar situation.
> 
> We could cope with it if the code was adapted to API changes when
> needed, e.g. this patch squashed into 278f064e4524 . It doesn't
> seem that can be achievable without some automation to detect
> buggy situations (e.g. code depends on the size of a structure).
> And even with that, it would still cause the subsystem that
> needs the header update to depend on other subsystems to
> fix the breakage.
> 
> Another possibility could maybe to stop doing global updates and
> let each subsystem handle the kernel headers it needs.
> 
> OR we could avoid breaking the API in the kernel in the first
> place.

That would be my preference!

Dave

> Thoughts ?
> 
> Anyway, the fix is good:
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> > (I don't think libfuse has a fix for this in yet itself, but it might
> > survive because it doesn't bother copying the data like we do with
> > mbuf).
> > 
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > > ---
> > >  tools/virtiofsd/fuse_common.h   | 5 +++++
> > >  tools/virtiofsd/fuse_lowlevel.c | 7 ++++++-
> > >  2 files changed, 11 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> > > index fa9671872e..0c2665b977 100644
> > > --- a/tools/virtiofsd/fuse_common.h
> > > +++ b/tools/virtiofsd/fuse_common.h
> > > @@ -372,6 +372,11 @@ struct fuse_file_info {
> > >   */
> > >  #define FUSE_CAP_HANDLE_KILLPRIV_V2 (1 << 28)
> > >  
> > > +/**
> > > + * Indicates that file server supports extended struct fuse_setxattr_in
> > > + */
> > > +#define FUSE_CAP_SETXATTR_EXT (1 << 29)
> > > +
> > >  /**
> > >   * Ioctl flags
> > >   *
> > > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> > > index 7fe2cef1eb..c2b6ff1686 100644
> > > --- a/tools/virtiofsd/fuse_lowlevel.c
> > > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > > @@ -1419,8 +1419,13 @@ static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
> > >      struct fuse_setxattr_in *arg;
> > >      const char *name;
> > >      const char *value;
> > > +    bool setxattr_ext = req->se->conn.want & FUSE_CAP_SETXATTR_EXT;
> > >  
> > > -    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> > > +    if (setxattr_ext) {
> > > +        arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> > > +    } else {
> > > +        arg = fuse_mbuf_iter_advance(iter, FUSE_COMPAT_SETXATTR_IN_SIZE);
> > > +    }
> > >      name = fuse_mbuf_iter_advance_str(iter);
> > >      if (!arg || !name) {
> > >          fuse_reply_err(req, EINVAL);
> > > -- 
> > > 2.25.4
> > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


