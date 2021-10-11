Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512C8428D46
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:46:15 +0200 (CEST)
Received: from localhost ([::1]:46682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZuh4-0000Ig-AB
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZuef-00070p-Ct
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:43:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZued-00055j-Hg
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633956222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g3JjZCz9UqhcIJXZZlLRFooKdIO0SFgPJiahj5cH7Kc=;
 b=DKb2o1I2WyAFbne7p23LMQRDJnEo18yuGpLCiGz16FOOPnmUCDtsv055Rupt3jYllK+zsR
 or4OdQi1AJDMRDKvgnT2QUHVjssC/Ele6A4qyEGR6qH7D51gybBbNqoGz2gkret+maDzsA
 GM74x2mwPGQcypzCXP6BWO9EKHWkg6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-pWwy5B5FODa0VnZmsnrlOQ-1; Mon, 11 Oct 2021 08:43:40 -0400
X-MC-Unique: pWwy5B5FODa0VnZmsnrlOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D7DE10B3960;
 Mon, 11 Oct 2021 12:43:39 +0000 (UTC)
Received: from localhost (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F5475D9F4;
 Mon, 11 Oct 2021 12:43:38 +0000 (UTC)
Date: Mon, 11 Oct 2021 13:43:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] coroutine: resize pool periodically instead of
 limiting size
Message-ID: <YWQxepmvtbtl73WA@stefanha-x1.localdomain>
References: <20210913153524.1190696-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210913153524.1190696-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iyAvV+jlJELk0SRm"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Tingting Mao <timao@redhat.com>, Honghao Wang <wanghonghao@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--iyAvV+jlJELk0SRm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 04:35:24PM +0100, Stefan Hajnoczi wrote:
> It was reported that enabling SafeStack reduces IOPS significantly
> (>25%) with the following fio benchmark on virtio-blk using a NVMe host
> block device:
>=20
>   # fio --rw=3Drandrw --bs=3D4k --iodepth=3D64 --runtime=3D1m --direct=3D=
1 \
> =09--filename=3D/dev/vdb --name=3Djob1 --ioengine=3Dlibaio --thread \
> =09--group_reporting --numjobs=3D16 --time_based \
>         --output=3D/tmp/fio_result
>=20
> Serge Guelton and I found that SafeStack is not really at fault, it just
> increases the cost of coroutine creation. This fio workload exhausts the
> coroutine pool and coroutine creation becomes a bottleneck. Previous
> work by Honghao Wang also pointed to excessive coroutine creation.
>=20
> Creating new coroutines is expensive due to allocating new stacks with
> mmap(2) and mprotect(2). Currently there are thread-local and global
> pools that recycle old Coroutine objects and their stacks but the
> hardcoded size limit of 64 for thread-local pools and 128 for the global
> pool is insufficient for the fio benchmark shown above.
>=20
> This patch changes the coroutine pool algorithm to a simple thread-local
> pool without a maximum size limit. Threads periodically shrink the pool
> down to a size sufficient for the maximum observed number of coroutines.
>=20
> The global pool is removed by this patch. It can help to hide the fact
> that local pools are easily exhausted, but it's doesn't fix the root
> cause. I don't think there is a need for a global pool because QEMU's
> threads are long-lived, so let's keep things simple.
>=20
> Performance of the above fio benchmark is as follows:
>=20
>       Before   After
> IOPS     60k     97k
>=20
> Memory usage varies over time as needed by the workload:
>=20
>             VSZ (KB)             RSS (KB)
> Before fio  4705248              843128
> During fio  5747668 (+ ~100 MB)  849280
> After fio   4694996 (- ~100 MB)  845184
>=20
> This confirms that coroutines are indeed being freed when no longer
> needed.
>=20
> Thanks to Serge Guelton for working on identifying the bottleneck with
> me!
>=20
> Reported-by: Tingting Mao <timao@redhat.com>
> Cc: Serge Guelton <sguelton@redhat.com>
> Cc: Honghao Wang <wanghonghao@bytedance.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>  * Retained minimum pool size of 64 to keep latency low for threads that
>    perform I/O infrequently and to prevent possible regressions [Daniele]
> ---
>  include/qemu/coroutine-pool-timer.h | 36 ++++++++++++++++
>  include/qemu/coroutine.h            |  7 +++
>  iothread.c                          |  6 +++
>  util/coroutine-pool-timer.c         | 35 +++++++++++++++
>  util/main-loop.c                    |  5 +++
>  util/qemu-coroutine.c               | 66 ++++++++++++++++-------------
>  util/meson.build                    |  1 +
>  7 files changed, 126 insertions(+), 30 deletions(-)
>  create mode 100644 include/qemu/coroutine-pool-timer.h
>  create mode 100644 util/coroutine-pool-timer.c

Applied to my block-next tree:
https://gitlab.com/stefanha/qemu/commits/block-next

Stefan

--iyAvV+jlJELk0SRm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFkMXoACgkQnKSrs4Gr
c8iumQgAozzh7LZ68RYhEW04oveYXTmfMGnBcy/k28TN1FawRoK8ihLn78Ipvhkl
Xptg5mrMQfitVji2tCWIYrqBoN/v46URloVxYY+v6YJTEePQCwjoEoQKgBJ2M4W6
anrSCvW6Q0FwsO7ISMKYOkUJTB6WG9UwxLzGvvdZtjYl0zs+WN7MjbZj8nXSyl3c
AzUBb/4WbGR/LUflLy+sVxiAf2IRrE9FJEhfDN9wXBVDlfnncAtG0Q/HEs6r5k0e
tGVNf0lkk1G/jUp18PUQje+sDSsoQvSTqHhY9qE4p7xQw7U5NGPyMbeJXkihxabN
LWHnsr3aVt/z8Eqa1zWOGJ8ouQXfNg==
=i2GQ
-----END PGP SIGNATURE-----

--iyAvV+jlJELk0SRm--


