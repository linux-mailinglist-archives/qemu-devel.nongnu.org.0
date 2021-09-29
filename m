Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8941CE65
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 23:48:55 +0200 (CEST)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVhRe-0006QR-0I
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 17:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mVhQd-0005jq-RU
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 17:47:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mVhQb-0007yU-Jt
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 17:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632952068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKqDYCRD4NTy3l0Fo3kIln6rLAkCOl3T9ZXlVFyZ4sY=;
 b=OU3YMwKiljey+kQPWaXqaPgEin5tsZn0dS2A4nYjacvYTU9N68rvPe3QV9KY86gMEMpaCn
 Lum7urUay64IVu9Ocdg7puTY+4GqqcCPrpGuicb8LGs45bqc2t/fQRw8LmhBmmT1dnfk0z
 T1HL5O89FxMHaOHG9H0IBVEKjQJqCPk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-f0oC9C7kOTSkYKFAmiY6sQ-1; Wed, 29 Sep 2021 17:47:43 -0400
X-MC-Unique: f0oC9C7kOTSkYKFAmiY6sQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p4-20020adfe604000000b0016074dc4c46so1036573wrm.2
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 14:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KKqDYCRD4NTy3l0Fo3kIln6rLAkCOl3T9ZXlVFyZ4sY=;
 b=bkAgOaLnA7Qyyg51ZTGs1/UqhEZFAqvTGnX3mII3iHzIoV2T2RxGQ4yODFZHjQZUm5
 I0PDjLDvEv1OUvFFIbWXImvui8DaZMzR0Xyt4REe9kHFM7Mo56t1QiDmMip3K+gyUl5f
 Qs+OSjNPs86Kvc5e8LmxJDjfsc7lBlFaKxNpndZnAfefKZ+IFvpezCLoOg48/nl05iIQ
 zthVb68x+6hrNYGdcRdVhQ2hiwVtf0UhVTVfRQzEzU8JNwmO6Nxy2s4Mg0+hrGOA5l/1
 tH18UBtK6NAACv+YP3JbpB5v1MSpBmKjJzovxWgmCB9NbV4RNdhihw7NHGIULTvRp4mZ
 pwxg==
X-Gm-Message-State: AOAM530UzvmceCpY28c3NHgp5KE//Q3U6BHphONzR9x1pKab/M+VV4YH
 nEFRj6UXS3VzQxvTspKTwovWPtL5adSx7DNocpxMB426zMwuq+AzriGLprgzSh+5NPMFL9K4q4n
 gkSem2IYH98oEY28=
X-Received: by 2002:a5d:4d84:: with SMTP id b4mr2597922wru.258.1632952062746; 
 Wed, 29 Sep 2021 14:47:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze+uWP2P/L5gOP+aP7krXDfSPQF669QjQvb3Qp1DvN7WXuTfGdZbmS+mVXAvKBBowoArppxg==
X-Received: by 2002:a5d:4d84:: with SMTP id b4mr2597845wru.258.1632952061498; 
 Wed, 29 Sep 2021 14:47:41 -0700 (PDT)
Received: from redhat.com ([2.55.134.220])
 by smtp.gmail.com with ESMTPSA id r9sm1077392wru.2.2021.09.29.14.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 14:47:39 -0700 (PDT)
Date: Wed, 29 Sep 2021 17:47:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: marcel@redhat.com
Subject: Re: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
Message-ID: <20210929172519-mutt-send-email-mst@kernel.org>
References: <20210803205043.165034-1-mst@redhat.com>
 <20210803205043.165034-2-mst@redhat.com>
 <YVGP9vdTtu5sRVpl@redhat.com>
 <20210927053932-mutt-send-email-mst@kernel.org>
 <CA+aaKfDO_KRZYova9fGkPAr0vgh=YygATZ87iwrfqeV=CyN=tg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+aaKfDO_KRZYova9fGkPAr0vgh=YygATZ87iwrfqeV=CyN=tg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 04:41:49PM +0300, Marcel Apfelbaum wrote:
> Hi Michael,
> 
> On Mon, Sep 27, 2021 at 12:49 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrangé wrote:
>     > On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrote:
>     > > From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>     > >
>     > > Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
>     > > As opposed to native PCIe hotplug, guests like Fedora 34
>     > > will not assign IO range to pcie-root-ports not supporting
>     > > native hotplug, resulting into a regression.
>     > >
>     > > Reproduce by:
>     > >     qemu-bin -M q35 -device pcie-root-port,id=p1 -monitor stdio
>     > >     device_add e1000,bus=p1
>     > > In the Guest OS the respective pcie-root-port will have the IO range
>     > > disabled.
>     > >
>     > > Fix it by setting the "reserve-io" hint capability of the
>     > > pcie-root-ports so the firmware will allocate the IO range instead.
>     > >
>     > > Acked-by: Igor Mammedov <imammedo@redhat.com>
>     > > Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
>     > > Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
>     > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>     > > ---
>     > >  hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
>     > >  1 file changed, 5 insertions(+)
>     >
>     > This change, when combined with the switch to ACPI based hotplug by
>     > default, is responsible for a significant regression in QEMU 6.1.0
>     >
>     > It is no longer possible to have more than 15 pcie-root-port devices
>     > added to a q35 VM in 6.1.0.  Before this I've had as many as 80+ devices
>     > present before I stopped trying to add more.
>     >
>     >   https://gitlab.com/qemu-project/qemu/-/issues/641
>     >
>     > This regression is significant, because it has broken the out of the
>     > box default configuration that OpenStack uses for booting all VMs.
>     > They add 16 pcie-root-ports by defalt to allow empty slots for device
>     > hotplug under q35 [1].
> 
> 
>     Indeed, oops. Thanks for the report!
> 
>     Going back and looking at seabios code, didn't we get confused?
>     Shouldn't we have reserved memory and not IO?
> 
> 
> We need the IO space for the legacy PCI bridges, otherwise an empty PCI bridge
> will become unusable.

Maybe we should go back to using OSC then ... the issue
is we can't then mix acpi and native hotplug for bridges.


> 
> 
>     I see:
>                 int resource_optional = pcie_cap && (type ==
>     PCI_REGION_TYPE_IO);
>                 if (!sum && hotplug_support && !resource_optional)
>                     sum = align; /* reserve min size for hot-plug */
> 
> 
>     generally maybe we should just add an ACPI-hotplug capability and
>     teach seabios about it?
> 
> 
> I suppose it is possible.
> 
> Thanks,
> Marcel
>  
> 
> 
>     Marcel?
> 
>     > > diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/
>     gen_pcie_root_port.c
>     > > index ec9907917e..20099a8ae3 100644
>     > > --- a/hw/pci-bridge/gen_pcie_root_port.c
>     > > +++ b/hw/pci-bridge/gen_pcie_root_port.c
>     > > @@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort,
>     GEN_PCIE_ROOT_PORT)
>     > >          (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
>     > > 
>     > >  #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR       1
>     > > +#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE          4096
>     > > 
>     > >  struct GenPCIERootPort {
>     > >      /*< private >*/
>     > > @@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaque,
>     int version_id)
>     > >  static void gen_rp_realize(DeviceState *dev, Error **errp)
>     > >  {
>     > >      PCIDevice *d = PCI_DEVICE(dev);
>     > > +    PCIESlot *s = PCIE_SLOT(d);
>     > >      GenPCIERootPort *grp = GEN_PCIE_ROOT_PORT(d);
>     > >      PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(d);
>     > >      Error *local_err = NULL;
>     > > @@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Error
>     **errp)
>     > >          return;
>     > >      }
>     > > 
>     > > +    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug)
>     {
>     > > +        grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
>     > > +    }
>     > >      int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
>     > >                                                grp->res_reserve, errp);
>     > > 
>     > > --
>     > > MST
>     > >
>     > >
>     >
>     > Regards,
>     > Daniel
>     >
>     > [1] https://github.com/openstack/tripleo-heat-templates/blob/
>     7a6cd0640ec390a330f5699d8ed60f71b2a9f514/deployment/nova/
>     nova-compute-container-puppet.yaml#L462-L472
>     > --
>     > |: https://berrange.com      -o-    https://www.flickr.com/photos/
>     dberrange :|
>     > |: https://libvirt.org         -o-            https://
>     fstop138.berrange.com :|
>     > |: https://entangle-photo.org    -o-    https://www.instagram.com/
>     dberrange :|
> 
> 


