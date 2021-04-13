Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768535DA54
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:49:10 +0200 (CEST)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEjN-0003VH-CY
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWEho-00030D-UJ
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWEhk-00057j-F1
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618303646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=toKgVAnJuVYLi+hCjT0wQ/aK2AMGtA66iIJg+9E2OoM=;
 b=VeF11PZOhxr1ArtX8QLX/fmMhUKpfIb4OGP1L6jAcdbZJP9XPXwowe/QVbpQAEAWB/o6KF
 EA72esPw9VVXQAT4X1BmmV/yGYjKMkEJbGoo7V/SXXTmHHyhjATdwXteFQ3ziAvhx1cED/
 JAGYTEysho9lxxnafjTXXBQZQffBAXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-X0jsAQJTNu-tOd5BuPfR3w-1; Tue, 13 Apr 2021 04:47:24 -0400
X-MC-Unique: X0jsAQJTNu-tOd5BuPfR3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2CBF9F92B;
 Tue, 13 Apr 2021 08:47:23 +0000 (UTC)
Received: from localhost (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 805DA299C4;
 Tue, 13 Apr 2021 08:47:15 +0000 (UTC)
Date: Tue, 13 Apr 2021 09:47:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Subject: Re: [PATCH] vhost-user-fs: fix features handling
Message-ID: <YHVakoU5hY0wif2n@stefanha-x1.localdomain>
References: <20210408195534.647895-1-antonkuchin@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20210408195534.647895-1-antonkuchin@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5X0H9MV3cTES+qvK"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: virtio-fs@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5X0H9MV3cTES+qvK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 10:55:34PM +0300, Anton Kuchin wrote:
> Make virtio-fs take into account server capabilities.
>=20
> Just returning requested features assumes they all of then are implemente=
d
> by server and results in setting unsupported configuration if some of the=
m
> are absent.
>=20
> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>  hw/virtio/vhost-user-fs.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index ac4fc34b36..6cf983ba0e 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -24,6 +24,14 @@
>  #include "monitor/monitor.h"
>  #include "sysemu/sysemu.h"
> =20
> +static const int user_feature_bits[] =3D {
> +    VIRTIO_F_VERSION_1,
> +    VIRTIO_RING_F_INDIRECT_DESC,
> +    VIRTIO_RING_F_EVENT_IDX,
> +    VIRTIO_F_NOTIFY_ON_EMPTY,
> +    VHOST_INVALID_FEATURE_BIT
> +};

Please add:

VIRTIO_F_RING_PACKED
VIRTIO_F_IOMMU_PLATFORM

QEMU's virtiofsd does not enable either of these for now, but it's worth
allowing the vhost-user device backend to participate in negotiation so
that this can change in the future (or alternative virtiofsd
implementations can support these features).

--5X0H9MV3cTES+qvK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB1WpIACgkQnKSrs4Gr
c8i4Fgf+L+wCMhwPZ/BAkAceeQiKNByNCVMiTDWHiKe3BRsixlZVhtRmYdhxIoB2
3r7xK109cPr7/QSR++09l22mk2230tbUX0SYLhyAXKNrnNBI1QzBPp8PvFM5eMDU
KV8wnmdxNF5W0YILEri8KRXUIFlhescDkMQbnrjW/TDPChpzpCMf40o3BqJUiIK3
LFph7obLX15vR2mP5Zx6abU/aPTFZx9V9J9NwHP9EJyl89T0sSycWafmiySJQvDI
/Q52irxuvG5VuFcFiLzta79s4f/kaGqDu0kJq4/r4VnTA4LSjXvedEyz9oMeaOQK
VeDPlqkWMLyksah6xtObAREpfRMb2A==
=Qq8o
-----END PGP SIGNATURE-----

--5X0H9MV3cTES+qvK--


