Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBAE33B016
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:38:37 +0100 (CET)
Received: from localhost ([::1]:45118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkcO-00086a-IT
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLkaI-00075H-Ly
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLkaF-000648-Q1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615804582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=56B6aIe++0DczDVhIDRxVw3oq05rDqq9FMRfJ7y+gPo=;
 b=E/uPrEgp0iWfF+Ibw9PXExaHCDN9Ylkg9bSsJeQaU6MLPFeJ0lqVJZ+jrFfSt3BHr+11Xx
 fN8d3ef+rUgm3F4uivbyRqJbT3N5ZU5aeizJNnJwPQuAW0GEhBPvz+2JZ34iOtpfIfBt/I
 siu0b078pXRqgWPSuWHRaPi7Rt3nIt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-VnsjOTWMNuyZuA8LfQPChw-1; Mon, 15 Mar 2021 06:36:19 -0400
X-MC-Unique: VnsjOTWMNuyZuA8LfQPChw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC2F61932486;
 Mon, 15 Mar 2021 10:36:18 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9C00100239A;
 Mon, 15 Mar 2021 10:36:11 +0000 (UTC)
Date: Mon, 15 Mar 2021 10:36:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 2/7] vhost-user: Fix double-close on slave_read()
 error path
Message-ID: <YE84mp9zLcGthhDg@stefanha-x1.localdomain>
References: <20210312092212.782255-1-groug@kaod.org>
 <20210312092212.782255-3-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210312092212.782255-3-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mZrQjOpYGClovNAv"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--mZrQjOpYGClovNAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 10:22:07AM +0100, Greg Kurz wrote:
> Some message types, e.g. VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG,
> can convey file descriptors. These must be closed before returning
> from slave_read() to avoid being leaked. This can currently be done
> in two different places:
>=20
> [1] just after the request has been processed
>=20
> [2] on the error path, under the goto label err:
>=20
> These path are supposed to be mutually exclusive but they are not
> actually. If the VHOST_USER_NEED_REPLY_MASK flag was passed and the
> sending of the reply fails, both [1] and [2] are performed with the
> same descriptor values. This can potentially cause subtle bugs if one
> of the descriptor was recycled by some other thread in the meantime.
>=20
> This code duplication complicates rollback for no real good benefit.
> Do the closing in a unique place, under a new fdcleanup: goto label
> at the end of the function.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/virtio/vhost-user.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--mZrQjOpYGClovNAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPOJoACgkQnKSrs4Gr
c8i6uwf+JwmQhn/F/YcxZJKo1B0eaXq7LNzPWlWuAkMTo6UKxobGYWbE3Mp5rpPm
4+VirdQ58yz7nyhEBwlVG5O+Nk6ddFVSizWK6BEifgebahfCMGRLIqTY1K44hjon
T5eyc9Qd7SZE1velPFapxSr6ydybn7895bB48dysAM3MF9NC+I//qPhh0J/ZtbI6
w0t+Nm47URhsYZlljJZP3Wt4T5oQfWTY9D5ycfriDwDey5tnZLJHsSI0x90jLyVd
YpynF4ibsLMEjXEH2O0fzAPelF/YGG1wqpp5eroPzZbaURmyypuuNhywi3m1SCoX
7LQ33ra2Z6frm6/iMmvVy4Cnogf83g==
=Y75D
-----END PGP SIGNATURE-----

--mZrQjOpYGClovNAv--


