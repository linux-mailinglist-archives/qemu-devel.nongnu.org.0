Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B931A65C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:00:01 +0100 (CET)
Received: from localhost ([::1]:48362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAfXk-0003SQ-FC
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lAfWL-0002wO-Vq
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:58:34 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lAfWJ-000591-K6
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:58:33 -0500
Received: by mail-pl1-x62f.google.com with SMTP id b8so457579plh.12
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 12:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mJGmJYChT1I/vyF+j2nNVdwrKx/bwKsKTOoOA8XqCAo=;
 b=rAHS9bLIPOsoUXrZWpIGDH4U+aVscf+4RaHNQKGydv+eX5bFOhdCRiv6cF49plb+gH
 /3YGlpmc5Phnc2808FRmn6wCKgNQWGEUqStprG6OCTTGniCoyw5/daFDgkWaLMIH/w5Z
 O0C9nkmXGxftVzGSV/YBn0bWu1ossYJhNrZ9Ueyom//EXn20usEmRr8LPL5QUtV5NRtS
 qc0uqlm05NhE1gnwraXj0vxStWqPGQWhcCkBZXYXjw6NYm7Rr15d0XGcB3MGwfc8u9wo
 Rb4OgN8kENv7GnP4eo/ucTI+xW+8IcgjNWSA4fX9D/316tfJYxkUNSZbcyzwmaHaZAVg
 X8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mJGmJYChT1I/vyF+j2nNVdwrKx/bwKsKTOoOA8XqCAo=;
 b=sGv/pNzMKiY/RmEC4FJpZ2J00CS8pl8UglSSyvd5R9ukCNLP2dq2QamAJUfLmXMfAv
 sMOUYWdtuuz0+LQr8Xr6HPaFtKkNl1Jfp0/kANTxMfrJAGxVWnr6S/Zx0o/FZlMM/Jqq
 NPcUX55br+07JIQiRGNf8kiO6xvIO1Yc6+t0QrLss/lJ2xJ3VZgsaUKfH6y6MC2068YI
 1V7gpeZfZ6Ac7xAuY07yxZdPPVyGoFGMpGDmxSmyFv5HTe5iNuGRmDJy+lu5eiRkBOgH
 KXKByRMLPy5hs7nhkjUDPhQs8bbBlLA9ceSi1Vy22UnRWjovAvItMbIWF1vIbmjaKBsM
 4Mkw==
X-Gm-Message-State: AOAM533fURwoCw6XWP4dEV4lgf1zXmfNJSRRNAx5OuC8prZYpm0iOb3R
 ue1c35nzZA1j58frtrpNk7UkANtlUzk=
X-Google-Smtp-Source: ABdhPJycEl7DCzQwXjHNd03gS3mm74NWoiqWd6JCERSvVjNwW87WPcHa6ZDtzZ/PPpSZ5GGfHT5HSQ==
X-Received: by 2002:a05:6a00:23c5:b029:1e6:2f2e:a438 with SMTP id
 g5-20020a056a0023c5b02901e62f2ea438mr4580877pfc.75.1613163126873; 
 Fri, 12 Feb 2021 12:52:06 -0800 (PST)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id q139sm9789662pfc.2.2021.02.12.12.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 12:52:06 -0800 (PST)
Date: Fri, 12 Feb 2021 12:51:57 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 07/10] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210212205157.GA7151@private.email.ne.jp>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
 <ea43ecd8e920088a783f81a7b2aeee8715657dc6.1613025709.git.isaku.yamahata@intel.com>
 <20210212164038.207e0f54@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212164038.207e0f54@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, qemu-devel@nongnu.org,
 isaku.yamahata@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 12, 2021 at 04:40:38PM +0100,
Igor Mammedov <imammedo@redhat.com> wrote:

> On Wed, 10 Feb 2021 22:46:43 -0800
> Isaku Yamahata <isaku.yamahata@intel.com> wrote:
> 
> > Declare PNP0C01 device to reserve MMCONFIG region to conform to the
> > spec better and play nice with guest BIOSes/OSes.
> > 
> > According to PCI Firmware Specification[0], MMCONFIG region must be
> > reserved by declaring a motherboard resource. It's optional to reserve
> > the region in memory map by Int 15 E820h or EFIGetMemoryMap.
> > Guest Linux checks if the MMCFG region is reserved by bios memory map
> > or ACPI resource. If it's not reserved, Linux falls back to legacy PCI
> > configuration access.
> > 
> > TDVF [1] [2] doesn't reserve MMCONFIG the region in memory map.
> > On the other hand OVMF reserves it in memory map without declaring a
> > motherboard resource. With memory map reservation, linux guest uses
> > MMCONFIG region. However it doesn't comply to PCI Firmware
> > specification.
> > 
> > [0] PCI Firmware specification Revision 3.2
> >   4.1.2 MCFG Table Description table 4-2 NOTE 2
> >   If the operating system does not natively comprehend reserving the
> >   MMCFG region, The MMCFG region must e reserved by firmware. ...
> >   For most systems, the mortheroard resource would appear at the root
> >   of the ACPI namespace (under \_SB)...
> >   The resource can optionally be returned in Int15 E820h or
> >   EFIGetMemoryMap as reserved memory but must always be reported
> >   through ACPI as a motherboard resource
> > 
> > [1] TDX: Intel Trust Domain Extension
> >     https://software.intel.com/content/www/us/en/develop/articles/intel-trust-domain-extensions.html
> > [2] TDX Virtual Firmware
> >     https://github.com/tianocore/edk2-staging/tree/TDVF
> > 
> > The change to DSDT is as follows.
> > @@ -68,32 +68,51 @@
> > 
> >                      If ((CDW3 != Local0))
> >                      {
> >                          CDW1 |= 0x10
> >                      }
> > 
> >                      CDW3 = Local0
> >                  }
> >                  Else
> >                  {
> >                      CDW1 |= 0x04
> >                  }
> > 
> >                  Return (Arg3)
> >              }
> >          }
> > +
> > +        Device (DRAC)
> > +        {
> > +            Name (_HID, "PNP0C01" /* System Board */)  // _HID: Hardware ID
> > +            Name (RBUF, ResourceTemplate ()
> > +            {
> > +                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
> > +                    0x0000000000000000, // Granularity
> > +                    0x00000000B0000000, // Range Minimum
> > +                    0x00000000BFFFFFFF, // Range Maximum
> > +                    0x0000000000000000, // Translation Offset
> > +                    0x0000000010000000, // Length
> > +                    ,, , AddressRangeMemory, TypeStatic)
> > +            })
> > +            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
> > +            {
> > +                Return (RBUF) /* \_SB_.DRAC.RBUF */
> > +            }
> > +        }
> >      }
> > 
> >      Scope (_SB)
> >      {
> >          Device (HPET)
> >          {
> >              Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
> >              Name (_UID, Zero)  // _UID: Unique ID
> >              OperationRegion (HPTM, SystemMemory, 0xFED00000, 0x0400)
> >              Field (HPTM, DWordAcc, Lock, Preserve)
> >              {
> >                  VEND,   32,
> >                  PRD,    32
> >              }
> > 
> >              Method (_STA, 0, NotSerialized)  // _STA: Status
> > 
> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > ---
> >  hw/i386/acpi-build.c | 46 +++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 00cc119362..e369908b1a 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1072,6 +1072,46 @@ static void build_q35_pci0_int(Aml *table)
> >      aml_append(table, sb_scope);
> >  }
> >  
> > +static Aml *build_q35_dram_controller(void)
> > +{
> > +    AcpiMcfgInfo mcfg;
> build_dsdt() already calls acpi_get_mcfg(),
> I suggest to cache it there and pass to build_q35_dram_controller
> as an argument.

Sure.


> > +    Aml *dev;
> > +    Aml *rbuf;
> > +    Aml *resource_template;
> > +    Aml *rbuf_name;
> > +    Aml *crs;
> > +
> > +    if (!acpi_get_mcfg(&mcfg)) {
> > +        return NULL;
> > +    }
> > +
> > +    /* DRAM controller */
> > +    dev = aml_device("DRAC");
> > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
> > +
> > +    resource_template = aml_resource_template();
> > +    aml_append(resource_template,
> > +               aml_qword_memory(AML_POS_DECODE,
> > +                                AML_MIN_FIXED,
> > +                                AML_MAX_FIXED,
> > +                                AML_NON_CACHEABLE,
> > +                                AML_READ_WRITE,
> > +                                0x0000000000000000,
> > +                                mcfg.base,
> > +                                mcfg.base + mcfg.size - 1,
> s/mcfg.base + mcfg.size - 1/mcfg.base/

AddressMaximum needs to be the highest address of the region.
Not base address. By disassemble/assembl it, iasl complains as follows.
Also there are similar examples in acpi-build.c.

  iasl drm-1.dsl

  Intel ACPI Component Architecture
  ASL+ Optimizing Compiler/Disassembler version 20190509
  Copyright (c) 2000 - 2019 Intel Corporation

  drm-1.dsl     23:                     0x10000000, // Length = 256M
  Error    6049 -                               ^ Length is larger than Min/Max window

  ASL Input:     drm-1.dsl -    1000 bytes      6 keywords     37 source lines

  Compilation failed. 1 Errors, 0 Warnings, 0 Remarks
  No AML files were generated due to compiler error(s)


> > +                                0x0000000000000000,
> > +                                mcfg.size));
> > +    rbuf = aml_name_decl("RBUF", resource_template);
> > +    aml_append(dev, rbuf);
> > +
> > +    crs = aml_method("_CRS", 0, AML_SERIALIZED);
> > +    rbuf_name = aml_name("RBUF");
> > +    aml_append(crs, aml_return(rbuf_name));
> > +    aml_append(dev, crs);
> > +
> > +    return dev;
> > +}
> > +
> >  static void build_q35_isa_bridge(Aml *table)
> >  {
> >      Aml *dev;
> > @@ -1212,7 +1252,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >             Range *pci_hole, Range *pci_hole64, MachineState *machine)
> >  {
> >      CrsRangeEntry *entry;
> > -    Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
> > +    Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs, *drac;
> maybe limit drac to
>   if (misc->is_piix4) { 
>   ... } else {
>      Aml *drac
> scope

ok.


> >      CrsRangeSet crs_range_set;
> >      PCMachineState *pcms = PC_MACHINE(machine);
> >      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(machine);
> > @@ -1256,6 +1296,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >          aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >          aml_append(dev, build_q35_osc_method());
> >          aml_append(sb_scope, dev);
> > +        drac = build_q35_dram_controller();
> > +        if (drac) {
> > +            aml_append(sb_scope, drac);
> > +        }
> mmcfg isn't optional for q35, is it?
> I'd simplify to:
>     aml_append(sb_scope, build_q35_dram_controller(mmcfg_info));
> or put all of it under condition if it's optional
>    if(foo) aml_append(sb_scope, build_q35_dram_controller(mmcfg_info))

It's optional. If MCFG isn't setup after reset, PCIE_BASE_ADDR_UNMAPPED
is returned.

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

