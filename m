Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87DD405A76
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:54:05 +0200 (CEST)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOMNI-0005Sf-9x
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOMLB-0004Xg-Kt
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:51:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOML9-0003Ea-1Y
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:51:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631202708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xwrrp5au648I257JFAnoznDGXqPpOY4t1aPuIH0j8ZE=;
 b=ErO4ULQqd2P0mJkHSkO5fpIhkDYCyOASLEhKzP/BFHoVncTN409rga9oesQdkLNCcu7uty
 tKSlfzZfIKP+GFi1Pd4GAwdQvtvtgYLylZhxPy/w9B5ds89QUivQcymWKvMEEobPVz3rGm
 Utu24Wx5gDhPLuArzwOrKH2Fl1K53HU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-AKyUlHLMNRmxxGjwKGLOpg-1; Thu, 09 Sep 2021 11:51:47 -0400
X-MC-Unique: AKyUlHLMNRmxxGjwKGLOpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CE8384A5E0;
 Thu,  9 Sep 2021 15:51:46 +0000 (UTC)
Received: from localhost (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E09D5C1C5;
 Thu,  9 Sep 2021 15:51:45 +0000 (UTC)
Date: Thu, 9 Sep 2021 16:51:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] coroutine: resize pool periodically instead of limiting
 size
Message-ID: <YTotkCiuqTeDgJJ0@stefanha-x1.localdomain>
References: <20210901160923.525651-1-stefanha@redhat.com>
 <YTnHwJ/0O4rk7M7g@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTnHwJ/0O4rk7M7g@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qS09FERC6TzG4CjN"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tingting Mao <timao@redhat.com>,
 qemu-devel@nongnu.org, Honghao Wang <wanghonghao@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qS09FERC6TzG4CjN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 09, 2021 at 09:37:20AM +0100, Daniel P. Berrang=E9 wrote:
> On Wed, Sep 01, 2021 at 05:09:23PM +0100, Stefan Hajnoczi wrote:
> > It was reported that enabling SafeStack reduces IOPS significantly
> > (>25%) with the following fio benchmark on virtio-blk using a NVMe host
> > block device:
> >=20
> >   # fio --rw=3Drandrw --bs=3D4k --iodepth=3D64 --runtime=3D1m --direct=
=3D1 \
> > =09--filename=3D/dev/vdb --name=3Djob1 --ioengine=3Dlibaio --thread \
> > =09--group_reporting --numjobs=3D16 --time_based \
> >         --output=3D/tmp/fio_result
> >=20
> > Serge Guelton and I found that SafeStack is not really at fault, it jus=
t
> > increases the cost of coroutine creation. This fio workload exhausts th=
e
> > coroutine pool and coroutine creation becomes a bottleneck. Previous
> > work by Honghao Wang also pointed to excessive coroutine creation.
> >=20
> > Creating new coroutines is expensive due to allocating new stacks with
> > mmap(2) and mprotect(2). Currently there are thread-local and global
> > pools that recycle old Coroutine objects and their stacks but the
> > hardcoded size limit of 64 for thread-local pools and 128 for the globa=
l
> > pool is insufficient for the fio benchmark shown above.
>=20
> Rather than keeping around a thread local pool of coroutine
> instances, did you ever consider keeping around a pool of
> allocated stacks ? Essentially it seems like you're syaing
> the stack allocation is the problem due to it using mmap()
> instead of malloc() and thus not benefiting from any of the
> performance tricks malloc() impls use to avoid repeated
> syscalls on every allocation.  If 'qemu_alloc_stack' and
> qemu_free_stack could be made more intelligent by caching
> stacks, then perhaps the coroutine side can be left "dumb" ?

What is the advantage of doing that? Then the Coroutine struct needs to
be malloced each time. Coroutines are the only users of
qemu_alloc_stack(), so I think pooling the Coroutines is optimal.

> >=20
> > This patch changes the coroutine pool algorithm to a simple thread-loca=
l
> > pool without a size limit. Threads periodically shrink the pool down to
> > a size sufficient for the maximum observed number of coroutines.
> >=20
> > This is a very simple algorithm. Fancier things could be done like
> > keeping a minimum number of coroutines around to avoid latency when a
> > new coroutine is created after a long period of inactivity. Another
> > thought is to stop the timer when the pool size is zero for power savin=
g
> > on threads that aren't using coroutines. However, I'd rather not add
> > bells and whistles unless they are really necessary.
> >=20
> > The global pool is removed by this patch. It can help to hide the fact
> > that local pools are easily exhausted, but it's doesn't fix the root
> > cause. I don't think there is a need for a global pool because QEMU's
> > threads are long-lived, so let's keep things simple.
>=20
> QEMU's threads may be long-lived,  but are the workloads they service
> expected to be consistent over time?
>=20
> eg can we ever get a situation where Thread A has a peak of activity
> causing caching of many coroutines, and then go idle for a long time,
> while Thread B then has a peak and is unable to take advantage of the
> cache from Thread A that is now unused ?

It's possible to trigger that case, but it's probably not a real-world
scenario. It requires a storage controller that is emulated in the vCPU
thread (like AHCI) and a workload that alternates between vCPUs.
However, that configuration isn't expected to perform well anyway
(virtio-blk and virtio-scsi use IOThreads instead of running emulation
in vCPU threads because this reduces the cost of the vmexit).

Stefan

--qS09FERC6TzG4CjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE6LZAACgkQnKSrs4Gr
c8jY/QgAv0rJVrEyEZcLNokWQaJkzC+RVYV1d1u2poEq2wtMGbnU92dcQznHwE6x
qQ1tQ41kU289qVMrsCA4dy112FPoDVOQxNQLgNS5F1+nx/OAoLYU38KBZDbkJWkH
pdzvo2Vq4fR4WvnWULXvlEd0YGrtLPCdHPRBjohpuJOQpnMdn7TH3AyAP/rw5IFH
tBlbyc+sHhTT7zawWNTqUbPL0vP6do24o18oqOLfW3hiLQHY6ff0tlkczHU9Tdul
EecYhDtQIi7jb63Yn6wJJgZTCkQPDJKTSGZ4g+ZXvJs1GCnH8ibWRwc/yJjpgy/v
bmSKvI08mm1BWsaEgQ1hCeWfjOj5UQ==
=Kwbe
-----END PGP SIGNATURE-----

--qS09FERC6TzG4CjN--


