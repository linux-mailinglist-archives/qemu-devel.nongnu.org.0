Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236502B847D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:15:20 +0100 (CET)
Received: from localhost ([::1]:58308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSvH-0003LE-4I
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:15:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kfSqo-00023E-Kt; Wed, 18 Nov 2020 14:10:42 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:41100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kfSqm-0000pW-E9; Wed, 18 Nov 2020 14:10:42 -0500
Received: by mail-qk1-x742.google.com with SMTP id d9so2902101qke.8;
 Wed, 18 Nov 2020 11:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xjjtG8dKgKbh9DODZnGVivebvwnpQ/6Y/PkPUZsAXJ0=;
 b=XMwoNlS4sfEuD80bkrmbcaaoPAvbOk3Vceq9thZ65/X58JxjlYHWH6YFxxZ0+RItdW
 LDgH9g3Eaqy2pNL+Ic0W+mL3JBEsV31ZpoQavCP6L6C6NFShA2/iFhkelBs8pukpBdm3
 kWNsbjXCDHU5wMQc856qSdo7q2JvA3oiT4cQYNwIyjAKSyMmQd+sCX3cpz5QjlowVvHA
 PHQl8ZkS1ruG1UGc9evww5S2/pxjk+DixLCUC2vZ08/J/7BZwkLuCWl/SjY7tq46Tnxy
 GSp4xEAsQ2yZr2/3gsxdQb8aELlunQuAE0tJp0Nkhxyq0Fg0iQo5+7NBZqwF5+7LcqiT
 uNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xjjtG8dKgKbh9DODZnGVivebvwnpQ/6Y/PkPUZsAXJ0=;
 b=HDi0IgbqJZamYcqx4DVkWYOvxoXQeYlFGTuOHf+Udmn+sc7M71Uwum85xcsZdz9VzA
 /Mw25hR8HiozUf0GaUqGVpPA/RAiWRi9jHROgwig93lE0He6CkqE45asqbShPm2X3YBe
 Aa1fhAiEF7DkWEBRMYPZjjeQS7wXMsNIswzNsA7Q7QDT2klNq4Qrc2UOwPeqHc8JeVLm
 i1Y2Fyz4Po/7xEccruT6oz+QbKm1XN2+ctzVJts0QtRIYXEy2rUSNsF8qtEIu7H7VAq7
 i+yzJfE8W/S/ZU3QFwrRdvhsk/azJX8YWakuPVB2nRzNbLpjldSiTgWlVvqURosMNQjT
 EZIw==
X-Gm-Message-State: AOAM530/dqvCUigLI6BQJKfmr6AW+M16sFmOlX9d7CCqeq5B2YIid2zs
 dX0c4o1c5DOzcbwDo3VlSw==
X-Google-Smtp-Source: ABdhPJwdUbnu3UKVsB/1gjCpeSkqaZp7E4dWQukYn5nQdPv76XvYIi9aFAJS4t/vhqs62JwkECexFw==
X-Received: by 2002:a37:4552:: with SMTP id s79mr6402727qka.6.1605726638891;
 Wed, 18 Nov 2020 11:10:38 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id r14sm16572343qtu.25.2020.11.18.11.10.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Nov 2020 11:10:38 -0800 (PST)
Date: Wed, 18 Nov 2020 14:10:36 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/2] file-posix: Use OFD lock only if the filesystem
 supports the lock
Message-ID: <20201118191036.yk4rju2hk4vpkhfl@gabell>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
 <20201118154247.GB11988@merkur.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118154247.GB11988@merkur.fritz.box>
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=msys.mizuma@gmail.com; helo=mail-qk1-x742.google.com
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 04:42:47PM +0100, Kevin Wolf wrote:
> Am 06.11.2020 um 05:01 hat Masayoshi Mizuma geschrieben:
> > From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> > 
> > locking=auto doesn't work if the filesystem doesn't support OFD lock.
> > In that situation, following error happens:
> > 
> >   qemu-system-x86_64: -blockdev driver=qcow2,node-name=disk,file.driver=file,file.filename=/mnt/guest.qcow2,file.locking=auto: Failed to lock byte 100
> > 
> > qemu_probe_lock_ops() judges whether qemu can use OFD lock
> > or not with doing fcntl(F_OFD_GETLK) to /dev/null. So the
> > error happens if /dev/null supports OFD lock, but the filesystem
> > doesn't support the lock.
> > 
> > Lock the actual file, not /dev/null, using F_OFD_SETLK and if that
> > fails, then fallback to F_SETLK.
> > 
> > Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> 
> CCing qemu-block, which is the relevant mailing list. You can use the
> scripts/get_maintainer.pl script to find out who should be CCed on your
> patches.
> 
> As qemu-devel itself is a very high traffic list, it's easy for a patch
> to get lost if it's only sent there.

Thank you for letting me know.
I'll do scripts/get_maintainer.pl to get the mailing list before posting patches.

> 
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 66d01b9160..454e8ef9f4 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -117,9 +117,6 @@ int qemu_mprotect_none(void *addr, size_t size)
> >  
> >  #ifndef _WIN32
> >  
> > -static int fcntl_op_setlk = -1;
> > -static int fcntl_op_getlk = -1;
> > -
> >  /*
> >   * Dups an fd and sets the flags
> >   */
> > @@ -187,68 +184,87 @@ static int qemu_parse_fdset(const char *param)
> >      return qemu_parse_fd(param);
> >  }
> >  
> > -static void qemu_probe_lock_ops(void)
> > +bool qemu_has_ofd_lock(int orig_fd)
> >  {
> > -    if (fcntl_op_setlk == -1) {
> >  #ifdef F_OFD_SETLK
> > -        int fd;
> > -        int ret;
> > -        struct flock fl = {
> > -            .l_whence = SEEK_SET,
> > -            .l_start  = 0,
> > -            .l_len    = 0,
> > -            .l_type   = F_WRLCK,
> > -        };
> > -
> > -        fd = open("/dev/null", O_RDWR);
> > -        if (fd < 0) {
> > +    int fd;
> > +    int ret;
> > +    struct flock fl = {
> > +        .l_whence = SEEK_SET,
> > +        .l_start  = 0,
> > +        .l_len    = 0,
> > +        .l_type   = F_RDLCK,
> > +    };
> > +
> > +    fd = qemu_dup(orig_fd);
> > +    if (fd >= 0) {
> > +        ret = fcntl_setfl(fd, O_RDONLY);
> 
> I don't understand this part. Why are you trying to reopen the file
> descriptor read-only? Shouldn't the test work fine with a read-write
> file descriptor? /dev/null was opened O_RDWR in the old code.
> 
> > +        if (ret) {
> >              fprintf(stderr,
> > -                    "Failed to open /dev/null for OFD lock probing: %s\n",
> > -                    strerror(errno));
> > -            fcntl_op_setlk = F_SETLK;
> > -            fcntl_op_getlk = F_GETLK;
> > -            return;
> > -        }
> > -        ret = fcntl(fd, F_OFD_GETLK, &fl);
> > -        close(fd);
> > -        if (!ret) {
> > -            fcntl_op_setlk = F_OFD_SETLK;
> > -            fcntl_op_getlk = F_OFD_GETLK;
> > -        } else {
> > -            fcntl_op_setlk = F_SETLK;
> > -            fcntl_op_getlk = F_GETLK;
> > +                    "Failed to fcntl for OFD lock probing.\n");
> > +            qemu_close(fd);
> > +            return false;
> >          }
> > +    }
> > +
> > +    ret = fcntl(fd, F_OFD_GETLK, &fl);
> > +    qemu_close(fd);
> 
> F_OFD_GETLK doesn't modify the state, so it seems to me that even the
> qemu_dup() is unnecessary and we could just directly try F_OFD_GETLK on
> the passed file descriptor (orig_fd).

OK, I'll change to try F_OFD_GETLK of orig_fd directly.

> 
> > +
> > +    if (ret == 0) {
> > +        return true;
> > +    } else {
> > +        return false;
> > +    }
> 
> This should be written shorter as return ret == 0;
> 
> >  #else
> > -        fcntl_op_setlk = F_SETLK;
> > -        fcntl_op_getlk = F_GETLK;
> > +    return false;
> >  #endif
> > -    }
> >  }
> >  
> > -bool qemu_has_ofd_lock(void)
> > -{
> > -    qemu_probe_lock_ops();
> >  #ifdef F_OFD_SETLK
> > -    return fcntl_op_setlk == F_OFD_SETLK;
> > +static int _qemu_lock_fcntl(int fd, struct flock *fl)
> > +{
> > +    int ret;
> > +    bool ofd_lock = true;
> > +
> > +    do {
> > +        if (ofd_lock) {
> > +            ret = fcntl(fd, F_OFD_SETLK, fl);
> > +            if ((ret == -1) && (errno == EINVAL)) {
> > +                ofd_lock = false;
> > +            }
> > +        }
> > +
> > +        if (!ofd_lock) {
> > +            /* Fallback to POSIX lock */
> > +            ret = fcntl(fd, F_SETLK, fl);
> > +        }
> > +    } while (ret == -1 && errno == EINTR);
> > +
> > +    return ret == -1 ? -errno : 0;
> > +}
> >  #else
> > -    return false;
> > -#endif
> > +static int _qemu_lock_fcntl(int fd, struct flock *fl)
> > +{
> > +    int ret;
> > +
> > +    do {
> > +        ret = fcntl(fd, F_SETLK, fl);
> > +    } while (ret == -1 && errno == EINTR);
> > +
> > +    return ret == -1 ? -errno : 0;
> >  }
> > +#endif
> 
> The logic looks fine to me, at least assuming that EINVAL is really what
> we will consistently get from the kernel if OFD locks are not supported.
> Is this documented anywhere? The fcntl manpage doesn't seem to mention
> this case.
> 
> Anyway, I think I would try to minimise the duplication by having only
> a small #ifdef section inside the function, maybe like this:
> 
> #ifdef F_OFD_SETLK
>             ret = fcntl(fd, F_OFD_SETLK, fl);
>             if ((ret == -1) && (errno == EINVAL)) {
>                 ofd_lock = false;
>             }
> #else
>             ofd_lock = false;
> #endif

Great! I'll make this.

> 
> >  static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_type)
> >  {
> > -    int ret;
> >      struct flock fl = {
> >          .l_whence = SEEK_SET,
> >          .l_start  = start,
> >          .l_len    = len,
> >          .l_type   = fl_type,
> >      };
> > -    qemu_probe_lock_ops();
> > -    do {
> > -        ret = fcntl(fd, fcntl_op_setlk, &fl);
> > -    } while (ret == -1 && errno == EINTR);
> > -    return ret == -1 ? -errno : 0;
> > +
> > +    return _qemu_lock_fcntl(fd, &fl);
> >  }
> >  
> >  int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive)
> > @@ -261,22 +277,49 @@ int qemu_unlock_fd(int fd, int64_t start, int64_t len)
> >      return qemu_lock_fcntl(fd, start, len, F_UNLCK);
> >  }
> >  
> > -int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
> > +#ifdef F_OFD_SETLK
> > +static int _qemu_lock_fd_test(int fd, struct flock *fl)
> >  {
> >      int ret;
> > +
> > +    ret = fcntl(fd, F_OFD_GETLK, fl);
> > +    if ((ret == -1) && (errno != EINVAL)) {
> > +        return -errno;
> > +
> 
> Please remove this empty line.
> 
> The parentheses in the condition (above and below) are not stricly
> necessary.

Got it.

> 
> > +    } else if ((ret == -1) && (errno == EINVAL)) {
> > +        /* Fallback to POSIX lock */
> > +        ret = fcntl(fd, F_GETLK, fl);
> > +        if (ret == -1) {
> > +            return -errno;
> > +        }
> > +    }
> > +
> > +    return fl->l_type == F_UNLCK ? 0 : -EAGAIN;
> > +}
> > +#else
> > +static int _qemu_lock_fd_test(int fd, struct flock *fl)
> > +{
> > +    int ret;
> > +
> > +    ret = fcntl(fd, F_GETLK, fl);
> > +    if (ret == -1) {
> > +        return -errno;
> > +    } else {
> > +        return fl->l_type == F_UNLCK ? 0 : -EAGAIN;
> > +    }
> > +}
> > +#endif
> 
> Same idea as above: #ifdef only around the fcntl(F_OFD_GETLK) call can
> minimise the code duplication.
> 
> > +int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
> > +{
> >      struct flock fl = {
> >          .l_whence = SEEK_SET,
> >          .l_start  = start,
> >          .l_len    = len,
> >          .l_type   = exclusive ? F_WRLCK : F_RDLCK,
> >      };
> > -    qemu_probe_lock_ops();
> > -    ret = fcntl(fd, fcntl_op_getlk, &fl);
> > -    if (ret == -1) {
> > -        return -errno;
> > -    } else {
> > -        return fl.l_type == F_UNLCK ? 0 : -EAGAIN;
> > -    }
> > +
> > +    return _qemu_lock_fd_test(fd, &fl);
> >  }
> >  #endif
> 
> After moving the #ifdef into the function, you can inline
> _qemu_lock_fd_test() and and _qemu_lock_fcntl() again. This is also good
> because identifiers starting with an underscore are reserved in the C
> standard.

Got it, thanks! I'll post v2.

- Masa

