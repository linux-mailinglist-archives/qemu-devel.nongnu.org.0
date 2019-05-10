Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D478119A2C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 11:02:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP1Pk-0005xl-31
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 05:02:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hP1OT-0004wK-Ea
	for qemu-devel@nongnu.org; Fri, 10 May 2019 05:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hP1OO-0005Jj-8E
	for qemu-devel@nongnu.org; Fri, 10 May 2019 05:00:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hP1ON-0005JS-UR
	for qemu-devel@nongnu.org; Fri, 10 May 2019 05:00:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 271E780F6D;
	Fri, 10 May 2019 09:00:35 +0000 (UTC)
Received: from redhat.com (ovpn-112-68.ams2.redhat.com [10.36.112.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 243DF6013A;
	Fri, 10 May 2019 09:00:30 +0000 (UTC)
Date: Fri, 10 May 2019 10:00:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Message-ID: <20190510090028.GF7671@redhat.com>
References: <20190510081526.15507-1-kchamart@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190510081526.15507-1-kchamart@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 10 May 2019 09:00:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] VirtIO-RNG: Update default entropy
 source to `/dev/urandom`
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
Cc: armbru@redhat.com, rjones@redhat.com, qemu-devel@nongnu.org,
	stefanha@redhat.com, amit@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 10, 2019 at 10:15:25AM +0200, Kashyap Chamarthy wrote:
> When QEMU exposes a VirtIO-RNG device to the guest, that device needs a
> source of entropy, and that source needs to be "non-blocking", like
> `/dev/urandom`.  However, currently QEMU defaults to the problematic
> `/dev/random`, which is "blocking" (as in, it waits until sufficient
> entropy is available).
>=20
> Why prefer `/dev/urandom` over `/dev/random`?
> ---------------------------------------------
>=20
> The man pages of urandom(4) and random(4) state:
>=20
>     "The /dev/random device is a legacy interface which dates back to a
>     time where the cryptographic primitives used in the implementation
>     of /dev/urandom were not widely trusted.  It will return random
>     bytes only within the estimated number of bits of fresh noise in th=
e
>     entropy pool, blocking if necessary.  /dev/random is suitable for
>     applications that need high quality randomness, and can afford
>     indeterminate delays."
>=20
> Further, the "Usage" section of the said man pages state:
>=20
>     "The /dev/random interface is considered a legacy interface, and
>     /dev/urandom is preferred and sufficient in all use cases, with the
>     exception of applications which require randomness during early boo=
t
>     time; for these applications, getrandom(2) must be used instead,
>     because it will block until the entropy pool is initialized.
>=20
>     "If a seed file is saved across reboots as recommended below (all
>     major Linux distributions have done this since 2000 at least), the
>     output is cryptographically secure against attackers without local
>     root access as soon as it is reloaded in the boot sequence, and
>     perfectly adequate for network encryption session keys.  Since read=
s
>     from /dev/random may block, users will usually want to open it in
>     nonblocking mode (or perform a read with timeout), and provide some
>     sort of user notification if the desired entropy is not immediately
>     available."
>=20
> And refer to random(7) for a comparison of `/dev/random` and
> `/dev/urandom`.
>=20
>     - - -
>=20
> Given the above, change the entropy source for VirtIO-RNG device to
> `/dev/urandom`.
>=20
> Related discussion in these[1][2] past threads.
>=20
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg08335.h=
tml
>     -- "RNG: Any reason QEMU doesn't default to `/dev/urandom`?"
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2018-09/msg02724.h=
tml
>     -- "[RFC] Virtio RNG: Consider changing the default entropy source =
to
>        /dev/urandom"
>=20
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
> v2:
>  - Update commit message to mention justification for preferring
>    `/dev/urandom` over `/dev/random` [stefanha]
> ---
>  backends/rng-random.c | 2 +-
>  qemu-options.hx       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

