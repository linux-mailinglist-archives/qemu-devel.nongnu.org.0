Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008EA346619
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:16:27 +0100 (CET)
Received: from localhost ([::1]:49740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkdm-0002zI-0b
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lOkJQ-0001XB-3R
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:55:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lOkJA-0003oD-HV
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616518507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SdWQde6Olka61wicEQRsuvGQhLQuJdcC0qYtNWbiToE=;
 b=GmdeHJ2V1MswcCcdkwwCEVeALiEbho51Y0VE6pvEueLzIUYUsyvkQNc30FCD+LVvGYAOiV
 xy9lZ+vrMc8Qyt7E+JE7lT4Q5+fq0BZJ1HiWjy/DvCpwFZW8ps9h8mRB9VOZww1Sz7b1fF
 qQRiqUYKRYQqWEpIIt3DyS5OKS1VOfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-V871cHbGPL67evKrhgss-g-1; Tue, 23 Mar 2021 12:55:03 -0400
X-MC-Unique: V871cHbGPL67evKrhgss-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6631B18C8C01;
 Tue, 23 Mar 2021 16:55:02 +0000 (UTC)
Received: from localhost (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B9CD5FCB5;
 Tue, 23 Mar 2021 16:54:49 +0000 (UTC)
Date: Tue, 23 Mar 2021 17:54:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Ways to deal with broken machine types
Message-ID: <20210323175447.0c57d2a4@redhat.com>
In-Reply-To: <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
 <20210323104542-mutt-send-email-mst@kernel.org>
 <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
 <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 qemu devel list <qemu-devel@nongnu.org>, Vitaly Cheptsov <cheptsov@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 16:04:11 +0100
Thomas Lamprecht <t.lamprecht@proxmox.com> wrote:

> On 23.03.21 15:55, Vitaly Cheptsov wrote:
> >> 23 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2021 =D0=B3., =D0=B2 17:48, Michael =
S. Tsirkin <mst@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=
=B0):
> >>
> >> The issue is with people who installed a VM using 5.1 qemu,
> >> migrated to 5.2, booted there and set a config on a device
> >> e.g. IP on a NIC.
> >> They now have a 5.1 machine type but changing uid back
> >> like we do will break these VMs.
> >>
> >> Unlikley to be common but let's at least create a way for these people
> >> to used these VMs.
> >> =20
> > They can simply set the 5.2 VM version in such a case. I do not want to=
  =20
> let this legacy hack to be enabled in any modern QEMU VM version, as it v=
iolates ACPI specification and makes the life more difficult for various ot=
her software like bootloaders and operating systems.
>=20
> Yeah here I agree with Vitaly, if they already used 5.2 and made some con=
figurations
> for those "new" devices they can just keep using 5.2?
>=20
> If some of the devices got configured on 5.1 and some on 5.2 there's noth=
ing we can
> do anyway, from a QEMU POV - there the user always need to choose one mac=
hine version
> and fix up the device configured while on the other machine.

According to testing it appears that issue affects virtio drivers so it may=
 lead to
failure to boot guest (and there was at least 1 report about virtio-scsi be=
ing affected).

Let me hijack this thread for beyond this case scope.

I agree that for this particular bug we've done all we could, but
there is broader issue to discuss here.

We have machine versions to deal with hw compatibility issues and that cove=
rs most of the cases,
but occasionally we notice problem well after release(s),
so users may be stuck with broken VM and need to manually fix configuration=
 (and/or VM).
Figuring out what's wrong and how to fix it is far from trivial. So lets di=
scuss if we
can help to ease this pain, yes it will be late for first victims but it's =
still
better than never.

I'll try to sum up idea Michael suggested (here comes my unorganized brain-=
dump),

1. We can keep in VM's config QEMU version it was created on
   and as minimum warn user with a pointer to known issues if version in
   config mismatches version of actually used QEMU, with a knob to silence
   it for particular mismatch.

When an issue becomes know and resolved we know for sure how and what
changed and embed instructions on what options to use for fixing up VM's
config to preserve old HW config depending on QEMU version VM was installed=
 on.

some more ideas:
   2. let mgmt layer to keep fixup list and apply them to config if availab=
le
       (user would need to upgrade mgmt or update fixup list somehow)
   3. let mgmt layer to pass VM's QEMU version to currently used QEMU, so
      that QEMU could maintain and apply fixups based on QEMU version + mac=
hine type.
      The user will have to upgrade to newer QEMU to get/use new fixups.

In my opinion both would lead to explosion of 'possibly needed' properties =
for each
change we introduce in hw/firmware(read ACPI) and very possibly a lot of co=
nditional
branches in QEMU code. And I'm afraid it will become hard to maintain QEMU =
=3D>
more bugs in future.
Also it will lead to explosion of test matrix for downstreams who care abou=
t testing.

If we proactively gate changes on properties, we can just update fixup list=
s in mgmt,
without need to update QEMU (aka Insite rules) at a cost of complexity on Q=
MEU side.

Alternatively we can be conservative in spawning new properties, that means=
 creating
them only when issue is fixed and require users to update QEMU, so that fix=
ups could
be applied to VM.

Feel free to shoot the messenger down or suggest ways how we can deal with =
the problem.


