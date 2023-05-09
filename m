Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9BE6FC8C0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:21:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOCr-000551-Ir; Tue, 09 May 2023 10:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pwOCm-00054Z-LP
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pwOCk-0004E6-Rd
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683642030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rfDrY4x5pYMQZ/Z8xa489Luni59io4Z45J8XeRi9v8=;
 b=hYinSiozruJkhuKFd6ADz9fS0bpyXAPr5y61Y+jZkWjYrV6hOHhHg159bXnCR9oS8RwWXR
 OMUHelIHL+krTZGNXLfUEKRpeXl2yIOUQ0VvgZQ0CCD1ylrqxv9e9Y2qBE7ulwSg3+o8mH
 XlCAhn03ul0vZ9nTzDYlL6eUfylq8ag=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-5I7M-C5cPgeQWKW_oYDiNw-1; Tue, 09 May 2023 10:20:24 -0400
X-MC-Unique: 5I7M-C5cPgeQWKW_oYDiNw-1
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-76c27782e30so264449839f.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642023; x=1686234023;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/rfDrY4x5pYMQZ/Z8xa489Luni59io4Z45J8XeRi9v8=;
 b=fqnVrZAqpVwLSkl9xc8sjWdgwEiEU+PYKmkTAtBPp8TjiM8HrKAHrBm7csv7GDBvHj
 wuoN0CZmLwX0X3+AMBLjtAxWt/HbwG1BKi2lXppbF1txleCOlwkQxXDlrgmPIqD32cDp
 wpTaeD5Zswu/fubi8R1A/iWzijeo/eanr760aTwpa9UyKeVFPLS6tGZHHR+w1T/ev0/A
 6Uq8qD7X/jLkzle9kfeE9RqQAMUiy/syIkLL9FR/mghucv4A0QR1qlupdSKbkpFxfJ1t
 ay+zSBIz3inX7YR8CUbycSXTt7hMZi+yZIDr/PRMQHqwVeuzHzI3TurQmrLEpTuKQynw
 GUaA==
X-Gm-Message-State: AC+VfDwTCVWzqowAu5e9/0UzALdLqiv1LYNBatnlWo6nuRXMpE4wuSx6
 d6OuoKZfK/d6/RuE44Ws8wZow9d7EaYv01LLV+BuQtPXdTRWxXGpusIBuOtjANFzTt8RN0bPqeL
 N/f3/9rk5EDeAgqs=
X-Received: by 2002:a6b:e311:0:b0:769:b812:c536 with SMTP id
 u17-20020a6be311000000b00769b812c536mr10387030ioc.5.1683642022765; 
 Tue, 09 May 2023 07:20:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5oBSsbi+vaENwmH44Vyb0QrHYa4xadnYPbMYTTrPt/uHYWsZ90Vf5HOzQGKWUrVCnywNRBFg==
X-Received: by 2002:a6b:e311:0:b0:769:b812:c536 with SMTP id
 u17-20020a6be311000000b00769b812c536mr10387012ioc.5.1683642022388; 
 Tue, 09 May 2023 07:20:22 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a11-20020a5d980b000000b007697fe48ca8sm2903348iol.47.2023.05.09.07.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 07:20:21 -0700 (PDT)
Date: Tue, 9 May 2023 08:20:19 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] vfio/pci: Static Resizable BAR capability
Message-ID: <20230509082019.72ace1c8.alex.williamson@redhat.com>
In-Reply-To: <0e61fc26-369b-3a6a-8001-8be1bb49ff40@redhat.com>
References: <20230505232308.2869912-1-alex.williamson@redhat.com>
 <0e61fc26-369b-3a6a-8001-8be1bb49ff40@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, 9 May 2023 11:39:57 +0200
C=C3=A9dric Le Goater <clg@redhat.com> wrote:

> On 5/6/23 01:23, Alex Williamson wrote:
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
> > ---
> > v2:
> >   - Add spec reference
> >   - Use PCI_REBAR_CAP_SIZES to check sizes in range
> >   - Try to clarify capability bit generation
> >   - Rename s/bars/nbar/ to match #defines
> >   - More complete masking of NBAR value
> >=20
> >   hw/vfio/pci.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 53 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index cf27f28936cb..3ab849767a92 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -2066,6 +2066,54 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev,=
 uint8_t pos, Error **errp)
> >       return 0;
> >   }
> >  =20
> > +static int vfio_setup_rebar_ecap(VFIOPCIDevice *vdev, uint16_t pos)
> > +{
> > +    uint32_t ctrl;
> > +    int i, nbar;
> > +
> > +    ctrl =3D pci_get_long(vdev->pdev.config + pos + PCI_REBAR_CTRL);
> > +    nbar =3D (ctrl & PCI_REBAR_CTRL_NBAR_MASK) >> PCI_REBAR_CTRL_NBAR_=
SHIFT;
> > +
> > +    for (i =3D 0; i < nbar; i++) {
> > +        uint32_t cap;
> > +        int size;
> > +
> > +        ctrl =3D pci_get_long(vdev->pdev.config + pos + PCI_REBAR_CTRL=
 + (i * 8));
> > +        size =3D (ctrl & PCI_REBAR_CTRL_BAR_SIZE) >> PCI_REBAR_CTRL_BA=
R_SHIFT;
> > +
> > +        /* The cap register reports sizes 1MB to 127TB, with 4 reserve=
d bits */ =20
>=20
> s/127/128/

Yes, fixed.  Thanks!

Alex

> > +        cap =3D size <=3D 27 ? 1U << (size + 4) : 0;
> > +
> > +        /*
> > +         * The PCIe spec (v6.0.1, 7.8.6) requires HW to support at lea=
st one
> > +         * size in the range 1MB to 512GB.  We intend to mask all size=
s except
> > +         * the one currently enabled in the size field, therefore if i=
t's
> > +         * outside the range, hide the whole capability as this virtua=
lization
> > +         * trick won't work.  If >512GB resizable BARs start to appear=
, we
> > +         * might need an opt-in or reservation scheme in the kernel.
> > +         */
> > +        if (!(cap & PCI_REBAR_CAP_SIZES)) {
> > +            return -EINVAL;
> > +        }
> > +
> > +        /* Hide all sizes reported in the ctrl reg per above requireme=
nt. */
> > +        ctrl &=3D (PCI_REBAR_CTRL_BAR_SIZE |
> > +                 PCI_REBAR_CTRL_NBAR_MASK |
> > +                 PCI_REBAR_CTRL_BAR_IDX);
> > +
> > +        /*
> > +         * The BAR size field is RW, however we've mangled the capabil=
ity
> > +         * register such that we only report a single size, ie. the cu=
rrent
> > +         * BAR size.  A write of an unsupported value is undefined, th=
erefore
> > +         * the register field is essentially RO.
> > +         */
> > +        vfio_add_emulated_long(vdev, pos + PCI_REBAR_CAP + (i * 8), ca=
p, ~0);
> > +        vfio_add_emulated_long(vdev, pos + PCI_REBAR_CTRL + (i * 8), c=
trl, ~0);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
> >   {
> >       PCIDevice *pdev =3D &vdev->pdev;
> > @@ -2139,9 +2187,13 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
> >           case 0: /* kernel masked capability */
> >           case PCI_EXT_CAP_ID_SRIOV: /* Read-only VF BARs confuse OVMF =
*/
> >           case PCI_EXT_CAP_ID_ARI: /* XXX Needs next function virtualiz=
ation */
> > -        case PCI_EXT_CAP_ID_REBAR: /* Can't expose read-only */
> >               trace_vfio_add_ext_cap_dropped(vdev->vbasedev.name, cap_i=
d, next);
> >               break;
> > +        case PCI_EXT_CAP_ID_REBAR:
> > +            if (!vfio_setup_rebar_ecap(vdev, next)) {
> > +                pcie_add_capability(pdev, cap_id, cap_ver, next, size);
> > +            }
> > +            break;
> >           default:
> >               pcie_add_capability(pdev, cap_id, cap_ver, next, size);
> >           } =20
>=20


