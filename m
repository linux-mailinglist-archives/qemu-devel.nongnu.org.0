Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A3429CFE6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 13:25:32 +0100 (CET)
Received: from localhost ([::1]:40118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXkWB-0001qE-SF
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 08:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXkTy-0000lR-RH
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 08:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kXkTu-0006Ot-6c
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 08:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603887789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MXQO6TN//k8jfeTrEZyn8Ixy+M4HQxU/AsAODf+lPQI=;
 b=W5vWDPLjRjOIdx2O3QIUhvXdSwy/6cOQaA8u9BSwSO2tvWrqya5uHHGn/ewuRFMwuoIjaZ
 JGLVssS88+a1wCehhMTO5/MdtYXmEz6K2M4OBN/ILHT5ku/pxQ/vS2Ic/sZzJIS4yUjzid
 7yDYhhk+KOYRLBko8tbQijOSzBpTo3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-dL1Gm537PbaGD-5KbL8Q5Q-1; Wed, 28 Oct 2020 08:23:06 -0400
X-MC-Unique: dL1Gm537PbaGD-5KbL8Q5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93D371009E22;
 Wed, 28 Oct 2020 12:23:05 +0000 (UTC)
Received: from localhost (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3567A5C1D7;
 Wed, 28 Oct 2020 12:23:05 +0000 (UTC)
Date: Wed, 28 Oct 2020 12:23:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] block: Move bdrv_drain_all_end_quiesce() to block_int.h
Message-ID: <20201028122300.GA231368@stefanha-x1.localdomain>
References: <160387245480.131299.13430357162209598411.stgit@bahia>
MIME-Version: 1.0
In-Reply-To: <160387245480.131299.13430357162209598411.stgit@bahia>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 09:07:34AM +0100, Greg Kurz wrote:
> This function is really an internal helper for bdrv_close(). Update its
> doc comment to make this clear and make the function private.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>=20
> As suggested by Stefan here:
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg08235.html
> ---
>  include/block/block.h     |    6 ------
>  include/block/block_int.h |    9 +++++++++
>  2 files changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+ZYqQACgkQnKSrs4Gr
c8jeKgf/dA86Xawj0UsWY72G7d0LNKTckQ6O14he8w1uGXZ4wbFfQu3KDylCG/UV
ciO2crCLYbbPk5rUJqzCb60spBnYL/lXKmV49+wAY1z5VvujbBGNoqhWkmBRZGZk
NAtHlmOyvVYoDhP/H9g1+tIQ1TQZdmr3p6MvxQx8SRJUZIzp2m6yFQceOEfKOHM3
X3R3KmVM6dDTLyMfIJugErdR0ox/JFim2huNVZB7dis/YNtBzOdeE2xo9rMfxMyr
e3b2gXlv4rW1GfY9H4Mk9peun8K34KhqvepeufKs/b67I1m4y23eiZDrbfde0GhD
0hYNoIDTDt+v56+KGPiaPLAn7sCNcQ==
=kCfw
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--


