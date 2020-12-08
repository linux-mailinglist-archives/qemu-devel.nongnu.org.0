Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6D62D2469
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 08:36:53 +0100 (CET)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmXYI-0008BE-GW
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 02:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmXWN-0007UM-SO
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 02:34:51 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmXWL-0007G0-R4
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 02:34:51 -0500
Received: by mail-ej1-x642.google.com with SMTP id g20so23278829ejb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 23:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KDNQai3ANvzHnuzmpGlNQLHSGL47jHO8xbQVoARcp+Y=;
 b=Ql2AB5GySJ65IFMHnw4MwFF+6A1fSxUbm0S/QCOsRh1e9K/RdvI9O9Yt/4u9lp/8zU
 WXpOxpcxkqc0ECWU/gBhCpde+JT2de7S+dnMJ/ThfJ2V2LjxOF40eH+xPBzu+Q/qIrx+
 IwJMliL/zNWO3P9FiZ3xRymHceBHcF2+A/XrgHm9IFQRlZCouH6KOsfRn0s5kND6IZsW
 ogcY6Q8BQynWXyWAzonWHDSrCT8Sypi5HvX/2Vh7p2n6UQ6hmXMEakUREVC0a87Bb0xI
 dc7Jx8nAnn6wruao79UPpFzmcbZp7kLhkcFlYOKujv5rwvsUxw/3IHEMFG9ts7W0/Zd7
 gtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KDNQai3ANvzHnuzmpGlNQLHSGL47jHO8xbQVoARcp+Y=;
 b=KfVQ5kFxlnoTfjjUCAYofS3nMKrOqjmdTx29E4vNYmUpNu6lBWhydx/uca0pmzMeUq
 +gPwKMkZNCOCBNjecpp35BmaVoH3+dF0Nb+X9YhKI7FEPHB/8S5jUWJrfw7llGVujw94
 2EsjfKLESn3ZIG9ueQeQGSgytzwkHFaNioJJuKJ1UGTGItN0KusKSY5UED2kTzFTvLkf
 QH77dQyutiazvaFfx78nINn1txVK2V5BWaP25sovUtPk+OCNPPtpKDpBR0MhK1hb8KrF
 eBKGzg13s9o5/3FIU8hS3QgvmAUQmiEcOG94wQ087wTuiM14uazQ8T66qT/z7rFS8fRb
 i65A==
X-Gm-Message-State: AOAM5318DhrYK6ThW0vDu5W0mC11xAfV2zVljW5xByfTcYkgC8lTvKRp
 siAzhspFWFhicb2TWERjX0Y=
X-Google-Smtp-Source: ABdhPJyAJ58CckXILtlZ1T1LSuVkaaFCXE8XFbVwePtP2qOXF2umzTx1ojn2UCAcCz94h+QkAZmFtg==
X-Received: by 2002:a17:907:444f:: with SMTP id
 on23mr22557982ejb.300.1607412888472; 
 Mon, 07 Dec 2020 23:34:48 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id mb15sm14605264ejb.9.2020.12.07.23.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 23:34:47 -0800 (PST)
Date: Tue, 8 Dec 2020 07:34:46 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 09/27] vhost: Route host->guest notification through
 qemu
Message-ID: <20201208073446.GP203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-10-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CKf/2jVYos1l2hij"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-10-eperezma@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CKf/2jVYos1l2hij
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:47PM +0100, Eugenio P=E9rez wrote:
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-sw-lm-ring.c |  3 +++
>  hw/virtio/vhost.c            | 20 ++++++++++++++++++++
>  2 files changed, 23 insertions(+)

I'm not sure I understand what is going here. The guest notifier masking
feature exists to support MSI masking semantics. It looks like this
patch repurposes the notifier to decouple the vhost hdev from the virtio
device's irqfd? But this breaks MSI masking. I think you need to set up
your own eventfd and assign it to the vhost hdev's call fd instead of
using the mask notifier.

>=20
> diff --git a/hw/virtio/vhost-sw-lm-ring.c b/hw/virtio/vhost-sw-lm-ring.c
> index 0192e77831..cbf53965cd 100644
> --- a/hw/virtio/vhost-sw-lm-ring.c
> +++ b/hw/virtio/vhost-sw-lm-ring.c
> @@ -50,6 +50,9 @@ VhostShadowVirtqueue *vhost_sw_lm_shadow_vq(struct vhos=
t_dev *dev, int idx)
>      r =3D dev->vhost_ops->vhost_set_vring_kick(dev, &file);
>      assert(r =3D=3D 0);
> =20
> +    vhost_virtqueue_mask(dev, dev->vdev, idx, true);
> +    vhost_virtqueue_pending(dev, idx);

Why is the mask notifier cleared? Could we lose a guest notification
here?

> +
>      return svq;
>  }
> =20
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 1d55e26d45..9352c56bfa 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -960,12 +960,29 @@ static void handle_sw_lm_vq(VirtIODevice *vdev, Vir=
tQueue *vq)
>      vhost_vring_kick(svq);
>  }
> =20
> +static void vhost_handle_call(EventNotifier *n)
> +{
> +    struct vhost_virtqueue *hvq =3D container_of(n,
> +                                              struct vhost_virtqueue,
> +                                              masked_notifier);
> +    struct vhost_dev *vdev =3D hvq->dev;
> +    int idx =3D vdev->vq_index + (hvq =3D=3D &vdev->vqs[0] ? 0 : 1);

vhost-net-specific hack

> +    VirtQueue *vq =3D virtio_get_queue(vdev->vdev, idx);
> +
> +    if (event_notifier_test_and_clear(n)) {
> +        virtio_queue_invalidate_signalled_used(vdev->vdev, idx);
> +        virtio_notify_irqfd(vdev->vdev, vq);

/* TODO push used elements into vq? */

--CKf/2jVYos1l2hij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/PLJYACgkQnKSrs4Gr
c8j+8gf+OhTHgPK0WzErs2NE4d0Ejs/ALV8z04626r9RXEFYC2Dmt4SiTUraP6EZ
P9Y5q2kAblCrBmheQQumXy/5QrGI1I/FCEtxRA1HFtSTfw8rElmzyKKMlv0I+aLY
06411eTjLH7Zcbw0DXBoCq/D34+j3B4s1XZK/sMWOtPofAxgzEAs24h+pmhkmHMz
y7vx211Io+dCP1BFJygv99K9fkMz3ZPYP9x9EBd49ySIaaIUQzEO+0knT1hVgd3w
28S8DYYxyu1XIrang6jbi9qxidnxf0VI1AhaibRWbBSYIrZeioGSeVUmJl32LrBR
fqt3IvJyBw52U11v0zbmStbzogfVOA==
=xYDv
-----END PGP SIGNATURE-----

--CKf/2jVYos1l2hij--

