Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437984210E0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:57:41 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOTM-0005Bf-4t
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXOQW-0002d6-7Q
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXOQT-00087I-KW
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633355680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IEYQaxv5FQyFqYg3IvEWQWj8UnuXklis4gIPQyv1hrk=;
 b=KJlSFAbzK+D/FH2kdDT/pEEuevfOg6d6e4B6Dpwi4XNTTSwPruyb03u/17cyNSKEghR8MU
 9jzFnYWafCkszX9OHOL/RMw4KaNkJUBI/MOCcpX2Ozy7GsIubeZXsDyWrMadsTMuXIfnuZ
 CsXPyhDSaFZ26Vm3a4fYtV5Cns/t4o0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-63HapcZHMAusTUO9wwiSdg-1; Mon, 04 Oct 2021 09:54:39 -0400
X-MC-Unique: 63HapcZHMAusTUO9wwiSdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FBBF5721D;
 Mon,  4 Oct 2021 13:54:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DAAC652AF;
 Mon,  4 Oct 2021 13:54:18 +0000 (UTC)
Date: Mon, 4 Oct 2021 14:54:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 06/13] vhost-user-fs: Use helpers to create/cleanup
 virtqueue
Message-ID: <YVsHifrJdRtVyERb@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-7-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-7-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CWiKzr2oM9sJPKTF"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

--CWiKzr2oM9sJPKTF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:30AM -0400, Vivek Goyal wrote:
> Add helpers to create/cleanup virtuqueues and use those helpers. I will

s/virtuqueues/virtqueues/

> need to reconfigure queues in later patches and using helpers will allow
> reusing the code.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  hw/virtio/vhost-user-fs.c | 87 +++++++++++++++++++++++----------------
>  1 file changed, 52 insertions(+), 35 deletions(-)
>=20
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index c595957983..d1efbc5b18 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -139,6 +139,55 @@ static void vuf_set_status(VirtIODevice *vdev, uint8=
_t status)
>      }
>  }
> =20
> +static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> +{
> +    /*
> +     * Not normally called; it's the daemon that handles the queue;
> +     * however virtio's cleanup path can call this.
> +     */
> +}
> +
> +static void vuf_create_vqs(VirtIODevice *vdev)
> +{
> +    VHostUserFS *fs =3D VHOST_USER_FS(vdev);
> +    unsigned int i;
> +
> +    /* Hiprio queue */
> +    fs->hiprio_vq =3D virtio_add_queue(vdev, fs->conf.queue_size,
> +                                     vuf_handle_output);
> +
> +    /* Request queues */
> +    fs->req_vqs =3D g_new(VirtQueue *, fs->conf.num_request_queues);
> +    for (i =3D 0; i < fs->conf.num_request_queues; i++) {
> +        fs->req_vqs[i] =3D virtio_add_queue(vdev, fs->conf.queue_size,
> +                                          vuf_handle_output);
> +    }
> +
> +    /* 1 high prio queue, plus the number configured */
> +    fs->vhost_dev.nvqs =3D 1 + fs->conf.num_request_queues;
> +    fs->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, fs->vhost_dev.n=
vqs);

These two lines prepare for vhost_dev_init(), so moving them here is
debatable. If a caller is going to use this function again in the future
then they need to be sure to also call vhost_dev_init(). For now it
looks safe, so I guess it's okay.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--CWiKzr2oM9sJPKTF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFbB4kACgkQnKSrs4Gr
c8hGlAgAwmM9a8sFrj+13RbkfOirZZX1fbsCv8nLOQLAxgIvluvq6AGf8aXsvmsW
I74wKaz05bQVw9hXBONNyiKRvytwPh1ybhXmolEkwE97vVRUq6REGwknLTEHf4EL
UX8azUs7mVvDl0zBCTb29ThkJuYouy6+jYE9xYJLt5fRyzbfIdi87XKZ/nywm/Fq
yCPpNUlSll7D/Sp7NqkjRXQB/gw8edbkx5H7DjFx8I1sigQ/2c5qFQ04OV2iNCSj
/NaaC5Xwm7gt6M5h8cE2LkgznzoavqTmoYVw2/ZIE/pwGkC4B1vYsL9fUJpyddER
dRTzy96Dcp+pL8fbZ5wzEBaVd2QJxA==
=RyaR
-----END PGP SIGNATURE-----

--CWiKzr2oM9sJPKTF--


