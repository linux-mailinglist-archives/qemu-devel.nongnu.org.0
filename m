Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3293349E3B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:50:37 +0100 (CET)
Received: from localhost ([::1]:36298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPagO-00038H-P1
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lPaec-0002IZ-3v
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 20:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lPaeW-0005Rr-OQ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 20:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616719719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8bsoisWwOa6jBGNMsgvN27MloGhkoGTokDjMfO4HqJY=;
 b=gMsqf2uXspTsnBgZUfYlqI/P7GokJhEhmuY9bjBmgg9zY3tVF8S/ocNSgQeeGUG2GJqEDO
 F5PWTCX3y7sep2c6CqtHJ+iatyY757Mpnos/6DpS3oReb/kqN1jpliVH49whDVpgaacUjG
 CvwrVTq3RizSX5xkRwMtKX5POxasCKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-JSQyZ8Q9PEK_Pp6TSzOLlw-1; Thu, 25 Mar 2021 20:48:38 -0400
X-MC-Unique: JSQyZ8Q9PEK_Pp6TSzOLlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 419D1180FCA0;
 Fri, 26 Mar 2021 00:48:36 +0000 (UTC)
Received: from localhost (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67F496A8FE;
 Fri, 26 Mar 2021 00:48:27 +0000 (UTC)
Date: Fri, 26 Mar 2021 01:48:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: Ways to deal with broken machine types
Message-ID: <20210326014825.2e58c68f@redhat.com>
In-Reply-To: <YFooFMWxwpiSB6ZJ@redhat.com>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
 <20210323104542-mutt-send-email-mst@kernel.org>
 <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
 <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
 <20210323175447.0c57d2a4@redhat.com> <YFooFMWxwpiSB6ZJ@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu devel list <qemu-devel@nongnu.org>, Vitaly Cheptsov <cheptsov@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 17:40:36 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Mar 23, 2021 at 05:54:47PM +0100, Igor Mammedov wrote:
> > Let me hijack this thread for beyond this case scope.
> >=20
> > I agree that for this particular bug we've done all we could, but
> > there is broader issue to discuss here.
> >=20
> > We have machine versions to deal with hw compatibility issues and that =
covers most of the cases,
> > but occasionally we notice problem well after release(s),
> > so users may be stuck with broken VM and need to manually fix configura=
tion (and/or VM).
> > Figuring out what's wrong and how to fix it is far from trivial. So let=
s discuss if we
> > can help to ease this pain, yes it will be late for first victims but i=
t's still
> > better than never. =20
>=20
> To summarize the problem situation
>=20
>  - We rely on a machine type version to encode a precise guest ABI.
>  - Due a bug, we are in a situation where the same machine type
>    encodes two distinct guest ABIs due to a mistake introduced
>    betwen QEMU N-2 and N-1
>  - We want to fix the bug in QEMU N
>  - For incoming migration there is no way to distinguish between
>    the ABIs used in N-2 and N-1, to pick the right one
>=20
> So we're left with an unwinnable problem:
>=20
>   - Not fixing the bug =3D>
>=20
>        a) user migrating N-2 to N-1 have ABI change
>        b) user migrating N-2 to N have ABI change
>        c) user migrating N-1 to N are fine
>=20
>     No mitigation for (a) or (b)
>=20
>   - Fixing the bug =3D>
>=20
>        a) user migrating N-2 to N-1 have ABI change.
>        b) user migrating N-2 to N are fine
>        c) user migrating N-1 to N have ABI change
>=20
>     Bad situations (a) and (c) are mitigated by
>     backporting fix to N-1-stable too.
>=20
> Generally we have preferred to fix the bug, because we have
> usually identified them fairly quickly after release, and
> backporting the fix to stable has been sufficient mitigation
> against ill effects. Basically the people left broken are a
> relatively small set out of the total userbase.
>=20
> The real challenge arises when we are slow to identify the
> problem, such that we have a large number of people impacted.
>=20
>=20
> > I'll try to sum up idea Michael suggested (here comes my unorganized br=
ain-dump),
> >=20
> > 1. We can keep in VM's config QEMU version it was created on
> >    and as minimum warn user with a pointer to known issues if version i=
n
> >    config mismatches version of actually used QEMU, with a knob to sile=
nce
> >    it for particular mismatch.
> >=20
> > When an issue becomes know and resolved we know for sure how and what
> > changed and embed instructions on what options to use for fixing up VM'=
s
> > config to preserve old HW config depending on QEMU version VM was insta=
lled on. =20
>=20
> > some more ideas:
> >    2. let mgmt layer to keep fixup list and apply them to config if ava=
ilable
> >        (user would need to upgrade mgmt or update fixup list somehow)
> >    3. let mgmt layer to pass VM's QEMU version to currently used QEMU, =
so
> >       that QEMU could maintain and apply fixups based on QEMU version +=
 machine type.
> >       The user will have to upgrade to newer QEMU to get/use new fixups=
. =20
>=20
> The nice thing about machine type versioning is that we are treating the
> versions as opaque strings which represent a specific ABI, regardless of
> the QEMU version. This means that even if distros backport fixes for bugs
> or even new features, the machine type compatibility check remains a
> simple equality comparsion.
>=20
> As soon as you introduce the QEMU version though, we have created a
> large matrix for compatibility. This matrix is expanded if a distro
> chooses to backport fixes for any of the machine type bugs to their
> stable streams. This can get particularly expensive when there are
> multiple streams a distro is maintaining.
>=20
> *IF* the original N-1 qemu has a property that could be queried by
> the mgmt app to identify a machine type bug, then we could potentially
> apply a fixup automatically.
>=20
> eg query-machines command in QEMU version N could report against
> "pc-i440fx-5.0", that there was a regression fix that has to be
> applied if property "foo" had value "bar".
>=20
> Now, the mgmt app wants to migrate from QEMU N-2 or N-1 to QEMU N.
> It can query the value of "foo" on the source QEMU with qom-get.
> It now knows whether it has to override this property "foo" when
> spawning QEMU N on the target host.
>=20
> Of course this doesn't help us if neither N-1 or N-2 QEMU had a
> property that can be queried to identify the bug - ie if the
> property in question was newly introduced in QEMU N to fix the
> bug.
>=20
> > In my opinion both would lead to explosion of 'possibly needed' propert=
ies for each
> > change we introduce in hw/firmware(read ACPI) and very possibly a lot o=
f conditional
> > branches in QEMU code. And I'm afraid it will become hard to maintain Q=
EMU =3D>
> > more bugs in future.
> > Also it will lead to explosion of test matrix for downstreams who care =
about testing.
> >=20
> > If we proactively gate changes on properties, we can just update fixup =
lists in mgmt,
> > without need to update QEMU (aka Insite rules) at a cost of complexity =
on QMEU side.
> >=20
> > Alternatively we can be conservative in spawning new properties, that m=
eans creating
> > them only when issue is fixed and require users to update QEMU, so that=
 fixups could
> > be applied to VM.
> >=20
> > Feel free to shoot the messenger down or suggest ways how we can deal w=
ith the problem. =20
>=20
> The best solution is of course to not have introduced the ABI change in
> the first place. We have lots of testing, but upstream at least, I don't
> think we have anything that is explicitly recording the ABI associated
> with each machine type and validating that it hasn't changed. We rely on
> the developers to follow the coding practices wrt setting machine type
> defaults for back compat, and while we're good, we inevitably screw up
> every now & then.
>=20
> Downstreams do have some of this ABI testing - several problems like the
> one we have there, have been identified when RHEL downstream QE did
> migration tests and found a change in RHEL machine types, which then
> was traced back to upstream.
>=20
> I feel like we need some standard tool which can be run inside a VM
> that dumps all the possible ABI relevant information about the virtual
> machine in a nice data format.
>=20
> We would have to run this for each machine type, and save the
> results to git immediately after release. Then for every change to
> master, we would have to run the test again for every historic
> machine type version and compare to the recorded ABI record.

Like Michael said we don't know that something is broken until it's
too late and this particular case it's not even broken (strictly speaking
change is correct) and is not even a part of ABI (it's ACPI code, i.e. firm=
ware).

Problem is in the way virtio drivers enumerate devices, which makes the sam=
e
device appear as a new one. We can work around issue on hypervisor side so =
user
won't loose network connectivity or would be able to boot guest after QEMU =
upgrade.

We can suggest user re-installing their Windows (method that fixes almost a=
ll Win issues)
or to try to make it pain-less for user in these rare cases, by upgrading t=
o
new QEMU (or fixed stable) which has workaround, so only the first few has =
to suffer.

(I think downstreams would even more benefit from this, there were similar =
problems
there before).

Yes, It surely will expand test matrix, but it should be limited to specifi=
c cases
we implemented fixups for.

>=20
> Regards,
> Daniel


