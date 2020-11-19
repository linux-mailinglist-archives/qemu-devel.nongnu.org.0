Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342012B9EBA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 00:58:35 +0100 (CET)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kftov-0005WP-QU
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 18:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kftnP-0004yg-Q8; Thu, 19 Nov 2020 18:56:59 -0500
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:42771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kftnL-0006FA-Bi; Thu, 19 Nov 2020 18:56:57 -0500
Received: by mail-qv1-xf41.google.com with SMTP id b11so3870965qvr.9;
 Thu, 19 Nov 2020 15:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/aWK5YA856U9RTY9bUGRrjVSEVQilY5wkdTUUBrb1pM=;
 b=LfzKdLx2hYA+0yboOsQND7HIcSQYHjBNP5HNtS9ovMI+rZwlu6cUacfN0biHJ23OLV
 4TyOeW/4AxMFuBBO+Tn3FzfzwvRBtTtAaA7uPjypGfQY3M6yiHhL0RDXQbb8brfV431P
 ouXA5GcpEeZ14SxNz7ZILIKnUvcGfTdQLtiGSSXejDkZvBfNt7WWbOEUHv8bUgqHT/yJ
 e8FrhJ2kl/BTtGuNbYkVFD7kTidNjRINPExIQ65KulQMY8HF/BcdCDrvZ/taIiOuzWRr
 k9Ku2hpCaxBu2kMqReUEWo76Il/zYiaqkGinZafe6VH1X4J3sJ2LEffDmqUFROU7GdRu
 Nxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/aWK5YA856U9RTY9bUGRrjVSEVQilY5wkdTUUBrb1pM=;
 b=YffJqXQh5g8asfyv+kCnWnWomRVpK078oLuXjc0ID61uvuHxo2KvBqKI1Kz1h8tQAG
 9WZy1OzTmYaFNG6tqAVXJEwRaq2wElk9nGwdIXooQI5RA1QI37pf/C/5zOJRTreHSmNO
 mMiBSc2Pq+bBNx/p/iWHzAHOV7pJwptkuef2MXQH4WKtbIPWikDMq2zeYriEojodEMzF
 iyC1HfCx5clpPAVM4VJiKbH0ufEFP2dhf/I05xTfd1YqJNr+LrdaWgTYdKPwU79k8Mgf
 GrM6PINtiGq4lZdoQiKU+d9diaCToNCr2QTOLKhB45BCNTIqXbAk99OUUY/Q+GehPe60
 6UPQ==
X-Gm-Message-State: AOAM533YkqL3SZZ7AfDLpzZqeyKunugjuODeTVbYEN2yhrGiLhEeCv86
 GvXFJOty8fute5M7jFpS8w==
X-Google-Smtp-Source: ABdhPJzJsufxUN+Wsy5Li/pXl10gQXdT6ojQ/tBLafC755WGOMIkWzwrooge5nO0qFBgDPF4z/W2ow==
X-Received: by 2002:a0c:99c6:: with SMTP id y6mr13398097qve.60.1605830213768; 
 Thu, 19 Nov 2020 15:56:53 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id k188sm1003599qkd.98.2020.11.19.15.56.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 19 Nov 2020 15:56:52 -0800 (PST)
Date: Thu, 19 Nov 2020 18:56:50 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/2] file-posix: Use OFD lock only if the filesystem
 supports the lock
Message-ID: <20201119235650.62vcbycc5fc4oxec@gabell>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
 <20201118154247.GB11988@merkur.fritz.box>
 <20201118191036.yk4rju2hk4vpkhfl@gabell>
 <20201118194837.b54rp2qpbvuelosx@gabell>
 <20201119104442.GB4530@merkur.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119104442.GB4530@merkur.fritz.box>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f41;
 envelope-from=msys.mizuma@gmail.com; helo=mail-qv1-xf41.google.com
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

On Thu, Nov 19, 2020 at 11:44:42AM +0100, Kevin Wolf wrote:
> Am 18.11.2020 um 20:48 hat Masayoshi Mizuma geschrieben:
> > On Wed, Nov 18, 2020 at 02:10:36PM -0500, Masayoshi Mizuma wrote:
> > > On Wed, Nov 18, 2020 at 04:42:47PM +0100, Kevin Wolf wrote:
> > > > Am 06.11.2020 um 05:01 hat Masayoshi Mizuma geschrieben:
> > > > > From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> > > > > 
> > > > > locking=auto doesn't work if the filesystem doesn't support OFD lock.
> > > > > In that situation, following error happens:
> > > > > 
> > > > >   qemu-system-x86_64: -blockdev driver=qcow2,node-name=disk,file.driver=file,file.filename=/mnt/guest.qcow2,file.locking=auto: Failed to lock byte 100
> > > > > 
> > > > > qemu_probe_lock_ops() judges whether qemu can use OFD lock
> > > > > or not with doing fcntl(F_OFD_GETLK) to /dev/null. So the
> > > > > error happens if /dev/null supports OFD lock, but the filesystem
> > > > > doesn't support the lock.
> > > > > 
> > > > > Lock the actual file, not /dev/null, using F_OFD_SETLK and if that
> > > > > fails, then fallback to F_SETLK.
> > > > > 
> > > > > Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> 
> > > > > -bool qemu_has_ofd_lock(void)
> > > > > -{
> > > > > -    qemu_probe_lock_ops();
> > > > >  #ifdef F_OFD_SETLK
> > > > > -    return fcntl_op_setlk == F_OFD_SETLK;
> > > > > +static int _qemu_lock_fcntl(int fd, struct flock *fl)
> > > > > +{
> > > > > +    int ret;
> > > > > +    bool ofd_lock = true;
> > > > > +
> > > > > +    do {
> > > > > +        if (ofd_lock) {
> > > > > +            ret = fcntl(fd, F_OFD_SETLK, fl);
> > > > > +            if ((ret == -1) && (errno == EINVAL)) {
> > > > > +                ofd_lock = false;
> > > > > +            }
> > > > > +        }
> > > > > +
> > > > > +        if (!ofd_lock) {
> > > > > +            /* Fallback to POSIX lock */
> > > > > +            ret = fcntl(fd, F_SETLK, fl);
> > > > > +        }
> > > > > +    } while (ret == -1 && errno == EINTR);
> > > > > +
> > > > > +    return ret == -1 ? -errno : 0;
> > > > > +}
> > > > >  #else
> > > > > -    return false;
> > > > > -#endif
> > > > > +static int _qemu_lock_fcntl(int fd, struct flock *fl)
> > > > > +{
> > > > > +    int ret;
> > > > > +
> > > > > +    do {
> > > > > +        ret = fcntl(fd, F_SETLK, fl);
> > > > > +    } while (ret == -1 && errno == EINTR);
> > > > > +
> > > > > +    return ret == -1 ? -errno : 0;
> > > > >  }
> > > > > +#endif
> > > > 
> > > > The logic looks fine to me, at least assuming that EINVAL is really what
> > > > we will consistently get from the kernel if OFD locks are not supported.
> > > > Is this documented anywhere? The fcntl manpage doesn't seem to mention
> > > > this case.
> > 
> > The man page of fcntl(2) says:
> > 
> >        EINVAL The value specified in cmd is not recognized by this kernel.
> > 
> > So I think EINVAL is good enough to check whether the filesystem supports
> > OFD locks or not...
> 
> A kernel not knowing the cmd at all is a somewhat different case (and
> certainly a different code path) than a filesystem not supporting it.
> 
> I just had a look at the kernel code, and to me it seems that the
> difference between POSIX locks and OFD locks is handled entirely in
> filesystem independent code. A filesystem driver would in theory have
> ways to distinguish both, but I don't see any driver in the kernel tree
> that actually does this (and there is probably little reason for a
> driver to do so).
> 
> So now I wonder what filesystem you are using? I'm curious what I
> missed.

I'm using a proprietary filesystem, which isn't in the linux kernel.
The filesystem supports posix lock only, doesn't support OFD lock...

Thanks,
Masa

