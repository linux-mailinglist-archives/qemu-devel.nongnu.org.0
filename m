Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E943B341
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 15:38:21 +0200 (CEST)
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfMei-00074u-UR
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 09:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfMdE-0005g6-6d
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:36:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfMdC-0006ld-9m
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 09:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635255404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uMLFos5AmBjNcqFCqJyw+e3Yif9YTS9O81wAYMzb38o=;
 b=MMj3kIjGwsLFolf2Rmq24+udscRXDZ1uWfuHBd31+5ZqgT4rpjnXn92o4AVKvhUUBhw+9B
 fHqCL33lESSovqW30Pjj7OhJXTJhHj0zyCdW/XKYZjWoYLVgolZcBi1/1roeKFbJVTNztp
 kVDaViNYHIiQSfzv+k+bjoxbEsznER4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-vyealuNwMeCgX4crl6Ojqg-1; Tue, 26 Oct 2021 09:36:41 -0400
X-MC-Unique: vyealuNwMeCgX4crl6Ojqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E235196634E;
 Tue, 26 Oct 2021 13:36:27 +0000 (UTC)
Received: from localhost (unknown [10.39.195.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F29CD100EBAD;
 Tue, 26 Oct 2021 13:36:26 +0000 (UTC)
Date: Tue, 26 Oct 2021 14:36:25 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC 1/2] tls: add macros for coroutine-safe TLS variables
Message-ID: <YXgEWV7CnnVj4bLO@stefanha-x1.localdomain>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <20211025140716.166971-2-stefanha@redhat.com>
 <YXa7zMZG2saNHInI@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YXa7zMZG2saNHInI@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gvw4wkoZn73RYNFY"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gvw4wkoZn73RYNFY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 03:14:36PM +0100, Daniel P. Berrang=E9 wrote:
> On Mon, Oct 25, 2021 at 03:07:15PM +0100, Stefan Hajnoczi wrote:
> > Compiler optimizations can cache TLS values across coroutine yield
> > points, resulting in stale values from the previous thread when a
> > coroutine is re-entered by a new thread.
> >=20
> > Serge Guelton developed an __attribute__((noinline)) wrapper and tested
> > it with clang and gcc. I formatted his idea according to QEMU's coding
> > style and wrote documentation.
> >=20
> > These macros must be used instead of __thread from now on to prevent
> > coroutine TLS bugs.
>=20
> Does this apply to all  __thread usage in the QEMU process that can
> be used from coroutine context, or just certain __thread usage ?
>=20
> Mostly I'm wondering if this is going to have implications on external
> libraries we use. eg if block layer is using librbd.so APIs, is librbd.sp
> safe to use __thread directly in any way it desires ?

There is a theoretical problem but I'm not sure if it will occur in
practice:

If a __thread variable is in an extern function then there's little
risk of the value being cached. The function executes and returns back
to QEMU, never yielding.

The only case I can think of is when the library accesses a __thread
variable, invokes a callback into QEMU, and that callback yields. If the
coroutine is re-entered from another thread and returns back to the
library, then we have a problem. This seems like a very rare case
though.

It gets trickier if the library has the __thread variable in a header
file, because then the compiler may optimize it into a QEMU coroutine
function and cache its value.

Stefan

--gvw4wkoZn73RYNFY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF4BFkACgkQnKSrs4Gr
c8jJkwf/XCrveDdFpxEi7OiulxnWN1IXuN3eHi7yt2K6SlklhYybEMOsL+nZoC4G
ZsOtCRdJf6y8vUrCSaCT++snvJRkZpnvCc9sMJKlidZj4X+XTnZpglDpvms9FAcu
zxELfSez3rv1+Vyygtm4IH5rkClXJMdSTD6v2Pt4/E5tuHhZrzt0pANA8sQcpvr6
FHfvDD0EaEJpqM30f6LVWw5T+Levp1sCVVjZjfuP22W3+qQ/WxiX+4zn9lEd4DDA
0U17psAOGHgXG6k3oMYWIEKakX9cTu2sNY+RxMsO3i94d5gQf0A4zfynurUNJM5h
SkpROT9htrYSnER7roztCujnM3qepw==
=C9/u
-----END PGP SIGNATURE-----

--gvw4wkoZn73RYNFY--


