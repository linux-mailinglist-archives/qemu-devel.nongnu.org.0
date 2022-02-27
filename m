Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068C4C5A75
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 11:24:04 +0100 (CET)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOGig-0005v3-8o
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 05:24:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nOGhS-0004eG-1f
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 05:22:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nOGhN-0002kg-RX
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 05:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645957360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3+OhuR1PRtOnYLRIs2xQzfGO24KNk9oYSuu9TNOsg6E=;
 b=BjCmYyXGvLidGif5Rzn29HoS3A3NpV5UBne/eUT4jGwnwXM+y/8G0GzIZ65HUS0bXCFgoj
 Z+qDyFZY2DxHnr/RdMtZsZ3PB2S1QvCxGOg5Ug879ZneVo+Z0g9ExvC5bsjMnJOuw+3TEb
 FLWBDOG3ROdJNUAGDWE/o94ImZZHv74=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-sgVanlhDPuG76uWx9uV5cQ-1; Sun, 27 Feb 2022 05:22:39 -0500
X-MC-Unique: sgVanlhDPuG76uWx9uV5cQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l31-20020a05600c1d1f00b00380e3425ba7so4317897wms.9
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 02:22:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3+OhuR1PRtOnYLRIs2xQzfGO24KNk9oYSuu9TNOsg6E=;
 b=xON0nd2v97XNwMqOXaYp2Vhb/B5CXwS1aSHcvrZpl91B48WKiU/NG13v5tUzupmbxf
 gNtF1gvdFjcbE19vsWZo+rcSYrB1DXU6qL3OVkdiEd6JLF2gB5aRLlBB++FMyFxT5N8f
 faXN1f9VHqbkO4xlNCUZj5t9QFAZwXqSjBOPhnBYTZ2JIJeCDGvSftYfRYClQyF+arXl
 xvscrQ1VUXClFBiWFcmdaTaj3G2qo5PzgSsYKT2VL81e8Oz3YGJXOGg9vwIB6G0v+dFe
 FGhJGmKW7N4Oyz6Qf4H49gQMgt9hTc5FG9WY143ud8bhrmDUZAjAMOOcbmfAp3Ph4TFc
 x8ig==
X-Gm-Message-State: AOAM533khZzZpQgEyjRZrZ+BBo+gBZGkMi8hc+JlpiIgmXs8BfxGk7LP
 gyj9t346xiMZuhXkkIbE7XlYNG/jpzXh8+y2n5f5pWL+rshLo3orjP2SQPxbsDFG/Ev/iLhiaLN
 VM6Nt0KwvFNLSLYo=
X-Received: by 2002:adf:f84c:0:b0:1ee:b696:4ae9 with SMTP id
 d12-20020adff84c000000b001eeb6964ae9mr10831616wrq.651.1645957357820; 
 Sun, 27 Feb 2022 02:22:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNDzBDDlmESiFJmEYczUOPqqQ6HmHQpWjrCS38ywMqxOn/L3AXgweST/1Sl3+dhjnPD6IT5Q==
X-Received: by 2002:adf:f84c:0:b0:1ee:b696:4ae9 with SMTP id
 d12-20020adff84c000000b001eeb6964ae9mr10831604wrq.651.1645957357566; 
 Sun, 27 Feb 2022 02:22:37 -0800 (PST)
Received: from redhat.com ([2.53.153.125]) by smtp.gmail.com with ESMTPSA id
 l5-20020adff485000000b001d54142b02bsm7240040wro.85.2022.02.27.02.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 02:22:36 -0800 (PST)
Date: Sun, 27 Feb 2022 05:22:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/4] Fix broken PCIe device after migration
Message-ID: <20220227050634-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220225045327-mutt-send-email-mst@kernel.org>
 <20220225141823.5ee12954@redhat.com>
 <20220225084957-mutt-send-email-mst@kernel.org>
 <20220225165054.184b1a3c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225165054.184b1a3c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 04:50:54PM +0100, Igor Mammedov wrote:
> On Fri, 25 Feb 2022 08:50:43 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Feb 25, 2022 at 02:18:23PM +0100, Igor Mammedov wrote:
> > > On Fri, 25 Feb 2022 04:58:46 -0500
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >   
> > > > On Thu, Feb 24, 2022 at 12:44:07PM -0500, Igor Mammedov wrote:  
> > > > > Currently ACPI PCI hotplug is enabled by default for Q35 machine
> > > > > type and overrides native PCIe hotplug. It works as expected when
> > > > > a PCIe device is hotplugged into slot, however the device becomes
> > > > > in-operational after migration. Which is caused by BARs being
> > > > > disabled on target due to powered off status of the slot.
> > > > > 
> > > > > Proposed fix disables power control on PCIe slot when ACPI pcihp
> > > > > takes over hotplug control and makes PCIe slot check if power
> > > > > control is enabled before trying to change slot's power. Which
> > > > > leaves slot always powered on and that makes PCI core keep BARs
> > > > > enabled.    
> > > > 
> > > > 
> > > > I thought some more about this. One of the reasons we
> > > > did not remove the hotplug capability is really so
> > > > it's easier to layer acpi on top of pcihp if we
> > > > want to do it down the road. And it would be quite annoying
> > > > if we had to add more hack to go back to having capability.
> > > > 
> > > > How about instead of patch 3 we call pci_set_power(dev, true) for all
> > > > devices where ACPI is managing hotplug immediately on plug?  This will
> > > > fix the bug avoiding headache with migration.  
> > > 
> > > true it would be more migration friendly (v6.2 still broken
> > > but that can't be helped), since we won't alter pci_config at all.
> > > Although it's still more hackish compared to disabling SLTCAP_PCP
> > > (though it seems guest OSes have no issues with SLTCAP_PCP being
> > > present but not really operational, at least for ~6months the thing
> > > was released (6.1-6.2-now)).
> > > 
> > > Let me play with this idea and see if it works and at what cost,
> > > though I still prefer cleaner SLTCAP_PCP disabling to make sure
> > > guest OS won't get wrong idea about power control being present
> > > when it's not actually not.  
> > 
> > Well the control is present, isn't it? Can be used to e.g. reset the
> > device behind the bridge.
> 
> can you point to how reset is supposed to work?

Well, I am alluding to this code in linux

static const struct pci_reset_fn_method pci_reset_fn_methods[] = {
        { },
        { pci_dev_specific_reset, .name = "device_specific" },
        { pci_dev_acpi_reset, .name = "acpi" },
        { pcie_reset_flr, .name = "flr" },
        { pci_af_flr, .name = "af_flr" },
        { pci_pm_reset, .name = "pm" },
        { pci_reset_bus_function, .name = "bus" },
};

Thinkably down the road linux could add a method powering the secondary bus
off then back on as a way to reset devices behind it.
There are plenty of other ways so it's not that I can say why that
specific way of doing it is useful.

> > 
> > >   
> > > > Patch 2 does seem like a good idea.
> > > >   
> > > > > PS:
> > > > > it's still hacky approach as all ACPI PCI hotplug is, but it's
> > > > > the least intrusive one. Alternative, I've considered, could be
> > > > > chaining hotplug callbacks and making pcihp ones call overriden
> > > > > native callbacks while inhibiting hotplug event in native callbacks
> > > > > somehow. But that were a bit more intrusive and spills over to SHPC
> > > > > if implemented systematically, so I ditched that for now. It could
> > > > > be resurrected later on if current approach turns out to be
> > > > > insufficient.
> > > > > 
> > > > > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> > > > > CC: mst@redhat.com
> > > > > CC: kraxel@redhat.com
> > > > > 
> > > > > Igor Mammedov (4):
> > > > >   pci: expose TYPE_XIO3130_DOWNSTREAM name
> > > > >   pcie: update slot power status only is power control is enabled
> > > > >   acpi: pcihp: disable power control on PCIe slot
> > > > >   q35: compat: keep hotplugged PCIe device broken after migration for
> > > > >     6.2-older machine types
> > > > > 
> > > > >  include/hw/acpi/pcihp.h                    |  4 +++-
> > > > >  include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
> > > > >  hw/acpi/acpi-pci-hotplug-stub.c            |  3 ++-
> > > > >  hw/acpi/ich9.c                             | 21 ++++++++++++++++++++-
> > > > >  hw/acpi/pcihp.c                            | 16 +++++++++++++++-
> > > > >  hw/acpi/piix4.c                            |  3 ++-
> > > > >  hw/core/machine.c                          |  4 +++-
> > > > >  hw/pci-bridge/xio3130_downstream.c         |  3 ++-
> > > > >  hw/pci/pcie.c                              |  5 ++---
> > > > >  9 files changed, 64 insertions(+), 10 deletions(-)
> > > > >  create mode 100644 include/hw/pci-bridge/xio3130_downstream.h
> > > > > 
> > > > > -- 
> > > > > 2.31.1    
> > > >   
> > 


