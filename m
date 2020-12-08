Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065D92D2590
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:18:06 +0100 (CET)
Received: from localhost ([::1]:60290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYCD-0002cP-3Y
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYAf-0001cJ-0P
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:16:30 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:39346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYAb-000184-1B
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:16:28 -0500
Received: by mail-ej1-x644.google.com with SMTP id n26so23367899eju.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 00:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0MZ4ych3emYAu7+Q9yW/YIpRfM16QACSHELWSs2rWrA=;
 b=kF3j152eFYRZ/AwAwWDl/8sH1FPpTecOhMACHlnX2wSwpOpc27L5GyoUZDH2EvCMwK
 y9wdK63uwUY50RL+FKK/zFY7ENKQWtMei9T/F0e5Or8fI038x1kXF1sF1iwFXCgopmSZ
 AJOEaH2ql+No+qeGgAULvXiz+Aa5U0IxKDHTifUL42IzuKIBSNaQ/pZhZmfPEU7UhTou
 jF99BF0DppWSjdEFpvFU6Dcpd/2h1jWuRu8A5cPwUhFScGvhBsorFjDslWEVtkJS4M21
 tXsRydYs0Zv/Xh41I5eXCNNTkCFv+auW8eCgzL3yGUKOt5Y6+a+UpjbWfn52hfDkrVvE
 N6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0MZ4ych3emYAu7+Q9yW/YIpRfM16QACSHELWSs2rWrA=;
 b=NBXX53EsYvi1GmsYXKs8cYnWYiL4YGbhGx6+dzZCgvVy2OG7U6Z7KyVQKpfgJfJmw4
 ycfyxcrA0yt6WUD5VQNWXux8Irknq4ebR1iX26p3nsrodlnXy8e7l7CYedLg2fYi+lCp
 33r3rHvf0Jo1A3jJwmM7PqAen9IANi923yKcWVjRuG8FKh14ws3ZXaGVr70gj0sagTsc
 MQr7nIDaUbaf5ZZsQj4+Qp6QKxR7r/aehciABsEgACHEHXO7WEa2u6NKc6VkoY7ZCSBh
 IQDjOB9mmGw1CCDE/68bfdrYENomgyBZplXc1jKcgtQmTANx80OEdKKg6qlSxqXgBr6/
 Fwwg==
X-Gm-Message-State: AOAM530ZbHxpI4W27WypLVtZ9SCgqrJ4UqPBtkLtI3b4aZszMBaEpucM
 3Dc7OFlR89SVsptgsYb2fdI=
X-Google-Smtp-Source: ABdhPJxyWbI55Jd6qYICL2uwX+696K8Y0xIltzoZqUUzlSQ/rT8zc0suMehmzBTJUlToBddDlIP13Q==
X-Received: by 2002:a17:906:3294:: with SMTP id
 20mr22572710ejw.239.1607415383508; 
 Tue, 08 Dec 2020 00:16:23 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id z26sm16339109edl.71.2020.12.08.00.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 00:16:22 -0800 (PST)
Date: Tue, 8 Dec 2020 08:16:21 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 13/27] vhost: Send buffers to device
Message-ID: <20201208081621.GR203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-14-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="chReQkDOePndSGWY"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-14-eperezma@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x644.google.com
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


--chReQkDOePndSGWY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:51PM +0100, Eugenio P=E9rez wrote:
> -static inline bool vhost_vring_should_kick(VhostShadowVirtqueue *vq)
> +static bool vhost_vring_should_kick_rcu(VhostShadowVirtqueue *vq)

"vhost_vring_" is a confusing name. This is not related to
vhost_virtqueue or the vhost_vring_* structs.

vhost_shadow_vq_should_kick_rcu()?

>  {
> -    return virtio_queue_get_used_notify_split(vq->vq);
> +    VirtIODevice *vdev =3D vq->vdev;
> +    vq->num_added =3D 0;

I'm surprised that a bool function modifies state. Is this assignment
intentional?

> +/* virtqueue_add:
> + * @vq: The #VirtQueue
> + * @elem: The #VirtQueueElement

The copy-pasted doc comment doesn't match this function.

> +int vhost_vring_add(VhostShadowVirtqueue *vq, VirtQueueElement *elem)
> +{
> +    int host_head =3D vhost_vring_add_split(vq, elem);
> +    if (vq->ring_id_maps[host_head]) {
> +        g_free(vq->ring_id_maps[host_head]);
> +    }

VirtQueueElement is freed lazily? Is there a reason for this approach? I
would have expected it to be freed when the used element is process by
the kick fd handler.

> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 9352c56bfa..304e0baa61 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -956,8 +956,34 @@ static void handle_sw_lm_vq(VirtIODevice *vdev, Virt=
Queue *vq)
>      uint16_t idx =3D virtio_get_queue_index(vq);
> =20
>      VhostShadowVirtqueue *svq =3D hdev->sw_lm_shadow_vq[idx];
> +    VirtQueueElement *elem;
> =20
> -    vhost_vring_kick(svq);
> +    /*
> +     * Make available all buffers as possible.
> +     */
> +    do {
> +        if (virtio_queue_get_notification(vq)) {
> +            virtio_queue_set_notification(vq, false);
> +        }
> +
> +        while (true) {
> +            int r;
> +            if (virtio_queue_full(vq)) {
> +                break;
> +            }

Why is this check necessary? The guest cannot provide more descriptors
than there is ring space. If that happens somehow then it's a driver
error that is already reported in virtqueue_pop() below.

I wonder if you added this because the vring implementation above
doesn't support indirect descriptors? It's easy to exhaust the vhost
hdev vring while there is still room in the VirtIODevice's VirtQueue
vring.

--chReQkDOePndSGWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/PNlUACgkQnKSrs4Gr
c8i9Uwf+KL98CWZdfBbfOzMa4z1SurHdDzNVHmvessTG6JChYGBDqPsIWpD7BZkb
xT/Qq67zwsCyUzrAlmFN90vPucMpqvB21DfXXv4MpjBWS5X0yjwwMQFktulDW/0y
TYJd7mplqyRUC8UV0yzv4U7N9RH15oZ8fyZ0KvYwXhlLgjsfBZAPXekHrVU+Ir1W
5Lx5C+/+h0ocxFTU2ycn4y0flbIvYZXtGf5y9dX3g48JH0R8D81d7qXamsRAA1Cw
uYhOsTVIDTpLWPuT6gJXu8ibk2Zc8tFcBul+5G1XfMNWAaUkZqsQmzGpOl2p3DZK
XuOZqG530TE0w0AtfRTsiDrsjWfvjw==
=TPSt
-----END PGP SIGNATURE-----

--chReQkDOePndSGWY--

