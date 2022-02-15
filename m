Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C889D4B741A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:31:24 +0100 (CET)
Received: from localhost ([::1]:38988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1ff-00086k-Ep
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:31:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nK1cp-0006l9-SG
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:28:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nK1cm-0003cM-V4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644946103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y+mlQqe2YRWrz55Iijb0usxn1bWNlTgbX20jo2fM6qQ=;
 b=GtCb/mFQJUze7BBvWzRPdMk61d6+wpFJzQb2wwP5QivV6Tv1AltG2i+HcSCe9OkYSNhzYG
 6UtmY65yow3c2Uc/Y7yVorLUl3v6ghb9blr/z/+r4uscZ5xQ31UOURbUSJZkhTLhmEDWFY
 ovJd92pCwyiURYwqNh0KcXf1DGHRmCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-Kl5k-dg_P6WAaLtsw-Jojw-1; Tue, 15 Feb 2022 12:28:17 -0500
X-MC-Unique: Kl5k-dg_P6WAaLtsw-Jojw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B1D61800D50;
 Tue, 15 Feb 2022 17:28:16 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E81C410A48B2;
 Tue, 15 Feb 2022 17:27:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 6F74122361A; Tue, 15 Feb 2022 12:27:46 -0500 (EST)
Date: Tue, 15 Feb 2022 12:27:46 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v5 3/3] virtiofsd: Add support for FUSE_SYNCFS request
 without announce_submounts
Message-ID: <YgvikrLzWLfVAePx@redhat.com>
References: <20220214135820.43897-1-groug@kaod.org>
 <20220214135820.43897-4-groug@kaod.org>
 <YgqfCtcjhApw5Fyw@redhat.com> <YgqlyP5M7NF/bMoj@redhat.com>
 <Ygqo+24vo1z7rSvk@redhat.com> <20220215101803.14206a48@bahia>
MIME-Version: 1.0
In-Reply-To: <20220215101803.14206a48@bahia>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: virtio-fs@redhat.com,
 Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 10:18:03AM +0100, Greg Kurz wrote:
> On Mon, 14 Feb 2022 14:09:47 -0500
> Vivek Goyal <vgoyal@redhat.com> wrote:
> 
> > On Mon, Feb 14, 2022 at 01:56:08PM -0500, Vivek Goyal wrote:
> > > On Mon, Feb 14, 2022 at 01:27:22PM -0500, Vivek Goyal wrote:
> > > > On Mon, Feb 14, 2022 at 02:58:20PM +0100, Greg Kurz wrote:
> > > > > This adds the missing bits to support FUSE_SYNCFS in the case submounts
> > > > > aren't announced to the client.
> > > > > 
> > > > > Iterate over all inodes and call syncfs() on the ones marked as submounts.
> > > > > Since syncfs() can block for an indefinite time, we cannot call it with
> > > > > lo->mutex held as it would prevent the server to process other requests.
> > > > > This is thus broken down in two steps. First build a list of submounts
> > > > > with lo->mutex held, drop the mutex and finally process the list. A
> > > > > reference is taken on the inodes to ensure they don't go away when
> > > > > lo->mutex is dropped.
> > > > > 
> > > > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > > > ---
> > > > >  tools/virtiofsd/passthrough_ll.c | 38 ++++++++++++++++++++++++++++++--
> > > > >  1 file changed, 36 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > > > index e94c4e6f8635..7ce944bfe2a0 100644
> > > > > --- a/tools/virtiofsd/passthrough_ll.c
> > > > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > > > @@ -3400,8 +3400,42 @@ static void lo_syncfs(fuse_req_t req, fuse_ino_t ino)
> > > > >          err = lo_do_syncfs(lo, inode);
> > > > >          lo_inode_put(lo, &inode);
> > > > >      } else {
> > > > > -        /* Requires the sever to track submounts. Not implemented yet */
> > > > > -        err = ENOSYS;
> > > > > +        g_autoptr(GSList) submount_list = NULL;
> > > > > +        GSList *elem;
> > > > > +        GHashTableIter iter;
> > > > > +        gpointer key, value;
> > > > > +
> > > > > +        pthread_mutex_lock(&lo->mutex);
> > > > > +
> > > > > +        g_hash_table_iter_init(&iter, lo->inodes);
> > > > > +        while (g_hash_table_iter_next(&iter, &key, &value)) {
> > > > 
> > > > Going through all the inodes sounds very inefficient. If there are large
> > > > number of inodes (say 1 million or more), and if frequent syncfs requests
> > > > are coming this can consume lot of cpu cycles.
> > > > 
> > > > Given C virtiofsd is slowly going away, so I don't want to be too
> > > > particular about it. But, I would have thought to put submount
> > > > inodes into another list or hash map (using mount id as key) and just
> > > > traverse through that list instead. Given number of submounts should
> > > > be small, it should be pretty quick to walk through that list.
> > > > 
> > > > > +            struct lo_inode *inode = value;
> > > > > +
> > > > > +            if (inode->is_submount) {
> > > > > +                g_atomic_int_inc(&inode->refcount);
> > > > > +                submount_list = g_slist_prepend(submount_list, inode);
> > > > > +            }
> > > > > +        }
> > > > > +
> > > > > +        pthread_mutex_unlock(&lo->mutex);
> > > > > +
> > > > > +        /* The root inode is always present and not tracked in the hash table */
> > > > > +        err = lo_do_syncfs(lo, &lo->root);
> > > > > +
> > > > > +        for (elem = submount_list; elem; elem = g_slist_next(elem)) {
> > > > > +            struct lo_inode *inode = elem->data;
> > > > > +            int r;
> > > > > +
> > > > > +            r = lo_do_syncfs(lo, inode);
> > > > > +            if (r) {
> > > > > +                /*
> > > > > +                 * Try to sync as much as possible. Only one error can be
> > > > > +                 * reported to the client though, arbitrarily the last one.
> > > > > +                 */
> > > > > +                err = r;
> > > > > +            }
> > > > > +            lo_inode_put(lo, &inode);
> > > > > +        }
> > > > 
> > > > One more minor nit. What happens if virtiofsd is processing syncfs list
> > > > and then somebody hard reboots qemu and mounts virtiofs again. That
> > > > will trigger FUSE_INIT and will call lo_destroy() first.
> > > > 
> > > > fuse_lowlevel.c
> > > > 
> > > > fuse_session_process_buf_int()
> > > > {
> > > >             fuse_log(FUSE_LOG_DEBUG, "%s: reinit\n", __func__);
> > > >             se->got_destroy = 1;
> > > >             se->got_init = 0;
> > > >             if (se->op.destroy) {
> > > >                 se->op.destroy(se->userdata);
> > > >             }
> > > > }
> > > > 
> > > > IIUC, there is no synchronization with this path. If we are running with
> > > > thread pool enabled, it could very well happen that one thread is still
> > > > doing syncfs while other thread is executing do_init(). That sounds
> > > > like little bit of a problem. It will be good if there is a way
> > > > to either abort syncfs() or do_destroy() waits for all the previous
> > > > syncfs() to finish.
> > > > 
> > > > Greg, if you like, you could break down this work in two patch series.
> > > > First patch series just issues syncfs() on inode id sent with FUSE_SYNCFS.
> > > > That's easy fix and can get merged now.
> > > 
> > > Actually I think even single "syncfs" will have synchronization issue
> > > with do_init() upon hard reboot if we drop lo->mutex during syncfs().
> > 
> > Actually, we have similar issues with ->fsync(). We take lo->mutex,
> > and then take a reference on inode. Call fsync() on this. Now it is
> > possible that guest hard reboots, triggers, FUSE_INIT and lo_destroy()
> > is called. It will take lo->mutex and drop its referene on inode.
> > 
> > So it looks like in extreme case a new connection can start looking
> > up inodes which we still have old inodes in hash table because
> > some thread is blocked doing operation and has not dropped its
> > reference.
> > 
> > David, do I understand it right?
> > 
> > We probably need to have a notion of keeping track of number of requests
> > which are in progress. And lo_destroy() should wait till number of
> > requests in progress come to zero. This will be equivalent of draining
> > the queues operation in virtiofs kernel driver.
> > 
> > Anyway, given we already have the issue w.r.t lo_destroy(), and C code
> > is going away, I will be fine even if you don't fix races with FUSE_INIT.
> > 
> > Vivek
> 
> As you pointed out, this can affect other type of requests as well, so
> this would probably deserve a more generic fix than just making it
> work for syncfs(). This would most likely call for cycles that I don't
> have. Thanks ! ;-)
> 
> BTW, does the rust implementation have the same flaw ?

I don't think Rust implementation drops any locks at all while syncfs()
is called. So next FUSE_INIT might just serialize completely and
wait for syncfs() to finish first. But don't quote me on this because
I don't understand rust virtiofsd locking well yet. It is more of a 
guess.

Vivek

> 
> > > 
> > > Vivek
> > > 
> > > > 
> > > > And second patch series take care of above issues and will be little bit
> > > > more work.
> > > > 
> > > > Thanks
> > > > Vivek
> > 
> 


