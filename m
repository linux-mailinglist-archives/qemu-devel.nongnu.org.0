Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4D262A0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 12:59:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTOy4-00067z-Ud
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 06:59:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hTOwp-0005go-QF
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:58:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hTOwo-0000ps-Lb
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:58:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48142)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hTOwm-0000o3-Ix
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:58:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28A1F3004153;
	Wed, 22 May 2019 10:58:10 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.248])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C1D25427C;
	Wed, 22 May 2019 10:58:09 +0000 (UTC)
Date: Wed, 22 May 2019 11:58:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190522105807.GF32359@redhat.com>
References: <20190517023924.1686-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190517023924.1686-1-richard.henderson@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 22 May 2019 10:58:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v8 00/25] Add qemu_getrandom and
 ARMv8.5-RNG etc
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 16, 2019 at 07:38:59PM -0700, Richard Henderson wrote:
> The change in v8 is to which objects are linked in to user-only
> from the crypto directory.  Daniel asked for all of crypto-obj-y
> to be added, but I have been unable to find a solution that works.
>=20
> If I add crypto-obj-y, then authz-obj-y must be included to resolve
> dependencies.  Daniel suggested splitting authz-obj-y into two, so
> that linux-user plus some of the tools need not link against libpam.
>=20
> However, I tried that, and in the process managed to break testing.
> I'm not really sure what I did wrong:
>=20
>   TEST    check-speed: tests/benchmark-crypto-cipher
>   ERROR - too few tests run (expected 32, got 0)
>=20
> Or maybe it was broken before, but at least this way I'm not touching
> any of the variables that affect tests/Makefile.include.
>=20
> Given that user-only *is* being linked against the enabled crypto libs,
> the behaviour between static and non-static is identical, which is I
> believe the major portion of Daniel's request.  I think further cleanup
> to the makefiles can be done separately.
>

For avoidance of any doubt

  Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

for Richard to send a pull request with any of the crypto related patches
I'm tagged as maintainer for.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

