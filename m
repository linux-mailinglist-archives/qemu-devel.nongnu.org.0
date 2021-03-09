Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A43321D0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:21:01 +0100 (CET)
Received: from localhost ([::1]:46208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYY0-0005sq-7t
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJYVj-00051Q-SN
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:18:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJYVi-0007UD-26
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:18:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615281517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BXwMNVuah9PkpYS6Xo+VBq+JL0v6GCiwJVhz28WptKY=;
 b=SOv2s8D8iF68OasDieyF/YewZSQ6RfyUIvyHzJcWmzVdkjRXXhAMnn90uw/tvx7+xaDON2
 sRD5IWizJeH7+V3K78gR0c09uwwdmaZfSQ450hk4A1bJZ704o2GodqXncGnBVjnCVk4z0U
 7fR8YE4V5eVQcXCbTWFGBfrtm/ICIH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-tVCqC8V5MKiPsSc0a0qHJQ-1; Tue, 09 Mar 2021 04:18:33 -0500
X-MC-Unique: tVCqC8V5MKiPsSc0a0qHJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 156F683DD33;
 Tue,  9 Mar 2021 09:18:32 +0000 (UTC)
Received: from localhost (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B079C69102;
 Tue,  9 Mar 2021 09:18:08 +0000 (UTC)
Date: Tue, 9 Mar 2021 09:18:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] virtio-net: calculating proper msix vectors on init
Message-ID: <YEc9SaL6/9PtZzTm@stefanha-x1.localdomain>
References: <20210309042314.45817-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309042314.45817-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Iq/MML42tktaiLb3"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, philmd@redhat.com, ehabkost@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Iq/MML42tktaiLb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 12:23:14PM +0800, Jason Wang wrote:
> Currently, the default msix vectors for virtio-net-pci is 3 which is
> obvious not suitable for multiqueue guest, so we depends on the user
> or management tools to pass a correct vectors parameter. In fact, we
> can simplifying this by calculating the number of vectors on realize.
>=20
> Consider we have N queues, the number of vectors needed is 2*N + 2
> (#queue pairs + plus one config interrupt and control vq). We didn't
> check whether or not host support control vq because it was added
> unconditionally by qemu to avoid breaking legacy guests such as Minix.
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes since v1:
> - Fix typo in the commit log
> - Explain the magic number during vectors calculation
> ---
>  hw/core/machine.c          |  1 +
>  hw/virtio/virtio-net-pci.c | 10 +++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

Nice!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Iq/MML42tktaiLb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBHPUkACgkQnKSrs4Gr
c8jrngf/T01sCvI+6A9tGG0B4uoYgyAOuPTyoYktDSDftvkbT5W8l8wseIr0spNZ
zm0FlUOC8ANZALGM5LlZid+ksibyD6V0/4ei+sucQT1XhLYiXnFs0aX2/+5IyWyR
DB37YMaMRfri7YSBiRXeZ8uSM0sPR5rEIyiAmS4fy9Q3pd0wLt+GnnomSbbvG1nN
xCALiOUFDWU3PEMzO0jD6VdlWnvl6Dd4CA4kusQEgEQ5HdcGv8XybIgQsJkP89X0
UiUZdvQTxFZT8lU2YZMgudJXyabayqKvTvfup8tK2Et03fB6+q3Te4rsbkvehW23
c/xe722hDq7KivRorMmzaJc+4EIahA==
=zZyF
-----END PGP SIGNATURE-----

--Iq/MML42tktaiLb3--


