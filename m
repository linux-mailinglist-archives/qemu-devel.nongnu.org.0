Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198D155C22
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 17:50:46 +0100 (CET)
Received: from localhost ([::1]:60698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j06q5-0004AY-2b
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 11:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60653)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1j06pD-0003eY-RL
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 11:49:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1j06pC-0004pw-SC
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 11:49:51 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41796)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1j06pC-0004np-Ln
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 11:49:50 -0500
Received: by mail-wr1-x443.google.com with SMTP id c9so3470204wrw.8
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 08:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=92uU3xpuUKXAnWusoGwd6BJzOpB2e8piLTQYa8P/0IM=;
 b=cMJU7U/rWOF8ZDdTaTj6thyE++n/qAY9UQ1hqdGb00eCjXRpp2/jR2Hl55xbjD3cLB
 tdWYPx35CrL6PHsb/g/vl+k+pxv5vNoJprc0e/yhjyYyQDMAQWHxOuEUU9AnjFjLKhX5
 G889g9n59V3iaeIXPGOP1MusCptFjbaOU2umbRW/u01u+/vxT+c/w+qlSCZjeoX1WJ+j
 35fjN7oq/xoOuaf8w6d/gf6vM/IkZ9SrwqEP51fwTlo0hfUBKHFxNRigQZKPVYAHvDbj
 ju/z8ADTJF8bIhYodO7owlCnyZO81ZgVtJYaY24mf36gKCdk3InyCJ0i2X4JKaoa1Z7J
 kfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=92uU3xpuUKXAnWusoGwd6BJzOpB2e8piLTQYa8P/0IM=;
 b=ladkzyNq1SC84EseBovTL2qzZRHNJHaEBGKxcEBVgf2wQf6vnSju4znoKG6pFmfDBB
 SAidIjKBVc04hwHdRqZdHoIPuIlssMu6FWYPzyf+Q4Z6qxZq2gUkY4QBz78dtJAmZBPJ
 XAddLzs7/dzaCoUplNeO6AEpH6fZz1nXJ8uTJtX8VjbSW4kw6x10QMdEIAj1UzSmCH/p
 mlF0M/SdAKETlIN/rDINEfa/BvIJCTC/f3TBj6txt0JKAHxjilVeBqOU0bQPqVpar9rL
 ajus85o8QijUCuybnVaOsQ1PjC1x3LKWBe5gyznmkrAIBaqi+jbXszgT95W2fEEX8/M6
 MUoQ==
X-Gm-Message-State: APjAAAWZcE9qTNz8ZYuDrf2Pai5VL8uqcy0MkJn8Xtk4ZX0LlFl7BUuH
 hEdokXXxuTdPGBeeQeMdZ9Q=
X-Google-Smtp-Source: APXvYqx/jcU2vtHr7vTIyZNXKu4QK8yyhN7UYnuF4sJBFJAkad++ft5EgFbQqOt0SfG2wvx+omtAAw==
X-Received: by 2002:adf:97d6:: with SMTP id t22mr5547260wrb.407.1581094189529; 
 Fri, 07 Feb 2020 08:49:49 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id w19sm3832825wmc.22.2020.02.07.08.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 08:49:48 -0800 (PST)
Date: Fri, 7 Feb 2020 16:49:47 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] hw/core: Allow setting 'virtio-blk-device.scsi'
 property on OSX host
Message-ID: <20200207164947.GK168381@stefanha-x1.localdomain>
References: <20200207001404.1739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Rex5+51txc1ort/q"
Content-Disposition: inline
In-Reply-To: <20200207001404.1739-1-philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Rex5+51txc1ort/q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2020 at 01:14:04AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Commit ed65fd1a2750 ("virtio-blk: switch off scsi-passthrough by
> default") changed the default value of the 'scsi' property of
> virtio-blk, which is only available on Linux hosts. It also added
> an unconditional compat entry for 2.4 or earlier machines.
>=20
> Trying to set this property on a pre-2.5 machine on OSX, we get:
>=20
>    Unexpected error in object_property_find() at qom/object.c:1201:
>    qemu-system-x86_64: -device virtio-blk-pci,id=3Dscsi0,drive=3Ddrive0: =
can't apply global virtio-blk-device.scsi=3Dtrue: Property '.scsi' not found
>=20
> Fix this error by marking the property optional.
>=20
> Fixes: ed65fd1a27 ("virtio-blk: switch off scsi-passthrough by default")
> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> v2: Reworded description (Cornelia)
>=20
> Extracted from testing series:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg675074.html
> ---
>  hw/core/machine.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--Rex5+51txc1ort/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl49lSsACgkQnKSrs4Gr
c8gl4wf+KAcn8Vs6f0jAh8kw1o9ktF+PHmxUesiACA+jKiYDmBK4hb8HRxU6SzSG
6dd0Z/tliODb+GGAIfI94PYd/zApyU1pR+3BPnDI/Inq4PjoVdpw4OVt8Iu/Lu7W
gjQZntD867XDF9qen81OswvHH8F6bAT8sX6oy1dTcuia/zLAu90h30F186YIlGWN
irLrDlRRAMk4KxoRvJ431Ra/2aPA4v7oiF0pe5sY0WZCaaM/+yqthHdFB7HQeDRH
CFQhZ7zUHDFiRNq2xI/Xa6yQNTl/qyuQaaM/vhNeqxlhM2Z2g+0J6aTMYUOhg2Ud
BwxtQ5Acg4NZBoDXWPbneZzVCb0a7g==
=e/cJ
-----END PGP SIGNATURE-----

--Rex5+51txc1ort/q--

