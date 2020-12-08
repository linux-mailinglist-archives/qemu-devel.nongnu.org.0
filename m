Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199632D2680
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:44:13 +0100 (CET)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYbU-0007zd-5y
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYZQ-00078C-Nw
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:42:04 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:43654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYZO-00029J-OJ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:42:04 -0500
Received: by mail-ed1-x543.google.com with SMTP id q16so16682456edv.10
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 00:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dv5042T5Xl5anFxys9y89AYgrw+q8hp4hTeeMVqbfNM=;
 b=Wff6CoaMW3uX4r9WwTxFp+jpDE9pAduxRRSz4rVxEnS3miF+JZ5aS9POcaEvPBDpQz
 xXbitemYl5dTVKfKNkNxEU7WDwvcrfENEAVtPFtR9Cn0auNaRG8YJ9LDw41E/bwIBDos
 no7fegFtVm8SeEp8tLDpXgwXQ2mKUfL1Zymw1sn3DINpWzHt4irS9t/LQ6zXzsxRjiYL
 ZXw+AP9aHRwBDaRb8jHEcqgoWOnUV5aJpV64PykkpG0XMVbj8bXQtwVmroIefb/pSfyO
 2NR0mGnXYp/Nm1p1ydo3umt/7Juo4vr31PatUjq6dSribOltlKSB8LIlq0LSOK758U/H
 3zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dv5042T5Xl5anFxys9y89AYgrw+q8hp4hTeeMVqbfNM=;
 b=GHDPTjW1fu8PpAUqTSnos+2mMsbOfpSgcfXZQP0isE7syA/XyaHhMYgnpdI0ZmFHDJ
 sdpuBFfvIVIXGYone1Qpq74EKPKOG6iPsm91G8pJD+jVRymgXEMXqek5tpA2XvjaIoD4
 G7kp+/jXK8NfTGoqMl1QYvwzKAr/Gh7IFJAhEHBxTLYHb+H2XHMDaoXKVtxkbRM3RFDM
 bhWQOx6QE4I2LTB5iQ3zixg28rBkHH4HPfv55yrRL+PNgeIwIFBHt7TryiZAvhifNoHC
 KbMAtuNsAn6jaNT9RVYDCZHYzXRk5Pd8+DlVlKhJs94SlPeQR0jv3Msqxn33BRjPpFdu
 XLzw==
X-Gm-Message-State: AOAM532atVI4i+P6Ix60ACL8lBlXuLYi74yD1p2fmD9nN5MnvWQai0sF
 4APfSxA9JsC5roHL/8IyHPM=
X-Google-Smtp-Source: ABdhPJxKX9FUD+oYHW+oUA4G+bzORQxT3oENR+iOmlg23ZJuzgV75RiXV2XUS+CIPltJfjfZPeW9YQ==
X-Received: by 2002:a05:6402:a45:: with SMTP id
 bt5mr23987529edb.130.1607416920727; 
 Tue, 08 Dec 2020 00:42:00 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id m1sm13292254ejg.41.2020.12.08.00.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 00:41:59 -0800 (PST)
Date: Tue, 8 Dec 2020 08:41:58 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 18/27] vhost: add vhost_vring_poll_rcu
Message-ID: <20201208084158.GU203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-19-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sDhuxz86kt5qlkuV"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-19-eperezma@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x543.google.com
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


--sDhuxz86kt5qlkuV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:56PM +0100, Eugenio P=E9rez wrote:
> @@ -83,6 +89,18 @@ void vhost_vring_set_notification_rcu(VhostShadowVirtq=
ueue *vq, bool enable)
>      smp_mb();
>  }
> =20
> +bool vhost_vring_poll_rcu(VhostShadowVirtqueue *vq)

A name like "more_used" is clearer than "poll".

--sDhuxz86kt5qlkuV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/PPFYACgkQnKSrs4Gr
c8i/SQf/TvTgWv3whWVp5Emvh9/XNPEraByggX/NHutQ/7KU68p2ij7mFjVhwXoA
S6Cga7m5aygc3dDUoTF2rsp1uhontJMnUxLtq7glV2eUFpg/DqxfwBjU9uAYziyo
yqr4PaBlhgqJbNO9lsLXpwHX+KZwGDDsm+eiAPgOsKVltCQaHMCE3LETr3MX6JwU
ZHwC9DSppMxi7LXWqiTiHMwP006UxKxQQQfHiUpYYkZQ2qBpNpGXfQoebtyDgbUm
/lb3vNSJzsqrusZvv7j1LMVXFjPnpGdsry9w9q+ia9B68VPFQJp9CYwJxVIBA3DS
mOsdXqFq6+bwjli4YUG16be6Oc3rOg==
=k8Qa
-----END PGP SIGNATURE-----

--sDhuxz86kt5qlkuV--

