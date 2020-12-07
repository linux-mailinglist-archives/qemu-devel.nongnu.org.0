Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A063E2D1711
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:03:04 +0100 (CET)
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJuh-0006bz-Br
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmJqh-0005EW-7L
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:58:55 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:34673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmJqe-0002Zf-MM
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:58:55 -0500
Received: by mail-ej1-x644.google.com with SMTP id g20so20532008ejb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 08:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ODFYNKTjMTwnPrK31rw4SLzGgzSU67H0O2yeRZFdhqE=;
 b=StWv8dDxId3OKQIuDuKxj9jQNu0m2dzeV78062mOPIKyxMU89QJYro/YNl6/gjoSSS
 v+t8vX/HJok65OHBMUd/BtXcUpWPE5Ub+gyBQOwt1/2u/C8p+9CU+1Mcr4dA+Y14w57i
 45c9afhRrA+LOIgaVY/Kd651s2f0piLIcWD4/ZPGUokK04B51HiNdCtNJ238uJfgGUcE
 rw4cg4ji6epNW5tAC0WMjVbnEYY1SQjxkYzqX3FZ/JoKmSLH1MrT7IFpcIu3FPLfnUTb
 s+MZhd9GtEOIS4n+mXJNrCelojEWWRysYkGqyQ3LzTTqgH5FkkH79xzDO9SGVNseGj6i
 Q13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ODFYNKTjMTwnPrK31rw4SLzGgzSU67H0O2yeRZFdhqE=;
 b=pU/B3IGkUr46HMEwPoOzVjCb5eVJ4mkuAx9mq8C0FWT+1cvGVAOxlA+e3sNtpeCPEH
 QIwmYnyHRZM0KALVLuIYjEQ7xtjK5PnyuBwSOiQ65+jP33HECloWXa4EiKFI+PHL2VAG
 ZvPJKb3WIHIVM/GV4yNQyy+JHVLH4akcWZSSomgXId5hr5HvZnyDT282xhBArGoM45BP
 RoNvk3Yo2Fp4lUTmUYioPHXaWRJDlM0j8ggYlC8japyPRgMwZSM0FZY0l5so0fxybv32
 Ayumbr5njwZHKbC5Zn4ms0Vk7fYrDDRZYuThpssOiag/K1e300QsdEyYA0giJ9vzRSJm
 aoFA==
X-Gm-Message-State: AOAM532nT/M3cIDou+4aX9iM7zvJ70iyisjl1K6me8QWtLR7GaiIDUnu
 sOn2jUddJoLxbonxW9gFewQ=
X-Google-Smtp-Source: ABdhPJzHOW+Ylwqjw+on2+NxIj8szkbB93r8R6R4oPxzlBCIMpXESI+nx/IQwtqoqUYOs2yYBcEfMQ==
X-Received: by 2002:a17:907:447d:: with SMTP id
 oo21mr19969752ejb.367.1607360330523; 
 Mon, 07 Dec 2020 08:58:50 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id n1sm12853926ejb.2.2020.12.07.08.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 08:58:49 -0800 (PST)
Date: Mon, 7 Dec 2020 16:58:48 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 06/27] virtio: Add virtio_queue_get_used_notify_split
Message-ID: <20201207165848.GM203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-7-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EOHJn1TVIJfeVXv2"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-7-eperezma@redhat.com>
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


--EOHJn1TVIJfeVXv2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:44PM +0100, Eugenio P=E9rez wrote:
> This function is just used for a few commits, so SW LM is developed
> incrementally, and it is deleted after it is useful.
>=20
> For a few commits, only the events (irqfd, eventfd) are forwarded.

s/eventfd/ioeventfd/ (irqfd is also an eventfd)

> +bool virtio_queue_get_used_notify_split(VirtQueue *vq)
> +{
> +    VRingMemoryRegionCaches *caches;
> +    hwaddr pa =3D offsetof(VRingUsed, flags);
> +    uint16_t flags;
> +
> +    RCU_READ_LOCK_GUARD();
> +
> +    caches =3D vring_get_region_caches(vq);
> +    assert(caches);
> +    flags =3D virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
> +    return !(VRING_USED_F_NO_NOTIFY & flags);
> +}

QEMU stores the notification status:

void virtio_queue_set_notification(VirtQueue *vq, int enable)
{
    vq->notification =3D enable; <---- here

    if (!vq->vring.desc) {
        return;
    }

    if (virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED)) {
        virtio_queue_packed_set_notification(vq, enable);
    } else {
        virtio_queue_split_set_notification(vq, enable);

I'm wondering why it's necessary to fetch from guest RAM instead of
using vq->notification? It also works for both split and packed
queues so the code would be simpler.

--EOHJn1TVIJfeVXv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/OX0gACgkQnKSrs4Gr
c8joJwgAxP2IQdibt4q6jUVfHjl/jy+5PpzROcRTI3+NTOW7RZAtHwg1VSLc+N8N
AGRSKiaMpsWS/ApNmdzTjrmMurFOZRjrsPVwu+UDqsd1vscYk9ZWhc3vS24gYSot
X9Y0av+ZpV0OBKlFGpEdqaOHt7LuK/IwyZe5fXGH0CAH25+OKky7gisAMXeY9c3L
CEusJ6PGE4fr+99IcJcefGiMPCW6QvmJQnvsq2F7ST1ArsPfhvZASZWnucmtXsNH
YywpV+RFNQrbyiMU86CwVE99COm16dTpb1n4QHu5+4tTQa9l3wy9cKTPrrFzlUGI
Wm8tTPQ1Njha3wNnYaoHBGcNMX0sCg==
=RgXt
-----END PGP SIGNATURE-----

--EOHJn1TVIJfeVXv2--

