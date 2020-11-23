Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A02C14A0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:42:08 +0100 (CET)
Received: from localhost ([::1]:38408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHix-0000n3-Fs
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjia@nvidia.com>) id 1khHb1-00050s-GL
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:33:55 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjia@nvidia.com>) id 1khHax-00021o-LK
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:33:55 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbc0e950000>; Mon, 23 Nov 2020 11:33:41 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 23 Nov 2020 19:33:38 +0000
Date: Mon, 23 Nov 2020 11:33:37 -0800
From: Neo Jia <cjia@nvidia.com>
To: Shenming Lu <lushenming@huawei.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
Message-ID: <20201123193336.GA32690@nvidia.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
 <20201120150146.5e5693e9@w520.home>
 <09549a98-85a0-fe4e-59fc-fdb636a4a5cd@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <09549a98-85a0-fe4e-59fc-fdb636a4a5cd@huawei.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.6.2 (2016-07-01)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606160021; bh=q8Y/f4WjrS/2neMGtSkfHvbAvgDJDv4z5vMu67wM2fM=;
 h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:Content-Transfer-Encoding:
 In-Reply-To:X-NVConfidentiality:User-Agent:X-Originating-IP:
 X-ClientProxiedBy;
 b=JquiSpD/AY4SYoH2ok2sFKnL3BoqT8s8pYYUx56CeTiAqjEQ59rGtSwKa/p/2QR2u
 cooIKXsiQnYlsNddTddyScSRrkAwT3mWyIj4KKzG9CXneQw0IdPEqNNpjjq2FM+XEG
 2l1/qTxRigD1vCMc6pOTGy28cJU6LQm3XWmJRp0NeNR0hH4ktH+0WoyQhw4QRPVh0j
 hg3h7ioeMCa3vtNaNys8QhFPCfxm2tAR5TMPWxpIChpkpvDAURWyo3LzwiK3g2MWR5
 7+9MdV9d9gK4Z1GC48pEc1EKFqQLnklrFDjxEATeVYmHRFrElSSVqrW75PesAmrvtD
 1+VSsJbS/hOOw==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=cjia@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, dgilbert@redhat.com, Eric Auger <eric.auger@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 23, 2020 at 11:14:38AM +0800, Shenming Lu wrote:
> External email: Use caution opening links or attachments
>=20
>=20
> On 2020/11/21 6:01, Alex Williamson wrote:
> > On Fri, 20 Nov 2020 22:05:49 +0800
> > Shenming Lu <lushenming@huawei.com> wrote:
> >
> >> On 2020/11/20 1:41, Alex Williamson wrote:
> >>> On Thu, 19 Nov 2020 14:13:24 +0530
> >>> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> >>>
> >>>> On 11/14/2020 2:47 PM, Shenming Lu wrote:
> >>>>> When running VFIO migration, I found that the restoring of VFIO PCI=
 device=E2=80=99s
> >>>>> config space is before VGIC on ARM64 target. But generally, interru=
pt controllers
> >>>>> need to be restored before PCI devices.
> >>>>
> >>>> Is there any other way by which VGIC can be restored before PCI devi=
ce?
> >>
> >> As far as I know, it seems to have to depend on priorities in the non-=
iterable process.
> >>
> >>>>
> >>>>> Besides, if a VFIO PCI device is
> >>>>> configured to have directly-injected MSIs (VLPIs), the restoring of=
 its config
> >>>>> space will trigger the configuring of these VLPIs (in kernel), wher=
e it would
> >>>>> return an error as I saw due to the dependency on kvm=E2=80=99s vgi=
c.
> >>>>>
> >>>>
> >>>> Can this be fixed in kernel to re-initialize the kernel state?
> >>
> >> Did you mean to reconfigure these VLPIs when restoring kvm's vgic?
> >> But the fact is that this error is not caused by kernel, it is due to =
the incorrect
> >> calling order of qemu...
> >>
> >>>>
> >>>>> To avoid this, we can move the saving of the config space from the =
iterable
> >>>>> process to the non-iterable process, so that it will be called afte=
r VGIC
> >>>>> according to their priorities.
> >>>>>
> >>>>
> >>>> With this change, at resume side, pre-copy phase data would reach
> >>>> destination without restored config space. VFIO device on destinatio=
n
> >>>> might need it's config space setup and validated before it can accep=
t
> >>>> further VFIO device specific migration state.
> >>>>
> >>>> This also changes bit-stream, so it would break migration with origi=
nal
> >>>> migration patch-set.
> >>>
> >>> Config space can continue to change while in pre-copy, if we're only
> >>> sending config space at the initiation of pre-copy, how are any chang=
es
> >>> that might occur before the VM is stopped conveyed to the target?  Fo=
r
> >>> example the guest might reboot and a device returned to INTx mode fro=
m
> >>> MSI during pre-copy.  Thanks,
> >>
> >> What I see is that the config space is only saved once in save_live_co=
mplete_precopy
> >> currently...
> >> As you said, a VFIO device might need it's config space setup first, a=
nd
> >> the config space can continue to change while in pre-copy, Did you mea=
n we
> >> have to migrate the config space in save_live_iterate?
> >> However, I still have a little doubt about the restoring dependence be=
tween
> >> the qemu emulated config space and the device data...
> >>
> >> Besides, if we surely can't move the saving of the config space back, =
can we
> >> just move some actions which are triggered by the restoring of the con=
fig space
> >> back (such as vfio_msix_enable())?
> >
> > It seems that the significant benefit to enabling interrupts during
> > pre-copy would be to reduce the latency and failure potential during
> > the final phase of migration.  Do we have any data for how much it adds
> > to the device contributed downtime to configure interrupts only at the
> > final stage?  My guess is that it's a measurable delay on its own.  At
> > the same time, we can't ignore the differences in machine specific
> > dependencies and if we don't even sync the config space once the VM is
> > stopped... this all seems not ready to call supported, especially if we
> > have concerns already about migration bit-stream compatibility.
> >
>=20
> I have another question for this, if we restore the config space while in=
 pre-copy
> (include enabling interrupts), does it affect the _RESUMING state (paused=
) of the
> device on the dst host (cause it to send interrupts? which should not be =
allowed
> in this stage). Does the restore sequence need to be further discussed an=
d reach
> a consensus(spec) (taking into account other devices and the correspondin=
g actions
> of the vendor driver)?
>=20
> > Given our timing relative to QEMU 5.2, the only path I feel comfortable
> > with is to move forward with downgrading vfio migration support to be
> > enabled via an experimental option.  Objections?  Thanks,
>=20
> Alright, but this issue is related to our ARM GICv4.1 migration scheme, c=
ould you
> give a rough idea about this (where to enable interrupts, we hope it to b=
e after
> the restoring of VGIC)?

I disagree. If this is only specific to Huawei ARM GIC implementation, why =
do we want to
make the entire VFIO based migration an experimental feature?

Thanks,
Neo

>=20
> Thanks,
> Shenming

