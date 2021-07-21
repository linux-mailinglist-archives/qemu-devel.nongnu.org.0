Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828183D0F5D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:18:37 +0200 (CEST)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6C7Q-0000lv-JB
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m6C2W-0003RI-Nh
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:13:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m6C2U-0006g9-EO
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626873209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tPgLDPHMt6JPup9EVXYJZghmbTCbnRI/oF9h+63dkOo=;
 b=ci0iMeiJoYkvIdZTNzEt0bgf3iadFLvu+xqSdXYEAA4AtQ/Krt7zxr+sl2i6luIxWOGjZZ
 aXf+9qmcRkwTze4QDXO471DNDgMtPA4vzOziDqPi/1UemRfcMnKnVVqA9xXPFdOltsPKrM
 V8jZemj0lyaFvi80WACX0jIDOcfTqVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-TyRgNRZWOCKROg1UHFPFCw-1; Wed, 21 Jul 2021 09:13:26 -0400
X-MC-Unique: TyRgNRZWOCKROg1UHFPFCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D34F10CE7AD;
 Wed, 21 Jul 2021 13:13:23 +0000 (UTC)
Received: from localhost (ovpn-114-233.ams2.redhat.com [10.36.114.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 355F660583;
 Wed, 21 Jul 2021 13:13:23 +0000 (UTC)
Date: Wed, 21 Jul 2021 14:13:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH for-6.1? v2 0/3] linux-aio: limit the batch size to
 reduce queue latency
Message-ID: <YPgdcpbzbAy/6E+D@stefanha-x1.localdomain>
References: <20210721094211.69853-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721094211.69853-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HtDknYtU+fOH3k64"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.459, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HtDknYtU+fOH3k64
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 11:42:08AM +0200, Stefano Garzarella wrote:
> Since it's a performance regression, if possible we could include it in 6=
.1-rc1.
> There shouldn't be any particular criticism.
>=20
> v1: https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01526.html
> v2:
>   - s/bacth/batch/ [stefanha]
>   - limit the batch with the number of available events [stefanha]
>   - rebased on master
>   - re-run benchmarks
>=20
> Commit 2558cb8dd4 ("linux-aio: increasing MAX_EVENTS to a larger hardcode=
d
> value") changed MAX_EVENTS from 128 to 1024, to increase the number of
> in-flight requests. But this change also increased the potential maximum =
batch
> to 1024 elements.
>=20
> The problem is noticeable when we have a lot of requests in flight and mu=
ltiple
> queues attached to the same AIO context.
> In this case we potentially create very large batches. Instead, when we h=
ave
> a single queue, the batch is limited because when the queue is unplugged,
> there is a call to io_submit(2).
> In practice, io_submit(2) was called only when there are no more queues p=
lugged
> in or when we fill the AIO queue (MAX_EVENTS =3D 1024).
>=20
> This series limit the batch size (number of request submitted to the kern=
el
> through a single io_submit(2) call) in the Linux AIO backend, and add a n=
ew
> `aio-max-batch` parameter to IOThread to allow tuning it.
> If `aio-max-batch` is equal to 0 (default value), the AIO engine will use=
 its
> default maximum batch size value.
>=20
> I run some benchmarks to choose 32 as default batch value for Linux AIO.
> Below the kIOPS measured with fio running in the guest (average over 3 ru=
ns):
>=20
>                    |   master  |           with this series applied      =
      |
>                    |143c2e04328| maxbatch=3D8|maxbatch=3D16|maxbatch=3D32=
|maxbatch=3D64|
>           # queues | 1q  | 4qs | 1q  | 4qs | 1q  | 4qs | 1q  | 4qs | 1q  =
| 4qs |
> -- randread tests -|-----------------------------------------------------=
------|
> bs=3D4k iodepth=3D1    | 200 | 195 | 181 | 208 | 200 | 203 | 206 | 212 | =
200 | 204 |
> bs=3D4k iodepth=3D8    | 269 | 231 | 256 | 244 | 255 | 260 | 266 | 268 | =
270 | 250 |
> bs=3D4k iodepth=3D64   | 230 | 198 | 262 | 265 | 261 | 253 | 260 | 273 | =
253 | 263 |
> bs=3D4k iodepth=3D128  | 217 | 181 | 261 | 253 | 249 | 276 | 250 | 278 | =
255 | 278 |
> bs=3D16k iodepth=3D1   | 130 | 130 | 130 | 130 | 130 | 130 | 137 | 130 | =
130 | 130 |
> bs=3D16k iodepth=3D8   | 130 | 131 | 130 | 131 | 130 | 130 | 137 | 131 | =
131 | 130 |
> bs=3D16k iodepth=3D64  | 130 | 102 | 131 | 128 | 131 | 128 | 137 | 140 | =
130 | 128 |
> bs=3D16k iodepth=3D128 | 131 | 100 | 130 | 128 | 131 | 129 | 137 | 141 | =
130 | 129 |
>=20
> 1q  =3D virtio-blk device with a single queue
> 4qs =3D virito-blk device with multi queues (one queue per vCPU - 4)
>=20
> I reported only the most significant tests, but I also did other tests to
> make sure there were no regressions, here the full report:
> https://docs.google.com/spreadsheets/d/11X3_5FJu7pnMTlf4ZatRDvsnU9K3EPj6M=
n3aJIsE4tI
>=20
> Test environment:
> - Disk: Intel Corporation NVMe Datacenter SSD [Optane]
> - CPU: Intel(R) Xeon(R) Silver 4214 CPU @ 2.20GHz
> - QEMU: qemu-system-x86_64 -machine q35,accel=3Dkvm -smp 4 -m 4096 \
>           ... \
>           -object iothread,id=3Diothread0,aio-max-batch=3D${MAX_BATCH} \
>           -device virtio-blk-pci,iothread=3Diothread0,num-queues=3D${NUM_=
QUEUES}
>=20
> - benchmark: fio --ioengine=3Dlibaio --thread --group_reporting \
>                  --number_ios=3D200000 --direct=3D1 --filename=3D/dev/vdb=
 \
>                  --rw=3D${TEST} --bs=3D${BS} --iodepth=3D${IODEPTH} --num=
jobs=3D16
>=20
> Next steps:
>  - benchmark io_uring and use `aio-max-batch` also there
>  - make MAX_EVENTS parametric adding a new `aio-max-events` parameter
>=20
> Thanks,
> Stefano
>=20
> Stefano Garzarella (3):
>   iothread: generalize iothread_set_param/iothread_get_param
>   iothread: add aio-max-batch parameter
>   linux-aio: limit the batch size using `aio-max-batch` parameter
>=20
>  qapi/misc.json            |  6 ++-
>  qapi/qom.json             |  7 +++-
>  include/block/aio.h       | 12 ++++++
>  include/sysemu/iothread.h |  3 ++
>  block/linux-aio.c         |  9 ++++-
>  iothread.c                | 82 ++++++++++++++++++++++++++++++++++-----
>  monitor/hmp-cmds.c        |  2 +
>  util/aio-posix.c          | 12 ++++++
>  util/aio-win32.c          |  5 +++
>  util/async.c              |  2 +
>  qemu-options.hx           |  8 +++-
>  11 files changed, 134 insertions(+), 14 deletions(-)
>=20
> --=20
> 2.31.1
>=20

Thanks, applied to my master tree:
https://gitlab.com/stefanha/qemu/commits/master

Stefan

--HtDknYtU+fOH3k64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD4HXIACgkQnKSrs4Gr
c8j5hQf/R2wscriUxujhwDK0WY3iW5ANX+D9egRjrnGFqcGCwNTF3/GJLUaVxQhE
knkwwRFSFntSxDHZRZsj3MqefYUO2GFJku2eVNl3jDLVw025hiJHHaFV+qGJonLq
XiUN/fN6IEwHZOdvtZZSmKlglutRO3uLQ3SoZgumOsleVpA2xIUJXlih6o7xhOC9
5aRG5RmKthlcXuLtgtyVQ8sfiueirh4+ZgULlHrdXnqG+MpGUeDL7zISgu2cstD2
HJIMd9O+AMxN8wxPioCf5p1aTTnCbIltjtpk7HOZD1GwnTFq9Ux+EUqx44eST3CD
ichPXUiMgXi6uTSGiTUnBS7dWafBGA==
=nO+s
-----END PGP SIGNATURE-----

--HtDknYtU+fOH3k64--


