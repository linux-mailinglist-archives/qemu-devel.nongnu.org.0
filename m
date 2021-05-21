Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E9F38CC6B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:42:26 +0200 (CEST)
Received: from localhost ([::1]:32858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9AG-0001nt-IC
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lk961-0008Bc-Kd
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lk95y-0004Zv-Qj
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621618677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IGCWBIPch75sIo3uSe+nVDNsBAmdg9GxgtntLRMS6Ko=;
 b=YHHcZPnMfBZ/MpISONzK1pbrPkvaLHqeLI5NugIFoVj109lN5Q5/XAvtyDq8oWFR3ZP6IX
 /fxxJfjsDkI3J3K9elEiIIAPtkLvEQMnJt+M3z71oFSsR7Idx/CgQIEvnbA11cLDmXlTiK
 cl5VadBKAXuybkeTrbSRJEXajGUOJkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-q5YLVAjkMfuJ4zgOJarcIQ-1; Fri, 21 May 2021 13:37:53 -0400
X-MC-Unique: q5YLVAjkMfuJ4zgOJarcIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE5ED6D581;
 Fri, 21 May 2021 17:37:52 +0000 (UTC)
Received: from localhost (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFA9B60C17;
 Fri, 21 May 2021 17:37:48 +0000 (UTC)
Date: Fri, 21 May 2021 18:37:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 2/2] virtio-blk: Convert QEMUBH callback to "bitops.h"
 API
Message-ID: <YKfv68/UQvCl7Q7o@stefanha-x1.localdomain>
References: <20210510200758.2623154-1-philmd@redhat.com>
 <20210510200758.2623154-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210510200758.2623154-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nNTMWOG5S8y+Vxzf"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Chai Wen <chaiwen@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nNTMWOG5S8y+Vxzf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 10:07:58PM +0200, Philippe Mathieu-Daud=E9 wrote:
> By directly using find_first_bit() and find_next_bit from the
> "bitops.h" API to iterate over the bitmap, we can remove the
> bitmap[] variable-length array copy on the stack and the complex
> manual bit testing/clearing logic.
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
>=20
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-=
blk.c
> index e9050c8987e..a31fa94ca33 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -60,24 +60,14 @@ static void notify_guest_bh(void *opaque)
>  {
>      VirtIOBlockDataPlane *s =3D opaque;
>      unsigned nvqs =3D s->conf->num_queues;
> -    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
> -    unsigned j;
> =20
> -    memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
> -    memset(s->batch_notify_vqs, 0, sizeof(bitmap));
> +    for (unsigned long i =3D find_first_bit(s->batch_notify_vqs, nvqs);
> +             i < nvqs; i =3D find_next_bit(s->batch_notify_vqs, nvqs, i)=
) {

It needs to be find_next_bit(s->batch_notify_vqs, nvqs, i + 1).

--nNTMWOG5S8y+Vxzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCn7+sACgkQnKSrs4Gr
c8gUZggAlAeJ9X2VhWXZAB8Bjw+eSUfQCY+HONmQq5xMRV3/jRTdcM/N91Ia6n4Z
cDPzdA/oD9LzzlN/wY2DjBbQ3G3dIrT1mKvw5fD3O+FxQpLgLvkfTw1z16vk0gsI
EPVsMc5P1FPkQhAvq4qeeFqNETdI8Q4vr9LmGiF0kaXurQ3urEYxj0KY6EV32bw+
UA5YT+CLfT4lbod+D7OI3Lb0oOc7LDRt7O/3DyUAWv34oSbOLv9jHGAO17yRl4MH
2pG7q5HpHVaRdtKmo5MaOndd2rImgy3uETvUnY8ITKfyk4YkEYVp/+THVkLMG8r0
8rQB3v2/iNCYyyyfib52DzBRPAZMIA==
=8Jzy
-----END PGP SIGNATURE-----

--nNTMWOG5S8y+Vxzf--


