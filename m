Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867AC2B8042
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:18:57 +0100 (CET)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPEW-00023b-Du
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfPCp-0001BE-Ne
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfPCl-0000lC-59
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605712626;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=o+aDDnzzWB6aMvjjjTGXM064qwMcPaFEnb24mdMhBgs=;
 b=DG0V5xlTPoYcs/UJ1aEh4BSG1CvPEH8SEgLXocWYy1i7YNlyxC+V+ocY/VfgC1RTcOYiOP
 quYy6Q5Ax+pFjXyZmEzH5zTmb/nAmsMdWR9MnCrW7/tscjPC2O3tK79Z+hnePij/XyVGkD
 c+88PEFuJlVAgYFFyl6KMR/hOmBtPnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-NReV9GpNOhKxg5V3b3uLwA-1; Wed, 18 Nov 2020 10:16:58 -0500
X-MC-Unique: NReV9GpNOhKxg5V3b3uLwA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 043FC64151;
 Wed, 18 Nov 2020 15:16:57 +0000 (UTC)
Received: from redhat.com (ovpn-115-41.ams2.redhat.com [10.36.115.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 050545D6BA;
 Wed, 18 Nov 2020 15:16:55 +0000 (UTC)
Date: Wed, 18 Nov 2020 15:16:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
Subject: Re: [PATCH 1/2] file-posix: Use OFD lock only if the filesystem
 supports the lock
Message-ID: <20201118151653.GF229461@redhat.com>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201106040102.13892-1-msys.mizuma@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 05, 2020 at 11:01:01PM -0500, Masayoshi Mizuma wrote:
> From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> 
> locking=auto doesn't work if the filesystem doesn't support OFD lock.
> In that situation, following error happens:
> 
>   qemu-system-x86_64: -blockdev driver=qcow2,node-name=disk,file.driver=file,file.filename=/mnt/guest.qcow2,file.locking=auto: Failed to lock byte 100
> 
> qemu_probe_lock_ops() judges whether qemu can use OFD lock
> or not with doing fcntl(F_OFD_GETLK) to /dev/null. So the
> error happens if /dev/null supports OFD lock, but the filesystem
> doesn't support the lock.
> 
> Lock the actual file, not /dev/null, using F_OFD_SETLK and if that
> fails, then fallback to F_SETLK.
> 
> Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> ---
>  block/file-posix.c   |  56 ++++++++--------
>  include/qemu/osdep.h |   2 +-
>  util/osdep.c         | 149 ++++++++++++++++++++++++++++---------------
>  3 files changed, 125 insertions(+), 82 deletions(-)


> diff --git a/util/osdep.c b/util/osdep.c
> index 66d01b9160..454e8ef9f4 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -117,9 +117,6 @@ int qemu_mprotect_none(void *addr, size_t size)
>  
>  #ifndef _WIN32
>  
> -static int fcntl_op_setlk = -1;
> -static int fcntl_op_getlk = -1;
> -
>  /*
>   * Dups an fd and sets the flags
>   */
> @@ -187,68 +184,87 @@ static int qemu_parse_fdset(const char *param)
>      return qemu_parse_fd(param);
>  }
>  
> -static void qemu_probe_lock_ops(void)
> +bool qemu_has_ofd_lock(int orig_fd)
>  {
> -    if (fcntl_op_setlk == -1) {
>  #ifdef F_OFD_SETLK
> -        int fd;
> -        int ret;
> -        struct flock fl = {
> -            .l_whence = SEEK_SET,
> -            .l_start  = 0,
> -            .l_len    = 0,
> -            .l_type   = F_WRLCK,
> -        };
> -
> -        fd = open("/dev/null", O_RDWR);
> -        if (fd < 0) {
> +    int fd;
> +    int ret;
> +    struct flock fl = {
> +        .l_whence = SEEK_SET,
> +        .l_start  = 0,
> +        .l_len    = 0,
> +        .l_type   = F_RDLCK,
> +    };
> +
> +    fd = qemu_dup(orig_fd);

Consider that we're *not* using  OFD locks, and QEMU already
has 'foo.qcow2' open for an existing disk backend, and it is
locked.

Now someone tries to hot-add 'foo.qcow2' for a second disk
by mistake.  Doing this qemu_dup + qemu_close will cause
the existing locks to be removed AFAICT.

> +    if (fd >= 0) {
> +        ret = fcntl_setfl(fd, O_RDONLY);
> +        if (ret) {
>              fprintf(stderr,
> -                    "Failed to open /dev/null for OFD lock probing: %s\n",
> -                    strerror(errno));
> -            fcntl_op_setlk = F_SETLK;
> -            fcntl_op_getlk = F_GETLK;
> -            return;
> -        }
> -        ret = fcntl(fd, F_OFD_GETLK, &fl);
> -        close(fd);
> -        if (!ret) {
> -            fcntl_op_setlk = F_OFD_SETLK;
> -            fcntl_op_getlk = F_OFD_GETLK;
> -        } else {
> -            fcntl_op_setlk = F_SETLK;
> -            fcntl_op_getlk = F_GETLK;
> +                    "Failed to fcntl for OFD lock probing.\n");
> +            qemu_close(fd);
> +            return false;
>          }
> +    }
> +
> +    ret = fcntl(fd, F_OFD_GETLK, &fl);
> +    qemu_close(fd);
> +
> +    if (ret == 0) {
> +        return true;
> +    } else {
> +        return false;
> +    }
>  #else
> -        fcntl_op_setlk = F_SETLK;
> -        fcntl_op_getlk = F_GETLK;
> +    return false;
>  #endif
> -    }
>  }
>  
> -bool qemu_has_ofd_lock(void)
> -{
> -    qemu_probe_lock_ops();
>  #ifdef F_OFD_SETLK
> -    return fcntl_op_setlk == F_OFD_SETLK;
> +static int _qemu_lock_fcntl(int fd, struct flock *fl)
> +{
> +    int ret;
> +    bool ofd_lock = true;
> +
> +    do {
> +        if (ofd_lock) {
> +            ret = fcntl(fd, F_OFD_SETLK, fl);
> +            if ((ret == -1) && (errno == EINVAL)) {
> +                ofd_lock = false;
> +            }
> +        }
> +
> +        if (!ofd_lock) {
> +            /* Fallback to POSIX lock */
> +            ret = fcntl(fd, F_SETLK, fl);
> +        }
> +    } while (ret == -1 && errno == EINTR);

THis loop is confusing to read. I'd suggest creating a
wrapper

  qemu_fcntl()

that does the while (ret == -1 && errno == EINTR) loop,
so that this locking code can be clearer without the
loop.

> +
> +    return ret == -1 ? -errno : 0;
> +}
>  #else
> -    return false;
> -#endif
> +static int _qemu_lock_fcntl(int fd, struct flock *fl)
> +{
> +    int ret;
> +
> +    do {
> +        ret = fcntl(fd, F_SETLK, fl);
> +    } while (ret == -1 && errno == EINTR);
> +
> +    return ret == -1 ? -errno : 0;
>  }
> +#endif


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


