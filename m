Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BFD2B801B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:08:25 +0100 (CET)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfP4K-0002d5-3I
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kfP2i-0001j3-3s
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:06:45 -0500
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:42776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kfP2a-0007aX-HC
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:06:42 -0500
Received: by mail-qv1-xf42.google.com with SMTP id b11so1132935qvr.9
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 07:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v91PDSfA50Nzwr7IZDXxwb/LkOLUTD9XC7INM3AnkOw=;
 b=Ua23qnY7QaV4hj2z/ExgeGXMy2MMfDSBfDkQDWFY+D9CDH/DiOhdXnTP1ets5ogq/A
 msJ0DQJ8CwboBpqf3IHZRTMeekpofby4sVMpVXjeeQiBEhy9ViZHxSfW3x0VV0CCGmRD
 qr3DIYDVApJmeVwsQobvAsa+H6kAmqSmf+MYGvhLi1BIbFBiKl67ACx2KdQzJg4u/1oz
 rDHDdf/pKzmjwx1LaQV+k4gAG2JsErtSoCT65eqfGvfNM2TMpbHpOiqJao5Sc2LACXiF
 N2UYuOQ/E+X0aofo/yW2DQmQ5PY0zpBJkowDA87E54Hqks5+ohe4spVbF5ZZZL65BVrp
 t0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v91PDSfA50Nzwr7IZDXxwb/LkOLUTD9XC7INM3AnkOw=;
 b=PcE6+KZTHpVeF/L62tV8oDmg3NCUEQ4uoZswBY6GTT0Jy23ftd9+yZqcepl+4o6mGu
 JBFmX16TGDzNRMUIm87MZbJ/fneB/bizUo07uYzCOeDF5doinp6x0fJY7rq7Gb7L5c8T
 RQ7aC0oiRD8GfPssiG5yEHcj5XLkiHPZVNYu6q5utTQSkPSUT9ouyIahLKlPyikaqViF
 2wgiQD1xVJMaCuu0/nifBbgPTLYEVaMvDiE5gU0O6xy1/jpFGGeDBaJk4hLkTraKLcRx
 EZwiuMWUQDH0kFYj7HXutQ50YlNhaKBSad6ldKL2NiTvFFM1C4nIX+LBAdAV4OykHmrF
 blAQ==
X-Gm-Message-State: AOAM532rE5gnJQLFzAfrTrzDeBH+Pj7jczFwxTe0u4suSo7esXaFgd1p
 kv+mU05tnodj7YAbRtsfvlcrL23q7A==
X-Google-Smtp-Source: ABdhPJxo6WAlJ5pskN8kQaDuhWdpq/FYPFH9CR8OEnbQmpxzCjRHcIyM+NQc3veDE7DPW2+tiZ74GA==
X-Received: by 2002:ad4:4673:: with SMTP id z19mr5266099qvv.60.1605711994330; 
 Wed, 18 Nov 2020 07:06:34 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id o9sm16659465qko.53.2020.11.18.07.06.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Nov 2020 07:06:33 -0800 (PST)
Date: Wed, 18 Nov 2020 10:06:31 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] file-posix: Use OFD lock only if the filesystem
 supports the lock
Message-ID: <20201118150631.ivpyxmhbeied7bwi@gabell>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106040102.13892-1-msys.mizuma@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f42;
 envelope-from=msys.mizuma@gmail.com; helo=mail-qv1-xf42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Would you review this patch when you have a chance?

Thanks!
Masa

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
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index c63926d592..a568dbf125 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -584,34 +584,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>      s->use_linux_io_uring = (aio == BLOCKDEV_AIO_OPTIONS_IO_URING);
>  #endif
>  
> -    locking = qapi_enum_parse(&OnOffAuto_lookup,
> -                              qemu_opt_get(opts, "locking"),
> -                              ON_OFF_AUTO_AUTO, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        ret = -EINVAL;
> -        goto fail;
> -    }
> -    switch (locking) {
> -    case ON_OFF_AUTO_ON:
> -        s->use_lock = true;
> -        if (!qemu_has_ofd_lock()) {
> -            warn_report("File lock requested but OFD locking syscall is "
> -                        "unavailable, falling back to POSIX file locks");
> -            error_printf("Due to the implementation, locks can be lost "
> -                         "unexpectedly.\n");
> -        }
> -        break;
> -    case ON_OFF_AUTO_OFF:
> -        s->use_lock = false;
> -        break;
> -    case ON_OFF_AUTO_AUTO:
> -        s->use_lock = qemu_has_ofd_lock();
> -        break;
> -    default:
> -        abort();
> -    }
> -
>      str = qemu_opt_get(opts, "pr-manager");
>      if (str) {
>          s->pr_mgr = pr_manager_lookup(str, &local_err);
> @@ -641,6 +613,34 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>      }
>      s->fd = fd;
>  
> +    locking = qapi_enum_parse(&OnOffAuto_lookup,
> +                              qemu_opt_get(opts, "locking"),
> +                              ON_OFF_AUTO_AUTO, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        ret = -EINVAL;
> +        goto fail;
> +    }
> +    switch (locking) {
> +    case ON_OFF_AUTO_ON:
> +        s->use_lock = true;
> +        if (!qemu_has_ofd_lock(s->fd)) {
> +            warn_report("File lock requested but OFD locking syscall is "
> +                        "unavailable, falling back to POSIX file locks");
> +            error_printf("Due to the implementation, locks can be lost "
> +                         "unexpectedly.\n");
> +        }
> +        break;
> +    case ON_OFF_AUTO_OFF:
> +        s->use_lock = false;
> +        break;
> +    case ON_OFF_AUTO_AUTO:
> +        s->use_lock = qemu_has_ofd_lock(s->fd);
> +        break;
> +    default:
> +        abort();
> +    }
> +
>      /* Check s->open_flags rather than bdrv_flags due to auto-read-only */
>      if (s->open_flags & O_RDWR) {
>          ret = check_hdev_writable(s->fd);
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index f9ec8c84e9..222138a81a 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -512,7 +512,7 @@ int qemu_dup(int fd);
>  int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
>  int qemu_unlock_fd(int fd, int64_t start, int64_t len);
>  int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
> -bool qemu_has_ofd_lock(void);
> +bool qemu_has_ofd_lock(int orig_fd);
>  #endif
>  
>  #if defined(__HAIKU__) && defined(__i386__)
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
>  
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
> +
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
>  
> -- 
> 2.27.0
> 

