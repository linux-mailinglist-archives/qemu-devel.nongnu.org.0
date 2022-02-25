Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BD04C49A9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:53:49 +0100 (CET)
Received: from localhost ([::1]:38716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcuh-0001bg-1O
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:53:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNcs3-0007mG-Ld
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:51:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNcrz-0007Ta-Te
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645804258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72d0rIMmK4WjGgfMYI+hZzuevRhB2ocHV9AE5DKC5wM=;
 b=iqttfY9Ns8eOlN96M+ypqKlmtBip3jpvnSNRvhi+e8Sg7Zt88p5VBConm8zBQsni9ZBR9f
 pJ9+SAUIB9G+tStk3+Qah8XsnGMZDIuK4ijBvvN+FexKOQ7SlcPKZ+/7XEr9SPt5v+anBd
 Fa/wfOB8WBbOoMdWu7ivzG14aSrxamU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-dgXjRJn9MJiKr0Qxys-wJw-1; Fri, 25 Feb 2022 10:50:57 -0500
X-MC-Unique: dgXjRJn9MJiKr0Qxys-wJw-1
Received: by mail-ed1-f71.google.com with SMTP id
 j10-20020a05640211ca00b004090fd8a936so2485397edw.23
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 07:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=72d0rIMmK4WjGgfMYI+hZzuevRhB2ocHV9AE5DKC5wM=;
 b=Ae9NuX1uyzO0OKx3oIhMWqdb7+/i7S9Wavd/sBWvzBme5XsMkLsDARqMK13texYFdZ
 /Cxy7gjVA9aak0wOUoOCKPPgEN+ON0JYyYPswEv9YSIIM43TtH0q1X6s3HEeJ1LygfuC
 O+VNsTNUbetncaJ1UpUfYVDRq7SmNfCoOxz37lZqe8NL1ytFlQxvjMycASyS6tuW05A2
 GkkAwfWVuuQldKxS7umzeTpB7QVJoUpD9F/1FGHLWLcB9Ybli2I//IL4UepBhdejJLT+
 P4yb4ExP7yrtiLlwo5XRAqwGB84wgOZ42ldA3qT3hAHBNHisdUzlDAKOc8fg+OqioJj1
 Jr2A==
X-Gm-Message-State: AOAM530BNCjR5QAQhEgbcEdZg2CcixTtRzYkhSSQR++p+ilpLQvyVhFO
 /AdaLJk0W4QEF9A3BgbWtPknoEvvrGH2G9vTYi+UOzux7gqsWhwqtp6PsYXhW0QJ0EkU41K/5NU
 RrWhvpZseq9ynhZc=
X-Received: by 2002:a17:906:360a:b0:6b9:1f8:9cdd with SMTP id
 q10-20020a170906360a00b006b901f89cddmr6667137ejb.461.1645804255919; 
 Fri, 25 Feb 2022 07:50:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsnAPe7ywfx27icLzM7YNuhtcKkiD4t2DnafLhOpBqO0UUCJUfBDaHz2XYoDzYCGbB8BxVXA==
X-Received: by 2002:a17:906:360a:b0:6b9:1f8:9cdd with SMTP id
 q10-20020a170906360a00b006b901f89cddmr6667121ejb.461.1645804255654; 
 Fri, 25 Feb 2022 07:50:55 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170906724d00b006cedd6d7e24sm1144701ejk.119.2022.02.25.07.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 07:50:55 -0800 (PST)
Date: Fri, 25 Feb 2022 16:50:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/4] Fix broken PCIe device after migration
Message-ID: <20220225165054.184b1a3c@redhat.com>
In-Reply-To: <20220225084957-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220225045327-mutt-send-email-mst@kernel.org>
 <20220225141823.5ee12954@redhat.com>
 <20220225084957-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Fri, 25 Feb 2022 08:50:43 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Feb 25, 2022 at 02:18:23PM +0100, Igor Mammedov wrote:
> > On Fri, 25 Feb 2022 04:58:46 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Thu, Feb 24, 2022 at 12:44:07PM -0500, Igor Mammedov wrote:  
> > > > Currently ACPI PCI hotplug is enabled by default for Q35 machine
> > > > type and overrides native PCIe hotplug. It works as expected when
> > > > a PCIe device is hotplugged into slot, however the device becomes
> > > > in-operational after migration. Which is caused by BARs being
> > > > disabled on target due to powered off status of the slot.
> > > > 
> > > > Proposed fix disables power control on PCIe slot when ACPI pcihp
> > > > takes over hotplug control and makes PCIe slot check if power
> > > > control is enabled before trying to change slot's power. Which
> > > > leaves slot always powered on and that makes PCI core keep BARs
> > > > enabled.    
> > > 
> > > 
> > > I thought some more about this. One of the reasons we
> > > did not remove the hotplug capability is really so
> > > it's easier to layer acpi on top of pcihp if we
> > > want to do it down the road. And it would be quite annoying
> > > if we had to add more hack to go back to having capability.
> > > 
> > > How about instead of patch 3 we call pci_set_power(dev, true) for all
> > > devices where ACPI is managing hotplug immediately on plug?  This will
> > > fix the bug avoiding headache with migration.  
> > 
> > true it would be more migration friendly (v6.2 still broken
> > but that can't be helped), since we won't alter pci_config at all.
> > Although it's still more hackish compared to disabling SLTCAP_PCP
> > (though it seems guest OSes have no issues with SLTCAP_PCP being
> > present but not really operational, at least for ~6months the thing
> > was released (6.1-6.2-now)).
> > 
> > Let me play with this idea and see if it works and at what cost,
> > though I still prefer cleaner SLTCAP_PCP disabling to make sure
> > guest OS won't get wrong idea about power control being present
> > when it's not actually not.  
> 
> Well the control is present, isn't it? Can be used to e.g. reset the
> device behind the bridge.

can you point to how reset is supposed to work?

> 
> >   
> > > Patch 2 does seem like a good idea.
> > >   
> > > > PS:
> > > > it's still hacky approach as all ACPI PCI hotplug is, but it's
> > > > the least intrusive one. Alternative, I've considered, could be
> > > > chaining hotplug callbacks and making pcihp ones call overriden
> > > > native callbacks while inhibiting hotplug event in native callbacks
> > > > somehow. But that were a bit more intrusive and spills over to SHPC
> > > > if implemented systematically, so I ditched that for now. It could
> > > > be resurrected later on if current approach turns out to be
> > > > insufficient.
> > > > 
> > > > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> > > > CC: mst@redhat.com
> > > > CC: kraxel@redhat.com
> > > > 
> > > > Igor Mammedov (4):
> > > >   pci: expose TYPE_XIO3130_DOWNSTREAM name
> > > >   pcie: update slot power status only is power control is enabled
> > > >   acpi: pcihp: disable power control on PCIe slot
> > > >   q35: compat: keep hotplugged PCIe device broken after migration for
> > > >     6.2-older machine types
> > > > 
> > > >  include/hw/acpi/pcihp.h                    |  4 +++-
> > > >  include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
> > > >  hw/acpi/acpi-pci-hotplug-stub.c            |  3 ++-
> > > >  hw/acpi/ich9.c                             | 21 ++++++++++++++++++++-
> > > >  hw/acpi/pcihp.c                            | 16 +++++++++++++++-
> > > >  hw/acpi/piix4.c                            |  3 ++-
> > > >  hw/core/machine.c                          |  4 +++-
> > > >  hw/pci-bridge/xio3130_downstream.c         |  3 ++-
> > > >  hw/pci/pcie.c                              |  5 ++---
> > > >  9 files changed, 64 insertions(+), 10 deletions(-)
> > > >  create mode 100644 include/hw/pci-bridge/xio3130_downstream.h
> > > > 
> > > > -- 
> > > > 2.31.1    
> > >   
> 


