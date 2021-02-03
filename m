Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A929F30E1CD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:04:36 +0100 (CET)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MW3-0007oX-Ly
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7MFZ-0006YN-Bj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:47:33 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7MFX-0007za-4R
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:47:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 082458234E9C;
 Wed,  3 Feb 2021 18:47:27 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Feb 2021
 18:47:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00330987d28-1862-4953-b50f-915fddf2a586,
 14764A637080470E006017DF0F40374BD57DCD59) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 3 Feb 2021 18:47:26 +0100
From: Greg Kurz <groug@kaod.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 1/3] virtiofsd: extract lo_do_open() from lo_open()
Message-ID: <20210203184726.339bd944@bahia.lan>
In-Reply-To: <20210203164510.08ab60db@bahia.lan>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-2-stefanha@redhat.com>
 <20210203152035.374924b9@bahia.lan> <20210203144730.GJ2950@work-vm>
 <20210203164510.08ab60db@bahia.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 8af1dfb3-f71e-4dd8-8417-c1c31f9b39c5
X-Ovh-Tracer-Id: 16262216781422631346
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepvhhgohihrghlsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, 3 Feb 2021 16:45:10 +0100
Greg Kurz <groug@kaod.org> wrote:

> On Wed, 3 Feb 2021 14:47:30 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Greg Kurz (groug@kaod.org) wrote:
> > > On Wed,  3 Feb 2021 11:37:17 +0000
> > > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > 
> > > > Both lo_open() and lo_create() have similar code to open a file. Extract
> > > > a common lo_do_open() function from lo_open() that will be used by
> > > > lo_create() in a later commit.
> > > > 
> > > > Since lo_do_open() does not otherwise need fuse_req_t req, convert
> > > > lo_add_fd_mapping() to use struct lo_data *lo instead.
> > > > 
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > 
> > > With the s/ENOMEM/-ENOMEM/ change in lo_do_open() suggested by patchew,
> > 
> > Isn't it actually the return -errno that's different from the original?
> > 
> 
> Yes and this is expected. The original sits in the top level handler
> lo_open() which sends the reply back to the client and doesn't have
> a return value, while lo_do_open() has a return value which should be
> 0 or negative.
> 

I got it backwards of course... sorry for the noise :)

Cheers,

--
Greg

> > Dave
> > 
> > > Reviewed-by: Greg Kurz <groug@kaod.org>
> > > 
> > > >  tools/virtiofsd/passthrough_ll.c | 73 ++++++++++++++++++++------------
> > > >  1 file changed, 46 insertions(+), 27 deletions(-)
> > > > 
> > > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > > index 5fb36d9407..e63cbd3fb7 100644
> > > > --- a/tools/virtiofsd/passthrough_ll.c
> > > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > > @@ -459,17 +459,17 @@ static void lo_map_remove(struct lo_map *map, size_t key)
> > > >  }
> > > >  
> > > >  /* Assumes lo->mutex is held */
> > > > -static ssize_t lo_add_fd_mapping(fuse_req_t req, int fd)
> > > > +static ssize_t lo_add_fd_mapping(struct lo_data *lo, int fd)
> > > >  {
> > > >      struct lo_map_elem *elem;
> > > >  
> > > > -    elem = lo_map_alloc_elem(&lo_data(req)->fd_map);
> > > > +    elem = lo_map_alloc_elem(&lo->fd_map);
> > > >      if (!elem) {
> > > >          return -1;
> > > >      }
> > > >  
> > > >      elem->fd = fd;
> > > > -    return elem - lo_data(req)->fd_map.elems;
> > > > +    return elem - lo->fd_map.elems;
> > > >  }
> > > >  
> > > >  /* Assumes lo->mutex is held */
> > > > @@ -1651,6 +1651,38 @@ static void update_open_flags(int writeback, int allow_direct_io,
> > > >      }
> > > >  }
> > > >  
> > > > +static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
> > > > +                      struct fuse_file_info *fi)
> > > > +{
> > > > +    char buf[64];
> > > > +    ssize_t fh;
> > > > +    int fd;
> > > > +
> > > > +    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > > > +
> > > > +    sprintf(buf, "%i", inode->fd);
> > > > +    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
> > > > +    if (fd == -1) {
> > > > +        return -errno;
> > > > +    }
> > > > +
> > > > +    pthread_mutex_lock(&lo->mutex);
> > > > +    fh = lo_add_fd_mapping(lo, fd);
> > > > +    pthread_mutex_unlock(&lo->mutex);
> > > > +    if (fh == -1) {
> > > > +        close(fd);
> > > > +        return ENOMEM;
> > > > +    }
> > > > +
> > > > +    fi->fh = fh;
> > > > +    if (lo->cache == CACHE_NONE) {
> > > > +        fi->direct_io = 1;
> > > > +    } else if (lo->cache == CACHE_ALWAYS) {
> > > > +        fi->keep_cache = 1;
> > > > +    }
> > > > +    return 0;
> > > > +}
> > > > +
> > > >  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
> > > >                        mode_t mode, struct fuse_file_info *fi)
> > > >  {
> > > > @@ -1691,7 +1723,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
> > > >          ssize_t fh;
> > > >  
> > > >          pthread_mutex_lock(&lo->mutex);
> > > > -        fh = lo_add_fd_mapping(req, fd);
> > > > +        fh = lo_add_fd_mapping(lo, fd);
> > > >          pthread_mutex_unlock(&lo->mutex);
> > > >          if (fh == -1) {
> > > >              close(fd);
> > > > @@ -1892,38 +1924,25 @@ static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
> > > >  
> > > >  static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
> > > >  {
> > > > -    int fd;
> > > > -    ssize_t fh;
> > > > -    char buf[64];
> > > >      struct lo_data *lo = lo_data(req);
> > > > +    struct lo_inode *inode = lo_inode(req, ino);
> > > > +    int err;
> > > >  
> > > >      fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
> > > >               fi->flags);
> > > >  
> > > > -    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
> > > > -
> > > > -    sprintf(buf, "%i", lo_fd(req, ino));
> > > > -    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
> > > > -    if (fd == -1) {
> > > > -        return (void)fuse_reply_err(req, errno);
> > > > -    }
> > > > -
> > > > -    pthread_mutex_lock(&lo->mutex);
> > > > -    fh = lo_add_fd_mapping(req, fd);
> > > > -    pthread_mutex_unlock(&lo->mutex);
> > > > -    if (fh == -1) {
> > > > -        close(fd);
> > > > -        fuse_reply_err(req, ENOMEM);
> > > > +    if (!inode) {
> > > > +        fuse_reply_err(req, EBADF);
> > > >          return;
> > > >      }
> > > >  
> > > > -    fi->fh = fh;
> > > > -    if (lo->cache == CACHE_NONE) {
> > > > -        fi->direct_io = 1;
> > > > -    } else if (lo->cache == CACHE_ALWAYS) {
> > > > -        fi->keep_cache = 1;
> > > > +    err = lo_do_open(lo, inode, fi);
> > > > +    lo_inode_put(lo, &inode);
> > > > +    if (err) {
> > > > +        fuse_reply_err(req, err);
> > > > +    } else {
> > > > +        fuse_reply_open(req, fi);
> > > >      }
> > > > -    fuse_reply_open(req, fi);
> > > >  }
> > > >  
> > > >  static void lo_release(fuse_req_t req, fuse_ino_t ino,
> > > 
> 
> 


