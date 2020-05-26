Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BF41AA3B6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 15:21:20 +0200 (CEST)
Received: from localhost ([::1]:50122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOhyh-0004AN-Du
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 09:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOhxi-00035E-0n
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 09:20:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOhxf-0003F7-PT
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 09:20:17 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48712)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOhxa-00038y-4f; Wed, 15 Apr 2020 09:20:10 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 962F8BF7AF;
 Wed, 15 Apr 2020 13:20:07 +0000 (UTC)
Date: Wed, 15 Apr 2020 15:20:04 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 13/16] nvme: factor out namespace setup
Message-ID: <20200415132004.zei3gqxg5l6r5c6y@apples.localdomain>
References: <20200415130159.611361-1-its@irrelevant.dk>
 <20200415130159.611361-14-its@irrelevant.dk>
 <b05fdbb7-2f74-be05-e108-36b14abce0be@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b05fdbb7-2f74-be05-e108-36b14abce0be@redhat.com>
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apr 15 15:16, Philippe Mathieu-Daud=C3=A9 wrote:
> On 4/15/20 3:01 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/block/nvme.c | 46 ++++++++++++++++++++++++++--------------------
> >   1 file changed, 26 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index d5244102252c..2b007115c302 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1358,6 +1358,27 @@ static void nvme_init_blk(NvmeCtrl *n, Error *=
*errp)
> >                                     false, errp);
> >   }
> > +static void nvme_init_namespace(NvmeCtrl *n, NvmeNamespace *ns, Erro=
r **errp)
> > +{
> > +    int64_t bs_size;
> > +    NvmeIdNs *id_ns =3D &ns->id_ns;
> > +
> > +    bs_size =3D blk_getlength(n->conf.blk);
> > +    if (bs_size < 0) {
> > +        error_setg_errno(errp, -bs_size, "could not get backing file=
 size");
> > +        return;
> > +    }
> > +
> > +    n->ns_size =3D bs_size;
> > +
> > +    id_ns->lbaf[0].ds =3D BDRV_SECTOR_BITS;
> > +    id_ns->nsze =3D cpu_to_le64(nvme_ns_nlbas(n, ns));
> > +
> > +    /* no thin provisioning */
> > +    id_ns->ncap =3D id_ns->nsze;
> > +    id_ns->nuse =3D id_ns->ncap;
> > +}
> > +
> >   static void nvme_realize(PCIDevice *pci_dev, Error **errp)
> >   {
> >       NvmeCtrl *n =3D NVME(pci_dev);
> > @@ -1365,7 +1386,6 @@ static void nvme_realize(PCIDevice *pci_dev, Er=
ror **errp)
> >       Error *err =3D NULL;
> >       int i;
> > -    int64_t bs_size;
> >       uint8_t *pci_conf;
> >       nvme_check_constraints(n, &err);
> > @@ -1376,12 +1396,6 @@ static void nvme_realize(PCIDevice *pci_dev, E=
rror **errp)
> >       nvme_init_state(n);
> > -    bs_size =3D blk_getlength(n->conf.blk);
> > -    if (bs_size < 0) {
> > -        error_setg(errp, "could not get backing file size");
> > -        return;
> > -    }
> > -
> >       nvme_init_blk(n, &err);
> >       if (err) {
> >           error_propagate(errp, err);
> > @@ -1394,8 +1408,6 @@ static void nvme_realize(PCIDevice *pci_dev, Er=
ror **errp)
> >       pci_config_set_class(pci_dev->config, PCI_CLASS_STORAGE_EXPRESS=
);
> >       pcie_endpoint_cap_init(pci_dev, 0x80);
> > -    n->ns_size =3D bs_size / (uint64_t)n->num_namespaces;
>=20
> Valid because currently 'n->num_namespaces' =3D 1, OK.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
=20
Thank you for the reviews Philippe and the suggesting that I split up
the series :)

I'll get the v1.3 series ready next.

