Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52252AF0EB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:41:00 +0100 (CET)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpQp-0004QX-Oh
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcpOU-0003D0-Mo
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:38:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcpOR-0007my-1P
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FoSZStS9KrzSAcpwfKbSGuZmBATdGECBeQe8KyizGMA=;
 b=W4mom3FFA6TzO2AVDecmll+PCKOmgrG+goRf/yZNi6Q9OrSLbEwM0pndW4traoj3vboWJ+
 Ufi+OLAEcPsQ/4sYGv8cGlvLvNlD9QKuCStHCjpnN+HYwcCp9hvs36sDwHKjxbJhalSHpE
 AncaBo5LLxvAO6PWeCLGpzRIAo/0HkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-dOi0dEM9MXK7j-bdDKjRoA-1; Wed, 11 Nov 2020 07:38:27 -0500
X-MC-Unique: dOi0dEM9MXK7j-bdDKjRoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 085A1186DD4F;
 Wed, 11 Nov 2020 12:38:26 +0000 (UTC)
Received: from gondolin (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C4701A925;
 Wed, 11 Nov 2020 12:38:18 +0000 (UTC)
Date: Wed, 11 Nov 2020 13:38:15 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Michael Mueller <mimu@linux.ibm.com>
Subject: Re: [PATCH 1/1] virtio-blk-ccw: tweak the default for num_queues
Message-ID: <20201111133815.10b8f3b7.cohuck@redhat.com>
In-Reply-To: <e27547cf-1462-6e0f-c830-dde5a6f8c1f6@linux.ibm.com>
References: <20201109154831.20779-1-pasic@linux.ibm.com>
 <20201109170616.6875f610.cohuck@redhat.com>
 <20201109195303.459f6fba.pasic@linux.ibm.com>
 <4a3d24e0-399f-f509-9a5c-c66c57b2d28a@linux.ibm.com>
 <e27547cf-1462-6e0f-c830-dde5a6f8c1f6@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 13:26:11 +0100
Michael Mueller <mimu@linux.ibm.com> wrote:

> On 10.11.20 15:16, Michael Mueller wrote:
> >=20
> >=20
> > On 09.11.20 19:53, Halil Pasic wrote: =20
> >> On Mon, 9 Nov 2020 17:06:16 +0100
> >> Cornelia Huck <cohuck@redhat.com> wrote:
> >> =20
> >>>> @@ -20,6 +21,11 @@ static void=20
> >>>> virtio_ccw_blk_realize(VirtioCcwDevice *ccw_dev, Error **errp)
> >>>> =C2=A0 {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VirtIOBlkCcw *dev =3D VIRTIO_BLK_CCW(=
ccw_dev);
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState *vdev =3D DEVICE(&dev->vd=
ev);
> >>>> +=C2=A0=C2=A0=C2=A0 VirtIOBlkConf *conf =3D &dev->vdev.conf;
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0 if (conf->num_queues =3D=3D VIRTIO_BLK_AUTO_NUM_=
QUEUES) {
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conf->num_queues =3D MIN=
(4, current_machine->smp.cpus);
> >>>> +=C2=A0=C2=A0=C2=A0 } =20
> >>>
> >>> I would like to have a comment explaining the numbers here, however.
> >>>
> >>> virtio-pci has a pretty good explanation (use 1:1 for vqs:vcpus if
> >>> possible, apply some other capping). 4 seems to be a bit arbitrary
> >>> without explanation, although I'm sure you did some measurements :) =
=20
> >>
> >> Frankly, I don't have any measurements yet. For the secure case,
> >> I think Mimu has assessed the impact of multiqueue, hence adding Mimu =
to
> >> the cc list. @Mimu can you help us out.
> >>
> >> Regarding the normal non-protected VMs I'm in a middle of producing so=
me
> >> measurement data. This was admittedly a bit rushed because of where we
> >> are in the cycle. Sorry to disappoint you. =20
> >=20
> > I'm talking with the perf team tomorrow. They have done some=20
> > measurements with multiqueue for PV guests and I asked for a comparison=
=20
> > to non PV guests as well. =20
>=20
> The perf team has performed measurements for us that show that a *PV
> KVM guest* benefits in terms of throughput for random read, random write
> and sequential read (no difference for sequential write) by a multi
> queue setup. CPU cost are reduced as well due to reduced spinlock
> contention.

Just to be clear, that was with 4 queues?

>=20
> For a *standard KVM guest* it currently has no throughput effect. No
> benefit and no harm. I have asked them to finalize their measurements
> by comparing the CPU cost as well. I will receive that information on=20
> Friday.

Thank you for checking!

>=20
> Michael
>=20
>=20
> >=20
> > Michael
> >  =20
> >>
> >> The number 4 was suggested by Christian, maybe Christian does have som=
e
> >> readily available measurement data for the normal VM case. @Christian:
> >> can you help me out?
> >>
> >> Regards,
> >> Halil
> >> =20
> >  =20
>=20
>=20


