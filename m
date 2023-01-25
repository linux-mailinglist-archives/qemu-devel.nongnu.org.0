Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A9967BFD6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 23:21:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKo7l-0005x9-Mg; Wed, 25 Jan 2023 17:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pKo7j-0005wy-IF
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:20:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pKo7h-0005X8-Kz
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674685205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Na3xe+QZCW01A+v/Yj9/ftxjQvjcENPbaW+sNyyenXI=;
 b=N5WY1p+6abgutvkUrG4GwTS9d+Frf+D/7nI3MZOD2yOHk56GWRLvsVsml6DUVxhBI2FiDF
 bZHVLcT9iUx9PmVlMyN44Ui0Ax4rLHyYtvTbKyufAVOkeLlcmzTFaqacIKQ5NDjdt4bnVn
 uHwHCPYz5hhTx2IHXmEslll2HWapwmU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-dZa9kRTuPoi_YhvH_rzgJQ-1; Wed, 25 Jan 2023 17:19:59 -0500
X-MC-Unique: dZa9kRTuPoi_YhvH_rzgJQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D7D7100F903;
 Wed, 25 Jan 2023 22:19:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B172F1121330;
 Wed, 25 Jan 2023 22:19:57 +0000 (UTC)
Date: Wed, 25 Jan 2023 17:19:55 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Amit Shah <amit@kernel.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
 "open list:Old World (g3beige)" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v4 3/3] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
Message-ID: <Y9GrC87Nbp6ViSBj@fedora>
References: <20230119070308.321653-1-alxndr@bu.edu>
 <20230119070308.321653-4-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PR/kp6ea097A6OkX"
Content-Disposition: inline
In-Reply-To: <20230119070308.321653-4-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--PR/kp6ea097A6OkX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 02:03:08AM -0500, Alexander Bulekov wrote:
> This protects devices from bh->mmio reentrancy issues.
>=20
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  hw/9pfs/xen-9p-backend.c        | 4 +++-
>  hw/block/dataplane/virtio-blk.c | 3 ++-
>  hw/block/dataplane/xen-block.c  | 5 +++--
>  hw/block/virtio-blk.c           | 5 +++--
>  hw/char/virtio-serial-bus.c     | 3 ++-
>  hw/display/qxl.c                | 9 ++++++---
>  hw/display/virtio-gpu.c         | 6 ++++--
>  hw/ide/ahci.c                   | 3 ++-
>  hw/ide/core.c                   | 3 ++-
>  hw/misc/imx_rngc.c              | 6 ++++--
>  hw/misc/macio/mac_dbdma.c       | 2 +-
>  hw/net/virtio-net.c             | 3 ++-
>  hw/nvme/ctrl.c                  | 6 ++++--
>  hw/scsi/mptsas.c                | 3 ++-
>  hw/scsi/scsi-bus.c              | 3 ++-
>  hw/scsi/vmw_pvscsi.c            | 3 ++-
>  hw/usb/dev-uas.c                | 3 ++-
>  hw/usb/hcd-dwc2.c               | 3 ++-
>  hw/usb/hcd-ehci.c               | 3 ++-
>  hw/usb/hcd-uhci.c               | 2 +-
>  hw/usb/host-libusb.c            | 6 ++++--
>  hw/usb/redirect.c               | 6 ++++--
>  hw/usb/xen-usb.c                | 3 ++-
>  hw/virtio/virtio-balloon.c      | 5 +++--
>  hw/virtio/virtio-crypto.c       | 3 ++-
>  25 files changed, 66 insertions(+), 35 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--PR/kp6ea097A6OkX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPRqwsACgkQnKSrs4Gr
c8j5WQf9F8Eg3nUxaGWZRHD3I8wFILb8NIBkmrWVzzVmfcZcxecQEQX/AJnoFfSP
7SY83PXVaWxyH5HHtNQMGMMchQ2bMO4m/8Rci3LPGKgDkauPzWbQVdj4mqkODrnl
/T+qIamwv5Zu7ddBh68Fi5qnA9OUGc6ycrKaQ0tDjA0xQ9j2ubdIw3i+KLLuUKLo
woyYb5kim7fMMt/1kVhUOM21c85TsFqe1hsyUjkbWN5fO3JifQPwoFjpYvNWDHdu
ysmdkchT2ekz2COepAVv5yc7yWI1ID8r7i//3xKrA486/GIm3XickhVNWoYNoU0e
Qo53IYuDqiMcWlTjSsfBJbq4CQa5iw==
=f/lH
-----END PGP SIGNATURE-----

--PR/kp6ea097A6OkX--


