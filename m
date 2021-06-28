Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E96E3B63AB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:57:14 +0200 (CEST)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxshF-0004zc-NI
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lxsfM-0002Ss-F2
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:55:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lxsfF-0004HX-NM
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624892105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=44GqLlX3J+6C/s7Q19SARKDqVBTs4IKCbcLEGhHNXyU=;
 b=DAvjvG8WfPEQZKglb6TeaKf/1WBFG6z0UBhSu834LQJhvtEmGm7oSz+W6/MZmlkbzrYd2X
 IAh3K2XqDNLRqT7Pqls3MPVjPxSIoe5mM+y7lV2Lq020d6bNDYgMRdHYLabBZDG7Fqxe89
 jqc0kEEAN1SQtOWyHsMVhhWX594Bc5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-CKB7Y65eNqu_mWXEY3ztqQ-1; Mon, 28 Jun 2021 10:55:03 -0400
X-MC-Unique: CKB7Y65eNqu_mWXEY3ztqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2D951054F9C;
 Mon, 28 Jun 2021 14:55:01 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-225.rdu2.redhat.com [10.10.115.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E8B660C13;
 Mon, 28 Jun 2021 14:54:54 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 9C37722054F; Mon, 28 Jun 2021 10:54:53 -0400 (EDT)
Date: Mon, 28 Jun 2021 10:54:53 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v7 1/7] virtiofsd: Fix fuse setxattr() API
 change issue
Message-ID: <20210628145453.GA1818333@redhat.com>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-2-vgoyal@redhat.com>
 <YNng0CPIFHxDIE3a@work-vm>
MIME-Version: 1.0
In-Reply-To: <YNng0CPIFHxDIE3a@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: virtio-fs@redhat.com, Nikolaus Rath <Nikolaus@rath.org>,
 qemu-devel@nongnu.org, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 03:46:40PM +0100, Dr. David Alan Gilbert wrote:
> * Vivek Goyal (vgoyal@redhat.com) wrote:
> > With kernel header updates fuse_setxattr_in struct has grown in size.
> > But this new struct size only takes affect if user has opted in
> > for fuse feature FUSE_SETXATTR_EXT otherwise fuse continues to
> > send "fuse_setxattr_in" of older size. Older size is determined
> > by FUSE_COMPAT_SETXATTR_IN_SIZE.
> > 
> > Fix this. If we have not opted in for FUSE_SETXATTR_EXT, then
> > expect that we will get fuse_setxattr_in of size FUSE_COMPAT_SETXATTR_IN_SIZE
> > and not sizeof(struct fuse_sexattr_in).
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> 
> Yeh it's a bit of a grim fix, but I think it's the best we can do, and
> we need to get it in since the headers have already been merged.
> (I don't think libfuse has a fix for this in yet itself, but it might
> survive because it doesn't bother copying the data like we do with
> mbuf).

[ CC Niklaus Rath]

libfuse will need a fix as well once they move to 5.13 kernel headers.
As of now they seem to be still working with 5.2 kernel headers.

commit 249942f6411042c4af18bd10438da34801cce02b
Author: Kirill Smelkov <kirr@nexedi.com>
Date:   Tue Jul 9 23:54:09 2019 +0300

    Sync fuse_kernel.h with Linux 5.2 (#433)

Thanks
Vivek

> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> > ---
> >  tools/virtiofsd/fuse_common.h   | 5 +++++
> >  tools/virtiofsd/fuse_lowlevel.c | 7 ++++++-
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> > index fa9671872e..0c2665b977 100644
> > --- a/tools/virtiofsd/fuse_common.h
> > +++ b/tools/virtiofsd/fuse_common.h
> > @@ -372,6 +372,11 @@ struct fuse_file_info {
> >   */
> >  #define FUSE_CAP_HANDLE_KILLPRIV_V2 (1 << 28)
> >  
> > +/**
> > + * Indicates that file server supports extended struct fuse_setxattr_in
> > + */
> > +#define FUSE_CAP_SETXATTR_EXT (1 << 29)
> > +
> >  /**
> >   * Ioctl flags
> >   *
> > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> > index 7fe2cef1eb..c2b6ff1686 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.c
> > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > @@ -1419,8 +1419,13 @@ static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
> >      struct fuse_setxattr_in *arg;
> >      const char *name;
> >      const char *value;
> > +    bool setxattr_ext = req->se->conn.want & FUSE_CAP_SETXATTR_EXT;
> >  
> > -    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> > +    if (setxattr_ext) {
> > +        arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> > +    } else {
> > +        arg = fuse_mbuf_iter_advance(iter, FUSE_COMPAT_SETXATTR_IN_SIZE);
> > +    }
> >      name = fuse_mbuf_iter_advance_str(iter);
> >      if (!arg || !name) {
> >          fuse_reply_err(req, EINVAL);
> > -- 
> > 2.25.4
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
> 


