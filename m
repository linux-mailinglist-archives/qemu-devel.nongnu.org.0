Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228496D7894
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 11:40:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjzbg-000508-4P; Wed, 05 Apr 2023 05:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjzbd-0004zv-6U
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjzbZ-0008AK-IZ
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 05:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680687540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KXQFgKFYEdPjEY2/X/wngIDyK+EaLFd/xiMhWMtVcI=;
 b=YYXaYih+K0dvwliP+BZXWsOvyCLPdP7OD2FTANVJJXpXg+/HFLBk1mAiEGXbjZWvBPPIeC
 8xJ4+Av0NO9sO8Pe6ACJEba4zrXNcxm6eQRNWnEc5fc5hwgwNSHmXyIM2JY7dRmFIlaaN4
 1d9SdQL/hY/HKjHsp9+/VretwNgwJ1s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-volyXI2EPsKzE_CBrA0zUA-1; Wed, 05 Apr 2023 05:38:58 -0400
X-MC-Unique: volyXI2EPsKzE_CBrA0zUA-1
Received: by mail-ed1-f72.google.com with SMTP id
 m18-20020a50d7d2000000b00501dfd867a4so49822152edj.20
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 02:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680687538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3KXQFgKFYEdPjEY2/X/wngIDyK+EaLFd/xiMhWMtVcI=;
 b=SiYj8RE+juH1iL8VKCKbB6jSO7IK1gMii7kU2sRcrSSOW8kxkxDWHXLwedV7eojL5v
 0cjnYoeCDG7i5hRK79sCX31/VjITZIsIdgGELNDeiDWRdMSFCNrD4+FJZ1+5r+zYEjHI
 JtKp+Y74O1HFIll7b9ktnu6OT0woBst5FCAxzyrLtQoiCAfXfQr2O5HCfrnNw4m+YbX2
 5dINsHgXjk6dYHMlMKr586JmNmVIIP1SVOTJfmxSmgSD5EBHnpdtG8Uo7CITYBllpjm2
 X4M8BU7JeGe6wnCJ1NgdGJHdeVhcDYjF044G1WN+YN/yHBamVICViTt4wVGaoqxfbRfs
 bd8w==
X-Gm-Message-State: AAQBX9dexVJh3v77TF7J/RCVPLWfZNEI6LMODaLheJcg7WSskgwHRaoz
 bqmrlF38eYuEOq2xG3duc01+uJaTRqG0sVTBEmIXZ+nHkWlN/9Ct5zo5YfyNx0FCeUeg3IjGvis
 NHnFjlEUyFtyi+8c=
X-Received: by 2002:a17:906:a005:b0:93d:e132:9122 with SMTP id
 p5-20020a170906a00500b0093de1329122mr2317726ejy.35.1680687537803; 
 Wed, 05 Apr 2023 02:38:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350b0a89mD8Hc7VYDo1wkyUeQO6AHyp9nl/JdPNEjd1WwM4+aYcN7y+emWviZqF5esiGgd+L98g==
X-Received: by 2002:a17:906:a005:b0:93d:e132:9122 with SMTP id
 p5-20020a170906a00500b0093de1329122mr2317717ejy.35.1680687537488; 
 Wed, 05 Apr 2023 02:38:57 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h23-20020a170906261700b008e0bb004976sm7083995ejc.134.2023.04.05.02.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 02:38:57 -0700 (PDT)
Date: Wed, 5 Apr 2023 11:38:56 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com
Subject: Re: [PATCH v2] acpi: pcihp: make pending delete blocking action expire
Message-ID: <20230405113856.72065fd0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230405044231-mutt-send-email-mst@kernel.org>
References: <20230405083444.1536720-1-imammedo@redhat.com>
 <20230405044231-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 5 Apr 2023 04:47:48 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Apr 05, 2023 at 10:34:44AM +0200, Igor Mammedov wrote:
> > with Q35 using ACPI PCI hotplug by default, user's request to unplug
> > device is ignored when it's issued before guest OS has been booted.
> > And any additional attempt to request device hot-unplug afterwards
> > results in following error:
> > 
> >   "Device XYZ is already in the process of unplug"
> > 
> > arguably it can be considered as a regression introduced by [2],
> > before which it was possible to issue unplug request multiple
> > times.
> > 
> > Allowing pending delete blocking expire brings ACPI PCI hotplug
> > on par with native PCIe unplug behavior [1] and allows user
> > to repeat unplug requests at propper times.
> > Set expire timeout to arbitrary 1msec so user won't be able to
> > flood guest with SCI interrupts by calling device_del in tight loop.
> > 
> > PS:
> > ACPI spec doesn't mandate what OSPM can do with GPEx.status
> > bits set before it's booted => it's impl. depended.
> > Status bits may be retained (I tested with one Windows version)
> > or cleared (Linux since 2.6 kernel times) during guest's ACPI
> > subsystem initialization.
> > Clearing status bits (though not wrong per se) hides the unplug
> > event from guest, and it's upto user to repeat device_del later
> > when guest is able to handle unplug requests.
> > 
> > 1) 18416c62e3 ("pcie: expire pending delete")
> > 2)
> > Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> I feel a real solution is to detect guest handling the
> event such as clearing GPE and allowing resending
> the interrupt then.

I did consider preserving(masking clearing attempt) of GPE0.sts[]
IF en[] hasn't been enabled ever (i.e. should help with unplug at
the 1st boot). But that won't work across reboots (depends on
reboot kind) and it's twisting rules wrt spec (platform(QEMU/fw)
may set status bits, but it's upto OSPM to decide what to do with
them (when and how clear or ignore them). 

> A similar strategy should be possible with the attention
> button.
> 

> This patch is more of a band-aid - it is possible that guest
> rebooted and so user knows a new device_del is required,
> and we arbitrarily reject that. Right?
You lost me here. Can you elaborate?

> 
> This is arguably a regression but not in this release yes?
> So I don't think it needs to block qemu release.
> 
> 
> > ---
> > v2:
> >    * change timeout to 1ms
> >    * add comment to expire usage
> >    * massage commit message to be a bit more clear
> > 
> > CC: mst@redhat.com
> > CC: anisinha@redhat.com
> > CC: jusual@redhat.com
> > CC: kraxel@redhat.com  
> 
> It's helpful to have CC before --- so backporters know whom to CC, too.

ok, I'll fix it up and respin

> 
> > ---
> >  hw/acpi/pcihp.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index dcfb779a7a..5daa732a33 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -357,6 +357,16 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> >       * acpi_pcihp_eject_slot() when the operation is completed.
> >       */
> >      pdev->qdev.pending_deleted_event = true;
> > +    /* if unplug was requested before OSPM is initialized,
> > +     * linux kernel will clear GPE0.sts[] bits during boot, which effectively
> > +     * hides unplug event. BAnd than followup qmp_device_del() calls remain  
> 
> BAnd?
> 
> > +     * blocked by above flag permanently.
> > +     * Unblock qmp_device_del() by setting expire limit, so user can
> > +     * repeat unplug request later when OSPM has been booted.
> > +     */
> > +    pdev->qdev.pending_deleted_expires_ms =
> > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL); /* 1 msec */
> > +
> >      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
> >      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
> >  }
> > -- 
> > 2.39.1  
> 


