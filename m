Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4C26B6029
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 20:24:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pb4nf-0005qz-Bg; Sat, 11 Mar 2023 14:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pb4nd-0005qn-EP
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 14:22:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pb4nb-0002hO-99
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 14:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678562553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTKMMoNAyCoP8zOIIf8MV/K+beQLPh2Got4aAEYWrHo=;
 b=Nzqs953HqRzGu6cga3QmSBhq68VLYFKrHwXhf2EjXLoOK8K6dH8L7E22sYUzRoEMPqJl0G
 OA2NqPQnb6v//Gbm5Y2u1fyFi/YXhKBFpRAJTl+AyvoXmtujeC9W/cE9XTuvGETFa0GKB4
 kPV4mAIIKesifdjMox9GhdIJqf0XQpg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-3zgONi8vNSSzZc4qBOqo8g-1; Sat, 11 Mar 2023 14:22:31 -0500
X-MC-Unique: 3zgONi8vNSSzZc4qBOqo8g-1
Received: by mail-wm1-f71.google.com with SMTP id
 fc11-20020a05600c524b00b003ed1fa46d1dso43307wmb.1
 for <qemu-devel@nongnu.org>; Sat, 11 Mar 2023 11:22:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678562550;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RTKMMoNAyCoP8zOIIf8MV/K+beQLPh2Got4aAEYWrHo=;
 b=mSUk09XlGK8l+UwWJjYIpsl5k6kkn/xIg5pb8zsSpkd5WQd4k6erOzzxbI5r3a7oiS
 IFSvQ8J8RZ0kpFFT6HzSB2JCVo388brGJOtwA0bP/PXto3Icf1hXAYBqdU5CtFYguQ4j
 xQaA+uVZzuf4dMwc5chGBF3ea5dsQIZmAveM0zP6/zOcVSDNBwOeBYF+0lVqdM8hQmWN
 kJN9GFNNFvaDeZlQ7IGpsvAFF06kXotby3d4TSrr5Z+9bNsB1vTUHBsBsEIg4X5dFUa6
 s0YTyxrKL7aWsSvClZ6RHhpOqmQiF0Hi8YdHfAOtdyytT9KtC+Bk99Z6LOCKYQMzkN7U
 XOkw==
X-Gm-Message-State: AO0yUKXjZ97cfS70LgLnxkAi6fgLsyNKP6Pt2MGh084fZ+ZacEeCLN+T
 KIp2PTOcWBaykgiE2NNT44giJS5tp6rhPLoKrYFzd4RHBib3pcyD2TTZz9cO0Yq7AzfMGRV195e
 rg26/bhqxhkaUGDA=
X-Received: by 2002:a05:600c:310d:b0:3eb:3945:d405 with SMTP id
 g13-20020a05600c310d00b003eb3945d405mr6427072wmo.38.1678562550308; 
 Sat, 11 Mar 2023 11:22:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8HtPW+UoARo7e7Lg32Huh4ndC0l/naZx/eBUWE7UIDXDJqgeuoYT8AwESBkDeEsV+vaxfiTg==
X-Received: by 2002:a05:600c:310d:b0:3eb:3945:d405 with SMTP id
 g13-20020a05600c310d00b003eb3945d405mr6427059wmo.38.1678562549974; 
 Sat, 11 Mar 2023 11:22:29 -0800 (PST)
Received: from redhat.com ([2.52.29.35]) by smtp.gmail.com with ESMTPSA id
 j2-20020a5d6042000000b002c71703876bsm3137528wrt.14.2023.03.11.11.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 11:22:29 -0800 (PST)
Date: Sat, 11 Mar 2023 14:22:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/73] virtio,pc,pci: features, fixes
Message-ID: <20230311141858-mutt-send-email-mst@kernel.org>
References: <cover.1678237635.git.mst@redhat.com>
 <20230309094647-mutt-send-email-mst@kernel.org>
 <CAFEAcA-pO1OYwO8PZwSjFiLX=MJcK+cYqtFqaF3ZZtTGdZ_EXw@mail.gmail.com>
 <dbc5dad7-0bb7-e947-60f8-84b6ff5a2dde@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbc5dad7-0bb7-e947-60f8-84b6ff5a2dde@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Fri, Mar 10, 2023 at 11:20:36PM +0100, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 10/3/23 18:32, Peter Maydell wrote:
> > On Thu, 9 Mar 2023 at 14:47, Michael S. Tsirkin <mst@redhat.com> wrote:
> 
> > > I moved it one commit back, now at (96cb085897)
> > > Cornelia posted some concerns about the last commit.
> > > 
> > > > ----------------------------------------------------------------
> > > > virtio,pc,pci: features, fixes
> > > > 
> > > > Several features that landed at the last possible moment:
> > > > 
> > > > Passthrough HDM decoder emulation
> > > > Refactor cryptodev
> > > > RAS error emulation and injection
> > > > acpi-index support on non-hotpluggable slots
> > > > Dynamically switch to vhost shadow virtqueues at vdpa net migration
> > > > 
> > > > Plus a couple of bugfixes that look important to have in the release.
> > > > 
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > 
> > 
> > 
> > Applied, thanks.
> 
> I'm getting this failure on Darwin (m1):
> 
> C compiler for the host machine: clang (clang 14.0.0 "Apple clang version
> 14.0.0 (clang-1400.0.29.202)")
> Program iasl found: YES (/opt/homebrew/bin/iasl)
> 
> $ make check-qtest-i386 V=1
>  ...
>  3/61 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test ERROR
> 17.52s   killed by signal 6 SIGABRT
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> ✀ ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> acpi-test: Warning! DSDT binary file mismatch. Actual
> [aml:/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/aml-HANQ11], Expected
> [aml:tests/data/acpi/pc/DSDT.nosmm].

Philippe, is tests/data/acpi/DSDT.nosmm in your tree for some reason?
Because it's not in mine:
$ git log -- tests/data/acpi/DSDT.nosmm


It's a side effect of how our tests work ATM that a presence of
a corrupted file in the source directory will confuse the test
and make it fail, and git reset will not be enough since some
of these can be untracked - you need git clean.



> See source file tests/qtest/bios-tables-test.c for instructions on how to
> update expected files.
> acpi-test: Warning! DSDT mismatch. Actual
> [asl:/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/asl-1CNQ11.dsl,
> aml:/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/aml-HANQ11], Expected
> [asl:/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/asl-XXGQ11.dsl,
> aml:tests/data/acpi/pc/DSDT.nosmm].
> --- /var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/asl-XXGQ11.dsl
> 2023-03-10 23:16:19
> +++ /var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/asl-1CNQ11.dsl
> 2023-03-10 23:16:19
> @@ -1,30 +1,30 @@
>  /*
>   * Intel ACPI Component Architecture
>   * AML/ASL+ Disassembler version 20221020 (64-bit version)
>   * Copyright (c) 2000 - 2022 Intel Corporation
>   *
>   * Disassembling to symbolic ASL+ operators
>   *
> - * Disassembly of tests/data/acpi/pc/DSDT.nosmm, Fri Mar 10 23:16:19 2023
> + * Disassembly of
> /var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/aml-HANQ11, Fri Mar 10
> 23:16:19 2023
>   *
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x000018D8 (6360)
> + *     Length           0x00001958 (6488)
>   *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
> - *     Checksum         0xCE
> + *     Checksum         0xAF
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPC    "
>   *     OEM Revision     0x00000001 (1)
>   *     Compiler ID      "BXPC"
>   *     Compiler Version 0x00000001 (1)
>   */
>  DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
>  {
>      Scope (\)
>      {
>          OperationRegion (DBG, SystemIO, 0x0402, One)
>          Field (DBG, ByteAcc, NoLock, Preserve)
>          {
>              DBGB,   8
>          }
> 
> @@ -38,32 +38,66 @@
>              {
>                  DBGB = DerefOf (Local0 [Local2])
>                  Local2++
>              }
> 
>              DBGB = 0x0A
>          }
>      }
> 
>      Scope (_SB)
>      {
>          Device (PCI0)
>          {
>              Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID:
> Hardware ID
>              Name (_ADR, Zero)  // _ADR: Address
>              Name (_UID, Zero)  // _UID: Unique ID
> +            Method (EDSM, 5, Serialized)
> +            {
> +                If ((Arg2 == Zero))
> +                {
> +                    Local0 = Buffer (One)
> +                        {
> +                             0x00       // .
> +                        }
> +                    If ((Arg0 != ToUUID
> ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
> +                    {
> +                        Return (Local0)
> +                    }
> +
> +                    If ((Arg1 < 0x02))
> +                    {
> +                        Return (Local0)
> +                    }
> +
> +                    Local0 [Zero] = 0x81
> +                    Return (Local0)
> +                }
> +
> +                If ((Arg2 == 0x07))
> +                {
> +                    Local0 = Package (0x02)
> +                        {
> +                            Zero,
> +                            ""
> +                        }
> +                    Local1 = DerefOf (Arg4 [Zero])
> +                    Local0 [Zero] = Local1
> +                    Return (Local0)
> +                }
> +            }
>          }
>      }
> 
>      Scope (_SB.PCI0)
>      {
>          OperationRegion (PCST, SystemIO, 0xAE00, 0x08)
>          Field (PCST, DWordAcc, NoLock, WriteAsZeros)
>          {
>              PCIU,   32,
>              PCID,   32
>          }
> 
>          OperationRegion (SEJ, SystemIO, 0xAE08, 0x04)
>          Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
>          {
>              B0EJ,   32
> @@ -91,43 +125,43 @@
>              Acquire (BLCK, 0xFFFF)
>              BNUM = Arg0
>              PIDX = (One << Arg1)
>              Local0 = PIDX /* \_SB_.PCI0.PIDX */
>              Release (BLCK)
>              Return (Local0)
>          }
> 
>          Method (PDSM, 5, Serialized)
>          {
>              If ((Arg2 == Zero))
>              {
>                  Local0 = Buffer (One)
>                      {
>                           0x00    // .
>                      }
> -                Local1 = Zero
>                  If ((Arg0 != ToUUID
> ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
>                  {
>                      Return (Local0)
>                  }
> 
>                  If ((Arg1 < 0x02))
>                  {
>                      Return (Local0)
>                  }
> 
> +                Local1 = Zero
>                  Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
>                      ))
>                  If (!((Local2 == Zero) | (Local2 == 0xFFFFFFFF)))
>                  {
>                      Local1 |= One
>                      Local1 |= (One << 0x07)
>                  }
> 
>                  Local0 [Zero] = Local1
>                  Return (Local0)
>              }
> 
>              If ((Arg2 == 0x07))
>              {
>                  Local0 = Package (0x02)
>                      {
> @@ -915,32 +949,42 @@
> 
>                  Device (RTC)
>                  {
>                      Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock
> */)  // _HID: Hardware ID
>                      Name (_CRS, ResourceTemplate ()  // _CRS: Current
> Resource Settings
>                      {
>                          IO (Decode16,
>                              0x0070,             // Range Minimum
>                              0x0070,             // Range Maximum
>                              0x01,               // Alignment
>                              0x08,               // Length
>                              )
>                          IRQNoFlags ()
>                              {8}
>                      })
>                  }
> +            }
> +
> +            Device (S09)
> +            {
> +                Name (_ADR, 0x00010001)  // _ADR: Address
> +            }
> +
> +            Device (S0B)
> +            {
> +                Name (_ADR, 0x00010003)  // _ADR: Address
>              }
> 
>              Device (S10)
>              {
>                  Name (_ADR, 0x00020000)  // _ADR: Address
>                  Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
>                  {
>                      Return (Zero)
>                  }
> 
>                  Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
>                  {
>                      Return (Zero)
>                  }
> 
>                  Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
> **
> ERROR:../../tests/qtest/bios-tables-test.c:536:test_acpi_asl: assertion
> failed: (all_tables_match)
> 
> (test program exited with status code -6)
> 
> FYI:
> 
> $ iasl -v
> 
> Intel ACPI Component Architecture
> ASL+ Optimizing Compiler/Disassembler version 20221020
> Copyright (c) 2000 - 2022 Intel Corporation
> 
> Regards,
> 
> Phil.
> 


