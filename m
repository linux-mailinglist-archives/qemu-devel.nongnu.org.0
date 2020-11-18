Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F992B810A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:46:33 +0100 (CET)
Received: from localhost ([::1]:32848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPfE-0006J2-KD
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kfPbk-0003O4-4U
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:42:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kfPbi-0005DT-3K
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605714173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=59AuvNKHRRTAfE6osKzYRrWu02BFqYflj1Xwr6LHou8=;
 b=X4mm+fHnKw1HmpchYWDBG8KTQ/OSuv9du1X78VS7a1aj3egN6W6eiyewy77t7kHVI7L9IH
 LbEHxT187zxLk0yXzSonTjPgMx1D0tQfdjyE9HyZAqsJWGYA2nD/EEOp62WNNusK1oax4X
 E5w+2hVuDOl2d5pXAny3OA6A/AHSQro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-3y5Vqf-IO127qmH-1usiAg-1; Wed, 18 Nov 2020 10:42:51 -0500
X-MC-Unique: 3y5Vqf-IO127qmH-1usiAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71B9D1074661;
 Wed, 18 Nov 2020 15:42:50 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-43.ams2.redhat.com [10.36.115.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F6BD60C05;
 Wed, 18 Nov 2020 15:42:49 +0000 (UTC)
Date: Wed, 18 Nov 2020 16:42:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
Subject: Re: [PATCH 1/2] file-posix: Use OFD lock only if the filesystem
 supports the lock
Message-ID: <20201118154247.GB11988@merkur.fritz.box>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201106040102.13892-1-msys.mizuma@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.11.2020 um 05:01 hat Masayoshi Mizuma geschrieben:
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

CCing qemu-block, which is the relevant mailing list. You can use the
scripts/get_maintainer.pl script to find out who should be CCed on your
patches.

As qemu-devel itself is a very high traffic list, it's easy for a patch
to get lost if it's only sent there.

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
> +    if (fd >= 0) {
> +        ret = fcntl_setfl(fd, O_RDONLY);

I don't understand this part. Why are you trying to reopen the file
descriptor read-only? Shouldn't the test work fine with a read-write
file descriptor? /dev/null was opened O_RDWR in the old code.

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

F_OFD_GETLK doesn't modify the state, so it seems to me that even the
qemu_dup() is unnecessary and we could just directly try F_OFD_GETLK on
the passed file descriptor (orig_fd).

> +
> +    if (ret == 0) {
> +        return true;
> +    } else {
> +        return false;
> +    }

This should be written shorter as return ret == 0;

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

The logic looks fine to me, at least assuming that EINVAL is really what
we will consistently get from the kernel if OFD locks are not supported.
Is this documented anywhere? The fcntl manpage doesn't seem to mention
this case.

Anyway, I think I would try to minimise the duplication by having only
a small #ifdef section inside the function, maybe like this:

#ifdef F_OFD_SETLK
            ret = fcntl(fd, F_OFD_SETLK, fl);
            if ((ret == -1) && (errno == EINVAL)) {
                ofd_lock = false;
            }
#else
            ofd_lock = false;
#endif

>  static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
>  {
> -    int ret;
>      struct flock fl = {
>          .l_whence = SEEK_SET,
>          .l_start  = start,
>          .l_len    = len,
>          .l_type   = fl_type,
>      };
> -    qemu_probe_lock_ops();
> -    do {
> -        ret = fcntl(fd, fcntl_op_setlk, &fl);
> -    } while (ret == -1 && errno == EINTR);
> -    return ret == -1 ? -errno : 0;
> +
> +    return _qemu_lock_fcntl(fd, &fl);
>  }
>  
>  int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive)
> @@ -261,22 +277,49 @@ int qemu_unlock_fd(int fd, int64_t start, int64_t len)
>      return qemu_lock_fcntl(fd, start, len, F_UNLCK);
>  }
>  
> -int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
> +#ifdef F_OFD_SETLK
> +static int _qemu_lock_fd_test(int fd, struct flock *fl)
>  {
>      int ret;
> +
> +    ret = fcntl(fd, F_OFD_GETLK, fl);
> +    if ((ret == -1) && (errno != EINVAL)) {
> +        return -errno;
> +

Please remove this empty line.

The parentheses in the condition (above and below) are not stricly
necessary.

> +    } else if ((ret == -1) && (errno == EINVAL)) {
> +        /* Fallback to POSIX lock */
> +        ret = fcntl(fd, F_GETLK, fl);
> +        if (ret == -1) {
> +            return -errno;
> +        }
> +    }
> +
> +    return fl->l_type == F_UNLCK ? 0 : -EAGAIN;
> +}
> +#else
> +static int _qemu_lock_fd_test(int fd, struct flock *fl)
> +{
> +    int ret;
> +
> +    ret = fcntl(fd, F_GETLK, fl);
> +    if (ret == -1) {
> +        return -errno;
> +    } else {
> +        return fl->l_type == F_UNLCK ? 0 : -EAGAIN;
> +    }
> +}
> +#endif

Same idea as above: #ifdef only around the fcntl(F_OFD_GETLK) call can
minimise the code duplication.

> +int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
> +{
>      struct flock fl = {
>          .l_whence = SEEK_SET,
>          .l_start  = start,
>          .l_len    = len,
>          .l_type   = exclusive ? F_WRLCK : F_RDLCK,
>      };
> -    qemu_probe_lock_ops();
> -    ret = fcntl(fd, fcntl_op_getlk, &fl);
> -    if (ret == -1) {
> -        return -errno;
> -    } else {
> -        return fl.l_type == F_UNLCK ? 0 : -EAGAIN;
> -    }
> +
> +    return _qemu_lock_fd_test(fd, &fl);
>  }
>  #endif

After moving the #ifdef into the function, you can inline
_qemu_lock_fd_test() and and _qemu_lock_fcntl() again. This is also good
because identifiers starting with an underscore are reserved in the C
standard.

Kevin


