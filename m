Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC4048976F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:30:17 +0100 (CET)
Received: from localhost ([::1]:41828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ssR-0006aw-Qh
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:30:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6soD-0004Ns-OE
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6so7-0005cL-GE
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641813926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FywNOjH0yWodX8WpQ9cI06kkk5bUhEMO1883pN4cezo=;
 b=RKEjBBozGreRGTng/l4QQu0KPM7sxYfz5CTAtaoggP/NRYjwIUQFDnDUi66lXegGkCUPBL
 XPeM2evBZaDuaCQgwjucNJxidhkS9wwRsrtLFQnIqEgZiEXWUTzrqhjSPgU/yhauPElIJW
 seN7GO5LfrX0Hr04AraxYd2Ot8N3Mg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-iLsWdon_NfO-4pxV-qU3uA-1; Mon, 10 Jan 2022 06:25:25 -0500
X-MC-Unique: iLsWdon_NfO-4pxV-qU3uA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0081784B9A6;
 Mon, 10 Jan 2022 11:25:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 112DC2B45E;
 Mon, 10 Jan 2022 11:24:53 +0000 (UTC)
Date: Mon, 10 Jan 2022 11:24:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v2 4/5] libvhost-user: prevent over-running max RAM slots
Message-ID: <YdwXhDdUjk5H9pmF@stefanha-x1.localdomain>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-5-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220106064717.7477-5-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2Z5Rs1eyGncOBxpr"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--2Z5Rs1eyGncOBxpr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2022 at 06:47:35AM +0000, Raphael Norwitz wrote:
> When VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support was added to
> libvhost-user, no guardrails were added to protect against QEMU
> attempting to hot-add too many RAM slots to a VM with a libvhost-user
> based backed attached.
>=20
> This change adds the missing error handling by introducing a check on
> the number of RAM slots the device has available before proceeding to
> process the VHOST_USER_ADD_MEM_REG message.
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--2Z5Rs1eyGncOBxpr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHcF4QACgkQnKSrs4Gr
c8jwPggAsVvJnHAycg4cmRKg8hB2hxEJTTWyqHMWckUBIZLtIYnIFvvvHOGLSuN0
bijYatEXAy2bIBGUbqnVKWlpumcXwdEKCw66ypW2FHSWIt9UAjdZ+ax6hFZJyGIw
6nSWPPBTfzjWNxrrt+oNbK77ZzPB+OHg1rfw5BAVuXtDrX1ehFAL9b5j6ufxAmxd
dv6CbP+2raZlqnEXolIobBbSrhR/0Xi2qkHflYW2sSliKYR4TPvJFyYCE4pweYIh
c2bDvyhJgDSfUQ24253mhSH/ckZcIxdBqO/5qbk0If2O+44u80i/8SOxl0omZ4eG
HYM9y1kXO7pLWtOBVVlBwf/I8RhHwg==
=SKUM
-----END PGP SIGNATURE-----

--2Z5Rs1eyGncOBxpr--


