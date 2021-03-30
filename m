Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3CA34EC8B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 17:33:31 +0200 (CEST)
Received: from localhost ([::1]:47822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGN0-0006vD-O2
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 11:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRGJC-0004Qc-74
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRGJA-0003EC-NL
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617118172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rbjmdHUglmyjco6fuM0Lmy5JKmPVZJR0kcnOlGfW3Ho=;
 b=aLvmKxJBHLxpGvStjaMa5jCfrfA6KrYr/sG5oDW7AmfsQdJsVcPqzm1JU7UQCsGY3VdtF2
 a8GzvW5hOkztEHyi0piv4xt6eCAFoy0RswXIvw6gkaZuZnx/RMrM0yulRRLwDjAUsDNZ6g
 AHKw5AavC1XmAp4XVbig4rHRKiqjotU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-kg3NXZcqOE-XrAm12g3p-Q-1; Tue, 30 Mar 2021 11:29:28 -0400
X-MC-Unique: kg3NXZcqOE-XrAm12g3p-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 250C38018A1;
 Tue, 30 Mar 2021 15:29:27 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B916F5C27C;
 Tue, 30 Mar 2021 15:29:26 +0000 (UTC)
Date: Tue, 30 Mar 2021 16:29:25 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 2/6] block/vdi: Don't assume that blocks are larger
 than VdiHeader
Message-ID: <YGND1V1WR5mreufA@stefanha-x1.localdomain>
References: <20210325112941.365238-1-pbonzini@redhat.com>
 <20210325112941.365238-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210325112941.365238-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qZIdgXB8W27nS2Ai"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: david.edmondson@oracle.com, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qZIdgXB8W27nS2Ai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 12:29:37PM +0100, Paolo Bonzini wrote:
> From: David Edmondson <david.edmondson@oracle.com>
>=20
> Given that the block size is read from the header of the VDI file, a
> wide variety of sizes might be seen. Rather than re-using a block
> sized memory region when writing the VDI header, allocate an
> appropriately sized buffer.
>=20
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> Message-Id: <20210309144015.557477-3-david.edmondson@oracle.com>
> Acked-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/vdi.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--qZIdgXB8W27nS2Ai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBjQ9UACgkQnKSrs4Gr
c8gDmgf+PvxUnhpyh4PBw/QvuxuhaWBPL2lhgIr6LR7wpIGnTLPR0ExIsfbN13Ll
6U6q6GGPkF8lxIStAGZQLTWngD0x0ykS8qRQ9vkN86SWJHYt08aM/xTgTBD/d08L
UcpKlsQwKZhEVa6+n/SPVRkJT99v6LkY66heFfapuqTV5NNBj/RWglZ51HrTl94C
heA2lkWupgrGiS/OFb8EOqQlJM0QLt0R3M57xZK+gmeMx6u2+uDq7iYBXpG8un5y
+Qrdn94omHAkznJyQpbiihnAX7EAn8vwnufxuW7tvmwSWhdeSmqpnjl2XbfeWiDC
aSMvjChkRdhsAMJ8qqsU8XvX8VIZZg==
=2faq
-----END PGP SIGNATURE-----

--qZIdgXB8W27nS2Ai--


