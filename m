Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142EB40F93B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:34:18 +0200 (CEST)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRE0O-0007lw-Kd
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mRDzH-00076G-0C
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:33:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mRDzD-0001VC-Uz
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631885582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqTjgGExYuMWa5VYnzKHjcg6DfBfOj+HgYYzmSvoc10=;
 b=BzREYgAmL0NVJgaP+fyn4Uetunizp0aADX9DUbsUU7CFhOj8DGAAAiAUFXfHsHvdelfbdT
 nQfYfexEABB7zB6Ki5PlADAHInfVq9bpa8/PKCAukEjkIl88gq4/l0pHGGIqcB5fxBJauY
 WwVeZsTENBXGNj6SMYpCU1wVE+SDExw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-l1ZR8_3LNLql755482-QuQ-1; Fri, 17 Sep 2021 09:32:51 -0400
X-MC-Unique: l1ZR8_3LNLql755482-QuQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x14-20020a50ba8e000000b003d5a565de3aso8117140ede.18
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 06:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oqTjgGExYuMWa5VYnzKHjcg6DfBfOj+HgYYzmSvoc10=;
 b=Sjkpk4MWp7mQ3Du7BdOow6ErVBEALZvgFAag2qfsZMaU0vsXc4sI9Vj3bUsCW3EnwX
 A5A4UkImDhBoJbsZzAZ0RPYtFIkR80KUoVvXD7HBRT97L4hbJr61yvIupaqSjKeZia2c
 YNeYm42apUA5gdonGwXkbMzzbdvzsw7mp3KYn8YH29vWukGFuwLkDExgvND85kUKJoMl
 4VkKPJxTRMKRbP5K6dKuetyoNngZJOWdDt19vvo7TriYi0WJ6svs4+xYXMpZwPN69yDl
 6yewZ0s5zVIumgoLVRy01f65+00NQdQULl8WMEA8LErGToBb/NkNAyvavCIHanBWRW2r
 X+mA==
X-Gm-Message-State: AOAM532L7OCmBkpwMbgUL6RrJcjsIre/Beu3jp17UoX3Y7iaAwW5Po7G
 qGxTp1r4We6Ldn/iNGW9LsrsPTl+nRkxW+fobFGXsAkfi0JJKbFm5XYb2egFQbpZW1Vqm1ga2lm
 Hjacra0bQEZC9vMA=
X-Received: by 2002:a50:bec4:: with SMTP id e4mr5820252edk.91.1631885570433;
 Fri, 17 Sep 2021 06:32:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi9RIWXWGQaazyr6IVu6VCzC2lu7gNKUvi46AtujnIZs5bUriJXbmzAq+nQKuRmins5yZIFQ==
X-Received: by 2002:a50:bec4:: with SMTP id e4mr5820232edk.91.1631885570105;
 Fri, 17 Sep 2021 06:32:50 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id t10sm2266991ejf.15.2021.09.17.06.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 06:32:49 -0700 (PDT)
Date: Fri, 17 Sep 2021 15:32:48 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [RFC PATCH] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Message-ID: <20210917153248.6ef88697@redhat.com>
In-Reply-To: <20210806174642.490023-2-ani@anisinha.ca>
References: <20210806174642.490023-1-ani@anisinha.ca>
 <20210806174642.490023-2-ani@anisinha.ca>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  6 Aug 2021 23:16:42 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> commit d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
> added ACPI hotplug descriptions for cold plugged bridges for functions other
> than 0. For all other devices, the ACPI hotplug descriptions are limited to
> function 0 only. This change adds unit tests for this feature.
> 
> The diff of ACPI DSDT table before and after the change d7346e614f4e with the
> same newly added unit test is provided below:

ASL below should be updated to match actual diff it's spewing out
(I get more than it mentioned below)

> @@ -5,13 +5,13 @@
>   *
>   * Disassembling to symbolic ASL+ operators
>   *
> - * Disassembly of /tmp/aml-35UR70, Fri Aug  6 21:00:03 2021
> + * Disassembly of /tmp/aml-GY8760, Fri Aug  6 21:10:31 2021
>   *
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x0000206A (8298)
> + *     Length           0x000020F3 (8435)
>   *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
> - *     Checksum         0x59
> + *     Checksum         0x1B
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPC    "
>   *     OEM Revision     0x00000001 (1)
> @@ -20,28 +20,6 @@
>   */
>  DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
>  {
> -    /*
> -     * iASL Warning: There was 1 external control method found during
> -     * disassembly, but only 0 were resolved (1 unresolved). Additional
> -     * ACPI tables may be required to properly disassemble the code. This
> -     * resulting disassembler output file may not compile because the
> -     * disassembler did not know how many arguments to assign to the
> -     * unresolved methods. Note: SSDTs can be dynamically loaded at
> -     * runtime and may or may not be available via the host OS.
> -     *
> -     * In addition, the -fe option can be used to specify a file containing
> -     * control method external declarations with the associated method
> -     * argument counts. Each line of the file must be of the form:
> -     *     External (<method pathname>, MethodObj, <argument count>)
> -     * Invocation:
> -     *     iasl -fe refs.txt -d dsdt.aml
> -     *
> -     * The following methods were unresolved and many not compile properly
> -     * because the disassembler had to guess at the number of arguments
> -     * required for each:
> -     */
> -    External (_SB_.PCI0.S09_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
> -
>      Scope (\)
>      {
>          OperationRegion (DBG, SystemIO, 0x0402, One)
> @@ -3280,9 +3258,45 @@
>                  }
>              }
> 
> +            Device (S09)
> +            {
> +                Name (_ADR, 0x00010001)  // _ADR: Address
> +                Name (BSEL, Zero)
> +                Device (S00)
> +                {
> +                    Name (_SUN, Zero)  // _SUN: Slot User Number
> +                    Name (_ADR, Zero)  // _ADR: Address
> +                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> +                    {
> +                        PCEJ (BSEL, _SUN)
> +                    }
> +
> +                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
> +                    {
> +                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
> +                    }
> +                }
> +
> +                Method (DVNT, 2, NotSerialized)
> +                {
> +                    If ((Arg0 & One))
> +                    {
> +                        Notify (S00, Arg1)
> +                    }
> +                }
> +
> +                Method (PCNT, 0, NotSerialized)
> +                {
> +                    BNUM = Zero
> +                    DVNT (PCIU, One)
> +                    DVNT (PCID, 0x03)
> +                }
> +            }
> +
>              Method (PCNT, 0, NotSerialized)
>              {
> -                ^S09.PCNT (^S08.PCNT ())
> +                ^S09.PCNT ()
> +                ^S08.PCNT ()
>              }
>          }
>      }
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/qtest/bios-tables-test.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 51d3a4e239..c92b70e8b8 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -859,6 +859,33 @@ static void test_acpi_q35_tcg_bridge(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_q35_multif_bridge(void)
> +{
> +    test_data data = {
> +        .machine = MACHINE_Q35,
> +        .variant = ".multi-bridge",

> +        .required_struct_types = base_required_struct_types,
> +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types)
do we care, i.e. why is this here?

> +    };
> +    /*
> +     * lets try three things:
s/try .../test following configuration/

> +     * (a) a multifunction bridge device
> +     * (b) a bridge device with function 1
> +     * (c) a non-bridge device with function 2
> +     * We should see AML hotplug descriptions for (a) and (b) in DSDT.
> +     * For (a) it should have a hotplug AML description for function 0.
> +     */

A little bit hard to parse this comment, maybe explain a bit more
what is being tested
also I'd move this comment into commit message

> +    test_acpi_one("-nodefaults -device pcie-root-port,id=pcie-root-port-0,"
> +                  "multifunction=on,"
> +                  "port=0x0,chassis=1,addr=0x1,bus=pcie.0 "
> +                  "-device pcie-root-port,id=pcie-root-port-1,"
> +                  "port=0x1,chassis=2,addr=0x1.0x1,bus=pcie.0 "
> +                  "-device virtio-balloon,id=balloon0,"
> +                  "bus=pcie.0,addr=0x1.0x2",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_tcg_mmio64(void)
>  {
>      test_data data = {
> @@ -1528,6 +1555,7 @@ int main(int argc, char *argv[])
>                         test_acpi_piix4_no_acpi_pci_hotplug);
>          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
>          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> +        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
>          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
>          qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
>          qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);


