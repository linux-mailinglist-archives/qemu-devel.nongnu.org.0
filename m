Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CC426A470
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 13:53:21 +0200 (CEST)
Received: from localhost ([::1]:60570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI9WS-0000i0-Ep
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 07:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kI9VC-0008AT-CX
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 07:52:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31034
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kI9V7-0004xu-CQ
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 07:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600170716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rlc5IsFGjRm7s6zHzD5ZuMIHbANshDeiyJpFm7UAmiY=;
 b=cQcSKEvg5aS6IIVhNnvoqZ2WhBjGICR8QcxakqBDWcDuqJObVmDDLTEl/no3P83GDQyTQq
 I7kgwYLQDF7wDV7p5d8XCXi1zpp5/8wIQShbEshYEQ2sH9xPzxuG4suy/XTGZssUOuNZ5D
 B0HtUmhKYABxx8d+YhCDCa85uqx42Ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-c16Cr-fQOBiCiRxlNH14Xg-1; Tue, 15 Sep 2020 07:51:52 -0400
X-MC-Unique: c16Cr-fQOBiCiRxlNH14Xg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44000188C13D;
 Tue, 15 Sep 2020 11:51:51 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BDBF5F704;
 Tue, 15 Sep 2020 11:51:43 +0000 (UTC)
Date: Tue, 15 Sep 2020 13:51:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 9/9] piix4: don't reserve hw resources when hotplug is
 off globally
Message-ID: <20200915135141.585c767d@redhat.com>
In-Reply-To: <CAARzgwzSg7zCk_jaQ7iriC4_L+9oTykv0RhPdkTroP9pNtiMCg@mail.gmail.com>
References: <20200911180755.28409-1-ani@anisinha.ca>
 <20200911180755.28409-9-ani@anisinha.ca>
 <20200914150550.23a91fa2@redhat.com>
 <CAARzgwyrSW4jjrPCc1SJkDZUV9C-e_96RNGytZ8VjpPzzrWfXg@mail.gmail.com>
 <CAARzgwx4T0MXtFTMe-b8DbAQCi7xq231kjOv8wRcRxwE5HPCyw@mail.gmail.com>
 <20200914160910.66785da8@redhat.com>
 <CAARzgwzSg7zCk_jaQ7iriC4_L+9oTykv0RhPdkTroP9pNtiMCg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:11:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Sep 2020 20:20:21 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Mon, Sep 14, 2020 at 7:39 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Mon, 14 Sep 2020 18:58:19 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> >  
> > > On Mon, Sep 14, 2020 at 6:40 PM Ani Sinha <ani@anisinha.ca> wrote:  
> > > >
> > > > On Mon, Sep 14, 2020 at 6:36 PM Igor Mammedov <imammedo@redhat.com> wrote:  
> > > > >
> > > > > On Fri, 11 Sep 2020 23:37:55 +0530
> > > > > Ani Sinha <ani@anisinha.ca> wrote:
> > > > >  
> > > > > > When acpi hotplug is turned off for both root pci bus as well as for pci
> > > > > > bridges, we should not generate the related amls for DSDT table or initialize
> > > > > > related hw ports or reserve hw resources. This change makes sure all those
> > > > > > operations are turned off in the case acpi pci hotplug is off globally.  
> > > > >
> > > > > it still leaves around pure PCI hotplug ACPI code:
> > > > >
> > > > >             Method (PCNT, 0, NotSerialized)
> > > > >             {
> > > > >             }  
> > > >
> > > > How do you suggest we fix this?  
> > >
> > > One way to fix this would be to do this:
> > >
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index 7e3cf3b57b..2bd0c37143 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -483,7 +483,8 @@ static void build_append_pci_bus_devices(Aml
> > > *parent_scope, PCIBus *bus,
> > >              aml_append(method, aml_name("^S%.02X.PCNT", devfn));
> > >          }
> > >      }
> > > -    aml_append(parent_scope, method);
> > > +    if (bsel)
> > > +        aml_append(parent_scope, method);

and this also introduces mem leak


> > >      qobject_unref(bsel);
> > >  }
> > >
> > > This means that if the hotplug on the root bus is disabled, we also
> > > disable PCNT. This will also need the unit test update as the unit  
> > Does bridge hot-plug still work if we disable it only on root bus?  
> 
> Just did a quick test. Windows seems to eject devices on the bridge
> even when the root bus hot plug is off.

well I'm not sure it works using ACPI hotplug,

with
-global PIIX4_PM.acpi-root-pci-hotplug=off 
-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=on

DSDT ins't what I'd expect when bridge hp is on:

    Scope (\_SB)
    {
        Scope (PCI0)
        {
            Device (S00)
            {
                Name (_ADR, Zero)  // _ADR: Address
            }

            Device (S08)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                {
                    Return (Zero)
                }

                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
                {
                    Return (Zero)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (Zero)
                }
            }
        }
    }


> 
> >  
> > > test
> > > will fail with :
> > >
> > > @@ -3113,24 +3113,20 @@
> > >                  Name (_ADR, 0x00010000)  // _ADR: Address
> > >                  Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
> > >                  {
> > >                      Return (Zero)
> > >                  }
> > >
> > >                  Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
> > >                  {
> > >                      Return (Zero)
> > >                  }
> > >
> > >                  Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
> > >                  {
> > >                      Return (Zero)
> > >                  }
> > >              }
> > > -
> > > -            Method (PCNT, 0, NotSerialized)
> > > -            {
> > > -            }
> > >          }
> > >      }
> > >  }
> > >
> > > Let's fix this as a separate patch.  
> >
> > I'd rather fix up this patch, so it would do what it claims.
> >  
> > > >  
> > > > > >
> > > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > > ---
> > > > > >  hw/acpi/piix4.c      |  6 ++++--
> > > > > >  hw/i386/acpi-build.c | 10 ++++++++--
> > > > > >  2 files changed, 12 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > > > > > index e6163bb6ce..b70b1f98af 100644
> > > > > > --- a/hw/acpi/piix4.c
> > > > > > +++ b/hw/acpi/piix4.c
> > > > > > @@ -596,8 +596,10 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
> > > > > >                            "acpi-gpe0", GPE_LEN);
> > > > > >      memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
> > > > > >
> > > > > > -    acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
> > > > > > -                    s->use_acpi_hotplug_bridge);
> > > > > > +    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
> > > > > > +        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
> > > > > > +                        s->use_acpi_hotplug_bridge);
> > > > > > +    }
> > > > > >
> > > > > >      s->cpu_hotplug_legacy = true;
> > > > > >      object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
> > > > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > > > index e079b686f5..7e3cf3b57b 100644
> > > > > > --- a/hw/i386/acpi-build.c
> > > > > > +++ b/hw/i386/acpi-build.c
> > > > > > @@ -95,6 +95,7 @@ typedef struct AcpiPmInfo {
> > > > > >      bool s3_disabled;
> > > > > >      bool s4_disabled;
> > > > > >      bool pcihp_bridge_en;
> > > > > > +    bool pcihp_root_en;
> > > > > >      uint8_t s4_val;
> > > > > >      AcpiFadtData fadt;
> > > > > >      uint16_t cpu_hp_io_base;
> > > > > > @@ -245,6 +246,9 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
> > > > > >      pm->pcihp_bridge_en =
> > > > > >          object_property_get_bool(obj, "acpi-pci-hotplug-with-bridge-support",
> > > > > >                                   NULL);
> > > > > > +    pm->pcihp_root_en =
> > > > > > +        object_property_get_bool(obj, "acpi-root-pci-hotplug",
> > > > > > +                                 NULL);
> > > > > >  }
> > > > > >
> > > > > >  static void acpi_get_misc_info(AcpiMiscInfo *info)
> > > > > > @@ -1504,7 +1508,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > > > >          build_hpet_aml(dsdt);
> > > > > >          build_piix4_isa_bridge(dsdt);
> > > > > >          build_isa_devices_aml(dsdt);
> > > > > > -        build_piix4_pci_hotplug(dsdt);
> > > > > > +        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
> > > > > > +            build_piix4_pci_hotplug(dsdt);
> > > > > > +        }
> > > > > >          build_piix4_pci0_int(dsdt);
> > > > > >      } else {
> > > > > >          sb_scope = aml_scope("_SB");
> > > > > > @@ -1698,7 +1704,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > > > >      crs_range_set_free(&crs_range_set);
> > > > > >
> > > > > >      /* reserve PCIHP resources */
> > > > > > -    if (pm->pcihp_io_len) {
> > > > > > +    if (pm->pcihp_io_len && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
> > > > > >          dev = aml_device("PHPR");
> > > > > >          aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
> > > > > >          aml_append(dev,  
> > > > >  
> > >  
> >  
> 


