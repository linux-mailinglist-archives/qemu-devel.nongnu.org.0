Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C627C184
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 11:44:43 +0200 (CEST)
Received: from localhost ([::1]:53800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNCBe-0007vq-N8
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 05:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kNC9h-0006BL-DN
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kNC9b-0006nG-T5
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 05:42:40 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601372554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CY3AEi3FeeySean0/CTuLo9IEAjEV9BX9fCN6ZDFjyo=;
 b=VlBeARAf05sgYjA9LekX3qOj9GGJNSD1+f/3QWV+HdF2b4Yko0npFSPt/KrKqIc35cHjbI
 /muJMlZhKNcylt7wLYRRneGl5qtaX97zIf2dGHr0+A3WDiLldqAyTCle9NOWGl8FdYB3Fp
 Zpz1tuXYbDhtMtUZFdVF+i6eIvMiQBY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-N-S5I6i0NWuE2q9s4Umt7Q-1; Tue, 29 Sep 2020 05:42:31 -0400
X-MC-Unique: N-S5I6i0NWuE2q9s4Umt7Q-1
Received: by mail-wr1-f69.google.com with SMTP id 33so1511546wrk.12
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 02:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CY3AEi3FeeySean0/CTuLo9IEAjEV9BX9fCN6ZDFjyo=;
 b=g3XbhVQZBd2t/DxqW/A9IaJ2MLyyYmncawKVcX0k8TIoV6LrZ7YbQILLYMcHDxUI2R
 9hDfstnWiQ2dSbKZfTavxWkLGx8JS5G3/yP0IFbh7xy00YBZPAKHOChz5ppbSfo0cVaK
 OFVm5ML2oEPoPtIaq7drNmYk9z+eJWeZHZuZN2HCXTNLvOwJ6Ww6i6LTMM4ed3HGaCRc
 SZRKfcNpAHaaKnPzzjEpyCz3LfAImdNAy+RZd5ysb6o6MOKKaIlTq9f0ni83i0xscF5L
 KkXCf8MWD/Ld6bo7QZdNl2v7K0YQO/slff4aAwEC7Jf3+NPocDXYdGlPcPwJC1zUwfAP
 d4IA==
X-Gm-Message-State: AOAM532FCtYd9O7QmpaYrwEa0aNyX+w9GYkLeWccReYFeTl0D8fFHSFs
 xgxMKYTEagqo5ydZK86BC30Fiycszwlxjpvgfk+lgANPlnkUfVKqujNsHK3eN2eAS3pJd1npnof
 95Z+R56a4wjvtkUc=
X-Received: by 2002:a05:6000:109:: with SMTP id
 o9mr3259809wrx.364.1601372549632; 
 Tue, 29 Sep 2020 02:42:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmdVjV//bGZi18pRoJ0yCx2wWfPtOjUSqrx0JzotzfMSp6kuze8757rBVLT4KTc6F3PiC/VA==
X-Received: by 2002:a05:6000:109:: with SMTP id
 o9mr3259775wrx.364.1601372549163; 
 Tue, 29 Sep 2020 02:42:29 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id o4sm4935827wru.55.2020.09.29.02.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:42:28 -0700 (PDT)
Date: Tue, 29 Sep 2020 05:42:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v10 13/13] tests/acpi: add DSDT.hpbrroot DSDT table blob
 to test global i440fx hotplug
Message-ID: <20200929053823-mutt-send-email-mst@kernel.org>
References: <20200918084111.15339-1-ani@anisinha.ca>
 <20200918084111.15339-14-ani@anisinha.ca>
 <20200929031032-mutt-send-email-mst@kernel.org>
 <CAARzgwzdVCwzXE2hUgPQdQpnp8eTf0JyEt3vctKWnZgwZZAfuA@mail.gmail.com>
 <20200929032619-mutt-send-email-mst@kernel.org>
 <CAARzgwz7x6uinPQ+oC+yAuFCbQEWhQuDmGU73E5NZ2WCH_C_kA@mail.gmail.com>
 <CAARzgwwxjjCAVsFB6_987pa1Z_in2G50rViYiRGVae-c_wn6xQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwwxjjCAVsFB6_987pa1Z_in2G50rViYiRGVae-c_wn6xQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 29, 2020 at 02:21:06PM +0530, Ani Sinha wrote:
> On Tue, Sep 29, 2020 at 1:53 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Tue, Sep 29, 2020 at 12:56 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Sep 29, 2020 at 12:53:17PM +0530, Ani Sinha wrote:
> > > > On Tue, Sep 29, 2020 at 12:42 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Fri, Sep 18, 2020 at 02:11:11PM +0530, Ani Sinha wrote:
> > > > > > This change adds a new DSDT golden master table blob to test disabling
> > > > > > hotplug on both pci root bus and pci bridges. Also reverts the change
> > > > > > in file bios-tables-test-allowed-diff.h to make sure its now empty so that
> > > > > > future modifications to acpi tables can be caught.
> > > > > >
> > > > > > The following is the disassembled diff between DSDT.hpbridge and DSDT.hpbrroot:
> > > > > >
> > > > > > @@ -1,30 +1,30 @@
> > > > > >  /*
> > > > > >   * Intel ACPI Component Architecture
> > > > > >   * AML/ASL+ Disassembler version 20180105 (64-bit version)
> > > > > >   * Copyright (c) 2000 - 2018 Intel Corporation
> > > > > >   *
> > > > > >   * Disassembling to symbolic ASL+ operators
> > > > > >   *
> > > > > > - * Disassembly of tests/data/acpi/pc/DSDT.hpbridge, Wed Sep 16 09:45:56 2020
> > > > > > + * Disassembly of /tmp/aml-ECV9Q0, Wed Sep 16 09:45:56 2020
> > > > > >   *
> > > > > >   * Original Table Header:
> > > > > >   *     Signature        "DSDT"
> > > > > > - *     Length           0x0000131F (4895)
> > > > > > + *     Length           0x00000B89 (2953)
> > > > > >   *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
> > > > > > - *     Checksum         0xF9
> > > > > > + *     Checksum         0xA2
> > > > > >   *     OEM ID           "BOCHS "
> > > > > >   *     OEM Table ID     "BXPCDSDT"
> > > > > >   *     OEM Revision     0x00000001 (1)
> > > > > >   *     Compiler ID      "BXPC"
> > > > > >   *     Compiler Version 0x00000001 (1)
> > > > > >   */
> > > > > >  DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
> > > > > >  {
> > > > > >      Scope (\)
> > > > > >      {
> > > > > >          OperationRegion (DBG, SystemIO, 0x0402, One)
> > > > > >          Field (DBG, ByteAcc, NoLock, Preserve)
> > > > > >          {
> > > > > >              DBGB,   8
> > > > > >          }
> > > > > >
> > > > > > @@ -234,64 +234,32 @@
> > > > > >          {
> > > > > >              Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
> > > > > >              Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > > > >              {
> > > > > >                  IO (Decode16,
> > > > > >                      0x0070,             // Range Minimum
> > > > > >                      0x0070,             // Range Maximum
> > > > > >                      0x01,               // Alignment
> > > > > >                      0x08,               // Length
> > > > > >                      )
> > > > > >                  IRQNoFlags ()
> > > > > >                      {8}
> > > > > >              })
> > > > > >          }
> > > > > >      }
> > > > > >
> > > > > > -    Scope (_SB.PCI0)
> > > > > > -    {
> > > > > > -        OperationRegion (PCST, SystemIO, 0xAE00, 0x08)
> > > > > > -        Field (PCST, DWordAcc, NoLock, WriteAsZeros)
> > > > > > -        {
> > > > > > -            PCIU,   32,
> > > > > > -            PCID,   32
> > > > > > -        }
> > > > > > -
> > > > > > -        OperationRegion (SEJ, SystemIO, 0xAE08, 0x04)
> > > > > > -        Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
> > > > > > -        {
> > > > > > -            B0EJ,   32
> > > > > > -        }
> > > > > > -
> > > > > > -        OperationRegion (BNMR, SystemIO, 0xAE10, 0x04)
> > > > > > -        Field (BNMR, DWordAcc, NoLock, WriteAsZeros)
> > > > > > -        {
> > > > > > -            BNUM,   32
> > > > > > -        }
> > > > > > -
> > > > > > -        Mutex (BLCK, 0x00)
> > > > > > -        Method (PCEJ, 2, NotSerialized)
> > > > > > -        {
> > > > > > -            Acquire (BLCK, 0xFFFF)
> > > > > > -            BNUM = Arg0
> > > > > > -            B0EJ = (One << Arg1)
> > > > > > -            Release (BLCK)
> > > > > > -            Return (Zero)
> > > > > > -        }
> > > > > > -    }
> > > > > > -
> > > > > >      Scope (_SB)
> > > > > >      {
> > > > > >          Scope (PCI0)
> > > > > >          {
> > > > > >              Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
> > > > > >              {
> > > > > >                  Local0 = Package (0x80){}
> > > > > >                  Local1 = Zero
> > > > > >                  While ((Local1 < 0x80))
> > > > > >                  {
> > > > > >                      Local2 = (Local1 >> 0x02)
> > > > > >                      Local3 = ((Local1 + Local2) & 0x03)
> > > > > >                      If ((Local3 == Zero))
> > > > > >                      {
> > > > > >                          Local4 = Package (0x04)
> > > > > >                              {
> > > > > > @@ -690,38 +658,32 @@
> > > > > >                  Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
> > > > > >                  {
> > > > > >                      COST (Zero, Arg0, Arg1, Arg2)
> > > > > >                  }
> > > > > >              }
> > > > > >          }
> > > > > >      }
> > > > > >
> > > > > >      Method (\_GPE._E02, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
> > > > > >      {
> > > > > >          \_SB.CPUS.CSCN ()
> > > > > >      }
> > > > > >
> > > > > >      Scope (_GPE)
> > > > > >      {
> > > > > >          Name (_HID, "ACPI0006" /* GPE Block Device */)  // _HID: Hardware ID
> > > > > > -        Method (_E01, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
> > > > > > -        {
> > > > > > -            Acquire (\_SB.PCI0.BLCK, 0xFFFF)
> > > > > > -            \_SB.PCI0.PCNT ()
> > > > > > -            Release (\_SB.PCI0.BLCK)
> > > > > > -        }
> > > > > >      }
> > > > > >
> > > > > >      Scope (\_SB.PCI0)
> > > > > >      {
> > > > > >          Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > > > >          {
> > > > > >              WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
> > > > > >                  0x0000,             // Granularity
> > > > > >                  0x0000,             // Range Minimum
> > > > > >                  0x00FF,             // Range Maximum
> > > > > >                  0x0000,             // Translation Offset
> > > > > >                  0x0100,             // Length
> > > > > >                  ,, )
> > > > > >              IO (Decode16,
> > > > > >                  0x0CF8,             // Range Minimum
> > > > > >                  0x0CF8,             // Range Maximum
> > > > > > @@ -766,48 +728,32 @@
> > > > > >          })
> > > > > >          Device (GPE0)
> > > > > >          {
> > > > > >              Name (_HID, "PNP0A06" /* Generic Container Device */)  // _HID: Hardware ID
> > > > > >              Name (_UID, "GPE0 resources")  // _UID: Unique ID
> > > > > >              Name (_STA, 0x0B)  // _STA: Status
> > > > > >              Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > > > >              {
> > > > > >                  IO (Decode16,
> > > > > >                      0xAFE0,             // Range Minimum
> > > > > >                      0xAFE0,             // Range Maximum
> > > > > >                      0x01,               // Alignment
> > > > > >                      0x04,               // Length
> > > > > >                      )
> > > > > >              })
> > > > > >          }
> > > > > > -
> > > > > > -        Device (PHPR)
> > > > > > -        {
> > > > > > -            Name (_HID, "PNP0A06" /* Generic Container Device */)  // _HID: Hardware ID
> > > > > > -            Name (_UID, "PCI Hotplug resources")  // _UID: Unique ID
> > > > > > -            Name (_STA, 0x0B)  // _STA: Status
> > > > > > -            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > > > > -            {
> > > > > > -                IO (Decode16,
> > > > > > -                    0xAE00,             // Range Minimum
> > > > > > -                    0xAE00,             // Range Maximum
> > > > > > -                    0x01,               // Alignment
> > > > > > -                    0x14,               // Length
> > > > > > -                    )
> > > > > > -            })
> > > > > > -        }
> > > > > >      }
> > > > > >
> > > > > >      Scope (\)
> > > > > >      {
> > > > > >          Name (_S3, Package (0x04)  // _S3_: S3 System State
> > > > > >          {
> > > > > >              One,
> > > > > >              One,
> > > > > >              Zero,
> > > > > >              Zero
> > > > > >          })
> > > > > >          Name (_S4, Package (0x04)  // _S4_: S4 System State
> > > > > >          {
> > > > > >              0x02,
> > > > > >              0x02,
> > > > > >              Zero,
> > > > > > @@ -831,479 +777,48 @@
> > > > > >              Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > > > >              {
> > > > > >                  IO (Decode16,
> > > > > >                      0x0510,             // Range Minimum
> > > > > >                      0x0510,             // Range Maximum
> > > > > >                      0x01,               // Alignment
> > > > > >                      0x0C,               // Length
> > > > > >                      )
> > > > > >              })
> > > > > >          }
> > > > > >      }
> > > > > >
> > > > > >      Scope (\_SB)
> > > > > >      {
> > > > > >          Scope (PCI0)
> > > > > >          {
> > > > > > -            Name (BSEL, Zero)
> > > > > >              Device (S00)
> > > > > >              {
> > > > > >                  Name (_ADR, Zero)  // _ADR: Address
> > > > > >              }
> > > > > >
> > > > > >              Device (S10)
> > > > > >              {
> > > > > >                  Name (_ADR, 0x00020000)  // _ADR: Address
> > > > > >                  Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
> > > > > >                  {
> > > > > >                      Return (Zero)
> > > > > >                  }
> > > > > >
> > > > > >                  Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
> > > > > >                  {
> > > > > >                      Return (Zero)
> > > > > >                  }
> > > > > >
> > > > > >                  Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
> > > > > >                  {
> > > > > >                      Return (Zero)
> > > > > >                  }
> > > > > >              }
> > > > > >
> > > > > >              Device (S18)
> > > > > >              {
> > > > > >                  Name (_ADR, 0x00030000)  // _ADR: Address
> > > > > >              }
> > > > > > -
> > > > > > -            Device (S20)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x04)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00040000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S28)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x05)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00050000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S30)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x06)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00060000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S38)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x07)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00070000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S40)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x08)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00080000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S48)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x09)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00090000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S50)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x0A)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x000A0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S58)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x0B)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x000B0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S60)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x0C)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x000C0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S68)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x0D)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x000D0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S70)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x0E)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x000E0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S78)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x0F)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x000F0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S80)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x10)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00100000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S88)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x11)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00110000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S90)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x12)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00120000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (S98)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x13)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00130000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SA0)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x14)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00140000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SA8)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x15)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00150000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SB0)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x16)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00160000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SB8)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x17)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00170000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SC0)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x18)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00180000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SC8)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x19)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x00190000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SD0)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x1A)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x001A0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SD8)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x1B)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x001B0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SE0)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x1C)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x001C0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SE8)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x1D)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x001D0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SF0)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x1E)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x001E0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Device (SF8)
> > > > > > -            {
> > > > > > -                Name (_SUN, 0x1F)  // _SUN: Slot User Number
> > > > > > -                Name (_ADR, 0x001F0000)  // _ADR: Address
> > > > > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
> > > > > > -                {
> > > > > > -                    PCEJ (BSEL, _SUN)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Method (DVNT, 2, NotSerialized)
> > > > > > -            {
> > > > > > -                If ((Arg0 & 0x10))
> > > > > > -                {
> > > > > > -                    Notify (S20, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x20))
> > > > > > -                {
> > > > > > -                    Notify (S28, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x40))
> > > > > > -                {
> > > > > > -                    Notify (S30, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x80))
> > > > > > -                {
> > > > > > -                    Notify (S38, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x0100))
> > > > > > -                {
> > > > > > -                    Notify (S40, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x0200))
> > > > > > -                {
> > > > > > -                    Notify (S48, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x0400))
> > > > > > -                {
> > > > > > -                    Notify (S50, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x0800))
> > > > > > -                {
> > > > > > -                    Notify (S58, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x1000))
> > > > > > -                {
> > > > > > -                    Notify (S60, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x2000))
> > > > > > -                {
> > > > > > -                    Notify (S68, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x4000))
> > > > > > -                {
> > > > > > -                    Notify (S70, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x8000))
> > > > > > -                {
> > > > > > -                    Notify (S78, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x00010000))
> > > > > > -                {
> > > > > > -                    Notify (S80, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x00020000))
> > > > > > -                {
> > > > > > -                    Notify (S88, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x00040000))
> > > > > > -                {
> > > > > > -                    Notify (S90, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x00080000))
> > > > > > -                {
> > > > > > -                    Notify (S98, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x00100000))
> > > > > > -                {
> > > > > > -                    Notify (SA0, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x00200000))
> > > > > > -                {
> > > > > > -                    Notify (SA8, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x00400000))
> > > > > > -                {
> > > > > > -                    Notify (SB0, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x00800000))
> > > > > > -                {
> > > > > > -                    Notify (SB8, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x01000000))
> > > > > > -                {
> > > > > > -                    Notify (SC0, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x02000000))
> > > > > > -                {
> > > > > > -                    Notify (SC8, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x04000000))
> > > > > > -                {
> > > > > > -                    Notify (SD0, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x08000000))
> > > > > > -                {
> > > > > > -                    Notify (SD8, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x10000000))
> > > > > > -                {
> > > > > > -                    Notify (SE0, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x20000000))
> > > > > > -                {
> > > > > > -                    Notify (SE8, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x40000000))
> > > > > > -                {
> > > > > > -                    Notify (SF0, Arg1)
> > > > > > -                }
> > > > > > -
> > > > > > -                If ((Arg0 & 0x80000000))
> > > > > > -                {
> > > > > > -                    Notify (SF8, Arg1)
> > > > > > -                }
> > > > > > -            }
> > > > > > -
> > > > > > -            Method (PCNT, 0, NotSerialized)
> > > > > > -            {
> > > > > > -                BNUM = Zero
> > > > > > -                DVNT (PCIU, One)
> > > > > > -                DVNT (PCID, 0x03)
> > > > > > -            }
> > > > > >          }
> > > > > >      }
> > > > > >  }
> > > > >
> > > > > This is not the only diff I see if I apply this patchset on
> > > > > top of master.
> > > > > Dropped this and the previous patch.
> > > > > Please check what is going on and repost as appropriate.
> > > >
> > > > Which two ACPI DSDT files are you diffing? What diff are you getting?
> > >
> > >
> > > diff -rup ./tests/data/acpi/pc/DSDT.hpbridge.dsl ./tests/data/acpi/pc/DSDT.hpbrroot.dsl
> >
> > I re-based my patchset on top of the latest qemu master and did a make
> >  && make check-qtest-x86_64 V=1.
> > They pass. I am seeing this diff:
> > https://pastebin.ubuntu.com/p/BXy9GFfB2R/
> >
> > and it looks good to me.
> >
> > Not sure why your diff looks different. Maybe you can regenerate the blob?
> 
> I did a full make check and it passed. I compared the diff again and
> it's the same. I checked my tree and it looks clean. These are the
> patches I have:
> 
> $ git log --oneline
> 20d1323e10 (HEAD -> master) qom: code hardening - have bound checking
> while looping with integer value
> 0f69dae0e2 Add a comment in bios-tables-test.c to clarify the reason
> behind approach
> dd9a8c3cd3 tests/acpi: add DSDT.hpbrroot DSDT table blob to test
> global i440fx hotplug
> 5b93474fe9 tests/acpi: unit test exercising global pci hotplug off for i440fx
> 54c33e334a tests/acpi: update golden master DSDT binary table blobs for q35
> 2279f61f30 piix4: don't reserve hw resources when hotplug is off globally
> 1f61c524a0 Add ACPI DSDT tables for q35 that are being updated by the next patch
> bdd823611b tests/acpi: add newly added acpi DSDT table blob for pci
> bridge hotplug flag
> 8c80f8fba9 tests/acpi: unit test for
> 'acpi-pci-hotplug-with-bridge-support' bridge flag
> e0a3142df9 tests/acpi: list added acpi table binary file for pci
> bridge hotplug test
> 0ba08317a8 i440fx/acpi: do not add hotplug related amls for cold plugged bridges
> 73b191ade6 Fix a gap where acpi_pcihp_find_hotplug_bus() returns a
> non-hotpluggable bus
> ef0e526cc2 tests/acpi: add a new ACPI table in order to test root pci
> hotplug on/off
> c6d13264f8 tests/acpi: add new unit test to test hotplug off/on
> feature on the root pci bus
> 6901bada65 tests/acpi: mark addition of table DSDT.roothp for unit
> testing root pci hotplug
> 74504514b1 (origin/master, origin/HEAD) Merge remote-tracking branch
> 'remotes/alistair/tags/pull-register-20200927' into staging

Try applying on top of latest pull request?


> 
> >
> > >
> > >
> > >
> > > --- ./tests/data/acpi/pc/DSDT.hpbridge.dsl      2020-09-29 02:44:43.874622404 -0400
> > > +++ ./tests/data/acpi/pc/DSDT.hpbrroot.dsl      2020-09-29 02:44:43.876622403 -0400
> > > @@ -5,13 +5,13 @@
> > >   *
> > >   * Disassembling to symbolic ASL+ operators
> > >   *
> > > - * Disassembly of tests/data/acpi/pc/DSDT.hpbridge, Tue Sep 29 02:44:43 2020
> > > + * Disassembly of tests/data/acpi/pc/DSDT.hpbrroot, Tue Sep 29 02:44:43 2020
> > >   *
> > >   * Original Table Header:
> > >   *     Signature        "DSDT"
> > > - *     Length           0x0000139D (5021)
> > > + *     Length           0x00000B89 (2953)
> > >   *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
> > > - *     Checksum         0x05
> > > + *     Checksum         0xA2
> > >   *     OEM ID           "BOCHS "
> > >   *     OEM Table ID     "BXPCDSDT"
> > >   *     OEM Revision     0x00000001 (1)
> > > @@ -247,38 +247,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
> > >          }
> > >      }
> > >
> > > -    Scope (_SB.PCI0)
> > > -    {
> > > -        OperationRegion (PCST, SystemIO, 0xAE00, 0x08)
> > > -        Field (PCST, DWordAcc, NoLock, WriteAsZeros)
> > > -        {
> > > -            PCIU,   32,
> > > -            PCID,   32
> > > -        }
> > > -
> > > -        OperationRegion (SEJ, SystemIO, 0xAE08, 0x04)
> > > -        Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
> > > -        {
> > > -            B0EJ,   32
> > > -        }
> > > -
> > > -        OperationRegion (BNMR, SystemIO, 0xAE10, 0x04)
> > > -        Field (BNMR, DWordAcc, NoLock, WriteAsZeros)
> > > -        {
> > > -            BNUM,   32
> > > -        }
> > > -
> > > -        Mutex (BLCK, 0x00)
> > > -        Method (PCEJ, 2, NotSerialized)
> > > -        {
> > > -            Acquire (BLCK, 0xFFFF)
> > > -            BNUM = Arg0
> > > -            B0EJ = (One << Arg1)
> > > -            Release (BLCK)
> > > -            Return (Zero)
> > > -        }
> > > -    }
> > > -
> > >      Scope (_SB)
> > >      {
> > >          Scope (PCI0)
> > > @@ -643,56 +611,22 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
> > >              Method (CSCN, 0, Serialized)
> > >              {
> > >                  Acquire (\_SB.PCI0.PRES.CPLK, 0xFFFF)
> > > -                Name (CNEW, Package (0xFF){})
> > > -                Local3 = Zero
> > > -                Local4 = One
> > > -                While ((Local4 == One))
> > > +                Local0 = One
> > > +                While ((Local0 == One))
> > >                  {
> > > -                    Local4 = Zero
> > > -                    Local0 = One
> > > -                    Local1 = Zero
> > > -                    While (((Local0 == One) && (Local3 < One)))
> > > +                    Local0 = Zero
> > > +                    \_SB.PCI0.PRES.CCMD = Zero
> > > +                    If ((\_SB.PCI0.PRES.CINS == One))
> > >                      {
> > > -                        Local0 = Zero
> > > -                        \_SB.PCI0.PRES.CSEL = Local3
> > > -                        \_SB.PCI0.PRES.CCMD = Zero
> > > -                        If ((\_SB.PCI0.PRES.CDAT < Local3))
> > > -                        {
> > > -                            Break
> > > -                        }
> > > -
> > > -                        If ((Local1 == 0xFF))
> > > -                        {
> > > -                            Local4 = One
> > > -                            Break
> > > -                        }
> > > -
> > > -                        Local3 = \_SB.PCI0.PRES.CDAT
> > > -                        If ((\_SB.PCI0.PRES.CINS == One))
> > > -                        {
> > > -                            CNEW [Local1] = Local3
> > > -                            Local1++
> > > -                            Local0 = One
> > > -                        }
> > > -                        ElseIf ((\_SB.PCI0.PRES.CRMV == One))
> > > -                        {
> > > -                            CTFY (Local3, 0x03)
> > > -                            \_SB.PCI0.PRES.CRMV = One
> > > -                            Local0 = One
> > > -                        }
> > > -
> > > -                        Local3++
> > > +                        CTFY (\_SB.PCI0.PRES.CDAT, One)
> > > +                        \_SB.PCI0.PRES.CINS = One
> > > +                        Local0 = One
> > >                      }
> > > -
> > > -                    Local2 = Zero
> > > -                    While ((Local2 < Local1))
> > > +                    ElseIf ((\_SB.PCI0.PRES.CRMV == One))
> > >                      {
> > > -                        Local3 = DerefOf (CNEW [Local2])
> > > -                        CTFY (Local3, One)
> > > -                        Debug = Local3
> > > -                        \_SB.PCI0.PRES.CSEL = Local3
> > > -                        \_SB.PCI0.PRES.CINS = One
> > > -                        Local2++
> > > +                        CTFY (\_SB.PCI0.PRES.CDAT, 0x03)
> > > +                        \_SB.PCI0.PRES.CRMV = One
> > > +                        Local0 = One
> > >                      }
> > >                  }
> > >
> > > @@ -737,12 +671,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
> > >      Scope (_GPE)
> > >      {
> > >          Name (_HID, "ACPI0006" /* GPE Block Device */)  // _HID: Hardware ID
> > > -        Method (_E01, 0, NotSerialized)  // _Exx: Edge-Triggered GPE, xx=0x00-0xFF
> > > -        {
> > > -            Acquire (\_SB.PCI0.BLCK, 0xFFFF)
> > > -            \_SB.PCI0.PCNT ()
> > > -            Release (\_SB.PCI0.BLCK)
> > > -        }
> > >      }
> > >
> > >      Scope (\_SB.PCI0)
> > > @@ -813,22 +741,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
> > >                      )
> > >              })
> > >          }
> > > -
> > > -        Device (PHPR)
> > > -        {
> > > -            Name (_HID, "PNP0A06" /* Generic Container Device */)  // _HID: Hardware ID
> > > -            Name (_UID, "PCI Hotplug resources")  // _UID: Unique ID
> > > -            Name (_STA, 0x0B)  // _STA: Status
> > > -            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > -            {
> > > -                IO (Decode16,
> > > -                    0xAE00,             // Range Minimum
> > > -                    0xAE00,             // Range Maximum
> > > -                    0x01,               // Alignment
> > > -                    0x14,               // Length
> > > -                    )
> > > -            })
> > > -        }
> > >      }
> > >
> > >      Scope (\)
> > > @@ -878,7 +790,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
> > >      {
> > >          Scope (PCI0)
> > >          {
> > > -            Name (BSEL, Zero)
> > >              Device (S00)
> > >              {
> > >                  Name (_ADR, Zero)  // _ADR: Address
> > > @@ -907,436 +818,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
> > >              {
> > >                  Name (_ADR, 0x00030000)  // _ADR: Address
> > >              }
> > > -
> > > -            Device (S20)
> > > -            {
> > > -                Name (_SUN, 0x04)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00040000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S28)
> > > -            {
> > > -                Name (_SUN, 0x05)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00050000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S30)
> > > -            {
> > > -                Name (_SUN, 0x06)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00060000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S38)
> > > -            {
> > > -                Name (_SUN, 0x07)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00070000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S40)
> > > -            {
> > > -                Name (_SUN, 0x08)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00080000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S48)
> > > -            {
> > > -                Name (_SUN, 0x09)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00090000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S50)
> > > -            {
> > > -                Name (_SUN, 0x0A)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x000A0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S58)
> > > -            {
> > > -                Name (_SUN, 0x0B)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x000B0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S60)
> > > -            {
> > > -                Name (_SUN, 0x0C)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x000C0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S68)
> > > -            {
> > > -                Name (_SUN, 0x0D)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x000D0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S70)
> > > -            {
> > > -                Name (_SUN, 0x0E)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x000E0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S78)
> > > -            {
> > > -                Name (_SUN, 0x0F)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x000F0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S80)
> > > -            {
> > > -                Name (_SUN, 0x10)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00100000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S88)
> > > -            {
> > > -                Name (_SUN, 0x11)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00110000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S90)
> > > -            {
> > > -                Name (_SUN, 0x12)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00120000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (S98)
> > > -            {
> > > -                Name (_SUN, 0x13)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00130000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SA0)
> > > -            {
> > > -                Name (_SUN, 0x14)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00140000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SA8)
> > > -            {
> > > -                Name (_SUN, 0x15)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00150000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SB0)
> > > -            {
> > > -                Name (_SUN, 0x16)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00160000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SB8)
> > > -            {
> > > -                Name (_SUN, 0x17)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00170000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SC0)
> > > -            {
> > > -                Name (_SUN, 0x18)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00180000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SC8)
> > > -            {
> > > -                Name (_SUN, 0x19)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x00190000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SD0)
> > > -            {
> > > -                Name (_SUN, 0x1A)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x001A0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SD8)
> > > -            {
> > > -                Name (_SUN, 0x1B)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x001B0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SE0)
> > > -            {
> > > -                Name (_SUN, 0x1C)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x001C0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SE8)
> > > -            {
> > > -                Name (_SUN, 0x1D)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x001D0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SF0)
> > > -            {
> > > -                Name (_SUN, 0x1E)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x001E0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Device (SF8)
> > > -            {
> > > -                Name (_SUN, 0x1F)  // _SUN: Slot User Number
> > > -                Name (_ADR, 0x001F0000)  // _ADR: Address
> > > -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > -                {
> > > -                    PCEJ (BSEL, _SUN)
> > > -                }
> > > -            }
> > > -
> > > -            Method (DVNT, 2, NotSerialized)
> > > -            {
> > > -                If ((Arg0 & 0x10))
> > > -                {
> > > -                    Notify (S20, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x20))
> > > -                {
> > > -                    Notify (S28, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x40))
> > > -                {
> > > -                    Notify (S30, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x80))
> > > -                {
> > > -                    Notify (S38, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x0100))
> > > -                {
> > > -                    Notify (S40, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x0200))
> > > -                {
> > > -                    Notify (S48, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x0400))
> > > -                {
> > > -                    Notify (S50, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x0800))
> > > -                {
> > > -                    Notify (S58, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x1000))
> > > -                {
> > > -                    Notify (S60, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x2000))
> > > -                {
> > > -                    Notify (S68, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x4000))
> > > -                {
> > > -                    Notify (S70, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x8000))
> > > -                {
> > > -                    Notify (S78, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x00010000))
> > > -                {
> > > -                    Notify (S80, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x00020000))
> > > -                {
> > > -                    Notify (S88, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x00040000))
> > > -                {
> > > -                    Notify (S90, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x00080000))
> > > -                {
> > > -                    Notify (S98, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x00100000))
> > > -                {
> > > -                    Notify (SA0, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x00200000))
> > > -                {
> > > -                    Notify (SA8, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x00400000))
> > > -                {
> > > -                    Notify (SB0, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x00800000))
> > > -                {
> > > -                    Notify (SB8, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x01000000))
> > > -                {
> > > -                    Notify (SC0, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x02000000))
> > > -                {
> > > -                    Notify (SC8, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x04000000))
> > > -                {
> > > -                    Notify (SD0, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x08000000))
> > > -                {
> > > -                    Notify (SD8, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x10000000))
> > > -                {
> > > -                    Notify (SE0, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x20000000))
> > > -                {
> > > -                    Notify (SE8, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x40000000))
> > > -                {
> > > -                    Notify (SF0, Arg1)
> > > -                }
> > > -
> > > -                If ((Arg0 & 0x80000000))
> > > -                {
> > > -                    Notify (SF8, Arg1)
> > > -                }
> > > -            }
> > > -
> > > -            Method (PCNT, 0, NotSerialized)
> > > -            {
> > > -                BNUM = Zero
> > > -                DVNT (PCIU, One)
> > > -                DVNT (PCID, 0x03)
> > > -            }
> > >          }
> > >      }
> > >  }
> > >


