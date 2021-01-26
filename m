Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AFC30437F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:13:54 +0100 (CET)
Received: from localhost ([::1]:42204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4QyX-0002eQ-Ld
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4QwX-0001ZA-Bv
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:11:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4QwV-0003Pe-LT
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611677506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rhhESqeBgmISFCghW9/Wc702hXjldJdGsjHNGeC10+U=;
 b=Vpax07cpcOFFpVy6VUNJ8bsVXIvUzd1pYALpEPJvgAWDQLKToh9DBQRAgWaMva7ZyfHEkA
 +GkSNSCgPLntSQbvZ7DeUVMua8pqTa92m1izquVBdP1XbDl1rI9MNygAEsX3+3J1qlIXvS
 nMdj+BLxS3vzWvk+CMIyJye2UFdjLO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-4sR12Y2APYmNNfxPxnxoww-1; Tue, 26 Jan 2021 11:11:43 -0500
X-MC-Unique: 4sR12Y2APYmNNfxPxnxoww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D6131084443
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 16:11:40 +0000 (UTC)
Received: from localhost (ovpn-114-186.ams2.redhat.com [10.36.114.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00AC75D719;
 Tue, 26 Jan 2021 16:11:39 +0000 (UTC)
Date: Tue, 26 Jan 2021 16:11:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] coroutine-sigaltstack: Add SIGUSR2 mutex
Message-ID: <20210126161139.GG250425@stefanha-x1.localdomain>
References: <20210125120305.19520-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210125120305.19520-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qxfKREH7IwbezJ+T"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?iso-8859-1?B?TOFzemzzIMlyc2Vr?= <lersek@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qxfKREH7IwbezJ+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 01:03:05PM +0100, Max Reitz wrote:
> Disposition (action) for any given signal is global for the process.
> When two threads run coroutine-sigaltstack's qemu_coroutine_new()
> concurrently, they may interfere with each other: One of them may revert
> the SIGUSR2 handler to SIG_DFL, between the other thread (a) setting up
> coroutine_trampoline() as the handler and (b) raising SIGUSR2.  That
> SIGUSR2 will then terminate the QEMU process abnormally.
>=20
> We have to ensure that only one thread at a time can modify the
> process-global SIGUSR2 handler.  To do so, wrap the whole section where
> that is done in a mutex.
>=20
> Alternatively, we could for example have the SIGUSR2 handler always be
> coroutine_trampoline(), so there would be no need to invoke sigaction()
> in qemu_coroutine_new().  Laszlo has posted a patch to do so here:
>=20
>   https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg05962.html
>=20
> However, given that coroutine-sigaltstack is more of a fallback
> implementation for platforms that do not support ucontext, that change
> may be a bit too invasive to be comfortable with it.  The mutex proposed
> here may negatively impact performance, but the change is much simpler.
>=20
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  util/coroutine-sigaltstack.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

I slightly prefer Laszlo's patch: since the signal disposition is
process-wide it's cleaner to set it up globally and once only. That
said, this patch is okay too.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--qxfKREH7IwbezJ+T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAQPzoACgkQnKSrs4Gr
c8jlbwf+PF5lkwf2KM61Z8o6wOnicbu1qmgsivbHRoWxG1N6lL+frCeMjmIQKP59
ACk3hbk6MyHNRLQrx/r09mu5dxiIUe9CG/jJ+VjKycyzTuDk3lQGPFyhTLzDYYHh
BWKRManJKkAP0CM3dQN4c3oOostHE9GkqPCkGhhbAtowpZh8XivWm1yx9AlBJSbz
0+qB9wJwRtfzJ+ZHtS81q57KP2OJdYEmTW/qaEy7eRcQK1bF/B0iJ5zpFTDOukUi
MZqugUh4aIMzgIomAWzNNdNJ18tqb0+cG/56K3FyCS6Mz/d4hbUARlEuI7LhNg6x
2BM5Vf1ZSRsg5p24QS79OsO4p0T3vA==
=zLnM
-----END PGP SIGNATURE-----

--qxfKREH7IwbezJ+T--


