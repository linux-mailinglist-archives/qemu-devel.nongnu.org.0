Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C5B318B23
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:49:12 +0100 (CET)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABPD-0006hE-FF
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABIN-0001nn-CT
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:42:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABIK-00012m-Em
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613047323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Q67VidwFJ0qQAUwqtLme9WdeuNYu6jdRdX/oVjFUsg=;
 b=KgHB+rLMGVZ5t3g6j0dZZABLfmbVvo9s16ksaqGoO6dYacQ+WEmq1WV5w3txaOvA59uwYa
 FO0NPgL5OSTCSIOIZhefJ08UmnMg9/ca3x7n8zMjxOjtLzcYRFQau+ii95Q00nBHRXYmn0
 RZumSzJCPDnXtxt8Ia5PDc354WU753o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-WOEAZovQPnavfktNDY57CQ-1; Thu, 11 Feb 2021 07:42:01 -0500
X-MC-Unique: WOEAZovQPnavfktNDY57CQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34A16107ACC7
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:42:00 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 478CF5C260;
 Thu, 11 Feb 2021 12:41:46 +0000 (UTC)
Date: Thu, 11 Feb 2021 12:41:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 13/24] DAX: virtiofsd: Make lo_removemapping() work
Message-ID: <20210211124145.GN247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-14-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-14-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tpyx7gKuSYt+mjHM"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tpyx7gKuSYt+mjHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:13PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Vivek Goyal <vgoyal@redhat.com>
>=20
> Let guest pass in the offset in dax window a mapping is currently
> mapped at and needs to be removed.
>=20
> Vivek added the initial support to remove single mapping and later Peng
> added patch to support removing multiple mappings in single command.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--tpyx7gKuSYt+mjHM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlJgkACgkQnKSrs4Gr
c8gv6ggAt7o8D5KrYv0lhlbHz0vL+9buvBKhYo5kqvt9vY87FYNbLNBZLdKYslzL
616NXlwAp90xMZXBbNhntOEU8O9nMKfQLgF645ePG1NsvW08OSSw5+1HC0yEkHFc
rE89wTrW/VCrMG1PEinuAjom+BnCRMtaIi83OmKCYP6nU3537CwOgRrm0FFgBsSo
ztR2Lbcm+OIRzPChP4QayWt7gLLXwYdn3qohaPrE02yAC+GzWaPpUgce1gwj0gjj
w8UYHrvjUWnpJEfPR/IJXSFEMuipC9Hgd7jdgs8Z2eSUAqmqxUFIB1Tq9gWJv+sN
Dn5VohT2NcJnApsXqyunCZNt8tWX8w==
=GZqo
-----END PGP SIGNATURE-----

--tpyx7gKuSYt+mjHM--


