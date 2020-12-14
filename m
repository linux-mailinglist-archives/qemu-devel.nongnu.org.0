Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604DD2D987A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 14:03:05 +0100 (CET)
Received: from localhost ([::1]:37560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1konVH-0007Gr-TU
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 08:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1konT9-0006Cs-Un
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:00:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1konT7-0004PD-30
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607950848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JE3XtjPQc71jkTomxWQg0XPMjsJswmEM6goMhwlyAoA=;
 b=TTBaX8b+nxIJ2btcFzc0aMFVkwvFOgs/3BsMqqrDx51RIK4Trzj8usvjMLoQnNJK+yRUn8
 vyphk2eLfb48COJOty4rRmku59iWXfchZvn7xn7gW1xDzcwJtDms/e5DFfEGP3zz5aMkZH
 okxAdXOhseiJJTMSQxgh3vmspXWeiE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114--mQ7HziBPKyHch-Hffpe2w-1; Mon, 14 Dec 2020 08:00:46 -0500
X-MC-Unique: -mQ7HziBPKyHch-Hffpe2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 264891DDE0;
 Mon, 14 Dec 2020 13:00:45 +0000 (UTC)
Received: from gondolin (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73E7117264;
 Mon, 14 Dec 2020 13:00:25 +0000 (UTC)
Date: Mon, 14 Dec 2020 14:00:22 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] tests/acceptance/machine_s390_ccw_virtio: Test
 virtio-rng via /dev/hwrng
Message-ID: <20201214140022.42656393.cohuck@redhat.com>
In-Reply-To: <5764fbf7-6c78-fc4f-47ce-74ddd1c64110@redhat.com>
References: <20201211173134.376078-1-thuth@redhat.com>
 <20201211173134.376078-3-thuth@redhat.com>
 <7f2adbee-49e0-94f7-fcd7-7e012cc36bfa@redhat.com>
 <5764fbf7-6c78-fc4f-47ce-74ddd1c64110@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-s390x@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Dec 2020 08:10:01 +0100
Thomas Huth <thuth@redhat.com> wrote:

Minor nit: I think that the subject is a bit unwieldy. What about

"tests/acceptance: Test virtio-rng on s390 via /dev/hwrng"

?

> On 11/12/2020 21.30, Wainer dos Santos Moschetta wrote:
> > Hi,
> >=20
> > On 12/11/20 2:31 PM, Thomas Huth wrote: =20
> >> /dev/hwrng is only functional if virtio-rng is working right, so let's
> >> add a sanity check for this device node. =20
> >=20
> > Good idea.
> >  =20
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >> =C2=A0 tests/acceptance/machine_s390_ccw_virtio.py | 17 ++++++++++++++=
+--
> >> =C2=A0 1 file changed, 15 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py
> >> b/tests/acceptance/machine_s390_ccw_virtio.py
> >> index 733a7ca24a..7d0a78139b 100644
> >> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> >> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> >> @@ -64,9 +64,9 @@ class S390CCWVirtioMachine(Test):
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 '-append', kernel_command_line,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 '-device', 'virtio-net-ccw,devno=3Dfe.1.1111',
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 '-device',
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 'virtio-rng-ccw,devno=3Dfe.2.0000,max_revision=3D0',
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> >> 'virtio-rng-ccw,devno=3Dfe.2.0000,max_revision=3D0,id=3Drn1',
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 '-device',
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 'virtio-rng-ccw,devno=3Dfe.3.1234,max_revision=3D2',
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> >> 'virtio-rng-ccw,devno=3Dfe.3.1234,max_revision=3D2,id=3Drn2',
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 '-device', 'zpci,uid=3D5,target=3Dzzz',
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 '-device', 'virtio-net-pci,id=3Dzzz',
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 '-device', 'zpci,uid=3D0xa,fid=3D12,target=3Dserial',
> >> @@ -96,6 +96,19 @@ class S390CCWVirtioMachine(Test):
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exec_command_an=
d_wait_for_pattern(self,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 'cat
> >> /sys/bus/ccw/devices/0.3.1234/virtio?/features',
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 virtio_rng_features)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # check that /dev/hwrng wo=
rks - and that it's gone after ejecting
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exec_command_and_wait_for_=
pattern(self,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'dd i=
f=3D/dev/hwrng of=3D/tmp/out.dat bs=3D1k count=3D10',
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '10+0=
 records out')
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.clear_guests_dmesg()
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.vm.command('device_de=
l', id=3D'rn1')
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.wait_for_crw_reports(=
)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.clear_guests_dmesg()
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.vm.command('device_de=
l', id=3D'rn2')
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.wait_for_crw_reports(=
)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exec_command_and_wait_for_=
pattern(self,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'dd i=
f=3D/dev/hwrng of=3D/tmp/out.dat bs=3D1k count=3D10',

Does this work if you direct the output to /dev/null?

> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'dd: =
/dev/hwrng: No such device') =20
> >=20
> > Maybe the expected pattern is too fragile. On my Fedora 33 system, 'dd'=
 will
> > print a different message. =20
>=20
> We are running this test with a well-defined kernel + initrd, so I don't
> think we have to care of other versions of dd here.
>=20
> > What if it checks for the presence of the device file, e.g:
> >=20
> > ... self, 'test -c /dev/hwrng; echo $?', '1') =20
>=20
> That doesn't work, the /dev/hwrng is still there (so test -c succeeds),
> since this initrd uses static device nodes for this in /dev. /dev/hwrng j=
ust
> can not be opened anymore after the device has been removed.

I had been thinking about a different approach to check that, but dd
really looks like the easiest way.


