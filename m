Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9C84AEE67
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 10:49:43 +0100 (CET)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHjba-0005QA-4u
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 04:49:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nHjDe-0005Jc-M6
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:24:58 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:50125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nHjDc-0004Ap-WC
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:24:58 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-9iZbPKTmOpu2YbSsfdV7_A-1; Wed, 09 Feb 2022 04:24:54 -0500
X-MC-Unique: 9iZbPKTmOpu2YbSsfdV7_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9620F84BA43;
 Wed,  9 Feb 2022 09:24:53 +0000 (UTC)
Received: from bahia (unknown [10.39.192.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 020655BC4B;
 Wed,  9 Feb 2022 09:24:51 +0000 (UTC)
Date: Wed, 9 Feb 2022 10:24:50 +0100
From: Greg Kurz <groug@kaod.org>
To: Miroslav Rezanina <mrezanin@redhat.com>
Subject: Re: [PATCH v2] Use long endian options for ppc64
Message-ID: <20220209102450.7fd3dfef@bahia>
In-Reply-To: <20220208144719.1ea88910@bahia>
References: <20220131091714.4825-1-mrezanin@redhat.com>
 <20220208144719.1ea88910@bahia>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 qemu-ppc@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 14:47:19 +0100
Greg Kurz <groug@kaod.org> wrote:

> On Mon, 31 Jan 2022 10:17:14 +0100
> Miroslav Rezanina <mrezanin@redhat.com> wrote:
>=20
> > GCC options pairs -mlittle/-mlittle-endian and -mbig/-mbig-endian are
> > equivalent on ppc64 architecture. However, Clang supports only long
> > version of the options.
> >=20
> > Use longer form in configure to properly support both GCC and Clang
> > compiler. In addition, fix this issue in tcg test configure.
> >=20
> > Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> >=20
> > ---
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
>=20

Cc'ing QEMU PPC folks since they're likely the primary users
of ppc64 hosts.

> > This is v2 of configure: Use -mlittle-endian instead of -mlittle for pp=
c64.
> >=20
> > v2:
> >  - handle both -mlittle and -mbig usage
> >  - fix tests/tcg/configure.sh
> > ---
> >  configure              | 4 ++--
> >  tests/tcg/configure.sh | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/configure b/configure
> > index e6cfc0e4be..066fa29b70 100755
> > --- a/configure
> > +++ b/configure
> > @@ -655,10 +655,10 @@ case "$cpu" in
> >    ppc)
> >      CPU_CFLAGS=3D"-m32" ;;
> >    ppc64)
> > -    CPU_CFLAGS=3D"-m64 -mbig" ;;
> > +    CPU_CFLAGS=3D"-m64 -mbig-endian" ;;
> >    ppc64le)
> >      cpu=3D"ppc64"
> > -    CPU_CFLAGS=3D"-m64 -mlittle" ;;
> > +    CPU_CFLAGS=3D"-m64 -mlittle-endian" ;;
> > =20
> >    s390)
> >      CPU_CFLAGS=3D"-m31" ;;
> > diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> > index 309335a2bd..21959e1fde 100755
> > --- a/tests/tcg/configure.sh
> > +++ b/tests/tcg/configure.sh
> > @@ -64,9 +64,9 @@ fi
> >  : ${cross_cc_ppc=3D"powerpc-linux-gnu-gcc"}
> >  : ${cross_cc_cflags_ppc=3D"-m32"}
> >  : ${cross_cc_ppc64=3D"powerpc64-linux-gnu-gcc"}
> > -: ${cross_cc_cflags_ppc64=3D"-m64 -mbig"}
> > +: ${cross_cc_cflags_ppc64=3D"-m64 -mbig-endian"}
> >  : ${cross_cc_ppc64le=3D"$cross_cc_ppc64"}
> > -: ${cross_cc_cflags_ppc64le=3D"-m64 -mlittle"}
> > +: ${cross_cc_cflags_ppc64le=3D"-m64 -mlittle-endian"}
> >  : ${cross_cc_riscv64=3D"riscv64-linux-gnu-gcc"}
> >  : ${cross_cc_s390x=3D"s390x-linux-gnu-gcc"}
> >  : ${cross_cc_sh4=3D"sh4-linux-gnu-gcc"}
>=20


