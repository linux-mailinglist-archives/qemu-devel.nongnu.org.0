Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2682125709A
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 22:58:08 +0200 (CEST)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCUOs-0003UY-V0
	for lists+qemu-devel@lfdr.de; Sun, 30 Aug 2020 16:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kCUOA-00033u-Ll
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 16:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kCUO7-0005yn-Qu
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 16:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598821037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UrIkrXvLwR3LQgB9oHl+dBavzd7rBT1gJ7/7lVUKXQY=;
 b=P5cKoR946TdOgXsK9smxI2Yun5TZBVSzGz26M0K3ZDGx/sGJT/P//JKRJHqGPXwIfzA4NP
 dyequVWXBmNYDs8W8uPwiM2AlrxlbsOMIy+Iu8Sfu7o4nc+C3h9nRSquaSgajYEgh6N7Wn
 haJDTDcCyKLhb7ea1qbkW8pF9uIiKTM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-CMVw2vwvNDG9XnzfSSCETQ-1; Sun, 30 Aug 2020 16:57:15 -0400
X-MC-Unique: CMVw2vwvNDG9XnzfSSCETQ-1
Received: by mail-wr1-f70.google.com with SMTP id 33so2396161wre.0
 for <qemu-devel@nongnu.org>; Sun, 30 Aug 2020 13:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UrIkrXvLwR3LQgB9oHl+dBavzd7rBT1gJ7/7lVUKXQY=;
 b=dXXwdF2gIQGBypDatdKJ4CPnjSgPytspkKkZMRh6LEmHguC1h2X6diarDqLsWdP0lW
 Dkjk/Z22EFtxTQH62dGS5ptnU9i0zKyuVJXc5xuTXFanKOHoHnktIXWUr7YE+f/x1f2R
 TUUuSTfZYiWJymOooX97l9b3gMtyPd/8SOZ/mM7B5SQ71gstgDW6MtamMaRb+Vi7gsA9
 7iUjxn6C/Ju4j3+aKLdYLSKahPlCtm1aKLkRdf9T5uLog7wWVZ72jZdS84uqqV9RZHov
 RQDLhAZVnsb8dslfS+IfEalq0bzM25QJ3JuTq2aOE6jN9Ao9zGw38HEfrUxkmnK+UH7C
 wxaw==
X-Gm-Message-State: AOAM531GBNfm59sjZ8XrgLTPatbNGZa7hTarRIiyuT0qZmO/Ar+1XA7j
 HYTseieTSYJPJDA8Lq3npWeohM2LAkC5Dzf0F8YvAcFNLTEpClPyxx8iZqiiUFYW2valCbh8x65
 9jA8Igcq/1Md6GGA=
X-Received: by 2002:a5d:544a:: with SMTP id w10mr8756085wrv.317.1598821034781; 
 Sun, 30 Aug 2020 13:57:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy443XI85GCjwEfGuvs53lijMWiwcDHkAKztReRd7iEe43v/fpwxwcmwvPKfu3lUdu4QomiCg==
X-Received: by 2002:a5d:544a:: with SMTP id w10mr8756071wrv.317.1598821034473; 
 Sun, 30 Aug 2020 13:57:14 -0700 (PDT)
Received: from redhat.com (bzq-109-64-136-54.red.bezeqint.net. [109.64.136.54])
 by smtp.gmail.com with ESMTPSA id x14sm8745531wmc.5.2020.08.30.13.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 13:57:13 -0700 (PDT)
Date: Sun, 30 Aug 2020 16:57:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PULL 06/13] Introduce a new flag for i440fx to disable PCI
 hotplug on the root bus
Message-ID: <20200830055642-mutt-send-email-mst@kernel.org>
References: <20200827133954.2118749-1-mst@redhat.com>
 <20200827133954.2118749-7-mst@redhat.com>
 <20200827194115.673f94de@imammedo-mac>
 <CAARzgwzLcu5iHrXNZrVbg2Yx27AvyYWrKqBZ0wK7CveQ_eKgsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwzLcu5iHrXNZrVbg2Yx27AvyYWrKqBZ0wK7CveQ_eKgsQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/30 16:57:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 27, 2020 at 11:29:34PM +0530, Ani Sinha wrote:
> On Thu, Aug 27, 2020 at 11:11 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Thu, 27 Aug 2020 09:40:34 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > > From: Ani Sinha <ani@anisinha.ca>
> > >
> > > We introduce a new global flag 'acpi-root-pci-hotplug' for i440fx with which
> > > we can turn on or off PCI device hotplug on the root bus. This flag can be
> > > used to prevent all PCI devices from getting hotplugged or unplugged from the
> > > root PCI bus.
> > > This feature is targetted mostly towards Windows VMs. It is useful in cases
> > > where some hypervisor admins want to deploy guest VMs in a way so that the
> > > users of the guest OSes are not able to hot-eject certain PCI devices from
> > > the Windows system tray. Laine has explained the use case here in detail:
> > > https://www.redhat.com/archives/libvir-list/2020-February/msg00110.html
> > >
> > > Julia has resolved this issue for PCIE buses with the following commit:
> > > 530a0963184e57e71a5b538 ("pcie_root_port: Add hotplug disabling option")
> > >
> > > This commit attempts to introduce similar behavior for PCI root buses used in
> > > i440fx machine types (although in this case, we do not have a per-slot
> > > capability to turn hotplug on or off).
> > >
> > > Usage:
> > >    -global PIIX4_PM.acpi-root-pci-hotplug=off
> > >
> > > By default, this option is enabled which means that hotplug is turned on for
> > > the PCI root bus.
> > >
> > > The previously existing flag 'acpi-pci-hotplug-with-bridge-support' for PCI-PCI
> > > bridges remain as is and can be used along with this new flag to control PCI
> > > hotplug on PCI bridges.
> > >
> > > This change has been tested using a Windows 2012R2 server guest image and also
> > > with a Windows 2019 server guest image on a Ubuntu 18.04 host using the latest
> > > master qemu from upstream.
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > Message-Id: <20200821165403.26589-1-ani@anisinha.ca>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> >
> > > Tested-by: Igor Mammedov <imammedo@redhat.com>
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > A glitch in scripts?
> > I didn't review nor tested this (v8) version
> 
> oops! I am so eager to get this done and dusted :)


One thing I would like to see is that all of these flags
should also disable the relevant functionality.



> >
> > > ---
> > >  include/hw/acpi/pcihp.h |  2 +-
> > >  hw/acpi/pcihp.c         | 23 ++++++++++++++++++++++-
> > >  hw/acpi/piix4.c         |  5 ++++-
> > >  3 files changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> > > index 8bc4a4c01d..02f4665767 100644
> > > --- a/include/hw/acpi/pcihp.h
> > > +++ b/include/hw/acpi/pcihp.h
> > > @@ -67,7 +67,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > >                                           Error **errp);
> > >
> > >  /* Called on reset */
> > > -void acpi_pcihp_reset(AcpiPciHpState *s);
> > > +void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
> > >
> > >  extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
> > >
> > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > index 9e31ab2da4..39b1f74442 100644
> > > --- a/hw/acpi/pcihp.c
> > > +++ b/hw/acpi/pcihp.c
> > > @@ -104,6 +104,24 @@ static void acpi_set_pci_info(void)
> > >      }
> > >  }
> > >
> > > +static void acpi_pcihp_disable_root_bus(void)
> > > +{
> > > +    static bool root_hp_disabled;
> > > +    PCIBus *bus;
> > > +
> > > +    if (root_hp_disabled) {
> > > +        return;
> > > +    }
> > > +
> > > +    bus = find_i440fx();
> > > +    if (bus) {
> > > +        /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
> > > +        qbus_set_hotplug_handler(BUS(bus), NULL);
> > > +    }
> > > +    root_hp_disabled = true;
> > > +    return;
> > > +}
> > > +
> > >  static void acpi_pcihp_test_hotplug_bus(PCIBus *bus, void *opaque)
> > >  {
> > >      AcpiPciHpFind *find = opaque;
> > > @@ -209,8 +227,11 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
> > >      }
> > >  }
> > >
> > > -void acpi_pcihp_reset(AcpiPciHpState *s)
> > > +void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
> > >  {
> > > +    if (acpihp_root_off) {
> > > +        acpi_pcihp_disable_root_bus();
> > > +    }
> > >      acpi_set_pci_info();
> > >      acpi_pcihp_update(s);
> > >  }
> > > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > > index 26bac4f16c..e6163bb6ce 100644
> > > --- a/hw/acpi/piix4.c
> > > +++ b/hw/acpi/piix4.c
> > > @@ -78,6 +78,7 @@ typedef struct PIIX4PMState {
> > >
> > >      AcpiPciHpState acpi_pci_hotplug;
> > >      bool use_acpi_hotplug_bridge;
> > > +    bool use_acpi_root_pci_hotplug;
> > >
> > >      uint8_t disable_s3;
> > >      uint8_t disable_s4;
> > > @@ -324,7 +325,7 @@ static void piix4_pm_reset(DeviceState *dev)
> > >          pci_conf[0x5B] = 0x02;
> > >      }
> > >      pm_io_space_update(s);
> > > -    acpi_pcihp_reset(&s->acpi_pci_hotplug);
> > > +    acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
> > >  }
> > >
> > >  static void piix4_pm_powerdown_req(Notifier *n, void *opaque)
> > > @@ -635,6 +636,8 @@ static Property piix4_pm_properties[] = {
> > >      DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
> > >      DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
> > >                       use_acpi_hotplug_bridge, true),
> > > +    DEFINE_PROP_BOOL("acpi-root-pci-hotplug", PIIX4PMState,
> > > +                     use_acpi_root_pci_hotplug, true),
> > >      DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
> > >                       acpi_memory_hotplug.is_enabled, true),
> > >      DEFINE_PROP_END_OF_LIST(),
> >


