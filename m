Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90AB423B8C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 12:32:47 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4EA-0005tq-VQ
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 06:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mY48M-0008QQ-0R
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:26:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mY48K-000722-6i
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633516003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mf/BTZRYlhnvplUqXxV5OydYXWZbezvi7/EtV5PmSoU=;
 b=a7kQMPW5kKrbQ7LrD3Kchyc9Et+qVddBErqXhRWaISoFeaUgq9HCeIb0v41cTUj8XXmRRD
 UGZIXtIhMXYWlm/3Ne0SVkZV0U6iCIMpq4Sh5p8FHzOJ1gWXaFV3qdWPzwFQ5wErYQhyXT
 AsJSL4K1aJY29t6XH4RBf98bgjoa4Zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-4KJ82PZIPl-TwyrFe8-N9g-1; Wed, 06 Oct 2021 06:26:40 -0400
X-MC-Unique: 4KJ82PZIPl-TwyrFe8-N9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0FA119057A8;
 Wed,  6 Oct 2021 10:26:39 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3603100164A;
 Wed,  6 Oct 2021 10:26:29 +0000 (UTC)
Date: Wed, 6 Oct 2021 11:26:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 10/13] virtiofsd: Custom threadpool for remote blocking
 posix locks requests
Message-ID: <YV151ENHPk4x4bDf@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-11-vgoyal@redhat.com>
 <YVsVp4rPILhz+/Eh@stefanha-x1.localdomain>
 <YVyw/wCkjn1JBtDJ@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVyw/wCkjn1JBtDJ@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pClmepGuOd5g+OUL"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pClmepGuOd5g+OUL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 04:09:35PM -0400, Vivek Goyal wrote:
> On Mon, Oct 04, 2021 at 03:54:31PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Sep 30, 2021 at 11:30:34AM -0400, Vivek Goyal wrote:
> > > Add a new custom threadpool using posix threads that specifically
> > > service locking requests.
> > >=20
> > > In the case of a fcntl(SETLKW) request, if the guest is waiting
> > > for a lock or locks and issues a hard-reboot through SYSRQ then virti=
ofsd
> > > unblocks the blocked threads by sending a signal to them and waking
> > > them up.
> > >=20
> > > The current threadpool (GThreadPool) is not adequate to service the
> > > locking requests that result in a thread blocking. That is because
> > > GLib does not provide an API to cancel the request while it is
> > > serviced by a thread. In addition, a user might be running virtiofsd
> > > without a threadpool (--thread-pool-size=3D0), thus a locking request
> > > that blocks, will block the main virtqueue thread that services reque=
sts
> > > from servicing any other requests.
> > >=20
> > > The only exception occurs when the lock is of type F_UNLCK. In this c=
ase
> > > the request is serviced by the main virtqueue thread or a GThreadPool
> > > thread to avoid a deadlock, when all the threads in the custom thread=
pool
> > > are blocked.
> > >=20
> > > Then virtiofsd proceeds to cleanup the state of the threads, release
> > > them back to the system and re-initialize.
> >=20
> > Is there another way to cancel SETLKW without resorting to a new thread
> > pool? Since this only matters when shutting down or restarting, can we
> > close all plock->fd file descriptors to kick the GThreadPool workers ou=
t
> > of fnctl()?
>=20
> Ok, I tested this. If a thread is blocked on OFD lock and another
> thread closes associated "fd", it does not unblock the thread
> which is blocked on lock. So closing OFD can't be used for unblocking
> a thread.
>=20
> Even if it could be, it can't be a replacement for a thread pool
> in general as we can't block main thread otherwise it can deadlock.
> But we could have used another glib thread pool (instead of a
> custom thread pool which can handle signals to unblock threads).
>=20
> If you are curious, here is my test program.
>=20
> https://github.com/rhvgoyal/misc/blob/master/virtiofs-tests/ofd-lock.c
>=20
> Comments in there explain how to use it. It can block on an OFD
> lock and one can send SIGUSR1 which will close fd.

Thanks for investigating this! Too bad that the semantics of SETLKW are
not usable:

I ran two instances on my system so that the second instance blocks in
SETLKW and found the same thing. fcntl(fd, F_OFD_SETLKW, &flock) return
success even though the other thread already closed the fd while the
main thread was blocked in fcntl().

Here is where it gets weird: lslocks(1) shows the OFD locks that are
acquired (process 1) and waiting (process 2). When process 1 terminates,
process 2 makes progress but lslocks(1) shows there are no OFD locks.

This suggests that when fcntl(2) returns success in process 2, the OFD
lock is immediately released by the kernel since the fd was already
closed beforehand. Process 2 would have no way of releasing the lock
since it already closed its fd. So the 0 return value does not really
mean success - there is no acquired OFD lock when fcntl(2) returns!

The problem is that doesn't return early with -EBADFD or similar when
fcntl(2) is blocked, so we cannot use close(fd) to interrupt it :(.

Stefan

--pClmepGuOd5g+OUL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFdedQACgkQnKSrs4Gr
c8gtmQgAnibAp62CvB1Blwam1wX9sfvLzAaPAtBFP6AMx4cbtjs2FxZAJC78uDzG
gOZKirtMtxkFb62ONNq60fTIgnIRXB6Zv9wSURgrp1pBAW2j6xochUMy/p3Ykiz4
Yz6HTsrQ47HqemmEnXNm6aF5pOrxCdW8Xco6v0o5BaeOOJEpa0zIzypAZsKWwwDn
3FD9QaPIEDctccA2FOAjQ1+yFsADBeadiRdGstEJq0HaitMwGrd6W3OG7eN/Wd2K
wgqkiyA2p7jb5xz9LcTDPKrkUAMsQr1lae0J/Wc66qnA0tqMHA5soKluYXBQyn/e
skYAXfp9LSD7h4qfevfl6EaZp17vow==
=kpxh
-----END PGP SIGNATURE-----

--pClmepGuOd5g+OUL--


