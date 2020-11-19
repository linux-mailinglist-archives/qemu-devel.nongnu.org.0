Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E272B9067
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:48:57 +0100 (CET)
Received: from localhost ([::1]:41388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhUm-00086M-0g
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kfhQv-00059Q-GD
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:44:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kfhQr-0002t2-AJ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605782689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S8A6kUib9XH9HPGYz/o+koVf0KgN3JDBJqb05UG0mBQ=;
 b=XCZpsAM7Lsr0V+ypc+GUvqcvHo24b594JtASjjgw9cKvy1fkugmcyo514JBYeUwhHkFI+L
 CvCL/DfsATbTOZJ1LokInU1dxSl6ZRwqIIO1YZXFslGab8j7U8T1vsoy+hYP84jrVxAcv/
 RLbfALRisAQTuzJ4yHcgKAfeRRPYusk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-vAFHwHp3MkmLmC_uhJ4I8g-1; Thu, 19 Nov 2020 05:44:45 -0500
X-MC-Unique: vAFHwHp3MkmLmC_uhJ4I8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EEF18144F1;
 Thu, 19 Nov 2020 10:44:44 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8852A10016F5;
 Thu, 19 Nov 2020 10:44:43 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:44:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
Subject: Re: [PATCH 1/2] file-posix: Use OFD lock only if the filesystem
 supports the lock
Message-ID: <20201119104442.GB4530@merkur.fritz.box>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
 <20201118154247.GB11988@merkur.fritz.box>
 <20201118191036.yk4rju2hk4vpkhfl@gabell>
 <20201118194837.b54rp2qpbvuelosx@gabell>
MIME-Version: 1.0
In-Reply-To: <20201118194837.b54rp2qpbvuelosx@gabell>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.11.2020 um 20:48 hat Masayoshi Mizuma geschrieben:
> On Wed, Nov 18, 2020 at 02:10:36PM -0500, Masayoshi Mizuma wrote:
> > On Wed, Nov 18, 2020 at 04:42:47PM +0100, Kevin Wolf wrote:
> > > Am 06.11.2020 um 05:01 hat Masayoshi Mizuma geschrieben:
> > > > From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> > > > 
> > > > locking=auto doesn't work if the filesystem doesn't support OFD lock.
> > > > In that situation, following error happens:
> > > > 
> > > >   qemu-system-x86_64: -blockdev driver=qcow2,node-name=disk,file.driver=file,file.filename=/mnt/guest.qcow2,file.locking=auto: Failed to lock byte 100
> > > > 
> > > > qemu_probe_lock_ops() judges whether qemu can use OFD lock
> > > > or not with doing fcntl(F_OFD_GETLK) to /dev/null. So the
> > > > error happens if /dev/null supports OFD lock, but the filesystem
> > > > doesn't support the lock.
> > > > 
> > > > Lock the actual file, not /dev/null, using F_OFD_SETLK and if that
> > > > fails, then fallback to F_SETLK.
> > > > 
> > > > Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

> > > > -bool qemu_has_ofd_lock(void)
> > > > -{
> > > > -    qemu_probe_lock_ops();
> > > >  #ifdef F_OFD_SETLK
> > > > -    return fcntl_op_setlk == F_OFD_SETLK;
> > > > +static int _qemu_lock_fcntl(int fd, struct flock *fl)
> > > > +{
> > > > +    int ret;
> > > > +    bool ofd_lock = true;
> > > > +
> > > > +    do {
> > > > +        if (ofd_lock) {
> > > > +            ret = fcntl(fd, F_OFD_SETLK, fl);
> > > > +            if ((ret == -1) && (errno == EINVAL)) {
> > > > +                ofd_lock = false;
> > > > +            }
> > > > +        }
> > > > +
> > > > +        if (!ofd_lock) {
> > > > +            /* Fallback to POSIX lock */
> > > > +            ret = fcntl(fd, F_SETLK, fl);
> > > > +        }
> > > > +    } while (ret == -1 && errno == EINTR);
> > > > +
> > > > +    return ret == -1 ? -errno : 0;
> > > > +}
> > > >  #else
> > > > -    return false;
> > > > -#endif
> > > > +static int _qemu_lock_fcntl(int fd, struct flock *fl)
> > > > +{
> > > > +    int ret;
> > > > +
> > > > +    do {
> > > > +        ret = fcntl(fd, F_SETLK, fl);
> > > > +    } while (ret == -1 && errno == EINTR);
> > > > +
> > > > +    return ret == -1 ? -errno : 0;
> > > >  }
> > > > +#endif
> > > 
> > > The logic looks fine to me, at least assuming that EINVAL is really what
> > > we will consistently get from the kernel if OFD locks are not supported.
> > > Is this documented anywhere? The fcntl manpage doesn't seem to mention
> > > this case.
> 
> The man page of fcntl(2) says:
> 
>        EINVAL The value specified in cmd is not recognized by this kernel.
> 
> So I think EINVAL is good enough to check whether the filesystem supports
> OFD locks or not...

A kernel not knowing the cmd at all is a somewhat different case (and
certainly a different code path) than a filesystem not supporting it.

I just had a look at the kernel code, and to me it seems that the
difference between POSIX locks and OFD locks is handled entirely in
filesystem independent code. A filesystem driver would in theory have
ways to distinguish both, but I don't see any driver in the kernel tree
that actually does this (and there is probably little reason for a
driver to do so).

So now I wonder what filesystem you are using? I'm curious what I
missed.

Kevin


