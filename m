Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8733240E9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:45:18 +0100 (CET)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwLl-00047b-GK
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEwKJ-0003WR-25
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:43:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEwKH-0005Dk-0R
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614181424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ggjdRPj/7xMJ1kI6IW8kVZc/NESG6/nOiafzIEn7XPc=;
 b=OUttWrkLeqC7SHMnCPdPPIiCLM6/2NDgz3wz8g+0LHE6DN/2j1B3ho1Z4BXxPk8kJnKosg
 /t4EvKzFG/1uFuADaXRdEC1AeJ5YnTDBCWyUcEKTVyV0P5Uqtod4zWG1nMXqnP4OJWgPys
 DCObQHzkVAT4sb9FoimbZnHCJYV9XRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-VaGOYYrPMNOlM3AIRgYKKw-1; Wed, 24 Feb 2021 10:43:40 -0500
X-MC-Unique: VaGOYYrPMNOlM3AIRgYKKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EE1611398DC;
 Wed, 24 Feb 2021 15:12:27 +0000 (UTC)
Received: from localhost (ovpn-115-137.ams2.redhat.com [10.36.115.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB7529CA0;
 Wed, 24 Feb 2021 15:12:23 +0000 (UTC)
Date: Wed, 24 Feb 2021 15:12:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 01/12] vhost-user-blk: fix blkcfg->num_queues endianness
Message-ID: <YDZs1wFYqgJcTLGr@stefanha-x1.localdomain>
References: <20210223144653.811468-1-stefanha@redhat.com>
 <20210223144653.811468-2-stefanha@redhat.com>
 <20210223111018-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210223111018-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ucfh2jvIfynHPZkt"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ucfh2jvIfynHPZkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 11:13:47AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 23, 2021 at 02:46:42PM +0000, Stefan Hajnoczi wrote:
> > Treat the num_queues field as virtio-endian. On big-endian hosts the
> > vhost-user-blk num_queues field was in the wrong endianness.
> >=20
> > Move the blkcfg.num_queues store operation from realize to
> > vhost_user_blk_update_config() so feature negotiation has finished and
> > we know the endianness of the device. VIRTIO 1.0 devices are
> > little-endian, but in case someone wants to use legacy VIRTIO we suppor=
t
> > all endianness cases.
> >=20
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>=20
> okay but as we recently discovered config space can in theory
> be read before FEATURES_OK. Nasty, I know. Things kind of work
> right now but we really need some other path to notify backends
> when legacy guest is active. E.g. VDPA also has this problem.

Thanks for mentioning it.

Do you know specifics about this type of guest driver? If it's only
legacy drivers then device implementations can ensure compatibility by
using host-endian until FEATURES_OK :). I guess existing code needs to
be audited to check if this can be done.

Stefan

--ucfh2jvIfynHPZkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA2bNYACgkQnKSrs4Gr
c8iCxgf+M9zCBmp7ery5kuRkvjsFq1cFqfwo3dCkpKKfdqiko0lnDTbEJ1G68VYU
xjB/naNeRCHfxDC4ZNiPL6vwfYU2T1g7M0qAm4muRup5rQh2PSDdGUtxYwW6DKBQ
ZB5kNNJ7F3WNg4NrnX784XmqobTNIu6zBCR/NNIS/gSC1o48G1CPQGHw50P/dk92
MsZHjMRcD5xQNU+kQhfISZbZj00F1H8ZeAAZko4jNstWTKbPkkinMAKufGi1dP65
ouDXrieISf0sqMAKhw1HMPOEQRaQQi26W6CFAOYfo2L/QqnCVUw1avIy5Q38S5tS
3hJ9lxmb0gr2ufocA7ESPKzm85eeuQ==
=qJkU
-----END PGP SIGNATURE-----

--ucfh2jvIfynHPZkt--


