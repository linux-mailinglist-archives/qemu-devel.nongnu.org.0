Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5D11C43C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 09:58:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQSKY-0002Zj-Ni
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 03:58:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hQSIK-0001Fz-4s
	for qemu-devel@nongnu.org; Tue, 14 May 2019 03:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hQSII-00047v-PE
	for qemu-devel@nongnu.org; Tue, 14 May 2019 03:56:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55710)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hQSII-00046z-Ht
	for qemu-devel@nongnu.org; Tue, 14 May 2019 03:56:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8F913082E8F;
	Tue, 14 May 2019 07:56:13 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.40.205.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B051963B86;
	Tue, 14 May 2019 07:56:08 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 09:56:00 +0200
Message-Id: <20190514075602.7674-2-lvivier@redhat.com>
In-Reply-To: <20190514075602.7674-1-lvivier@redhat.com>
References: <20190514075602.7674-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 14 May 2019 07:56:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 1/3] VirtIO-RNG: Update default entropy
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Kashyap Chamarthy <kchamart@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, Amit Shah <amit@kernel.org>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kashyap Chamarthy <kchamart@redhat.com>

When QEMU exposes a VirtIO-RNG device to the guest, that device needs a
source of entropy, and that source needs to be "non-blocking", like
`/dev/urandom`.  However, currently QEMU defaults to the problematic
`/dev/random`, which on linux is "blocking" (as in, it waits until
sufficient entropy is available).

Why prefer `/dev/urandom` over `/dev/random`?
---------------------------------------------

The man pages of urandom(4) and random(4) state:

    "The /dev/random device is a legacy interface which dates back to a
    time where the cryptographic primitives used in the implementation
    of /dev/urandom were not widely trusted.  It will return random
    bytes only within the estimated number of bits of fresh noise in the
    entropy pool, blocking if necessary.  /dev/random is suitable for
    applications that need high quality randomness, and can afford
    indeterminate delays."

Further, the "Usage" section of the said man pages state:

    "The /dev/random interface is considered a legacy interface, and
    /dev/urandom is preferred and sufficient in all use cases, with the
    exception of applications which require randomness during early boot
    time; for these applications, getrandom(2) must be used instead,
    because it will block until the entropy pool is initialized.

    "If a seed file is saved across reboots as recommended below (all
    major Linux distributions have done this since 2000 at least), the
    output is cryptographically secure against attackers without local
    root access as soon as it is reloaded in the boot sequence, and
    perfectly adequate for network encryption session keys.  Since reads
    from /dev/random may block, users will usually want to open it in
    nonblocking mode (or perform a read with timeout), and provide some
    sort of user notification if the desired entropy is not immediately
    available."

And refer to random(7) for a comparison of `/dev/random` and
`/dev/urandom`.

What about other OSes?
----------------------

`/dev/urandom` exists and works on OS-X, FreeBSD, DragonFlyBSD, NetBSD
and OpenBSD, which cover all the non-Linux platforms we explicitly
support, aside from Windows.

On Windows `/dev/random` doesn't work either so we don't regress.
This is actually another argument in favour of using the newly
proposed 'rng-builtin' backend by default, as that will work on
Windows.

    - - -

Given the above, change the entropy source for VirtIO-RNG device to
`/dev/urandom`.

Related discussion in these[1][2] past threads.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg08335.htm=
l
    -- "RNG: Any reason QEMU doesn't default to `/dev/urandom`?"
[2] https://lists.nongnu.org/archive/html/qemu-devel/2018-09/msg02724.htm=
l
    -- "[RFC] Virtio RNG: Consider changing the default entropy source to
       /dev/urandom"

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 backends/rng-random.c | 2 +-
 qemu-options.hx       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/backends/rng-random.c b/backends/rng-random.c
index e2a49b0571d7..eff36ef14084 100644
--- a/backends/rng-random.c
+++ b/backends/rng-random.c
@@ -112,7 +112,7 @@ static void rng_random_init(Object *obj)
                             rng_random_set_filename,
                             NULL);
=20
-    s->filename =3D g_strdup("/dev/random");
+    s->filename =3D g_strdup("/dev/urandom");
     s->fd =3D -1;
 }
=20
diff --git a/qemu-options.hx b/qemu-options.hx
index 0191ef8b1eb7..4df0ea3aed5c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4286,7 +4286,7 @@ Creates a random number generator backend which obt=
ains entropy from
 a device on the host. The @option{id} parameter is a unique ID that
 will be used to reference this entropy backend from the @option{virtio-r=
ng}
 device. The @option{filename} parameter specifies which file to obtain
-entropy from and if omitted defaults to @option{/dev/random}.
+entropy from and if omitted defaults to @option{/dev/urandom}.
=20
 @item -object rng-egd,id=3D@var{id},chardev=3D@var{chardevid}
=20
--=20
2.20.1


