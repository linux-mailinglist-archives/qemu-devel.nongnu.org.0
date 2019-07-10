Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4EC61F4C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 15:09:05 +0200 (CEST)
Received: from localhost ([::1]:41586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkTOD-0008NO-0s
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 09:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48165)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlevitsk@redhat.com>) id 1hkTMA-0007fr-Af
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 09:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hkTM9-0001Mw-5y
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 09:06:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33050)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hkTM2-0001IA-Mc; Mon, 08 Jul 2019 09:06:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EB11AC0578F2;
 Mon,  8 Jul 2019 13:06:49 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B85D57984;
 Mon,  8 Jul 2019 13:06:45 +0000 (UTC)
Message-ID: <55254f0299763e72795830220c6ceadb8d460bfb.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Date: Mon, 08 Jul 2019 16:06:44 +0300
In-Reply-To: <32e58390-1093-c470-84be-980f1b3e12f5@redhat.com>
References: <20190703155944.9637-1-mlevitsk@redhat.com>
 <20190703155944.9637-2-mlevitsk@redhat.com>
 <c47da7ef-82ac-1a76-9c8e-f76336c20c44@redhat.com>
 <d009ad68b237aae51d327955367dc2356f33bba0.camel@redhat.com>
 <5d32c846-1ff6-ec99-af20-8e7a794c4fe2@redhat.com>
 <7eeafe074290d5374b5ad6c0fc81d1c0dea492e1.camel@redhat.com>
 <32e58390-1093-c470-84be-980f1b3e12f5@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 08 Jul 2019 13:06:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 1/6] block/nvme: don't touch the
 completion entries
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2019-07-08 at 15:00 +0200, Max Reitz wrote:
> On 08.07.19 14:51, Maxim Levitsky wrote:
> > On Mon, 2019-07-08 at 14:23 +0200, Max Reitz wrote:
> > > On 07.07.19 10:43, Maxim Levitsky wrote:
> > > > On Fri, 2019-07-05 at 13:03 +0200, Max Reitz wrote:
> > > > > On 03.07.19 17:59, Maxim Levitsky wrote:
> > > > > > Completion entries are meant to be only read by the host and =
written by the device.
> > > > > > The driver is supposed to scan the completions from the last =
point where it left,
> > > > > > and until it sees a completion with non flipped phase bit.
> > > > >=20
> > > > > (Disclaimer: This is the first time I read the nvme driver, or =
really
> > > > > something in the nvme spec.)
> > > > >=20
> > > > > Well, no, completion entries are also meant to be initialized b=
y the
> > > > > host.  To me it looks like this is the place where that happens=
:
> > > > > Everything that has been processed by the device is immediately=
 being
> > > > > re-initialized.
> > > > >=20
> > > > > Maybe we shouldn=E2=80=99t do that here but in nvme_submit_comm=
and().  But
> > > > > currently we don=E2=80=99t, and I don=E2=80=99t see any other p=
lace where we currently
> > > > > initialize the CQ entries.
> > > >=20
> > > > Hi!
> > > > I couldn't find any place in the spec that says that completion e=
ntries should be initialized.
> > > > It is probably wise to initialize that area to 0 on driver initia=
lization, but nothing beyond that.
> > >=20
> > > Ah, you=E2=80=99re right, I misread.  I didn=E2=80=99t pay as much =
attention to the
> > > =E2=80=9C...prior to setting CC.EN to =E2=80=981=E2=80=99=E2=80=9D =
as I should have.  Yep, and that is
> > > done in nvme_init_queue().
> > >=20
> > > OK, I cease my wrongful protest:
> > >=20
> > > Reviewed-by: Max Reitz <mreitz@redhat.com>
> > >=20
> > > >=20
> >=20
> > Thank you very much!
> > BTW, the qemu driver does allocate zeroed memory (in nvme_init_queue,=
=20
> > "q->queue =3D qemu_try_blockalign0(bs, bytes);"
>=20
> Yes, that=E2=80=99s what I was referring to above. :-)
>=20
> > Thus I think this is all that is needed in that regard.
> >=20
> > Note that this patch doesn't fix any real bug I know of,=20
> > but just makes the thing right in regard to the spec.
> > Also racing with hardware in theory can have various memory ordering =
bugs,
> > although in this case the writes are done in=20
> > entries which controller probably won't touch, but still.
> >=20
> > TL;DR - no need in code which does nothing and might cause issues.
> >=20
> > Do you want me to resend the series or shall I wait till we decide
> > what to do with the image creation support? I done fixing all the
> > review comments long ago, just didn't want to resend the series.
> > Or shall I drop that patch and resend?
>=20
> I think I won=E2=80=99t apply the image creation patch now, so it=E2=80=
=99s probably
> better to just drop it for now.
>=20
> > From the urgency standpoint the only patch that really should
> > be merged ASAP is the one that adds support for block sizes,
> > because without it, the whole thing crashes and burns on 4K
> > nvme drives.
>=20
> By now we=E2=80=99re in softfreeze anyway, so unless write-zeroes/disca=
rd
> support is important now, it=E2=80=99s difficult to justify taking them=
 for 4.1.
>  So for me it would be best if you put patches 1 through 3 into a
> for-4.1 series and move the rest to 4.2.  (I=E2=80=99d probably also sp=
lit the
> creation patch off, because I don=E2=80=99t think I=E2=80=99m going to =
apply it before
> having experimented a bit with blockdev-create for qemu-img.)
>=20
> If you think write-zeroes/discard support is important for 4.1, feel
> free to include them in the for-4.1 series along with an explanation as
> to why it=E2=80=99s important.

I don't think either that these are important, so I split them as you say=
.

Best regards,
	Maxim Levitsky




