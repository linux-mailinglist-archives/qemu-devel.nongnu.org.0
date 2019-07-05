Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E935F4F3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 10:51:42 +0200 (CEST)
Received: from localhost ([::1]:43582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hixSv-0005AK-CO
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 04:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56789)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hixRf-0004jx-Dz
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:50:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hixRe-0006CU-2P
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:50:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50506)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hixRd-0006C5-SS
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 04:50:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 933C637F46;
 Thu,  4 Jul 2019 08:50:19 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6132B86C24;
 Thu,  4 Jul 2019 08:50:18 +0000 (UTC)
Date: Thu, 4 Jul 2019 09:50:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Message-ID: <20190704085016.GC20871@redhat.com>
References: <20190703135411.28436-1-berrange@redhat.com>
 <87k1cywznu.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k1cywznu.fsf@zen.linaroharston>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 04 Jul 2019 08:50:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] doc: document that the monitor console is
 a privileged control interface
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 P J P <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 03, 2019 at 10:56:05PM +0100, Alex Benn=C3=A9e wrote:
>=20
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>=20
> > A supposed exploit of QEMU was recently announced as CVE-2019-12928
> > claiming that the monitor console was insecure because the "migrate"
> > comand enabled arbitrary command execution for a remote attacker.
> >
> > For this to be a flaw the user launching QEMU must have configured
> > the monitor in a way that allows for other userrs to access it. The
> > exploit report quoted use of the "tcp" character device backend for
> > QMP.
> >
> > This would indeed allow any network user to connect to QEMU and
> > execute arbitrary comamnds, however, this is not a flaw in QEMU.
> > It is the normal expected behaviour of the monitor console and the
> > commands it supports. Given a monitor connection, there are many
> > ways to access host filesystem content besides the migrate command.
> >
> > The reality is that the monitor console (whether QMP or HMP) is
> > considered a privileged interface to QEMU and as such must only
> > be made available to trusted users. IOW, making it available with
> > no authentication over TCP is simply a, very serious, user
> > configuration error not a security flaw in QEMU itself.
>=20
> Is this the sort of thing we should emit warnings for? I guess this is =
a
> philosophical question as QEMU tends to err towards being taciturn on
> the command line unless something is actually wrong (and not just
> stupid).
>=20
> I wouldn't expect a warning for -serial mon:stdio but maybe a
> non-localhost tcp chardev for o+rw socket might be worth a mention? Of
> course this sort of sanitising of the command line options does incur
> cost and complexity in our option processing.

The challenge with issuing warnings is ensuring that we don't give
false positives, and that's pretty much impossible IMHO.

Even use of plain non-localhost TCP chardevs can be valid in some
circumstances. For example it would not be surprising to see it
used if QEMU was inside a Kubernetes container, as two containers
can communicate with each other over IP & rely on Kubernetes
networking layer to provide security

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

