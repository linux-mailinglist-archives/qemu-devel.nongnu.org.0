Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DCA33B01E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:40:39 +0100 (CET)
Received: from localhost ([::1]:51444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkeM-0002HL-SC
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLkcg-00017x-RH
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLkcf-0007Oo-2U
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615804732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HZPBOsvquglm8qCDDHZtKmqSrJ9+lPTdqB29ZZRec8E=;
 b=YBqof/6yp2CKsyY8Temio9cspNOSV8cRrUp2tDQXWpeBedHj89/Heiqr2YXX4yrlgDtI7u
 uCy1pFBxkY+zmI0msAh2gxVcHov9nMBaECoIWRe3c1cLn3SW+obuj5n6AEw9rmGoVil9G5
 /YK/R9B/c/wIZNQGxDrWd6agmU7Ti+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-VFZjrYItMHCZ8sqsneU_6w-1; Mon, 15 Mar 2021 06:38:49 -0400
X-MC-Unique: VFZjrYItMHCZ8sqsneU_6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D3CE1932481;
 Mon, 15 Mar 2021 10:38:48 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4E08100239A;
 Mon, 15 Mar 2021 10:38:41 +0000 (UTC)
Date: Mon, 15 Mar 2021 10:38:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 5/7] vhost-user: Introduce nested event loop in
 vhost_user_read()
Message-ID: <YE85MJl5VNnsN6Y2@stefanha-x1.localdomain>
References: <20210312092212.782255-1-groug@kaod.org>
 <20210312092212.782255-6-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210312092212.782255-6-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yUNiXaIpp1Pn1aSL"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

--yUNiXaIpp1Pn1aSL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 10:22:10AM +0100, Greg Kurz wrote:
> A deadlock condition potentially exists if a vhost-user process needs
> to request something to QEMU on the slave channel while processing a
> vhost-user message.
>=20
> This doesn't seem to affect any vhost-user implementation so far, but
> this is currently biting the upcoming enablement of DAX with virtio-fs.
> The issue is being observed when the guest does an emergency reboot while
> a mapping still exits in the DAX window, which is very easy to get with
> a busy enough workload (e.g. as simulated by blogbench [1]) :
>=20
> - QEMU sends VHOST_USER_GET_VRING_BASE to virtiofsd.
>=20
> - In order to complete the request, virtiofsd then asks QEMU to remove
>   the mapping on the slave channel.
>=20
> All these dialogs are synchronous, hence the deadlock.
>=20
> As pointed out by Stefan Hajnoczi:
>=20
> When QEMU's vhost-user master implementation sends a vhost-user protocol
> message, vhost_user_read() does a "blocking" read during which slave_fd
> is not monitored by QEMU.
>=20
> The natural solution for this issue is an event loop. The main event
> loop cannot be nested though since we have no guarantees that its
> fd handlers are prepared for re-entrancy.
>=20
> Introduce a new event loop that only monitors the chardev I/O for now
> in vhost_user_read() and push the actual reading to a one-shot handler.
> A subsequent patch will teach the loop to monitor and process messages
> from the slave channel as well.
>=20
> [1] https://github.com/jedisct1/Blogbench
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> v2: - Document why a nested loop is needed in vhost_user_read() (Stefan)
> ---
>  hw/virtio/vhost-user.c | 65 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 60 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--yUNiXaIpp1Pn1aSL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPOTAACgkQnKSrs4Gr
c8iz3Qf9HMski1feNXJekhs+KM5/P/56ISBX8w6ypbdqlLk7oS72vh9mtXQ0Ydg9
uAcyK0A0rUR1Js7+ZNQwp+zGAeBicsNn4aEn52cnKW343c7KjtSox5b+czgun9Rz
HSB+pZqRlo4aj/yZr6ezHAoF4r1RTyZDnTPpiVHYPgZoODQDq/3HPI4N5IRdM9pm
PuZnEi+JHXIB4L9gbkC4895MPMhPqvPJiK7PRh7VPv05FXIm+FhFPghEYvcaVL9g
973Z6rfSBh7+W/YVLNrquQYoHBObJPp3CFWNPKpQDsjXIVVC3kjL35TBnoVMMM9N
/KUSBuD9CRimZrNg8irdNAlBO0u1EQ==
=KF9+
-----END PGP SIGNATURE-----

--yUNiXaIpp1Pn1aSL--


