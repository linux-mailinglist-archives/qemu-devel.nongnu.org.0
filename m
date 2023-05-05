Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8566F865D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:07:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxxA-00077C-7L; Fri, 05 May 2023 12:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1puxx4-00076s-Nv
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1puxx2-0004rF-3k
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683302790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1vc7lBud/SGr8UnylZNvO0oDUcLDMZRNMXipr6gC68A=;
 b=RGAj+z5rfT4GnAQJGesZ69WmOvra93HVrts5sk5UKV4Pr0/aI/13wG6CLjbihmyLiDXugM
 r1BSNnirniJNTiUqLlp7Jl5WYPSchTzyO1gaOxayyM6aVBof0Q41mGErQDhqaUCrChkL8D
 32eH/V/XsvAABp59Qwbk+mFgzE7M83E=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-pjbMO_qlPgin5HXrYKiBqg-1; Fri, 05 May 2023 12:06:29 -0400
X-MC-Unique: pjbMO_qlPgin5HXrYKiBqg-1
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-76984376366so253571839f.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 09:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302788; x=1685894788;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1vc7lBud/SGr8UnylZNvO0oDUcLDMZRNMXipr6gC68A=;
 b=GH/qzK58o+NDnIvfarx5RqSpUEw/DwMWm7+ZMM/0ko2J4fPmGdara1mlaQH2E8FfGw
 3e3hu3c9DBmr2IpobMkg63juU/LjCAiZ5Hwj0Sh0pRWTOg7Ee2N2kSyWny6EEppfYRe5
 Y+JIQKCb80YSjLRbxo9ZtBLnBNOcGonbwlCKqe5OzXfTB6/aBXTi1lTruWAqFcjQcR2G
 r1AzEh+nbrBZREx1lZTOeL2pxD2X9bMyZZl/KWf2GgCFVRu5CGLHWJ6uOJOf/VU+2pYj
 s6Ik4B8YqfG8tFbY0Mp8wu5GptoVzzdXsEM2jPLDAXzy5QovyUdTwMkYgToLv734lFPP
 RW3g==
X-Gm-Message-State: AC+VfDz+FxPhM4ScE/n3Muurqgl4wENvJxEr36Z9dowhJViH5stPtDLu
 b0ImIIjHx/M17R5lawVZFWUcAI8l1/MVwnX+ku4ujFqGoqmxDiXnLfsM5eotSxHta5RrCGWKprs
 wAz4G3uXfb39ieWkbvJDd338=
X-Received: by 2002:a5d:9bd4:0:b0:769:c95b:29d2 with SMTP id
 d20-20020a5d9bd4000000b00769c95b29d2mr1016044ion.15.1683302787787; 
 Fri, 05 May 2023 09:06:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79aYnPDwVQGWksMxnxCYp0AduIgz6haIkRGBXpsU6zh3rha8hzeZ0v+A9c9ovRnS6Lu3X9Rg==
X-Received: by 2002:a5d:9bd4:0:b0:769:c95b:29d2 with SMTP id
 d20-20020a5d9bd4000000b00769c95b29d2mr1016014ion.15.1683302787364; 
 Fri, 05 May 2023 09:06:27 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 ch5-20020a0566383e8500b004161a1fbb06sm31819jab.121.2023.05.05.09.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 09:06:26 -0700 (PDT)
Date: Fri, 5 May 2023 10:06:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] vfio/pci: Static Resizable BAR capability
Message-ID: <20230505100625.4084bf10.alex.williamson@redhat.com>
In-Reply-To: <fca03c69-5a5d-f743-5238-1eb43192226a@redhat.com>
References: <20230504204248.2774200-1-alex.williamson@redhat.com>
 <fca03c69-5a5d-f743-5238-1eb43192226a@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 5 May 2023 10:29:36 +0200
C=C3=A9dric Le Goater <clg@redhat.com> wrote:

> On 5/4/23 22:42, Alex Williamson wrote:
> > The PCI Resizable BAR (ReBAR) capability is currently hidden from the
> > VM because the protocol for interacting with the capability does not
> > support a mechanism for the device to reject an advertised supported
> > BAR size.  However, when assigned to a VM, the act of resizing the
> > BAR requires adjustment of host resources for the device, which
> > absolutely can fail.  Linux does not currently allow us to reserve
> > resources for the device independent of the current usage.
> >=20
> > The only writable field within the ReBAR capability is the BAR Size
> > register.  The PCIe spec indicates that when written, the device
> > should immediately begin to operate with the provided BAR size.  The
> > spec however also notes that software must only write values
> > corresponding to supported sizes as indicated in the capability and
> > control registers.  Writing unsupported sizes produces undefined
> > results.  Therefore, if the hypervisor were to virtualize the
> > capability and control registers such that the current size is the
> > only indicated available size, then a write of anything other than
> > the current size falls into the category of undefined behavior,
> > where we can essentially expose the modified ReBAR capability as
> > read-only.
> >=20
> > This may seem pointless, but users have reported that virtualizing
> > the capability in this way not only allows guest software to expose
> > related features as available (even if only cosmetic), but in some
> > scenarios can resolve guest driver issues.  Additionally, no
> > regressions in behavior have been reported for this change.
> >=20
> > A caveat here is that the PCIe spec requires for compatibility that
> > devices report support for a size in the range of 1MB to 512GB,
> > therefore if the current BAR size falls outside that range we revert
> > to hiding the capability.
> >=20
> > Signed-off-by: Alex Williamson <alex.williamson@redhat.com> =20
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
>=20
> Some more below.
>=20
> > ---
> >   hw/vfio/pci.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 48 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index ec9a854361ac..3b4d36ce87bf 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -2066,6 +2066,49 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev,=
 uint8_t pos, Error **errp)
> >       return 0;
> >   }
> >  =20
> > +static int vfio_setup_rebar_ecap(VFIOPCIDevice *vdev, uint16_t pos)
> > +{
> > +    uint8_t bars =3D pci_get_byte(vdev->pdev.config + pos + PCI_REBAR_=
CTRL) >>
> > +                                                    PCI_REBAR_CTRL_NBA=
R_SHIFT;
> > +    int i;
> > +
> > +    for (i =3D 0; i < bars; i++) {
> > +        uint32_t cap, ctrl;
> > +        uint8_t size;
> > +
> > +        ctrl =3D pci_get_long(vdev->pdev.config + pos + PCI_REBAR_CTRL=
 + (i * 8));
> > +        size =3D (ctrl & PCI_REBAR_CTRL_BAR_SIZE) >> PCI_REBAR_CTRL_BA=
R_SHIFT;
> > +
> > +        /*
> > +         * PCIe spec requires HW to support at least one size in the r=
ange 1MB
> > +         * to 512GB, we intend to mask all sizes except the one curren=
tly =20
> May be mention "7.8.6 Resizable BAR Extended Capability" of the PCIe spec=
s ?

Sure.  I guess I assumed we're not pulling from minutia elsewhere in
the spec and the capability definition is obviously related, but
referencing specific versions can still be useful for later comparison.

> Because the size encoding is different between the CAP and CTRL registers
> and the '19' and '+ 4' values below are a bit confusing. I don't see how
> to make things better without macros (seems unnecessary as of today)

We're not actually using any size encoding relative to the CTRL
register given our requirement that the current size must fall within
the original definition of Resizable BARs for compatibility, so I don't
feel obligated to address a generalized algorithm to support that.  I'm
not sure how to make the BAR Size + 4 bit shift or size 19 limit more
clear either, it's not as if these can be derived outside of the spec
references.

>=20
> > +         * enabled in the size field, therefore if it's outside the ra=
nge,
> > +         * hide the whole capability.
> > +         */
> > +        if (size > 19) { =20
>=20
> should we not report a warning ?

We don't warn currently for hiding it and we're getting a request to
tone down the kernel logging for hiding capabilities.  I don't want to
make a 640KB caliber faux pas, but we probably have some time yet
before >512GB BARs become an issue.  If we reevaluate this later, we'd
probably also want a device option to expose the capability regardless
of the spec requirement.  In an ideal world we'd have some ability to
create resource reservations in the host so we might be able to present
a more capable REBAR capability to the VM without risk that resizing
resources aren't available when the VM requests them.  Thanks,

Alex


