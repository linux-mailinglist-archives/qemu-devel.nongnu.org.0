Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341FC2D25B4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:19:52 +0100 (CET)
Received: from localhost ([::1]:36934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYDv-0004dy-70
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYC8-0003H4-UH
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:18:00 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:34717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYC7-0001vf-7P
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:18:00 -0500
Received: by mail-ed1-x541.google.com with SMTP id dk8so13764550edb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 00:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BiHatFn29jpCwDDhBSm+X0xUHoMKEAQw9eUj4sTBRlM=;
 b=mQzGDDBdkuRnj6sxJrdTG4VLsqwKNasQhPknV11+Pb27T5zHd8ND5cE/Djp3nCtC+X
 mRSuXJy8UnNQ9MPbDTV9NREs531651euPnlM6X1VV7T1aHhD4lOcB52TgpOijuJoWcmC
 LAWGMzcGgHB0S3Cdol4KEUXm9GqEoBhja1U4G0EWt+WfEMJAmJtXktow0Z6fRyjZfsLT
 rxrLLDJDJMhbscND2z2sjN5ThDAG/+oBWMTE8MK0SvpE5hCJvvQNPI5xDni+TxqIOxMo
 izM4EHrGKVv0m8M2uMTlXlZEfiSnZgExpNv/mQB6dODNYagN4wkxZ6xve+BbCqCOnrSB
 fjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BiHatFn29jpCwDDhBSm+X0xUHoMKEAQw9eUj4sTBRlM=;
 b=MZKuGvhRdgdMQaeTlbtZX0YLKq3TDKlshtKuPO/r967sCCxHM2FfO6r0T82RqxmigG
 3jzW86SKNhtS7VyrEun6R5+tiY05qKNjVUeMuS40sHYwAW1hveZnFVrqbzoTiCUT+/eh
 /BvrimBCYDLv4hRLt7IGtRSlkCjPMfd7jQF5uPc33wB6YOs+mSBzNnhDZQZXKFjWulUr
 m1jIfG1QI09bfYX0hvtq2/HFeipMs7m8bxaLxfGeeIE1PYbJd5w8krfxm0r9Bzr3/7R0
 Y6/8HAsqCsYPhOUhTBiLVjzuRzu1zO/ZXEhRDyg+4Uoru04OqVfz9TnmwnUREMNxGzn8
 i/ZQ==
X-Gm-Message-State: AOAM5319PJbJ4kZ1fUowgxRQIm46JrUyjYOV17AFbaDW/diWshWFopt8
 Qy+ydYsKXPwdf3QAYyr6ncQ=
X-Google-Smtp-Source: ABdhPJyHh0yxa7w8t9BjtnS6Zimgt4s5lHthEFOAPhZNJnJ55BjwATBi4HezVl7QtEVqO0Z0JSV7Pg==
X-Received: by 2002:aa7:d459:: with SMTP id q25mr23378343edr.279.1607415477826; 
 Tue, 08 Dec 2020 00:17:57 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id ch30sm16327737edb.8.2020.12.08.00.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 00:17:56 -0800 (PST)
Date: Tue, 8 Dec 2020 08:17:55 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 10/27] vhost: Allocate shadow vring
Message-ID: <20201208081755.GS203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-11-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="E1BPhOSoTthPQdPL"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-11-eperezma@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x541.google.com
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


--E1BPhOSoTthPQdPL
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

Looking at later patches I see that this is the vhost hdev vring state,
not the VirtIODevice vring state. That makes more sense.

--E1BPhOSoTthPQdPL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/PNrMACgkQnKSrs4Gr
c8hJxQf/Xue75u7nedZDTV1CqmKKp32KUzPMlA5zalyXvgqpXIivVnQ97AKeTHt9
vwLbUTVRNrC+5TVoAsyAlBeqFCRzwcdOdxIBFfqHE8bbND4mV+98ka4xPEwwFYQG
zxbcGPKnGwvdUP/ZYk4l/qK2EUwAmqXBq9v9XiBzciMBptG+CVNCOppv4SqaWhdn
IdTLT2m0KevNzqTvF6jOy6zA4BSoKYOZENTh20MSqWEILqCREtS/VkHCiqVW4DuJ
653E63sKml4j2uCGj25Tvs0JV6B+yDDf5jyz97B4qW8ur8cGbxmklBjXrlUSaBfI
m9FnQX/MGv39h7gG9BRaDnGfk7DyMQ==
=d+Ix
-----END PGP SIGNATURE-----

--E1BPhOSoTthPQdPL--

