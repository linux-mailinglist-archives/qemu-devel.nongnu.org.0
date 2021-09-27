Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8954191F9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:06:56 +0200 (CEST)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnXD-0002Wk-0z
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mUnJr-0005PE-JT
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mUnJo-0004JL-TZ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632736383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=In31TxQCN1/qxbIZ+dQbjLCA65te7zHkP6RB322qppU=;
 b=ITko9vyOH/qCK3EGYJkabRASkQfhpVrVNjZpsSrjNF+8yn2dgfdWJAsb3n+V1mZx/3qfAR
 zrIo9S+rWp6ym8fNp1DZfHJBj9POkGZ3qsjE27l0gzej1iDzcnd3NeaB+hKHDvJfRqG7u5
 LCjLp++Lt/HRVuLSdj7DbMy1WdZRg84=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-Bsq9VCqUMpSk2wA-H8yNnQ-1; Mon, 27 Sep 2021 05:49:20 -0400
X-MC-Unique: Bsq9VCqUMpSk2wA-H8yNnQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso13828342wrg.1
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 02:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=In31TxQCN1/qxbIZ+dQbjLCA65te7zHkP6RB322qppU=;
 b=t6RgkZs842BEU47dcvK3HiG2ddfCxkcVlpcBb9v3tsU1tZkbjcAn29bruXEqeXC4XJ
 Lkfv6yOKqclOdAsZMu7W+4kYqEStKR3lxUs7UcmbSAslFolU9KSjmUiR29/yZAQUCXOe
 rK8R24uKMp5fGfNZako38wsS7rfIo/AXoKYZ/rmklT5rAqVp5aAGi7MQMJ45OTqWldKG
 e0sLxV78/vGtITFFFq3LhFmMMe6MG1wh4E1GN14PtT4V79GSstnR6sjThiBFFR2ykxiR
 mC3z4Zq6yoGL3H37rwy9bx+6WJt+G/WpmGvx3xFLoIVL+F6egF0pNNRymdACWhhRjYkl
 ZuVg==
X-Gm-Message-State: AOAM5305ioT3K7yxsLXdxW3licL+NLxKZ3tv4fHfYoUWTK1dhr5nkmiM
 ekcjiiNoaT3pIuZtnUVjoWvSfdxClbPUUnhTtrO0wue21a5IkZvD0HB/iH/wVlaNne+pdgW1vUY
 GwkUO9nkMNm8v2eA=
X-Received: by 2002:adf:a48f:: with SMTP id g15mr6045516wrb.35.1632736159410; 
 Mon, 27 Sep 2021 02:49:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKcoSsQulkrbAKzwrD13uBMDqIhVaTnC9O4qZZHkFNnZ78gWuV1kJRP3tJKJiyeb1h+eKm0Q==
X-Received: by 2002:adf:a48f:: with SMTP id g15mr6045497wrb.35.1632736159180; 
 Mon, 27 Sep 2021 02:49:19 -0700 (PDT)
Received: from redhat.com ([2.55.16.138])
 by smtp.gmail.com with ESMTPSA id s10sm16302871wrg.42.2021.09.27.02.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 02:49:18 -0700 (PDT)
Date: Mon, 27 Sep 2021 05:49:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
Message-ID: <20210927053932-mutt-send-email-mst@kernel.org>
References: <20210803205043.165034-1-mst@redhat.com>
 <20210803205043.165034-2-mst@redhat.com>
 <YVGP9vdTtu5sRVpl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVGP9vdTtu5sRVpl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: Marcel Apfelbaum <marcel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrangé wrote:
> On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrote:
> > From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > 
> > Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> > As opposed to native PCIe hotplug, guests like Fedora 34
> > will not assign IO range to pcie-root-ports not supporting
> > native hotplug, resulting into a regression.
> > 
> > Reproduce by:
> >     qemu-bin -M q35 -device pcie-root-port,id=p1 -monitor stdio
> >     device_add e1000,bus=p1
> > In the Guest OS the respective pcie-root-port will have the IO range
> > disabled.
> > 
> > Fix it by setting the "reserve-io" hint capability of the
> > pcie-root-ports so the firmware will allocate the IO range instead.
> > 
> > Acked-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> > Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> 
> This change, when combined with the switch to ACPI based hotplug by
> default, is responsible for a significant regression in QEMU 6.1.0
> 
> It is no longer possible to have more than 15 pcie-root-port devices
> added to a q35 VM in 6.1.0.  Before this I've had as many as 80+ devices
> present before I stopped trying to add more.
> 
>   https://gitlab.com/qemu-project/qemu/-/issues/641
> 
> This regression is significant, because it has broken the out of the
> box default configuration that OpenStack uses for booting all VMs.
> They add 16 pcie-root-ports by defalt to allow empty slots for device
> hotplug under q35 [1].


Indeed, oops. Thanks for the report!

Going back and looking at seabios code, didn't we get confused?
Shouldn't we have reserved memory and not IO?

I see:
            int resource_optional = pcie_cap && (type == PCI_REGION_TYPE_IO);
            if (!sum && hotplug_support && !resource_optional)
                sum = align; /* reserve min size for hot-plug */


generally maybe we should just add an ACPI-hotplug capability and
teach seabios about it?

Marcel?

> > diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
> > index ec9907917e..20099a8ae3 100644
> > --- a/hw/pci-bridge/gen_pcie_root_port.c
> > +++ b/hw/pci-bridge/gen_pcie_root_port.c
> > @@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort, GEN_PCIE_ROOT_PORT)
> >          (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
> >  
> >  #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR       1
> > +#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE          4096
> >  
> >  struct GenPCIERootPort {
> >      /*< private >*/
> > @@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaque, int version_id)
> >  static void gen_rp_realize(DeviceState *dev, Error **errp)
> >  {
> >      PCIDevice *d = PCI_DEVICE(dev);
> > +    PCIESlot *s = PCIE_SLOT(d);
> >      GenPCIERootPort *grp = GEN_PCIE_ROOT_PORT(d);
> >      PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(d);
> >      Error *local_err = NULL;
> > @@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
> >          return;
> >      }
> >  
> > +    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
> > +        grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
> > +    }
> >      int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
> >                                                grp->res_reserve, errp);
> >  
> > -- 
> > MST
> > 
> > 
> 
> Regards,
> Daniel
> 
> [1] https://github.com/openstack/tripleo-heat-templates/blob/7a6cd0640ec390a330f5699d8ed60f71b2a9f514/deployment/nova/nova-compute-container-puppet.yaml#L462-L472
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


