Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32958325E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 15:10:51 +0200 (CEST)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huzEo-0001qB-W8
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 09:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1huzEM-0001QV-41
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:10:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1huzEK-0005tg-MB
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:10:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58586)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1huzEK-0005tS-GW
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:10:20 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D770D7E428
 for <qemu-devel@nongnu.org>; Tue,  6 Aug 2019 13:10:19 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DDD460127;
 Tue,  6 Aug 2019 13:10:19 +0000 (UTC)
Date: Tue, 6 Aug 2019 14:10:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190806131017.GF14887@redhat.com>
References: <1565075475-15313-1-git-send-email-pbonzini@redhat.com>
 <20190806094140.GB14887@redhat.com>
 <ad9692cc-7aa2-7f09-0bf7-7c674e2d0d92@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad9692cc-7aa2-7f09-0bf7-7c674e2d0d92@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 06 Aug 2019 13:10:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] crypto: move common bits for all emulators
 to libqemuutil
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 06, 2019 at 03:07:40PM +0200, Paolo Bonzini wrote:
> On 06/08/19 11:41, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Aug 06, 2019 at 09:11:15AM +0200, Paolo Bonzini wrote:
> >> qcrypto_random_*, AES and qcrypto_init do not need to be linked as a=
 whole
> >> and are the only parts that are used by user-mode emulation.  Place =
them
> >> in libqemuutil, so that whatever needs them will pick them up automa=
tically.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> ---
> >>  MAINTAINERS                         | 3 +++
> >>  Makefile                            | 4 +---
> >>  Makefile.objs                       | 1 -
> >>  Makefile.target                     | 2 --
> >>  crypto/Makefile.objs                | 7 -------
> >>  util/Makefile.objs                  | 5 +++++
> >>  {crypto =3D> util}/aes.c              | 0
> >>  crypto/init.c =3D> util/crypto-init.c | 0
> >>  {crypto =3D> util}/random-gcrypt.c    | 0
> >>  {crypto =3D> util}/random-gnutls.c    | 0
> >>  {crypto =3D> util}/random-platform.c  | 0
> >=20
> > Ewww, definitely do not want to see these files moved as it spreads t=
he
> > crypto related code over multiple locations again, which is exactly w=
hat
> > I spent time fixing when introducing the crypto/ directory.
> >=20
> > Placing them to libqemuutil.a shouldn't mean we need to move the code=
 too.
>=20
> Fair enough, will do in v2.

I would love to be able to have a libqemucrypto.a library for everything
in crypto/ really, but the way we do QOM registration via library
constructors breaks this. The ld linker isn't clever enough to see the .o
is used via a constructor so unhelpfully throws away all the .o files
containing QOM objects :-(

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

