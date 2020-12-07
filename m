Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27232D15E7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:27:01 +0100 (CET)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJLo-0001XM-91
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmJEq-0004gR-Mv
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:19:48 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmJEm-00054t-TX
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:19:48 -0500
Received: by mail-ej1-x644.google.com with SMTP id x16so20279680ejj.7
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 08:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/eSi/KSMttHPQgAIpGGrtrzzrv7ZxXO1mG7WIUe69XI=;
 b=XBQhYfKoE1vDdmR6R6aw3GslMvqVhMHR+mWPKtK7kFF2S2NzpY3QDbR3B6hc6uqB2E
 nS5Bx6SFAYDqdy/fjDiMPPqUVPc+FyRfT0Mx9I/PnAGu/JGo6420yHTKjXAI/83QoJOL
 KXW9KklObO+mMR2gx5SZMQ93dzL4aK86V3M06gRdD4Ycqegs37yDDNaOPBmd/SWAPiaN
 vjufootHqk+B7uY3S9qON91bzw2uV6jqjyhc5iolXZGBNiYZyorBkZ5P6gngcVB/eGIf
 Qd51RPCKHOL9iMwHe2rnG3dEWHa1S+/v+HWZK75ObhxIlKBH84bLAR3t++wW7yZgMvYR
 ah4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/eSi/KSMttHPQgAIpGGrtrzzrv7ZxXO1mG7WIUe69XI=;
 b=hvzzNZTxCsCseof7rPNqoNKVExBjsuZx5JkkGfpj1g8HrANZEwVaV9TP4V+RBdCuTH
 Q5W3pdXV1KRrUYnBq4YyHF7Jytqv15GIW/OzlvE8mU0yxV9UlYQDQcP6K/h7LWY2QfUn
 0iz8GyvqrkkbxSqo4LiwuxuRnyUgbgpr2sPq2HkAG4yrmpP2Pg1CoDaQ3vF+/ibuY5qM
 AjK1C5feGCSPSNaVxNs6suP0DdpUPGd6YobJnKJyl6Ul4VweDdBxTvUJ8nJ89JruGy7G
 SbYkGMm+SoecEbhzXUPszba0+xKHGibLlkQbe8dkJKABaCC6mjvsLObjG0eX5uns5t7O
 Edtg==
X-Gm-Message-State: AOAM533dGZcQeFVolLO3wtDjqTF9tudvWDVYWuyZZRcNKsNTSC/p29Fn
 ero+EzXpmFiijOZgNkdeTt0=
X-Google-Smtp-Source: ABdhPJwKqNkLOxHgzPO8kSnC1Cb3/OofXxUefrdmsY4FNYlS+ZjB5jXyTOtCYTslSsyc6ct9KuXq4A==
X-Received: by 2002:a17:906:7146:: with SMTP id
 z6mr19613913ejj.379.1607357981469; 
 Mon, 07 Dec 2020 08:19:41 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id u3sm12762018eje.33.2020.12.07.08.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 08:19:40 -0800 (PST)
Date: Mon, 7 Dec 2020 16:19:38 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 02/27] vhost: Add device callback in
 vhost_migration_log
Message-ID: <20201207161938.GJ203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-3-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZG+WKzXzVby2T9Ro"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-3-eperezma@redhat.com>
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


--ZG+WKzXzVby2T9Ro
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:40PM +0100, Eugenio P=E9rez wrote:
> This allows code to reuse the logic to not to re-enable or re-disable
> migration mechanisms. Code works the same way as before.
>=20
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 2bd8cdf893..2adb2718c1 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -862,7 +862,9 @@ err_features:
>      return r;
>  }
> =20
> -static int vhost_migration_log(MemoryListener *listener, bool enable)
> +static int vhost_migration_log(MemoryListener *listener,
> +                               bool enable,
> +                               int (*device_cb)(struct vhost_dev *, bool=
))

Please document the argument. What is the callback function supposed to
do ("device_cb" is not descriptive so I'm not sure)?

--ZG+WKzXzVby2T9Ro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/OVhoACgkQnKSrs4Gr
c8gwwgf+I95GBsEKHODfWsFkV4okONNvzPrm37wdLDLPOul1sVnt6WLfrSCIsaMV
JOtZ9+/JvsQFtyPkRSK8+rZhnj9hCnPpDeyHgi7L4w46JZsJDlxJTbu0cGOmg7N7
M3b/q3g6WY3uH2vDG7s47bQbzT+cLO9VTRRiD8G7Vww4r9gG2i0KAtAcnohsfDTQ
jPi3NnuwisOT8xYnj7+av7mVKgT1QhGFgGXp03qASF+KyLT/SCh8h7fOgYo/vrDb
JzDowD77/K9l4bsGOvPi3bpIJu0VPPQ7aTVxWjALnBRIqCce8yeY5angbK+aUjPZ
GLHd2rLH3KnQlEclmuCx0N8nCCvc1Q==
=P6IF
-----END PGP SIGNATURE-----

--ZG+WKzXzVby2T9Ro--

