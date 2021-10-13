Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104B42BC52
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:00:14 +0200 (CEST)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mab3V-0000Px-9m
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1maasQ-000889-UE
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1maasP-0001kr-Au
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634118524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rZ4hyzf5SL9LE5seWoEVs6AD+mN6vO8FuReiyNg2W3M=;
 b=Ivqj6qso1r+FMsL1PrJ1ZjhOTbdejBeXirlcERnJS9ejmJgp1UyXGuPMKg5B2maKZW3Z+4
 BAxDnX27waoAp6JFyn+JnW8AwUMnK2Jl/Y+684zLczw1SFDpRq3GOoGbElRwJpy4J1f9dk
 liE76ZdQ+HHvjc+eCxAY/b2tVjm+i9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-k7P1QCn6MqKJJ-FuqaWS4g-1; Wed, 13 Oct 2021 05:48:41 -0400
X-MC-Unique: k7P1QCn6MqKJJ-FuqaWS4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 205AA1006AA2;
 Wed, 13 Oct 2021 09:48:40 +0000 (UTC)
Received: from localhost (unknown [10.39.193.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F34E5B826;
 Wed, 13 Oct 2021 09:48:26 +0000 (UTC)
Date: Wed, 13 Oct 2021 10:48:25 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
Message-ID: <YWaraVenjaIZXHCc@stefanha-x1.localdomain>
References: <20211012183832.62603-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012183832.62603-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vVAsFVzapQoRKqko"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Coiby Xu <coiby.xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vVAsFVzapQoRKqko
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 08:38:32PM +0200, David Hildenbrand wrote:
> We end up not closing the file descriptor, resulting in leaking one
> file descriptor for each VHOST_USER_REM_MEM_REG message.
>=20
> Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Coiby Xu <coiby.xu@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index bf09693255..bb5c3b3280 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -839,6 +839,8 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>          vu_panic(dev, "Specified region not found\n");
>      }
> =20
> +    close(vmsg->fds[0]);

Does anything check that exactly 1 fd was received? For example,
vu_set_log_fd_exec() does:

  if (vmsg->fd_num !=3D 1) {
      vu_panic(dev, "Invalid log_fd message");
      return false;
  }

I think that's necessary both to make vhost-user master development
easier and because fds[] is not initialized to -1.

Stefan

--vVAsFVzapQoRKqko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFmq2kACgkQnKSrs4Gr
c8hXQwgAkqByQNIdM2yxlrPxXaPuu+CV9U3LRUeEwSvsAQcDula8ZkbCxIpjytCf
HtzxaDhpBRRgEFvfhdjzyXmvFaRpr72iBHdss26ml+uHHDyibU/P/UZN5zeOtIpA
HhBm/Ira+YmhV1p/k1rSM6lbmNq7Joh8Y5jjUc61epZYyurgRV1UkuYg398FyBRS
LEgLH80TJU0ouTVhalBRoRCTzrye2iRah1QGzkJ7izQpX7+d5XEEadAzHIfzHKrx
IC4mbpxolVxSLkayPJ7uSUgbM3ptsvaV6MTzSWeKTdgW2z4Bg7jblBYjnvo+UlJ+
oxlwWOpqvs5a6MvEenXXpjIw7Y9cEQ==
=ltgT
-----END PGP SIGNATURE-----

--vVAsFVzapQoRKqko--


