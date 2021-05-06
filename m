Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7315C375129
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:55:14 +0200 (CEST)
Received: from localhost ([::1]:36076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZmr-0003qa-HL
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leZle-0002yP-IW
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:53:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leZlc-0002vE-QB
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620291235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GIPHv5l66hKr3Fd2hauYIwTu+jyoFGduXh/RcXtgWEE=;
 b=IiCMLX1Kn74yc3AteYneTcPyEqZkoZhzzRb2eaKZ00jq4NN5cziRIPyZ8ESEKTBld+9R9L
 exC0EmZ6ZAD+xp6twkQH/HSv4Gc2A2CzUMlZviGHi8mNPSEkgSM2nn/DwWg89PibGNzM4a
 IhLAKXHFVrml0WDnBoQtM/u7FQHIKRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-0XZLMGGyP7u5lmSSbxEtYg-1; Thu, 06 May 2021 04:53:51 -0400
X-MC-Unique: 0XZLMGGyP7u5lmSSbxEtYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90C7F19253CD;
 Thu,  6 May 2021 08:53:50 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FADE19D9F;
 Thu,  6 May 2021 08:53:15 +0000 (UTC)
Date: Thu, 6 May 2021 09:53:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 06/23] hw/block/dataplane/virtio-blk: Avoid dynamic stack
 allocation
Message-ID: <YJOuesiuqgQugO+Q@stefanha-x1.localdomain>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-7-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-7-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DleqjbJgFb0fOYjN"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DleqjbJgFb0fOYjN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 11:10:30PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Use autofree heap allocation instead of variable-length
> array on the stack.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/block/dataplane/virtio-blk.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Why? This is a performance-critical code path and BITS_TO_LONGS(nvqs) is
small.

Stefan

--DleqjbJgFb0fOYjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCTrnoACgkQnKSrs4Gr
c8ghvwgAwUp5uT8rwQ4BedhWI3tW/U8itfnmaszMq/UsY0oboxeU8bHlCRC29Tkt
gXCiCtvdmpVqP5tz5VJwtUJcsVVythv54Rl8ew0nkeUhMcOdBeHj0TtxthYMeiHb
uCSRv0oQrbYl10Ik+5k5nVBlSRsEeTQUG5a+pUX0dKA/CYm8RNC322WbSM6G2eg3
kl/K0J86JuqaBGQTj/4BGZSGCUAcaO+kyjHoya9M8gXVGDtAXcvZIkTk8r+Ta4Zw
GOc779R4BUxC6B1jFhgnvQiSaJuXTKspmlCuaAhWhPPsDEkxEv+aav9zcF+pPqZz
3yuURFDIlY+WfalVAPAjkqPOqEe6Gg==
=oEGu
-----END PGP SIGNATURE-----

--DleqjbJgFb0fOYjN--


