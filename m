Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF724B1959
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:21:35 +0100 (CET)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIIko-0003YC-6N
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nIIhH-0001Wc-Ga
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:17:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nIIhC-0003BA-AG
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644535059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oZ2gxwRDXmFgzEpL34AT+kmjNPxZhc2AhSpUIPX7CgU=;
 b=gdex8PSetbjsub8qZsEeDo+wv6uT2nEyzFxSW3urand0xT6ZvZM00dtdIlYlOWw3mRfrUm
 mUV2mbL2klKREi08KwyZTXaQK/ftg36Qm4J7lEE4kx6QVGRfxIK15hd7AwSArQ6s4zEDTF
 j3Zj4U4C5u6QJ9KsVT3D204aKjYEKjY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-4pS5L8NzN0mxqCJCDb717g-1; Thu, 10 Feb 2022 18:17:38 -0500
X-MC-Unique: 4pS5L8NzN0mxqCJCDb717g-1
Received: by mail-io1-f72.google.com with SMTP id
 p65-20020a6bbf44000000b00604c0757591so5133991iof.6
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=cI9GemYLLKYTzFke9rEnJRQqNwaHH1aJGlzIRrlaYY8=;
 b=5N0b5wRPcy/9LJg9BysNvWWrA8vQWqhavA5FXD4bbQMJWQWDCOtotz3GaOIL7MuV1M
 DmYfPFM89RNg0ML07Le557H47ZqCgHfVmP2k8BJAIRJYc0hFNXynt0DcQWdMy+lpLGLS
 UqC+fC0loJR3iy98rONq9haU1dfRkJsPujq4/jAMK/cgdQgTrgNhGqxTozr8RkkRFrTj
 R0j8jz1J6rvGzlnPaTV89gis+BTcxizZARlhQOcBCBWCJ/CxqFeP3h6ho0nAbJBnUBWz
 y92Knk178MHw+ZwMCOVEDplCaH33XWEnBNzyzB8U99OUDYcDHuCBX2hFC+cjbFFrQAPs
 636A==
X-Gm-Message-State: AOAM531ujRGvvZaRW1skiPu1CRn0Y1nRuoElljxomIgtUbNKWlxhDolz
 F3IFtq+Lqbki+is0uhheXH4DC8QgAXnKiRme1E02ZO+P5iDLkWCfgQfQIKVrAPXoDG1niZuebfL
 eHyTWeBjo+qlA7qI=
X-Received: by 2002:a05:6638:3051:: with SMTP id
 u17mr5336235jak.255.1644535057418; 
 Thu, 10 Feb 2022 15:17:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqq494mu+ZtD9oaWjbc88AbmUuZYSWTDm4wTTMOg4dpeZKtScN+Nl51lJtnNq5HU6AVBL9fg==
X-Received: by 2002:a05:6638:3051:: with SMTP id
 u17mr5336211jak.255.1644535057126; 
 Thu, 10 Feb 2022 15:17:37 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id n3sm12574269ioz.9.2022.02.10.15.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 15:17:36 -0800 (PST)
Date: Thu, 10 Feb 2022 16:17:34 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <20220210161734.18f36e8b.alex.williamson@redhat.com>
In-Reply-To: <9E989878-326F-4E72-85DD-34D1CB72F0F8@oracle.com>
References: <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
 <20220201223432.4f58518f.alex.williamson@redhat.com>
 <69BE660C-C527-459B-A392-F5546A0BEB5B@oracle.com>
 <20220210022543-mutt-send-email-mst@kernel.org>
 <9E989878-326F-4E72-85DD-34D1CB72F0F8@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 22:23:01 +0000
Jag Raman <jag.raman@oracle.com> wrote:

> > On Feb 10, 2022, at 3:02 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> >=20
> > On Thu, Feb 10, 2022 at 12:08:27AM +0000, Jag Raman wrote: =20
> >>=20
> >> Thanks for the explanation, Alex. Thanks to everyone else in the threa=
d who
> >> helped to clarify this problem.
> >>=20
> >> We have implemented the memory isolation based on the discussion in th=
e
> >> thread. We will send the patches out shortly.
> >>=20
> >> Devices such as =E2=80=9Cname" and =E2=80=9Ce1000=E2=80=9D worked fine=
. But I=E2=80=99d like to note that
> >> the LSI device (TYPE_LSI53C895A) had some problems - it doesn=E2=80=99=
t seem
> >> to be IOMMU aware. In LSI=E2=80=99s case, the kernel driver is asking =
the device to
> >> read instructions from the CPU VA (lsi_execute_script() -> read_dword(=
)),
> >> which is forbidden when IOMMU is enabled. Specifically, the driver is =
asking
> >> the device to access other BAR regions by using the BAR address progra=
mmed
> >> in the PCI config space. This happens even without vfio-user patches. =
For example,
> >> we could enable IOMMU using =E2=80=9C-device intel-iommu=E2=80=9D QEMU=
 option and also
> >> adding the following to the kernel command-line: =E2=80=9Cintel_iommu=
=3Don iommu=3Dnopt=E2=80=9D.
> >> In this case, we could see an IOMMU fault. =20
> >=20
> > So, device accessing its own BAR is different. Basically, these
> > transactions never go on the bus at all, never mind get to the IOMMU. =
=20
>=20
> Hi Michael,
>=20
> In LSI case, I did notice that it went to the IOMMU. The device is readin=
g the BAR
> address as if it was a DMA address.
>=20
> > I think it's just used as a handle to address internal device memory.
> > This kind of trick is not universal, but not terribly unusual.
> >=20
> >  =20
> >> Unfortunately, we started off our project with the LSI device. So that=
 lead to all the
> >> confusion about what is expected at the server end in-terms of
> >> vectoring/address-translation. It gave an impression as if the request=
 was still on
> >> the CPU side of the PCI root complex, but the actual problem was with =
the
> >> device driver itself.
> >>=20
> >> I=E2=80=99m wondering how to deal with this problem. Would it be OK if=
 we mapped the
> >> device=E2=80=99s BAR into the IOVA, at the same CPU VA programmed in t=
he BAR registers?
> >> This would help devices such as LSI to circumvent this problem. One pr=
oblem
> >> with this approach is that it has the potential to collide with anothe=
r legitimate
> >> IOVA address. Kindly share your thought on this.
> >>=20
> >> Thank you! =20
> >=20
> > I am not 100% sure what do you plan to do but it sounds fine since even
> > if it collides, with traditional PCI device must never initiate cycles =
=20
>=20
> OK sounds good, I=E2=80=99ll create a mapping of the device BARs in the I=
OVA.

I don't think this is correct.  Look for instance at ACPI _TRA support
where a system can specify a translation offset such that, for example,
a CPU access to a device is required to add the provided offset to the
bus address of the device.  A system using this could have multiple
root bridges, where each is given the same, overlapping MMIO aperture.
From the processor perspective, each MMIO range is unique and possibly
none of those devices have a zero _TRA, there could be system memory at
the equivalent flat memory address.

So if the transaction actually hits this bus, which I think is what
making use of the device AddressSpace implies, I don't think it can
assume that it's simply reflected back at itself.  Conventional PCI and
PCI Express may be software compatible, but there's a reason we don't
see IOMMUs that provide both translation and isolation in conventional
topologies.

Is this more a bug in the LSI device emulation model?  For instance in
vfio-pci, if I want to access an offset into a BAR from within QEMU, I
don't care what address is programmed into that BAR, I perform an
access relative to the vfio file descriptor region representing that
BAR space.  I'd expect that any viable device emulation model does the
same, an access to device memory uses an offset from an internal
resource, irrespective of the BAR address.

It would seem strange if the driver is actually programming the device
to DMA to itself and if that's actually happening, I'd wonder if this
driver is actually compatible with an IOMMU on bare metal.

> > within their own BAR range, and PCIe is software-compatible with PCI. S=
o
> > devices won't be able to access this IOVA even if it was programmed in
> > the IOMMU.
> >=20
> > As was mentioned elsewhere on this thread, devices accessing each
> > other's BAR is a different matter.
> >=20
> > I do not remember which rules apply to multiple functions of a
> > multi-function device though. I think in a traditional PCI
> > they will never go out on the bus, but with e.g. SRIOV they
> > would probably do go out? Alex, any idea?

This falls under implementation specific behavior in the spec, IIRC.
This is actually why IOMMU grouping requires ACS support on
multi-function devices to clarify the behavior of p2p between functions
in the same slot.  Thanks,

Alex


