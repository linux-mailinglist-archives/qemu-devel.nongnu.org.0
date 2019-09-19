Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC060B7BE6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 16:13:40 +0200 (CEST)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAxBi-0007pc-Va
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 10:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iAwx8-0007Ju-Sl
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:58:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iAwrK-0002WR-By
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:52:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iAwrI-0002VG-Rx
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:52:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DCEC03DE04;
 Thu, 19 Sep 2019 13:52:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-123-8.rdu2.redhat.com [10.10.123.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 191315C541;
 Thu, 19 Sep 2019 13:52:25 +0000 (UTC)
Date: Thu, 19 Sep 2019 09:52:23 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190919135223.GA5436@localhost.localdomain>
References: <20190918122748.2144-1-philmd@redhat.com>
 <20190919012351.GB23168@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190919012351.GB23168@localhost.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 19 Sep 2019 13:52:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] BootLinuxSshTest: Only run the tests when
 explicitly requested
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 18, 2019 at 09:23:59PM -0400, Cleber Rosa wrote:
> On Wed, Sep 18, 2019 at 02:27:48PM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
> > Currently the Avocado framework does not distinct the time spent
> > downloading assets vs. the time spent running a test. With big
> > assets (like a full VM image) the tests likely fail.
> >=20
> > This is a limitation known by the Avocado team.
> > Until this issue get fixed, do not run this tests automatically.
> >=20
> > Tests can still be run setting the AVOCADO_TIMEOUT_EXPECTED
> > environment variable.
> >=20
> > Reported-by: Gerd Hoffmann <kraxel@redhat.com>
> > Reported-by: David Gibson <david@gibson.dropbear.id.au>
> > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > ---
> >  tests/acceptance/linux_ssh_mips_malta.py | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/accepta=
nce/linux_ssh_mips_malta.py
> > index 134f10cac3..7200507a3a 100644
> > --- a/tests/acceptance/linux_ssh_mips_malta.py
> > +++ b/tests/acceptance/linux_ssh_mips_malta.py
> > @@ -12,7 +12,7 @@ import logging
> >  import paramiko
> >  import time
> > =20
> > -from avocado import skipIf
> > +from avocado import skipUnless
> >  from avocado_qemu import Test
> >  from avocado.utils import process
> >  from avocado.utils import archive
> > @@ -171,7 +171,7 @@ class LinuxSSH(Test):
> >          self.run_common_commands()
> >          self.shutdown_via_ssh()
> > =20
> > -    @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on Travis-=
CI')
> > +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might t=
imeout')
>=20
> This is definitely an improvement, specially because IMO a "make
> check-acceptance" command should be more similar across executions,
> wether on Travis or not.  The problem is (which is not new) is that
> users have to resort to the test to learn how to run those tests.
>=20
> FIY, I'm working on a RFC to have a handful of "make
> check-acceptance-$(TYPE)" targets that hopefully can represent most
> users' needs.  The avocado command line would still be available for
> more advanced users.
>=20
> >      def test_mips_malta32eb_kernel3_2_0(self):
> >          """
> >          :avocado: tags=3Darch:mips
> > @@ -186,7 +186,7 @@ class LinuxSSH(Test):
> > =20
> >          self.check_mips_malta('be', kernel_path, 'mips')
> > =20
> > -    @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on Travis-=
CI')
> > +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might t=
imeout')
> >      def test_mips_malta32el_kernel3_2_0(self):
> >          """
> >          :avocado: tags=3Darch:mipsel
> > @@ -201,7 +201,7 @@ class LinuxSSH(Test):
> > =20
> >          self.check_mips_malta('le', kernel_path, 'mips')
> > =20
> > -    @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on Travis-=
CI')
> > +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might t=
imeout')
> >      def test_mips_malta64eb_kernel3_2_0(self):
> >          """
> >          :avocado: tags=3Darch:mips64
> > @@ -215,7 +215,7 @@ class LinuxSSH(Test):
> >          kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dke=
rnel_hash)
> >          self.check_mips_malta('be', kernel_path, 'mips64')
> > =20
> > -    @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on Travis-=
CI')
> > +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might t=
imeout')
> >      def test_mips_malta64el_kernel3_2_0(self):
> >          """
> >          :avocado: tags=3Darch:mips64el
> > --=20
> > 2.20.1
> >=20
>=20
> Reviewed-by: Cleber Rosa <crosa@redhat.com>

BTW, also queueing this one on my python-next branch.

