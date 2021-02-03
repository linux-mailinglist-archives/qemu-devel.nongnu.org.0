Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A6030DE93
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:48:03 +0100 (CET)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KNu-0007ey-3Y
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7KLM-0006bL-7R
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:45:24 -0500
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:55961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7KLK-0004Po-2c
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:45:24 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 483FD261C10;
 Wed,  3 Feb 2021 16:45:18 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Feb 2021
 16:45:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00169ec5e24-d03a-4023-ab84-9129b746cdb4,
 14764A637080470E006017DF0F40374BD57DCD59) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 3 Feb 2021 16:45:10 +0100
From: Greg Kurz <groug@kaod.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 1/3] virtiofsd: extract lo_do_open() from lo_open()
Message-ID: <20210203164510.08ab60db@bahia.lan>
In-Reply-To: <20210203144730.GJ2950@work-vm>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-2-stefanha@redhat.com>
 <20210203152035.374924b9@bahia.lan> <20210203144730.GJ2950@work-vm>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 0c828325-e58a-4d8a-846d-7f40ef42327c
X-Ovh-Tracer-Id: 14199005202525690290
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepshhlphesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=188.165.42.229; envelope-from=groug@kaod.org;
 helo=4.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 3 Feb 2021 14:47:30 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Greg Kurz (groug@kaod.org) wrote:
> > On Wed,  3 Feb 2021 11:37:17 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > 
> > > Both lo_open() and lo_create() have similar code to open a file. Extract
> > > a common lo_do_open() function from lo_open() that will be used by
> > > lo_create() in a later commit.
> > > 
> > > Since lo_do_open() does not otherwise need fuse_req_t req, convert
> > > lo_add_fd_mapping() to use struct lo_data *lo instead.
> > > 
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > 
> > With the s/ENOMEM/-ENOMEM/ change in lo_do_open() suggested by patchew,
> 
> Isn't it actually the return -errno that's different from the original?
> 

Yes and this is expected. The original sits in the top level handler
lo_open() which sends the reply back to the client and doesn't have
a return value, while lo_do_open() has a return value which should be
0 or negative.

> Dave
> 
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > 
> > >  tools/virtiofsd/passthrough_ll.c | 73 ++++++++++++++++++++------------
> > >  1 file changed, 46 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > index 5fb36d9407..e63cbd3fb7 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -459,17 +459,17 @@ static void lo_map_remove(struct lo_map *map, size_t key)
> > >  }
> > >  
> > >  /* Assumes lo->mutex is held */
> > > -static ssize_t lo_add_fd_mapping(fuse_req_t req, int fd)
> > > +static ssize_t lo_add_fd_mapping(struct lo_data *lo, int fd)
> > >  {
> > >      struct lo_map_elem *elem;
> > >  
> > > -    elem = lo_map_alloc_elem(&lo_data(req)->fd_map);
> > > +    elem = lo_map_alloc_elem(&lo->fd_map);
> > >      if (!elem) {
> > >          return -1;
> > >      }
> > >  
> > >      elem->fd = fd;
> > > -    return elem - lo_data(req)->fd_map.elems;
> > > +    return elem - lo->fd_map.elems;
> > >  }
> > >  
> > >  /* Assumes lo->mutex is held */
> > > @@ -1651,6 +1651,38 @@ static void update_open_flags(int writeback, int allow_direct_io,
> > >      }
> > >  }
> > >  
> > > +static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
> > > +                      struct fuse_file_info *fi)
> > > +{
> > > +    char buf[64];
> > > +    ssize_t fh;
> > > +    int fd;
> > > +
> > > +    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > > +
> > > +    sprintf(buf, "%i", inode->fd);
> > > +    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
> > > +    if (fd == -1) {
> > > +        return -errno;
> > > +    }
> > > +
> > > +    pthread_mutex_lock(&lo->mutex);
> > > +    fh = lo_add_fd_mapping(lo, fd);
> > > +    pthread_mutex_unlock(&lo->mutex);
> > > +    if (fh == -1) {
> > > +        close(fd);
> > > +        return ENOMEM;
> > > +    }
> > > +
> > > +    fi->fh = fh;
> > > +    if (lo->cache == CACHE_NONE) {
> > > +        fi->direct_io = 1;
> > > +    } else if (lo->cache == CACHE_ALWAYS) {
> > > +        fi->keep_cache = 1;
> > > +    }
> > > +    return 0;
> > > +}
> > > +
> > >  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
> > >                        mode_t mode, struct fuse_file_info *fi)
> > >  {
> > > @@ -1691,7 +1723,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
> > >          ssize_t fh;
> > >  
> > >          pthread_mutex_lock(&lo->mutex);
> > > -        fh = lo_add_fd_mapping(req, fd);
> > > +        fh = lo_add_fd_mapping(lo, fd);
> > >          pthread_mutex_unlock(&lo->mutex);
> > >          if (fh == -1) {
> > >              close(fd);
> > > @@ -1892,38 +1924,25 @@ static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
> > >  
> > >  static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
> > >  {
> > > -    int fd;
> > > -    ssize_t fh;
> > > -    char buf[64];
> > >      struct lo_data *lo = lo_data(req);
> > > +    struct lo_inode *inode = lo_inode(req, ino);
> > > +    int err;
> > >  
> > >      fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
> > >               fi->flags);
> > >  
> > > -    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > > -
> > > -    sprintf(buf, "%i", lo_fd(req, ino));
> > > -    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
> > > -    if (fd == -1) {
> > > -        return (void)fuse_reply_err(req, errno);
> > > -    }
> > > -
> > > -    pthread_mutex_lock(&lo->mutex);
> > > -    fh = lo_add_fd_mapping(req, fd);
> > > -    pthread_mutex_unlock(&lo->mutex);
> > > -    if (fh == -1) {
> > > -        close(fd);
> > > -        fuse_reply_err(req, ENOMEM);
> > > +    if (!inode) {
> > > +        fuse_reply_err(req, EBADF);
> > >          return;
> > >      }
> > >  
> > > -    fi->fh = fh;
> > > -    if (lo->cache == CACHE_NONE) {
> > > -        fi->direct_io = 1;
> > > -    } else if (lo->cache == CACHE_ALWAYS) {
> > > -        fi->keep_cache = 1;
> > > +    err = lo_do_open(lo, inode, fi);
> > > +    lo_inode_put(lo, &inode);
> > > +    if (err) {
> > > +        fuse_reply_err(req, err);
> > > +    } else {
> > > +        fuse_reply_open(req, fi);
> > >      }
> > > -    fuse_reply_open(req, fi);
> > >  }
> > >  
> > >  static void lo_release(fuse_req_t req, fuse_ino_t ino,
> > 


