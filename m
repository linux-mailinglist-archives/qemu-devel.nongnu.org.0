Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C860910532F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 14:35:43 +0100 (CET)
Received: from localhost ([::1]:40436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXmcY-0005S7-HS
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 08:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iXmad-0004no-3T
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:33:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iXmac-0005wD-2K
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:33:42 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36598)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iXmab-0005vT-Pe
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:33:42 -0500
Received: by mail-wr1-x441.google.com with SMTP id z3so4444022wru.3
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 05:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YKiSUPMy3jGzYNHPKdZejHgYRb4Zvfac5Y85g9FPbnU=;
 b=jP3zlog6ZmnW9VDMITGnbK3Yg89H442CZoZeJKdIP/Pd6r5m27E8M+JY8X496EMJ6z
 15hN1Z/x0ztZ2DEVB94XWQ85sTdkm/GXAK1EKlzTHKtegXiw3s4FUeKsldDgXmw4Gp5N
 qdX4yFxI2biC/k7N6Q6t547Oi1ifXofvYLqqfHvwh4ybd7CGyJcaxf1RI7GB1mM+P7I7
 /w4fg37HPJkxQMgq7NS+V2vzcdMBQeV7k0UqPulUbx17n4eiICwhbtJ6yBGtgbl4/Njh
 cNbstrg/to3l+fTriwaXk/Nm294jVtZj5wrYDSBo2Np9APkWy5yU4MRjOmRqSoN66QQl
 lLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YKiSUPMy3jGzYNHPKdZejHgYRb4Zvfac5Y85g9FPbnU=;
 b=Z919Y9nsUXXmEidzRdbes22qCotEQ+PNDYotxXCW3w5tyJ08amDjC4onlaTUGLYVJQ
 AGDuheoDNG+jCbZSSB68xFvfgw6Z8RhJ6vU08GWo87G2pFrl/bkKFHPRSicY9vxlsPQJ
 mdD3/01KfyFGVSPID923VasrArZeNTk6fudJ5hKvHmyGHXU1jdcvwW9bN/SMshCi0nu6
 qXgYUu/JE0Idss4+A2uU+BwpnrJk41pnT8qVXxLiodXpDe/1NGjX44uCs5SGVQh10LqR
 byBf5u312k8BEWYWwvjPS59NZoGK4bZDcNwyTM2xEDkeXmOLL9RmeVH/pE5BAzN47XC/
 ACjg==
X-Gm-Message-State: APjAAAXET2oOxvQdCMK3R+o2Ibod41gg/46+87udlP9lWSAiuoCEizj+
 L3rdDW+72mwcstixp9Pc+Cc=
X-Google-Smtp-Source: APXvYqyKyhQ7IZZni90jttOVsi/IK6oi72fBmD96T4vYEaMlAWsfeb80NBn+FrFseB/PlZHinyMuJw==
X-Received: by 2002:adf:f6cf:: with SMTP id y15mr10190381wrp.97.1574343220615; 
 Thu, 21 Nov 2019 05:33:40 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id z7sm1700794wma.46.2019.11.21.05.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 05:33:39 -0800 (PST)
Date: Thu, 21 Nov 2019 13:33:38 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>
Subject: Re: [PATCH v3 0/2] virtio: make seg_max virtqueue size dependent
Message-ID: <20191121133338.GU439743@stefanha-x1.localdomain>
References: <20191112111354.26324-1-dplotnikov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KAk/33nSS6LK84p9"
Content-Disposition: inline
In-Reply-To: <20191112111354.26324-1-dplotnikov@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: kwolf@redhat.com, fam@euphon.net, ehabkost@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KAk/33nSS6LK84p9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 02:13:52PM +0300, Denis Plotnikov wrote:
> v3:
>   * add property to set in machine type [MST]
>   * add min queue size check [Stefan]
>   * add avocado based test [Max, Stefan, Eduardo, Cleber]
>=20
> v2:
>   * the standalone patch to make seg_max virtqueue size dependent
>   * other patches are postponed
>  =20
> v1:
>   the initial series
>=20
> Denis Plotnikov (2):
>   virtio: make seg_max virtqueue size dependent
>   tests: add virtio-scsi and virtio-blk seg_max_adjust test
>=20
>  hw/block/virtio-blk.c                     |   9 +-
>  hw/core/machine.c                         |   3 +
>  hw/scsi/vhost-scsi.c                      |   2 +
>  hw/scsi/virtio-scsi.c                     |  10 +-
>  include/hw/virtio/virtio-blk.h            |   1 +
>  include/hw/virtio/virtio-scsi.h           |   1 +
>  tests/acceptance/virtio_seg_max_adjust.py | 135 ++++++++++++++++++++++
>  7 files changed, 159 insertions(+), 2 deletions(-)
>  create mode 100755 tests/acceptance/virtio_seg_max_adjust.py
>=20
> --=20
> 2.17.0
>=20
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--KAk/33nSS6LK84p9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3WkjIACgkQnKSrs4Gr
c8iW2wf/d2TzoZk3X1YF7s4s3ufWXNtNXMfWvGxGxm1PAaH9llUFS2ZwQgPfmLz6
g/GdFVLLbkHYzjr63FswbIDS8dKfTb2rROwDXTxGzVQ/BkH+/vK5ilLjjT9X3U7e
SJEJIaNnBbfa2hJmydFMqHw2+Ko1PWXv+A1gJeCjrI8SsezNx7F/3fxy170+gcHN
XIjmEIWyCiCTnk9SawoJOkeYg2nsKkqaC25I1YDq7F8dr0l3z2jvS7fevheN2/KX
IdSh9rFH2IwdZHsz+q7BiYst5qi03e83HaIIJlbQYtFlP8h8t5TcKJH76UN1bx/e
0gZ8cSqVnBZpiClASE8DBD8pt/x/Rg==
=R4UR
-----END PGP SIGNATURE-----

--KAk/33nSS6LK84p9--

