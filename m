Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700C25479
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 17:50:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT72M-0008Cg-Gv
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 11:50:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hT717-0007n2-55
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:49:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hT716-0002Hf-4z
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:49:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49188)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hT715-0002Fq-Jj
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:49:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2877307D963
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 15:49:25 +0000 (UTC)
Received: from redhat.com (ovpn-112-26.ams2.redhat.com [10.36.112.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E9BE2E02A;
	Tue, 21 May 2019 15:49:24 +0000 (UTC)
Date: Tue, 21 May 2019 16:49:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190521154920.GT25835@redhat.com>
References: <20190521153835.23233-1-berrange@redhat.com>
	<66cec3d4-a47b-19eb-72f2-3f1b7f7d5764@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66cec3d4-a47b-19eb-72f2-3f1b7f7d5764@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 21 May 2019 15:49:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] qapi: report the default CPU type for each
 machine
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 21, 2019 at 10:44:14AM -0500, Eric Blake wrote:
> On 5/21/19 10:38 AM, Daniel P. Berrang=C3=A9 wrote:
> > When user doesn't request any explicit CPU model with libvirt or QEMU=
,
> > a machine type specific CPU model is picked. Currently there is no wa=
y
> > to determine what this QEMU built-in default is, so libvirt cannot
> > report this back to the user in the XML config.
> >=20
> > This extends the "query-machines" QMP command so that it reports the
> > default CPU model typename for each machine.
> >=20
> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> >  qapi/misc.json | 6 +++++-
> >  vl.c           | 4 ++++
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/qapi/misc.json b/qapi/misc.json
> > index 8b3ca4fdd3..0bb7995bd4 100644
> > --- a/qapi/misc.json
> > +++ b/qapi/misc.json
> > @@ -2018,12 +2018,16 @@
> >  #
> >  # @hotpluggable-cpus: cpu hotplug via -device is supported (since 2.=
7.0)
> >  #
> > +# @default-cpu-type: default CPU model typename if none is requested=
 via
> > +#                    the -cpu argument. (since 4.2.0)
>=20
> 4.1 is sufficient (unless you think this is so controversial as to miss
> the current release cycle).

Yes, I'm getting confused about which release we're doing right now :-)

> Otherwise,
> Reviewed-by: Eric Blake <eblake@redhat.com>

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

