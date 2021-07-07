Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C003BEBD9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 18:16:08 +0200 (CEST)
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ADX-0003or-Eq
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 12:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1AC3-00030R-PR
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1AC0-0006Ea-Gm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625674471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cqc3O51I3XJwLMSFI3R8UzdnurEN4Y4TN0XhG8EbO/g=;
 b=JUi3rNIvDlAR5bs1yLOrJbwHi+SviKMSYMpFb9WwtZ62u3CVQjY23wOyYF9CSgCaA1NWBU
 VLuN9DsdzL8B9EBRfyn51dNxfpmer+irLbdfdhk8U+kkFy+zumosCo5mTjy8lo2MDAaxM+
 o+ziVEWN5hnqEYLiDFuZVugweqk0eu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-jwlNwrrTN66TWrAlFAIZ6g-1; Wed, 07 Jul 2021 12:14:29 -0400
X-MC-Unique: jwlNwrrTN66TWrAlFAIZ6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A57E510C1ADC;
 Wed,  7 Jul 2021 16:14:27 +0000 (UTC)
Received: from localhost (ovpn-114-152.ams2.redhat.com [10.36.114.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6D2510016F4;
 Wed,  7 Jul 2021 16:14:26 +0000 (UTC)
Date: Wed, 7 Jul 2021 17:14:25 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH 4/4] hw/nvme: fix controller hot unplugging
Message-ID: <YOXS4QFXOPXLW5//@stefanha-x1.localdomain>
References: <20210706093358.1036387-1-its@irrelevant.dk>
 <20210706093358.1036387-5-its@irrelevant.dk>
 <f468bbdc-fa33-a7e6-a392-394a736a06be@suse.de>
 <YOV5qZj8pcnH1aAE@apples.localdomain>
 <9fecd4b6-b36f-2101-4139-0666f741cf8e@suse.de>
MIME-Version: 1.0
In-Reply-To: <9fecd4b6-b36f-2101-4139-0666f741cf8e@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z2Yd38Ur1j5KyFnO"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Z2Yd38Ur1j5KyFnO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 12:43:56PM +0200, Hannes Reinecke wrote:
> On 7/7/21 11:53 AM, Klaus Jensen wrote:
> > On Jul=A0 7 09:49, Hannes Reinecke wrote:
> > > On 7/6/21 11:33 AM, Klaus Jensen wrote:
> > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > >=20
> > > > Prior to this patch the nvme-ns devices are always children of the
> > > > NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
> > > > unrealized when the parent device is removed. However, when subsyst=
ems
> > > > are involved, this is not what we want since the namespaces may be
> > > > attached to other controllers as well.
> > > >=20
> > > > This patch adds an additional NvmeBus on the subsystem device. When
> > > > nvme-ns devices are realized, if the parent controller device is li=
nked
> > > > to a subsystem, the parent bus is set to the subsystem one instead.=
 This
> > > > makes sure that namespaces are kept alive and not unrealized.
> > > >=20
> > > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > > ---
> > > > =A0hw/nvme/nvme.h=A0=A0 | 18 ++++++++++--------
> > > > =A0hw/nvme/ctrl.c=A0=A0 |=A0 8 +++++---
> > > > =A0hw/nvme/ns.c=A0=A0=A0=A0 | 32 +++++++++++++++++++++++++-------
> > > > =A0hw/nvme/subsys.c |=A0 4 ++++
> > > > =A04 files changed, 44 insertions(+), 18 deletions(-)
> > > >=20
> > > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> > > > index c4065467d877..9401e212f9f7 100644
> > > > --- a/hw/nvme/nvme.h
> > > > +++ b/hw/nvme/nvme.h
> > > > @@ -33,12 +33,21 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES >
> > > > NVME_NSID_BROADCAST - 1);
> > > > =A0typedef struct NvmeCtrl NvmeCtrl;
> > > > =A0typedef struct NvmeNamespace NvmeNamespace;
> > > > +#define TYPE_NVME_BUS "nvme-bus"
> > > > +OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
> > > > +
> > > > +typedef struct NvmeBus {
> > > > +=A0=A0=A0 BusState parent_bus;
> > > > +=A0=A0=A0 bool=A0=A0=A0=A0 is_subsys;
> > > > +} NvmeBus;
> > > > +
> > > > =A0#define TYPE_NVME_SUBSYS "nvme-subsys"
> > > > =A0#define NVME_SUBSYS(obj) \
> > > > =A0=A0=A0=A0 OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
> > > > =A0typedef struct NvmeSubsystem {
> > > > =A0=A0=A0=A0 DeviceState parent_obj;
> > > > +=A0=A0=A0 NvmeBus=A0=A0=A0=A0 bus;
> > > > =A0=A0=A0=A0 uint8_t=A0=A0=A0=A0 subnqn[256];
> > > > =A0=A0=A0=A0 NvmeCtrl=A0=A0=A0=A0=A0 *ctrls[NVME_MAX_CONTROLLERS];
> > > > @@ -365,13 +374,6 @@ typedef struct NvmeCQueue {
> > > > =A0=A0=A0=A0 QTAILQ_HEAD(, NvmeRequest) req_list;
> > > > =A0} NvmeCQueue;
> > > > -#define TYPE_NVME_BUS "nvme-bus"
> > > > -#define NVME_BUS(obj) OBJECT_CHECK(NvmeBus, (obj), TYPE_NVME_BUS)
> > > > -
> > > > -typedef struct NvmeBus {
> > > > -=A0=A0=A0 BusState parent_bus;
> > > > -} NvmeBus;
> > > > -
> > > > =A0#define TYPE_NVME "nvme"
> > > > =A0#define NVME(obj) \
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
> > > > @@ -463,7 +465,7 @@ typedef struct NvmeCtrl {
> > > > =A0static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
> > > > =A0{
> > > > -=A0=A0=A0 if (!nsid || nsid > NVME_MAX_NAMESPACES) {
> > > > +=A0=A0=A0 if (!n || !nsid || nsid > NVME_MAX_NAMESPACES) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 return NULL;
> > > > =A0=A0=A0=A0 }
> > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > > index 90e3ee2b70ee..7c8fca36d9a5 100644
> > > > --- a/hw/nvme/ctrl.c
> > > > +++ b/hw/nvme/ctrl.c
> > > > @@ -6516,11 +6516,13 @@ static void nvme_exit(PCIDevice *pci_dev)
> > > > =A0=A0=A0=A0 for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 ns =3D nvme_ns(n, i);
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (!ns) {
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (ns) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ns->attached--;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > +=A0=A0=A0 }
> > > > -=A0=A0=A0=A0=A0=A0=A0 nvme_ns_cleanup(ns);
> > > > +=A0=A0=A0 if (n->subsys) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 nvme_subsys_unregister_ctrl(n->subsys, n);
> > > > =A0=A0=A0=A0 }
> > > > =A0=A0=A0=A0 if (n->subsys) {
> > > > diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> > > > index 3c4f5b8c714a..612a2786d75d 100644
> > > > --- a/hw/nvme/ns.c
> > > > +++ b/hw/nvme/ns.c
> > > > @@ -444,13 +444,29 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
> > > > =A0static void nvme_ns_realize(DeviceState *dev, Error **errp)
> > > > =A0{
> > > > =A0=A0=A0=A0 NvmeNamespace *ns =3D NVME_NS(dev);
> > > > -=A0=A0=A0 BusState *s =3D qdev_get_parent_bus(dev);
> > > > -=A0=A0=A0 NvmeCtrl *n =3D NVME(s->parent);
> > > > -=A0=A0=A0 NvmeSubsystem *subsys =3D n->subsys;
> > > > +=A0=A0=A0 BusState *qbus =3D qdev_get_parent_bus(dev);
> > > > +=A0=A0=A0 NvmeBus *bus =3D NVME_BUS(qbus);
> > > > +=A0=A0=A0 NvmeCtrl *n =3D NULL;
> > > > +=A0=A0=A0 NvmeSubsystem *subsys =3D NULL;
> > > > =A0=A0=A0=A0 uint32_t nsid =3D ns->params.nsid;
> > > > =A0=A0=A0=A0 int i;
> > > > -=A0=A0=A0 if (!n->subsys) {
> > > > +=A0=A0=A0 if (bus->is_subsys) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 subsys =3D NVME_SUBSYS(qbus->parent);
> > > > +=A0=A0=A0 } else {
> > > > +=A0=A0=A0=A0=A0=A0=A0 n =3D NVME(qbus->parent);
> > > > +=A0=A0=A0=A0=A0=A0=A0 subsys =3D n->subsys;
> > > > +=A0=A0=A0 }
> > > > +
> > > > +=A0=A0=A0 if (subsys) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 /*
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0 * If this namespace belongs to a subsyste=
m (through a
> > > > link on the
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0 * controller device), reparent the device=
.
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (!qdev_set_parent_bus(dev, &subsys->bus.p=
arent_bus, errp)) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > > +=A0=A0=A0 } else {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 if (ns->params.detached) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error_setg(errp, "detached req=
uires that the nvme
> > > > device is "
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 "linked to an nvme-subsys device");
> > > > @@ -470,7 +486,7 @@ static void nvme_ns_realize(DeviceState
> > > > *dev, Error **errp)
> > > > =A0=A0=A0=A0 if (!nsid) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; =
i++) {
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (nvme_ns(n, i) || nvme_subsys=
_ns(subsys, i)) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (nvme_subsys_ns(subsys, i) ||=
 nvme_ns(n, i)) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > @@ -483,7 +499,7 @@ static void nvme_ns_realize(DeviceState
> > > > *dev, Error **errp)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > =A0=A0=A0=A0 } else {
> > > > -=A0=A0=A0=A0=A0=A0=A0 if (nvme_ns(n, nsid) || nvme_subsys_ns(subsy=
s, nsid)) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 if (nvme_subsys_ns(subsys, nsid) || nvme_ns(=
n, nsid)) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error_setg(errp, "namespace id=
 '%d' already
> > > > allocated", nsid);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > @@ -509,7 +525,9 @@ static void nvme_ns_realize(DeviceState
> > > > *dev, Error **errp)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > =A0=A0=A0=A0 }
> > > > -=A0=A0=A0 nvme_attach_ns(n, ns);
> > > > +=A0=A0=A0 if (n) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 nvme_attach_ns(n, ns);
> > > > +=A0=A0=A0 }
> > > > =A0}
> > > > =A0static Property nvme_ns_props[] =3D {
> > > > diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
> > > > index 92caa604a280..fb7c3a7c55fc 100644
> > > > --- a/hw/nvme/subsys.c
> > > > +++ b/hw/nvme/subsys.c
> > > > @@ -50,6 +50,10 @@ static void nvme_subsys_realize(DeviceState
> > > > *dev, Error **errp)
> > > > =A0{
> > > > =A0=A0=A0=A0 NvmeSubsystem *subsys =3D NVME_SUBSYS(dev);
> > > > +=A0=A0=A0 qbus_create_inplace(&subsys->bus, sizeof(NvmeBus),
> > > > TYPE_NVME_BUS, dev,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 dev->id);
> > > > +=A0=A0=A0 subsys->bus.is_subsys =3D true;
> > > > +
> > > > =A0=A0=A0=A0 nvme_subsys_setup(subsys);
> > > > =A0}
> > > >=20
> > > Why not always create a subsystem, and distinguish between 'shared'
> > > and 'non-shared' subsystems instead of the ->subsys pointer?
> > > That way all namespaces can be children of the subsystem, we won't
> > > need any reparenting, and the whole thing will be more in-line with
> > > qdev, no?
> > >=20
> >=20
> > Hi Hannes,
> >=20
> > Thanks for your reviews and comments!
> >=20
> > So, I have actually considered what you suggest.
> >=20
> > The problem is that the nvme-ns device currently expects to plug into a
> > bus (an 'nvme-bus') and we cannot really get rid of that 'bus' paramete=
r
> > without breaking compatibility. I experimented with removing the bus
> > from the nvme device and instead creating it in the nvme-subsys device.
> > My idea here was to implicitly always create an nvme-subsys if not
> > explicitly created by the user, but since nvme-subsys does not plug int=
o
> > any bus itself, it is not exposed in the qtree and thus not reachable
> > (i.e., when realizing the nvme-ns device, it will complain that there
> > are no 'nvme-bus' available to plug into). To make this work, I believe
> > we'd have to have the nvme-subsys plug into the main system bus (or som=
e
> > other bus rooted at main-system-bus), and I'd prefer not to do that
> > since this is already a flawed design and I think it would be more
> > intrusive than what my patch does.
> >=20
> Sigh.
> _Again_.
>=20
> I seem to trip over issues for which no patch can possibly be accepted as
> first the infrastructure has to be reworked.
>=20
> ... there is a reason why I'm avoiding posting patches to qemu-devel :-(
>=20
> > I raised these issues on the mailinglist some time ago[1]. We didn't
> > really find a good solution, but I think the conclusion is that the
> > bus/device design of subsystems and namespaces is flawed. That's why I
> > am working on an "objectification" of the two devices as suggested by
> > Stefan[2] as a proper fix for this mess.
> >=20
> Actually, I _do_ think that it would be good to have an nvme-subsystem bu=
s,
> providing a list of all namespaces for that subsystem.
> Creating a controller would then mean that one has to create a controller
> and a namespace _separately_, as then the namespace would _not_ be a chil=
d
> of the controller.
> But that's arguably a good thing, as the namespaces _do_ have a separate
> lifetime from controllers.
> And the lifetime of the subsystem could be completely self-contained; the
> controller would be looking up subsystems via the subsystem NQN if presen=
t;
> I guess we'll need to create ad-hoc subsystems for PCIe.
> But nothing insurmountable.
> And certainly nothing which require a large-scale rework of qemu internal=
s,
> I would think.

I don't remember the reason to use --object instead of --device. Maybe
the --device approach is viable and it makes some sense because this is
a "device" (like a SCSI LUN) that exposed to the guest. It would be
necessary to have a nvme-subsys device on the system bus to act as the
bus for nvme-ns devices as Klaus described.

> But _if_ you work on the rework, please ensure that not only NVMe is
> represented here. SCSI multipathing has the same issue currently; there i=
s a
> strict host->lun->block->OS device relationship currently in SCSI, making=
 it
> impossible to represent a multipathed SCSI device in qemu.
> The only sneaky way is to allow for a shared OS device (ie specifying the
> filename more than once), but that completely sidesteps qemu internals, t=
oo.

Do you want one SCSIDevice to be accessible via multiple SCSIBus
instances for multipathing in QEMU?

Stefan

--Z2Yd38Ur1j5KyFnO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDl0uEACgkQnKSrs4Gr
c8hJiQf/QGRxbCFJ5tVyDcv2X5rYq7nR5IRWvEDdnxedmsBaFI55tqa4o0Fq+W6a
FXAiHshoO1IeGxSxHrCYgPHm5Nly2YEJxABK2JLTJDkb1BLu50TI9oZjhsUTu6JT
yoS+kJldf2Q6GPP/2dJvhKEsOYf66CNg9R096Jv6yEaM/tnxcjzMGgoGncS6ie0i
aPkrYuSISAl7m9e3KI6+s6uFp5wGLyMXxP8Now/5FaaxT/vkFQhbPcZLvyi0gc8P
8YzzPcVVCTwC3QNj60PbAo76+/mFkaozyPzivz5WSRDxWlgic0uXt94C8t4PAZu9
MINKr/RGo68DUIO6UGURXw6fMkMA/Q==
=55q7
-----END PGP SIGNATURE-----

--Z2Yd38Ur1j5KyFnO--


