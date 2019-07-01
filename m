Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7EB17F5E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 19:54:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOQlp-0007OT-EQ
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 13:54:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hOQko-000754-U5
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hOQkn-0000Pr-LW
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:53:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48590)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hOQkl-0000Ig-GI
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:53:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48EF8300180F;
	Wed,  8 May 2019 17:53:08 +0000 (UTC)
Received: from localhost (ovpn-116-61.gru2.redhat.com [10.97.116.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF2AF608E4;
	Wed,  8 May 2019 17:53:05 +0000 (UTC)
Date: Wed, 8 May 2019 14:53:03 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190508175303.GA4189@habkost.net>
References: <20190506213817.14344-1-ehabkost@redhat.com>
	<20190507141345.GS27205@redhat.com>
	<20190507144500.GK28722@habkost.net>
	<87pnot2j2s.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87pnot2j2s.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 08 May 2019 17:53:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] tests: Force Python I/O encoding for
 check-qapi-schema
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 08, 2019 at 03:04:43PM +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
>=20
> > On Tue, May 07, 2019 at 03:13:45PM +0100, Daniel P. Berrang=E9 wrote:
> >> On Mon, May 06, 2019 at 06:38:17PM -0300, Eduardo Habkost wrote:
> >> > test-qapi.py doesn't force a specific encoding for stderr or
> >> > stdout, but the reference files used by check-qapi-schema are in
> >> > UTF-8.  This breaks check-qapi-schema under certain circumstances
> >> > (e.g. if using the C locale and Python < 3.7).
> >> >=20
> >> > We need to make sure test-qapi.py always generate UTF-8 output
> >> > somehow.  On Python 3.7+ we can do it using
> >> > `sys.stdout.reconfigure(...)`, but we need a solution that works
> >> > with older Python versions.
> >> >=20
> >> > Instead of trying a hack like reopening sys.stdout and
> >> > sys.stderr, we can just tell Python to use UTF-8 for I/O encoding
> >> > when running test-qapi.py.  Do it by setting PYTHONIOENCODING.
> >> >=20
> >> > Reported-by: Thomas Huth <thuth@redhat.com>
> >> > Tested-by: Thomas Huth <thuth@redhat.com>
> >> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> >> > ---
> >> >  tests/Makefile.include | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >=20
> >> > diff --git a/tests/Makefile.include b/tests/Makefile.include
> >> > index 7c8b9c84b2..af88ab6f8b 100644
> >> > --- a/tests/Makefile.include
> >> > +++ b/tests/Makefile.include
> >> > @@ -1103,7 +1103,7 @@ check-tests/qemu-iotests-quick.sh: tests/qem=
u-iotests-quick.sh qemu-img$(EXESUF)
> >> >  .PHONY: $(patsubst %, check-%, $(check-qapi-schema-y))
> >> >  $(patsubst %, check-%, $(check-qapi-schema-y)): check-%.json: $(S=
RC_PATH)/%.json
> >> >  	$(call quiet-command, PYTHONPATH=3D$(SRC_PATH)/scripts \
> >> > -		$(PYTHON) $(SRC_PATH)/tests/qapi-schema/test-qapi.py \
> >> > +		PYTHONIOENCODING=3Dutf-8 $(PYTHON) $(SRC_PATH)/tests/qapi-schem=
a/test-qapi.py \
> >>=20
> >> I see PYTHONIOENCODING exists since 2.6 which is nice.
> >>=20
> >> How about we actually change $(PYTHON) so that it always includes
> >> PYTHONIOENCODING=3Dutf-8 ?
> >>=20
> >> That way we avoid continuing to play whack-a-mole with more utf-8
> >> bugs in future.
> >>=20
> >> It would also let us revert this:
> >>=20
> >>   commit de685ae5e9a4b523513033bd6cadc8187a227170
> >>   Author: Markus Armbruster <armbru@redhat.com>
> >>   Date:   Mon Jun 18 19:59:57 2018 +0200
> >>=20
> >>     qapi: Open files with encoding=3D'utf-8'
> >>=20
> >> which had to provide separate logic for py2 vs py3 :-(
>=20
> The separate logic will soon be history.  I'd welcome getting rid of th=
e
> remainder anyway.

Which remainder?  Do you mean the encoding=3D'utf-8' arguments to
open()?

>=20
> > Not every Python script in the QEMU tree is run by our makefiles
> > and scripts using $(PYTHON).  We need to ensure our scripts and
> > modules won't break when run directly from the command line, too.
> > Setting PYTHONIOENCODING everywhere would just hide these bugs
> > from us.
>=20
> I agree for Python scripts that are meant to be run that way (assuming
> such scripts exist).  [...]

All scripts inside ./scripts are meant to be run directly from
the command line, aren't they?


>                [...]  For all the others (including all the QAPI-relate=
d
> scripts), I'd be quite fine with
>=20
> 1. Our build system runs all Python scripts with the
> PYTHONIOENCODING=3Dutf-8
>=20
> 2. If you run a Python script yourself, you get to specify the
> PYTHONIOENCODING=3Dutf-8, or use a suitable locale.  Enabling UTF-8 mod=
e
> with PYTHONUTF8=3D1 or -X utf8 could also work.

I'm OK if we don't actively try to fix those bugs and just expect
people to set PYTHONIOENCODING.  But I don't think we should
reject patches that make the Python code work with non-utf8
locales if it's an easy fix.

--=20
Eduardo

