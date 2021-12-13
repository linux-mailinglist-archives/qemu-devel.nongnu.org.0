Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC647311F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 17:03:21 +0100 (CET)
Received: from localhost ([::1]:58316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnnM-0006pc-6n
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 11:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnlf-0005tH-Jl
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 11:01:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnlc-0005UU-7A
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 11:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639411291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ne7qoKfSxVoINZDLm3Ayt6jcoqtbCFcdhO3c1Ja29ko=;
 b=AjlHrdDe0yt9q06yDqQQNWQPiQvvWPYAdgKpWVfhzFWf3xWmimdIuDUm2zzk+KWophgPh4
 MmaJjYLMhjrSQ5ps+9XEej0yRj72LmEDcmN50HasSLNhMcWonpDE5JgyzbT3ZmQjZdhyco
 Ta9dPJ/eGnh5s/xEmFv2LitH3f2He7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-sg8h4fjDPAOo2S6CJo_5FA-1; Mon, 13 Dec 2021 11:01:28 -0500
X-MC-Unique: sg8h4fjDPAOo2S6CJo_5FA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F30D3102C858;
 Mon, 13 Dec 2021 16:01:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66ED57AB5B;
 Mon, 13 Dec 2021 16:01:24 +0000 (UTC)
Date: Mon, 13 Dec 2021 16:01:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/6] aio-posix: split poll check from ready handler
Message-ID: <YbduUxqibwDie3Vt@stefanha-x1.localdomain>
References: <20211207132336.36627-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207132336.36627-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ax/RBNHfth0NNMo5"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Peter Lieven <pl@kamp.de>,
 Stefan Weil <sw@weilnetz.de>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Ax/RBNHfth0NNMo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 01:23:30PM +0000, Stefan Hajnoczi wrote:
> v3:
> - Fixed FUSE export aio_set_fd_handler() call that I missed and double-ch=
ecked
>   for any other missing call sites using Coccinelle [Rich]
> v2:
> - Cleaned up unused return values in nvme and virtio-blk [Stefano]
> - Documented try_poll_mode() ready_list argument [Stefano]
> - Unified virtio-blk/scsi dataplane and non-dataplane virtqueue handlers =
[Stefano]
>=20
> The first patch improves AioContext's adaptive polling execution time
> measurement. This can result in better performance because the algorithm =
makes
> better decisions about when to poll versus when to fall back to file desc=
riptor
> monitoring.
>=20
> The remaining patches unify the virtio-blk and virtio-scsi dataplane and
> non-dataplane virtqueue handlers. This became possible because the datapl=
ane
> handler function now has the same function signature as the non-dataplane
> handler function. Stefano Garzarella prompted me to make this refactoring=
.
>=20
> Stefan Hajnoczi (6):
>   aio-posix: split poll check from ready handler
>   virtio: get rid of VirtIOHandleAIOOutput
>   virtio-blk: drop unused virtio_blk_handle_vq() return value
>   virtio-scsi: prepare virtio_scsi_handle_cmd for dataplane
>   virtio: use ->handle_output() instead of ->handle_aio_output()
>   virtio: unify dataplane and non-dataplane ->handle_output()
>=20
>  include/block/aio.h             |  4 +-
>  include/hw/virtio/virtio-blk.h  |  2 +-
>  include/hw/virtio/virtio.h      |  5 +-
>  util/aio-posix.h                |  1 +
>  block/curl.c                    | 11 ++--
>  block/export/fuse.c             |  4 +-
>  block/io_uring.c                | 19 ++++---
>  block/iscsi.c                   |  4 +-
>  block/linux-aio.c               | 16 +++---
>  block/nfs.c                     |  6 +--
>  block/nvme.c                    | 51 ++++++++++++-------
>  block/ssh.c                     |  4 +-
>  block/win32-aio.c               |  4 +-
>  hw/block/dataplane/virtio-blk.c | 16 +-----
>  hw/block/virtio-blk.c           | 14 ++----
>  hw/scsi/virtio-scsi-dataplane.c | 60 +++-------------------
>  hw/scsi/virtio-scsi.c           |  2 +-
>  hw/virtio/virtio.c              | 73 +++++++++------------------
>  hw/xen/xen-bus.c                |  6 +--
>  io/channel-command.c            |  6 ++-
>  io/channel-file.c               |  3 +-
>  io/channel-socket.c             |  3 +-
>  migration/rdma.c                |  8 +--
>  tests/unit/test-aio.c           |  4 +-
>  util/aio-posix.c                | 89 +++++++++++++++++++++++++--------
>  util/aio-win32.c                |  4 +-
>  util/async.c                    | 10 +++-
>  util/main-loop.c                |  4 +-
>  util/qemu-coroutine-io.c        |  5 +-
>  util/vhost-user-server.c        | 11 ++--
>  30 files changed, 219 insertions(+), 230 deletions(-)
>=20
> --=20
> 2.33.1
>=20
>=20

Thanks, applied to my block-next tree:
https://gitlab.com/stefanha/qemu/commits/block-next

Stefan

--Ax/RBNHfth0NNMo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3blMACgkQnKSrs4Gr
c8iqcgf/dPRV3F1SsSIbqM0FdwEE60A00v6lVdZPUOkO7Q/WKqfO0bMBCh4j7cCt
/SeyrgrCLFH2cACI4jssYC+5EEvzNoxr/PUx3l+verGNr701uvth0z6T5IUkI5b3
r6Mmb+jeKlbW+K1L0AYA5Keo2eHVj9ci4Nt2+uFmXqRXkAwADUDNuYWHmY2IqMNs
T49i5IZyHwxO4wp0gKIA+jSpEvxhaQ8zabGWN+W/P8UtC1ZQ+Scu4fFekTOtV/zv
a4OBp6wfnbbEJ9MNbWFH/YkUSzx4ggq1xSu1kUvszLIQaEQFqBUhBoy9RJFelUnj
ov+bJByWyD5w7tXUU1Z6wdXJkghzJg==
=H9XI
-----END PGP SIGNATURE-----

--Ax/RBNHfth0NNMo5--


