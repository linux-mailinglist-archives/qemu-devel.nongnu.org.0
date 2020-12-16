Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB362DBEDD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 11:42:56 +0100 (CET)
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUGl-0000tR-LE
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 05:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpUFc-0008LN-7U
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:41:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpUFX-0003Uo-Ts
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608115297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hvvxp74uehSqLgr1mR72k3vWWpdigzjFYCg4+P7Lk3k=;
 b=Jt4XQabPj8Dp8V5T/+qa75qBlSEhjD3UoVHDMZlSBibSMSVo2GAPe1unEUzWQOzMKwinfY
 vDM4hrthHQ1Fe9vnpezM0QBUTojQRV/lDb26r+15GQuoC5vXjOtABe5HIXLQ8JRQQ+TYDU
 YIlx/NrexVRGiI19z1DY6OYzUSD5Drw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521--ncnm0iNPU-oPeONMNFW0w-1; Wed, 16 Dec 2020 05:41:29 -0500
X-MC-Unique: -ncnm0iNPU-oPeONMNFW0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80322107ACF5;
 Wed, 16 Dec 2020 10:41:28 +0000 (UTC)
Received: from redhat.com (ovpn-115-177.ams2.redhat.com [10.36.115.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F055560C43;
 Wed, 16 Dec 2020 10:41:25 +0000 (UTC)
Date: Wed, 16 Dec 2020 10:41:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5] file-posix: detect the lock using the real file
Message-ID: <20201216104122.GE189795@redhat.com>
References: <1608029636-31442-1-git-send-email-fengli@smartx.com>
 <05c96a12-b343-fec4-4060-7110bb0850d0@virtuozzo.com>
 <20201216094959.GC189795@redhat.com>
 <e719c240-a232-c017-73e9-45dbcda619fd@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <e719c240-a232-c017-73e9-45dbcda619fd@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, lifeng1519@gmail.com,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Li Feng <fengli@smartx.com>, kyle@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 16, 2020 at 01:25:36PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 16.12.2020 12:49, Daniel P. Berrangé wrote:
> > On Wed, Dec 16, 2020 at 11:22:38AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > 15.12.2020 13:53, Li Feng wrote:
> > > > This patch addresses this issue:
> > > > When accessing a volume on an NFS filesystem without supporting the file lock,
> > > > tools, like qemu-img, will complain "Failed to lock byte 100".
> > > > 
> > > > In the original code, the qemu_has_ofd_lock will test the lock on the
> > > > "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
> > > > which depends on the underlay filesystem.
> > > > 
> > > > In this patch, add a new 'qemu_has_file_lock' to detect whether the
> > > > file supports the file lock. And disable the lock when the underlay file
> > > > system doesn't support locks.
> > > > 
> > > > Signed-off-by: Li Feng <fengli@smartx.com>
> > > > ---
> > > > v5: simplify the code.
> > > > v4: use the fd as the qemu_has_file_lock argument.
> > > > v3: don't call the qemu_has_ofd_lock, use a new function instead.
> > > > v2: remove the refactoring.
> > > > ---
> > > >    block/file-posix.c   | 61 +++++++++++++++++++++++---------------------
> > > >    include/qemu/osdep.h |  1 +
> > > >    util/osdep.c         | 14 ++++++++++
> > > >    3 files changed, 47 insertions(+), 29 deletions(-)
> > > > 
> > > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > > index 806764f7e3..4e00111031 100644
> > > > --- a/block/file-posix.c
> > > > +++ b/block/file-posix.c
> > > > @@ -584,6 +584,21 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
> > > >        s->use_linux_io_uring = (aio == BLOCKDEV_AIO_OPTIONS_IO_URING);
> > > >    #endif
> > > > +    s->open_flags = open_flags;
> > > > +    raw_parse_flags(bdrv_flags, &s->open_flags, false);
> > > > +
> > > > +    s->fd = -1;
> > > > +    fd = qemu_open(filename, s->open_flags, errp);
> > > > +    ret = fd < 0 ? -errno : 0;
> > > > +
> > > > +    if (ret < 0) {
> > > > +        if (ret == -EROFS) {
> > > > +            ret = -EACCES;
> > > > +        }
> > > > +        goto fail;
> > > > +    }
> > > > +    s->fd = fd;
> > > > +
> > > >        locking = qapi_enum_parse(&OnOffAuto_lookup,
> > > >                                  qemu_opt_get(opts, "locking"),
> > > >                                  ON_OFF_AUTO_AUTO, &local_err);
> > > > @@ -606,7 +621,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
> > > >            s->use_lock = false;
> > > >            break;
> > > 
> > > In case of ON_OFF_AUTO_ON: we do check qemu_has_ofd_lock() and print a warning.
> > > 
> > > Probably we can also check new qemu_has_file_lock() and just do early fail, not waiting for permissions update..
> > > 
> > > >        case ON_OFF_AUTO_AUTO:
> > > > -        s->use_lock = qemu_has_ofd_lock();
> > > > +        s->use_lock = qemu_has_file_lock(s->fd) && qemu_has_ofd_lock();
> > > >            break;
> > > >        default:
> > > >            abort();
> > > > @@ -625,22 +640,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
> > > >        s->drop_cache = qemu_opt_get_bool(opts, "drop-cache", true);
> > > >        s->check_cache_dropped = qemu_opt_get_bool(opts, "x-check-cache-dropped",
> > > >                                                   false);
> > > > -
> > > > -    s->open_flags = open_flags;
> > > > -    raw_parse_flags(bdrv_flags, &s->open_flags, false);
> > > > -
> > > > -    s->fd = -1;
> > > > -    fd = qemu_open(filename, s->open_flags, errp);
> > > > -    ret = fd < 0 ? -errno : 0;
> > > > -
> > > > -    if (ret < 0) {
> > > > -        if (ret == -EROFS) {
> > > > -            ret = -EACCES;
> > > > -        }
> > > > -        goto fail;
> > > > -    }
> > > > -    s->fd = fd;
> > > > -
> > > >        /* Check s->open_flags rather than bdrv_flags due to auto-read-only */
> > > >        if (s->open_flags & O_RDWR) {
> > > >            ret = check_hdev_writable(s->fd);
> > > > @@ -2388,6 +2387,7 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
> > > >        int fd;
> > > >        uint64_t perm, shared;
> > > >        int result = 0;
> > > > +    bool use_lock;
> > > >        /* Validate options and set default values */
> > > >        assert(options->driver == BLOCKDEV_DRIVER_FILE);
> > > > @@ -2428,19 +2428,22 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
> > > >        perm = BLK_PERM_WRITE | BLK_PERM_RESIZE;
> > > >        shared = BLK_PERM_ALL & ~BLK_PERM_RESIZE;
> > > > -    /* Step one: Take locks */
> > > > -    result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
> > > > -    if (result < 0) {
> > > > -        goto out_close;
> > > > -    }
> > > > +    use_lock = qemu_has_file_lock(fd);
> > > > +    if (use_lock) {
> > > > +        /* Step one: Take locks */
> > > > +        result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
> > > > +        if (result < 0) {
> > > > +            goto out_close;
> > > > +        }
> > > > -    /* Step two: Check that nobody else has taken conflicting locks */
> > > > -    result = raw_check_lock_bytes(fd, perm, shared, errp);
> > > > -    if (result < 0) {
> > > > -        error_append_hint(errp,
> > > > -                          "Is another process using the image [%s]?\n",
> > > > -                          file_opts->filename);
> > > > -        goto out_unlock;
> > > > +        /* Step two: Check that nobody else has taken conflicting locks */
> > > > +        result = raw_check_lock_bytes(fd, perm, shared, errp);
> > > > +        if (result < 0) {
> > > > +            error_append_hint(errp,
> > > > +                              "Is another process using the image [%s]?\n",
> > > > +                              file_opts->filename);
> > > > +            goto out_unlock;
> > > > +        }
> > > >        }
> > > 
> > > In raw_co_create(), I think you should also update code under "out_unlock:", we shouldn't
> > > call raw_apply_lock_bytes(), when use_lock is false.
> > > 
> > > 
> > > Another thing is call to raw_apply_lock_bytes() in raw_check_perm(). Looks like a preexisting bug. Why don't we check for s->use_lock?
> > > 
> > > >        /* Clear the file by truncating it to 0 */
> > > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > > index f9ec8c84e9..c7587be99d 100644
> > > > --- a/include/qemu/osdep.h
> > > > +++ b/include/qemu/osdep.h
> > > > @@ -513,6 +513,7 @@ int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
> > > >    int qemu_unlock_fd(int fd, int64_t start, int64_t len);
> > > >    int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
> > > >    bool qemu_has_ofd_lock(void);
> > > > +bool qemu_has_file_lock(int fd);
> > > >    #endif
> > > >    #if defined(__HAIKU__) && defined(__i386__)
> > > > diff --git a/util/osdep.c b/util/osdep.c
> > > > index 66d01b9160..dee1f076da 100644
> > > > --- a/util/osdep.c
> > > > +++ b/util/osdep.c
> > > > @@ -225,6 +225,20 @@ static void qemu_probe_lock_ops(void)
> > > >        }
> > > >    }
> > > > +bool qemu_has_file_lock(int fd)
> > > > +{
> > > > +    int ret;
> > > > +    struct flock fl = {
> > > > +        .l_whence = SEEK_SET,
> > > > +        .l_start  = 0,
> > > > +        .l_len    = 0,
> > > > +        .l_type   = F_WRLCK,
> > > > +    };
> > > > +
> > > > +    ret = fcntl(fd, F_GETLK, &fl);
> > > 
> > > I think we need
> > > 
> > >      qemu_probe_lock_ops();
> > >      ret = fcntl(fd, fcntl_op_getlk, &fl);
> > > 
> > > pattern instead, like in qemu_lock_fd_test(). Otherwise, what we check may differ with what we are going to use.
> > 
> > No, we explicitly do *not* want that.  This function is *only*
> > about checking whether traditional fcntl locks work or not on
> > this specific file handle.
> 
> Hmm, than may be name the function qemu_has_posix_lock(), to stress that fact? All other qemu*lock*(fd) API functions do rely on fcnt_op_getlk/fcntl_op_setlk and work with lock type determined by qemu_probe_lock_ops().
> 
> > 
> > Support for OFD locks is a separate check, and its result
> > applies system wide.
> > 
> 
> Still, I don't follow, why should we check posix lock, when we are
> going to use ofd locks. What if OFD locks are supported by kernel,
> but specific file-system supports posix lock, but not ofd? Than
> we'll fail the same way as described in commit message and the
> patch doesn't help. Or what I miss?

That's not a scenario that exists. OFD locks are implemented by the
kernel in the generic VFS layer, so apply to all filesystems. The
filesystems merely have to support traditiaonl fcntl locks, and then
they get OFD for free.

IOW, there are two separate questions the code needs answers to

 1. Does this specific filesystem support locking
 2. Does the operating system support OFD locking 

The problem in the commit message is because the original code was asking
question 2 only and geting the correct answer that the OS supports OFD.
The image was stored on a filesystem, however, that does not support fnctl
locks at all and hence locking failed. This failure would happen regardless
of whether OFD or traditional fcntl locks were used.

The problem is solved by also asking the first question before enabling
use of locks.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


