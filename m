Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA082532
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 20:58:38 +0200 (CEST)
Received: from localhost ([::1]:56604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huiBq-0002Tb-0R
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 14:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1huiBI-000251-N9
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 14:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1huiBH-0001hy-LW
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 14:58:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7731)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1huiBH-0001hc-Bg
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 14:58:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AB09712BD;
 Mon,  5 Aug 2019 18:58:02 +0000 (UTC)
Received: from work-vm (ovpn-117-168.ams2.redhat.com [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB50362926;
 Mon,  5 Aug 2019 18:57:53 +0000 (UTC)
Date: Mon, 5 Aug 2019 19:57:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190805185751.GB17658@work-vm>
References: <20190801165409.20121-1-stefanha@redhat.com>
 <20190801165409.20121-4-stefanha@redhat.com>
 <20190805151708.GN13734@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805151708.GN13734@work-vm>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 05 Aug 2019 18:58:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/4] virtiofsd: fix lo_destroy() resource
 leaks
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
Cc: virtio-fs@redhat.com, Liu Bo <bo.liu@linux.alibaba.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > Now that lo_destroy() is serialized we can call unref_inode() so that
> > all inode resources are freed.
> > 
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> > ---
> >  contrib/virtiofsd/passthrough_ll.c | 43 ++++++++++++++----------------
> >  1 file changed, 20 insertions(+), 23 deletions(-)
> > 
> > diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
> > index a81c01d0d1..02a5e97326 100644
> > --- a/contrib/virtiofsd/passthrough_ll.c
> > +++ b/contrib/virtiofsd/passthrough_ll.c
> > @@ -1340,28 +1340,6 @@ static void unref_inode(struct lo_data *lo, struct lo_inode *inode, uint64_t n)
> >  	}
> >  }
> >  
> > -static int unref_all_inodes_cb(gpointer key, gpointer value,
> > -			       gpointer user_data)
> > -{
> > -	struct lo_inode *inode  = value;
> > -	struct lo_data *lo = user_data;
> > -
> > -	inode->nlookup = 0;
> > -	lo_map_remove(&lo->ino_map, inode->fuse_ino);
> > -	close(inode->fd);
> > -	lo_inode_put(lo, &inode); /* Drop our refcount from lo_do_lookup() */
> > -
> > -	return TRUE;
> > -}
> > -
> > -static void unref_all_inodes(struct lo_data *lo)
> > -{
> > -	pthread_mutex_lock(&lo->mutex);
> > -	g_hash_table_foreach_remove(lo->inodes, unref_all_inodes_cb, lo);
> > -	pthread_mutex_unlock(&lo->mutex);
> > -
> > -}
> > -
> >  static void lo_forget_one(fuse_req_t req, fuse_ino_t ino, uint64_t nlookup)
> >  {
> >  	struct lo_data *lo = lo_data(req);
> > @@ -2462,6 +2440,18 @@ static void lo_removemapping(fuse_req_t req, struct fuse_session *se,
> >  	fuse_reply_err(req, ret);
> >  }
> >  
> > +static int destroy_inode_cb(gpointer key, gpointer value, gpointer user_data)
> > +{
> > +        struct lo_inode *inode = value;
> > +        struct lo_data *lo = user_data;
> > +
> > +        /* inode->nlookup is normally protected by lo->mutex but see the
> > +         * comment in lo_destroy().
> > +         */
> > +        unref_inode(lo, inode, inode->nlookup);
> > +        return TRUE;
> > +}
> > +
> >  static void lo_destroy(void *userdata, struct fuse_session *se)
> >  {
> >  	struct lo_data *lo = (struct lo_data*) userdata;
> > @@ -2475,7 +2465,14 @@ static void lo_destroy(void *userdata, struct fuse_session *se)
> >                          fuse_err("%s: unmap during destroy failed\n", __func__);
> >                  }
> >          }
> > -	unref_all_inodes(lo);
> > +
> > +        /* Normally lo->mutex must be taken when traversing lo->inodes but
> > +         * lo_destroy() is a serialized request so no races are possible here.
> > +         *
> > +         * In addition, we cannot acquire lo->mutex since destroy_inode_cb() takes it
> > +         * too and this would result in a recursive lock.
> > +         */
> > +        g_hash_table_foreach_remove(lo->inodes, destroy_inode_cb, lo);

I'm seeing a crash here if I ctrl-c the virtiofsd after it's got an
active mount:

(process:3219): GLib-CRITICAL **: 18:42:08.334: g_hash_table_foreach_remove_or_steal: assertion 'version == hash_table->version' failed

(I only get the debug if I give seccomp both getpeername and ioctl;
I think glib is trying to get to syslog and wants getpeername
and I'm guessing ioctl to do something funky with the terminal).

Dave

> >  }
> >  
> >  static struct fuse_lowlevel_ops lo_oper = {
> > -- 
> > 2.21.0
> > 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

