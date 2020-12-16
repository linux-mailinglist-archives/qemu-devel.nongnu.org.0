Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76602DC08F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 13:58:50 +0100 (CET)
Received: from localhost ([::1]:48194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpWOH-0007RR-6I
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 07:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpWNF-0006uj-Jv
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 07:57:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpWNC-0006JL-UD
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 07:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608123462;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHVX6GB5PoWyr/m7Y1yJcdZPYPVt7YnKxszo8WW9FyI=;
 b=flQ7ibUFAjvpmXJ1RXhl7KmFt1UmlaMrvDyX81rUMhlO7kAaBmT94XKNYO+bQ9+2xASkNy
 9qC+gLKy0Lx9XoDgYsFoxfiyPXe6+brjMCkgbZy8BmSzsj4RNK1Esv5hWzf11kSYXZW9lE
 JWYLfH6BZoED84vOgKQItN4v+fM65lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-K3xUapo1O1W_N06AnS6Nug-1; Wed, 16 Dec 2020 07:57:30 -0500
X-MC-Unique: K3xUapo1O1W_N06AnS6Nug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42E32192D78E;
 Wed, 16 Dec 2020 12:57:29 +0000 (UTC)
Received: from redhat.com (ovpn-115-177.ams2.redhat.com [10.36.115.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED87310023AF;
 Wed, 16 Dec 2020 12:57:26 +0000 (UTC)
Date: Wed, 16 Dec 2020 12:57:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5] file-posix: detect the lock using the real file
Message-ID: <20201216125723.GH189795@redhat.com>
References: <1608029636-31442-1-git-send-email-fengli@smartx.com>
 <05c96a12-b343-fec4-4060-7110bb0850d0@virtuozzo.com>
 <20201216094959.GC189795@redhat.com>
 <e719c240-a232-c017-73e9-45dbcda619fd@virtuozzo.com>
 <20201216104122.GE189795@redhat.com>
 <b87bc8a5-0635-aa2e-9aa1-4b5c67ca65e5@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b87bc8a5-0635-aa2e-9aa1-4b5c67ca65e5@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, lifeng1519@gmail.com,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Li Feng <fengli@smartx.com>, kyle@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 16, 2020 at 03:03:08PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 16.12.2020 13:41, Daniel P. Berrangé wrote:
> > On Wed, Dec 16, 2020 at 01:25:36PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > 16.12.2020 12:49, Daniel P. Berrangé wrote:
> > > > On Wed, Dec 16, 2020 at 11:22:38AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > > > 15.12.2020 13:53, Li Feng wrote:
> > > > > > This patch addresses this issue:
> > > > > > When accessing a volume on an NFS filesystem without supporting the file lock,
> > > > > > tools, like qemu-img, will complain "Failed to lock byte 100".
> > > > > > 
> > > > > > In the original code, the qemu_has_ofd_lock will test the lock on the
> > > > > > "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
> > > > > > which depends on the underlay filesystem.
> > > > > > 
> > > > > > In this patch, add a new 'qemu_has_file_lock' to detect whether the
> > > > > > file supports the file lock. And disable the lock when the underlay file
> > > > > > system doesn't support locks.
> > > > > > 


> > > > > > diff --git a/util/osdep.c b/util/osdep.c
> > > > > > index 66d01b9160..dee1f076da 100644
> > > > > > --- a/util/osdep.c
> > > > > > +++ b/util/osdep.c
> > > > > > @@ -225,6 +225,20 @@ static void qemu_probe_lock_ops(void)
> > > > > >         }
> > > > > >     }
> > > > > > +bool qemu_has_file_lock(int fd)
> > > > > > +{
> > > > > > +    int ret;
> > > > > > +    struct flock fl = {
> > > > > > +        .l_whence = SEEK_SET,
> > > > > > +        .l_start  = 0,
> > > > > > +        .l_len    = 0,
> > > > > > +        .l_type   = F_WRLCK,
> > > > > > +    };
> > > > > > +
> > > > > > +    ret = fcntl(fd, F_GETLK, &fl);
> > > > > 
> > > > > I think we need
> > > > > 
> > > > >       qemu_probe_lock_ops();
> > > > >       ret = fcntl(fd, fcntl_op_getlk, &fl);
> > > > > 
> > > > > pattern instead, like in qemu_lock_fd_test(). Otherwise, what we check may differ with what we are going to use.
> > > > 
> > > > No, we explicitly do *not* want that.  This function is *only*
> > > > about checking whether traditional fcntl locks work or not on
> > > > this specific file handle.
> > > 
> > > Hmm, than may be name the function qemu_has_posix_lock(), to stress that fact? All other qemu*lock*(fd) API functions do rely on fcnt_op_getlk/fcntl_op_setlk and work with lock type determined by qemu_probe_lock_ops().
> > > 
> > > > 
> > > > Support for OFD locks is a separate check, and its result
> > > > applies system wide.
> > > > 
> > > 
> > > Still, I don't follow, why should we check posix lock, when we are
> > > going to use ofd locks. What if OFD locks are supported by kernel,
> > > but specific file-system supports posix lock, but not ofd? Than
> > > we'll fail the same way as described in commit message and the
> > > patch doesn't help. Or what I miss?
> > 
> > That's not a scenario that exists. OFD locks are implemented by the
> > kernel in the generic VFS layer, so apply to all filesystems. The
> > filesystems merely have to support traditiaonl fcntl locks, and then
> > they get OFD for free.
> > 
> > IOW, there are two separate questions the code needs answers to
> > 
> >   1. Does this specific filesystem support locking
> >   2. Does the operating system support OFD locking
> > 
> > The problem in the commit message is because the original code was asking
> > question 2 only and geting the correct answer that the OS supports OFD.
> > The image was stored on a filesystem, however, that does not support fnctl
> > locks at all and hence locking failed. This failure would happen regardless
> > of whether OFD or traditional fcntl locks were used.
> > 
> > The problem is solved by also asking the first question before enabling
> > use of locks.
> > 
> 
> OK, thanks for explanation. Sorry, I was not attentive to previous versions, but I remember that something about this was discussed, so probably you explain this thing not the first time;( Hmm, still, what's wrong with checking fs by OFD lock trying? It will fail anyway? Or, it will NOT fail, because OFD knows that there is no locks, and will not ask filesystem driver and we will fail only later, when try to set the lock? If so, it worth a comment in file-posix.c.. As it looks like a design flaw of OFD locks.

We want to cache the OFD result check so we don't have to repeat the
probe every time. If we check OFD per-FS it makes caching much more
complex than it needs to be.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


