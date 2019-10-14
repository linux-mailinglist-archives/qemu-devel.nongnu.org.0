Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82785D6534
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 16:31:30 +0200 (CEST)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK1Ng-0003qJ-U4
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 10:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iK1GS-0005oj-US
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:24:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iK1GR-00006m-Mm
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:24:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43792)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iK1GR-00006h-HL
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:23:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C1C8AA3CD61;
 Mon, 14 Oct 2019 14:23:58 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55AED60126;
 Mon, 14 Oct 2019 14:23:58 +0000 (UTC)
Subject: Re: ideas towards requiring VPATH build
From: Eric Blake <eblake@redhat.com>
To: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <aa953b8f-daa2-e6dc-da4b-b7cb598c2c0e@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <35163d04-0cfc-79ef-dcb8-caa3b9f9fe27@redhat.com>
Date: Mon, 14 Oct 2019 09:23:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <aa953b8f-daa2-e6dc-da4b-b7cb598c2c0e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 14 Oct 2019 14:23:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/19 4:28 PM, Eric Blake wrote:
> I know we've talked about enforcing a VPATH build, but haven't yet=20
> flipped the switch.=C2=A0 This week, I've played with using a VPATH bui=
ld (cd=20
> qemu; mkdir -p build; cd ./build; ../configure ...; make ...), but find=
=20
> my old habits of expecting an in-tree build to just work (cd qemu; make=
=20
> ...) hard to overcome.=C2=A0 So this is what I've come up with: if you =
place=20
> the following file in-tree, then any 'make ...' command you type in-tre=
e=20
> without using -C will have the same effect as if you had typed the same=
=20
> command in the build directory, but without having to manually remember=
=20
> to switch to the build directory.
>=20
> Perhaps this can be a starting point for a patch to actually include=20
> this file in qemu.git as part of the larger effort to force VPATH=20
> builds, while still having the convenience of in-tree make working for=20
> those who were used to it.=C2=A0 (I places an echo and sleep in my file=
 to=20
> remind myself when I forgot to use the build directory, but that is not=
=20
> mandatory if we want GNUmakefile stored in qemu.git).
>=20
> Presumably, any full switch to force a VPATH build would also include=20
> creating the build directory as needed (my hack assumes that it already=
=20
> exists).
>=20
> $ cat GNUmakefile
> # Hack for redirecting while reminding myself to use distinct builddir
> %: force
>  =C2=A0=C2=A0=C2=A0=C2=A0@echo 'changing directory to build...'
>  =C2=A0=C2=A0=C2=A0=C2=A0@sleep 2
>  =C2=A0=C2=A0=C2=A0=C2=A0@$(MAKE) -C build -f Makefile $(MAKECMDGOALS)
> force: ;
> GNUmakefile: ;

Works for 'make all' or 'make check', but doesn't quite work for 'make'.=20
  For that, I had to add:

ifeq ($(MAKECMDGOALS),)
recurse: all
endif

prior to the %: line (the name 'recurse' is not special, it merely has=20
to be something unlikely to be in the actual Makefile, and appear as the=20
first rule with a dependency on the name of the real first rule in=20
Makefile, so that when make is invoked without a target, we still end up=20
invoking the actual Makefile rather than our GNUmakefile shim claiming=20
that 'force' has nothing to do).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

