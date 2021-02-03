Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F6530DD36
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:51:00 +0100 (CET)
Received: from localhost ([::1]:53614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JUi-0007L9-0w
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7JRh-0005XY-BG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:47:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7JRf-0002tD-Lv
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612363670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mEAuE0pw2FrDmE3oamjQNR28YzunNWY7GGBbLuvaFLI=;
 b=UXpxhhtyLllyjStOhw2Aez4QinL4bik6zWgI48XveidZJf2f7BsqviOiJTnaGymGDI+6c8
 7CVKnniQIGfFtPl9M60LhWfjzhRsbSYI7gfOOX+lECtSYoUITYFv6FgQrQkAXSziYWpWWx
 5KVUw2scYCwFJlR1aBTTZwfWuSYOG5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-Vr4DCjsJMt-LPV9hq6OHMQ-1; Wed, 03 Feb 2021 09:47:46 -0500
X-MC-Unique: Vr4DCjsJMt-LPV9hq6OHMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E6D41076215;
 Wed,  3 Feb 2021 14:47:45 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0456F60C6C;
 Wed,  3 Feb 2021 14:47:32 +0000 (UTC)
Date: Wed, 3 Feb 2021 14:47:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 1/3] virtiofsd: extract lo_do_open() from lo_open()
Message-ID: <20210203144730.GJ2950@work-vm>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-2-stefanha@redhat.com>
 <20210203152035.374924b9@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210203152035.374924b9@bahia.lan>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 qemu-devel@nongnu.org, P J P <ppandit@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> On Wed,  3 Feb 2021 11:37:17 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> 
> > Both lo_open() and lo_create() have similar code to open a file. Extract
> > a common lo_do_open() function from lo_open() that will be used by
> > lo_create() in a later commit.
> > 
> > Since lo_do_open() does not otherwise need fuse_req_t req, convert
> > lo_add_fd_mapping() to use struct lo_data *lo instead.
> > 
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> 
> With the s/ENOMEM/-ENOMEM/ change in lo_do_open() suggested by patchew,

Isn't it actually the return -errno that's different from the original?

Dave

> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> >  tools/virtiofsd/passthrough_ll.c | 73 ++++++++++++++++++++------------
> >  1 file changed, 46 insertions(+), 27 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index 5fb36d9407..e63cbd3fb7 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -459,17 +459,17 @@ static void lo_map_remove(struct lo_map *map, size_t key)
> >  }
> >  
> >  /* Assumes lo->mutex is held */
> > -static ssize_t lo_add_fd_mapping(fuse_req_t req, int fd)
> > +static ssize_t lo_add_fd_mapping(struct lo_data *lo, int fd)
> >  {
> >      struct lo_map_elem *elem;
> >  
> > -    elem = lo_map_alloc_elem(&lo_data(req)->fd_map);
> > +    elem = lo_map_alloc_elem(&lo->fd_map);
> >      if (!elem) {
> >          return -1;
> >      }
> >  
> >      elem->fd = fd;
> > -    return elem - lo_data(req)->fd_map.elems;
> > +    return elem - lo->fd_map.elems;
> >  }
> >  
> >  /* Assumes lo->mutex is held */
> > @@ -1651,6 +1651,38 @@ static void update_open_flags(int writeback, int allow_direct_io,
> >      }
> >  }
> >  
> > +static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
> > +                      struct fuse_file_info *fi)
> > +{
> > +    char buf[64];
> > +    ssize_t fh;
> > +    int fd;
> > +
> > +    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > +
> > +    sprintf(buf, "%i", inode->fd);
> > +    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
> > +    if (fd == -1) {
> > +        return -errno;
> > +    }
> > +
> > +    pthread_mutex_lock(&lo->mutex);
> > +    fh = lo_add_fd_mapping(lo, fd);
> > +    pthread_mutex_unlock(&lo->mutex);
> > +    if (fh == -1) {
> > +        close(fd);
> > +        return ENOMEM;
> > +    }
> > +
> > +    fi->fh = fh;
> > +    if (lo->cache == CACHE_NONE) {
> > +        fi->direct_io = 1;
> > +    } else if (lo->cache == CACHE_ALWAYS) {
> > +        fi->keep_cache = 1;
> > +    }
> > +    return 0;
> > +}
> > +
> >  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
> >                        mode_t mode, struct fuse_file_info *fi)
> >  {
> > @@ -1691,7 +1723,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
> >          ssize_t fh;
> >  
> >          pthread_mutex_lock(&lo->mutex);
> > -        fh = lo_add_fd_mapping(req, fd);
> > +        fh = lo_add_fd_mapping(lo, fd);
> >          pthread_mutex_unlock(&lo->mutex);
> >          if (fh == -1) {
> >              close(fd);
> > @@ -1892,38 +1924,25 @@ static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
> >  
> >  static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
> >  {
> > -    int fd;
> > -    ssize_t fh;
> > -    char buf[64];
> >      struct lo_data *lo = lo_data(req);
> > +    struct lo_inode *inode = lo_inode(req, ino);
> > +    int err;
> >  
> >      fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
> >               fi->flags);
> >  
> > -    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > -
> > -    sprintf(buf, "%i", lo_fd(req, ino));
> > -    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
> > -    if (fd == -1) {
> > -        return (void)fuse_reply_err(req, errno);
> > -    }
> > -
> > -    pthread_mutex_lock(&lo->mutex);
> > -    fh = lo_add_fd_mapping(req, fd);
> > -    pthread_mutex_unlock(&lo->mutex);
> > -    if (fh == -1) {
> > -        close(fd);
> > -        fuse_reply_err(req, ENOMEM);
> > +    if (!inode) {
> > +        fuse_reply_err(req, EBADF);
> >          return;
> >      }
> >  
> > -    fi->fh = fh;
> > -    if (lo->cache == CACHE_NONE) {
> > -        fi->direct_io = 1;
> > -    } else if (lo->cache == CACHE_ALWAYS) {
> > -        fi->keep_cache = 1;
> > +    err = lo_do_open(lo, inode, fi);
> > +    lo_inode_put(lo, &inode);
> > +    if (err) {
> > +        fuse_reply_err(req, err);
> > +    } else {
> > +        fuse_reply_open(req, fi);
> >      }
> > -    fuse_reply_open(req, fi);
> >  }
> >  
> >  static void lo_release(fuse_req_t req, fuse_ino_t ino,
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


