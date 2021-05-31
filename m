Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD94A396089
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 16:26:27 +0200 (CEST)
Received: from localhost ([::1]:51888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnis6-00060M-LX
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 10:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lniqI-00052V-Jf
 for qemu-devel@nongnu.org; Mon, 31 May 2021 10:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lniqC-0006EY-0v
 for qemu-devel@nongnu.org; Mon, 31 May 2021 10:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622471066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OwB0ooHSL67b4OFzBCnOoa3S9Vf20dLImC7qaV6l12Q=;
 b=LBcqDXl01mR+kLM0Ob5xnuTFuHkn5ls9Ws9BHgZr/n0GusnsVNTCEFtf6KO2gJsXtlGG1O
 XCr7DBusKSbK/dfAcbGyuF+E2KiMmm3YXx7C6WcYBJBTKt8orWYI0dLUrrcMJeQRh8CG6X
 OGqPCeibuM/rf++qiicjYLcZ2dh8stc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-G2Rwah9rNVKr6j6I9jjorg-1; Mon, 31 May 2021 10:24:24 -0400
X-MC-Unique: G2Rwah9rNVKr6j6I9jjorg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6252E1854E25;
 Mon, 31 May 2021 14:24:23 +0000 (UTC)
Received: from localhost (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1C9C6091B;
 Mon, 31 May 2021 14:24:22 +0000 (UTC)
Date: Mon, 31 May 2021 15:24:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 4/5] progressmeter: protect with a mutex
Message-ID: <YLTxlQcC0pXkH3f6@stefanha-x1.localdomain>
References: <20210518094058.25952-1-eesposit@redhat.com>
 <20210518094058.25952-5-eesposit@redhat.com>
 <60139fc9-4856-1dfa-222d-08267cb89c27@virtuozzo.com>
 <b0de7a46-5abc-3aef-adcb-438474274436@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b0de7a46-5abc-3aef-adcb-438474274436@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7zcAjTEwiShHl7if"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7zcAjTEwiShHl7if
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 12:14:17PM +0200, Emanuele Giuseppe Esposito wrote:
> On 18/05/2021 12:00, Vladimir Sementsov-Ogievskiy wrote:
> > 18.05.2021 12:40, Emanuele Giuseppe Esposito wrote:
> > > Progressmeter is protected by the AioContext mutex, which
> > > is taken by the block jobs and their caller (like blockdev).
> > >=20
> > > We would like to remove the dependency of block layer code on the
> > > AioContext mutex, since most drivers and the core I/O code are alread=
y
> > > not relying on it.
> > >=20
> > > Create a new C file to implement the ProgressMeter API, but keep the
> > > struct as public, to avoid forcing allocation on the heap.
> > >=20
> > > Also add a mutex to be able to provide an accurate snapshot of the
> > > progress values to the caller.
> > >=20
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> >=20
> > patch changed a lot, so you can't keep Stefan's r-b. r-b should be kept
> > if patch is unchanged.
>=20
> Sorry, my bad. Will remove it, if we keep these changes (see below).

I took a look again:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Regarding hiding the struct, in a library with a public API the authors
need to be very careful about exposing struct fields in order to prevent
ABI breakage or applications making use of internal fields.

However, in QEMU we're less strict since we have full control over the
codebase (including internal API consumers). If other factors outweigh
the need for strict encapsulation, then you can put the struct
definition in the header file. Grepping for "private" in QEMU shows lots
of examples and there are probably many more without an explicit
"private" comment. Code reviewers can reject patches that touch private
struct fields or patches can be submitted to remove existing access to
private fields, so we don't have the limitations that library authors
have.

Stefan

--7zcAjTEwiShHl7if
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC08YsACgkQnKSrs4Gr
c8gFdgf/beCAc/iIpMMQ53+aMSo7zsemP7hkOdOfyf2fhIMWxSo/tMFARQpoJ/yH
ybmxXFMu+HDkACu9mDHEKq860bPrZ6dbp/E+KjYltBdFOsx/Crdrpv45eTG6Y6aG
KTPIQkOwA2XvYiNFTc10fDf+PYg58cNEt2UqWVLv7awu/CqD/kvHJbNJ30568xf1
XIj/bN2E+jvxRz9cUCzs7TJ/2xwhT4z4tlt/qVUUkCuR6/Fc2cW9SGFqvqtDz8Bb
2QUp2FTL4CSbCbvuU6Ev4OnHzjC84sOVR6jHAnc5ugOA72A+BVYB99D3qp9K9YEI
P6TPk251lsoFFlKM15GKTLGA9sxoKw==
=96h1
-----END PGP SIGNATURE-----

--7zcAjTEwiShHl7if--


