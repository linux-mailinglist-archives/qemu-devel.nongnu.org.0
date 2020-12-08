Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0859F2D24EF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 08:52:12 +0100 (CET)
Received: from localhost ([::1]:46322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmXn8-0003nW-S5
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 02:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmXka-0002wb-Ej
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 02:49:33 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:45625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmXkU-0005JM-GS
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 02:49:30 -0500
Received: by mail-ej1-x642.google.com with SMTP id qw4so23252116ejb.12
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 23:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4rL1+j26gkB7erofiOGo8PnZet2HWoJP4KemX2vffbo=;
 b=EDZMPhB73I4Mii/KMuvj6gb1rjF6rQhkVObEQc/NoDsHeQZTSxwA2e/GP7Pnvb3I+A
 si3AFq87uNTZi5nfPLxcC5rpMAajc3QRFs5InP8m5fUEso0JIWK8DDjes8rRetBU2CWe
 LB1adPwqtLY5XkmAnu+Zq+TK4HNLClKKtDUiPbwrB2SJnih9h+h0y1kDdis7Y0YiJBGC
 XevX7TfA0Smdinf8Dgxp08b/QEYj/wbTh+Ug3CZSOoNDBsc++XkF56aEDLqr4zpVQZYG
 O+YI9vFRSbhaqQ3YOoh7Dkvb/YUlARxRcbn3Rv+50G2rKgxOxrePJFkOiE5MPzTpIuRb
 idRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4rL1+j26gkB7erofiOGo8PnZet2HWoJP4KemX2vffbo=;
 b=YfcKnoZwaK3K400pWD3dTJEvuw6XFL5W64G8oTuaLwexpCxBLD4FgRxm27pCPkPUXc
 rvKRxmTu50Al1DK1CvSePwoW2DzfgbRKWHCQHMnwKaTv5f6pnNz5X8C3VeSEmrtGbaw4
 QGyaD3HEJ+jPabnUgXWrc3ngHL5aAyzahzCE4bh2agRxABwpAQQS0WLfVS7i5q6vAlgX
 vkR73szBmthS0IFzStUeEugTAWivhw5gO4dbfy1wN271ArmRUnozfasuJJCJDMfPfADs
 i0xgVcy5enluqCxj7EX3kqzDKXimIc1RNPQ9LukXJ6ZkVEWHLcmK0tNy979xCXVCJcHU
 nqCg==
X-Gm-Message-State: AOAM53060RInCz+ExuaBEVsV3L4bnrJhQkn11Fhc8krmKMqglia50usM
 sT1YwFBoHsb/kLXZfVhUWU4=
X-Google-Smtp-Source: ABdhPJxV3CSSLGGO1bLrsbPIe+eLOQhH8ex4ooVemMOpVQnhueMjPvGB0QMQd8PYfPB4UtiMSuYLTw==
X-Received: by 2002:a17:906:144e:: with SMTP id
 q14mr11118182ejc.150.1607413763062; 
 Mon, 07 Dec 2020 23:49:23 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id i2sm16262086edk.93.2020.12.07.23.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 23:49:21 -0800 (PST)
Date: Tue, 8 Dec 2020 07:49:20 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 10/27] vhost: Allocate shadow vring
Message-ID: <20201208074920.GQ203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-11-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="90KBcPA0h13nTGdQ"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-11-eperezma@redhat.com>
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


--90KBcPA0h13nTGdQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:48PM +0100, Eugenio P=E9rez wrote:
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-sw-lm-ring.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/virtio/vhost-sw-lm-ring.c b/hw/virtio/vhost-sw-lm-ring.c
> index cbf53965cd..cd7b5ba772 100644
> --- a/hw/virtio/vhost-sw-lm-ring.c
> +++ b/hw/virtio/vhost-sw-lm-ring.c
> @@ -16,8 +16,11 @@
>  #include "qemu/event_notifier.h"
> =20
>  typedef struct VhostShadowVirtqueue {
> +    struct vring vring;
>      EventNotifier hdev_notifier;
>      VirtQueue *vq;
> +
> +    vring_desc_t descs[];
>  } VhostShadowVirtqueue;

VhostShadowVirtqueue is starting to look like VirtQueue. Can the shadow
vq code simply use the VirtIODevice's VirtQueues instead of duplicating
this?

What I mean is:

1. Disable the vhost hdev vq and sync the avail index back to the
   VirtQueue.
2. Move the irq fd to the VirtQueue as its guest notifier.
3. Install the shadow_vq_handler() as the VirtQueue's handle_output
   function.
4. Move the call fd to the VirtQueue as its host notifier.

Now we can process requests from the VirtIODevice's VirtQueue using
virtqueue_pop() and friends. We're also in sync and ready for vmstate
save/load.

--90KBcPA0h13nTGdQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/PMAAACgkQnKSrs4Gr
c8gavQgAw1mEua4Bu1as46tr75SMdL7OZIjXLc7U/7ipGFzF/CpY2dWW+pn/fmuo
Hti2GT73HxO/dNY0bQBdAlSt3khiO7ACSjUB9rd6+xz6YUlak8q6I3OyITFHSxT6
pJFrKX6oaOoVSkM127eYJ90cGqnJrAiWXjdlabuRXaW542cksyu4sRmUzaOiPATi
rCJRf4A9PGRpyuLouwi2iFUemk/M+JHp7xP1RA4TcNFF1POdTLL6Pz3u4tnLR0hs
O1/EQRfEPmXnMlW3ZHQdGm/Wzlvw09Z1So19n6Xhzst8cOzVXqtwA995/LbUugXr
eF5QMy92/O8yaVSwkQfQ6/ejnSWA1w==
=j5kK
-----END PGP SIGNATURE-----

--90KBcPA0h13nTGdQ--

