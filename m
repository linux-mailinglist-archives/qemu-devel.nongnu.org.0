Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9F44251BE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 13:09:57 +0200 (CEST)
Received: from localhost ([::1]:51746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYRHg-00084W-9d
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 07:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mYRFS-0005yv-TK
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mYRFM-0000bI-Mv
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633604851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FhqDW2suxgEWABdIksMIpodw73dIyvAhv0sQjHODdLo=;
 b=cMJcdHs5RBsH+f/tSU8776p/HgPGGlQx7O2K6Inf71ubFSRDsGdM7NpIUkIS1gf1x4G+Hm
 1eE1R4fLDXzmKd4gMnc7E/l8PctIt1Q3xyjFHKmNszWIag59tHNNaC2LCMJUvGDnCBJ+gS
 ikxmg5B4907CBpBrSfBcS+Tqsvl3TFc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-TJa3mdQNOvmX0CZfnaNm7Q-1; Thu, 07 Oct 2021 07:07:30 -0400
X-MC-Unique: TJa3mdQNOvmX0CZfnaNm7Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso4387110wrg.1
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 04:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FhqDW2suxgEWABdIksMIpodw73dIyvAhv0sQjHODdLo=;
 b=xjM5j8/iipLXH87eN33SHKq/3xvhgAMn6oMFVFFZkISj3L/QBTvnf1oNEE9HjWd2Ro
 3qvfaj/FCK0XgEaGaYAaNnITajaD5yuNri8qtJnokocwKZGGFwHs6OgseZ78bes9SeJs
 7KmI58iJTdMWipunnXDhArFW5taMi/sn3vuZbn8t6wOGqj7hGq8OCIlqZwtNH8dxHu9h
 cg+k7Cv/IMqsosfRngviquIUprn7r+qnYJwQmOsNR++H5IiL5B0fR9i5fJVyqBJZBVbq
 KQlNRAjPN6PIAINt/suARzHKJUf4CDuSLzwjg02L8gMlO0+G9YWlZliC7eUc53EeBsZE
 IIcQ==
X-Gm-Message-State: AOAM533clodFF2HK/cmJWcIt8FH7DSIgvGPo2nlT0UBLJcjmEfX8RSYp
 GYbstAWbmlZm8pAXwMAJ4X0FNvPRF6HR9EXpNyG9YYjGe/tbKTWmaKNcxbnO507VeWUOgKvfMPY
 3RMU/wanPJDUzEtI=
X-Received: by 2002:a05:600c:3b26:: with SMTP id
 m38mr3880423wms.176.1633604849263; 
 Thu, 07 Oct 2021 04:07:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf6XAV10H4i4rDeglKj7pLl59HDRWqGRas40WIKp8v+9jc9LdUol7ggOLjQ6d7iEdwglb6TA==
X-Received: by 2002:a05:600c:3b26:: with SMTP id
 m38mr3880399wms.176.1633604848981; 
 Thu, 07 Oct 2021 04:07:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id r19sm7575967wmp.43.2021.10.07.04.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 04:07:28 -0700 (PDT)
Date: Thu, 7 Oct 2021 13:07:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 2/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Message-ID: <20211007130727.475c15c7@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2110071345060.820442@anisinha-lenovo>
References: <20210920070047.3937292-1-ani@anisinha.ca>
 <20210920070047.3937292-3-ani@anisinha.ca>
 <20211007100700.327f1162@redhat.com>
 <alpine.DEB.2.22.394.2110071345060.820442@anisinha-lenovo>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Oct 2021 13:45:36 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Thu, 7 Oct 2021, Igor Mammedov wrote:
> 
> > On Mon, 20 Sep 2021 12:30:46 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> >  
> > > commit d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
> > > added ACPI hotplug descriptions for cold plugged bridges for functions other
> > > than 0. For all other devices, the ACPI hotplug descriptions are limited to
> > > function 0 only. This change adds unit tests for this feature.
> > >
> > > This test adds the following devices to qemu and then checks the changes
> > > introduced in the DSDT table due to the addition of the following devices:
> > >
> > > (a) a multifunction bridge device
> > > (b) a bridge device with function 1
> > > (c) a non-bridge device with function 2
> > >
> > > In the DSDT table, we should see AML hotplug descriptions for (a) and (b).
> > > For (a) we should find a hotplug AML description for function 0.
> > >
> > > The following diff compares the DSDT table AML with the new unit test before
> > > and after the change d7346e614f4ec is introduced. In other words,
> > > this diff reflects the changes that occurs in the DSDT table due to the change
> > > d7346e614f4ec .
> > >
> > > @@ -5,13 +5,13 @@
> > >   *
> > >   * Disassembling to symbolic ASL+ operators
> > >   *
> > > - * Disassembly of /tmp/aml-7A7890, Sat Sep 18 13:13:29 2021
> > > + * Disassembly of /tmp/aml-PE4S90, Sat Sep 18 13:08:54 2021
> > >   *
> > >   * Original Table Header:
> > >   *     Signature        "DSDT"
> > > - *     Length           0x0000206A (8298)
> > > + *     Length           0x000020F3 (8435)
> > >   *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
> > > - *     Checksum         0x59
> > > + *     Checksum         0x1B
> > >   *     OEM ID           "BOCHS "
> > >   *     OEM Table ID     "BXPC    "
> > >   *     OEM Revision     0x00000001 (1)
> > > @@ -20,28 +20,6 @@
> > >   */
> > >  DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
> > >  {
> > > -    /*
> > > -     * iASL Warning: There was 1 external control method found during
> > > -     * disassembly, but only 0 were resolved (1 unresolved). Additional
> > > -     * ACPI tables may be required to properly disassemble the code. This
> > > -     * resulting disassembler output file may not compile because the
> > > -     * disassembler did not know how many arguments to assign to the
> > > -     * unresolved methods. Note: SSDTs can be dynamically loaded at
> > > -     * runtime and may or may not be available via the host OS.
> > > -     *
> > > -     * In addition, the -fe option can be used to specify a file containing
> > > -     * control method external declarations with the associated method
> > > -     * argument counts. Each line of the file must be of the form:
> > > -     *     External (<method pathname>, MethodObj, <argument count>)
> > > -     * Invocation:
> > > -     *     iasl -fe refs.txt -d dsdt.aml
> > > -     *
> > > -     * The following methods were unresolved and many not compile properly
> > > -     * because the disassembler had to guess at the number of arguments
> > > -     * required for each:
> > > -     */
> > > -    External (_SB_.PCI0.S09_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
> > > -
> > >      Scope (\)
> > >      {
> > >          OperationRegion (DBG, SystemIO, 0x0402, One)
> > > @@ -3280,9 +3258,45 @@
> > >                  }
> > >              }
> > >
> > > +            Device (S09)
> > > +            {
> > > +                Name (_ADR, 0x00010001)  // _ADR: Address
> > > +                Name (BSEL, Zero)
> > > +                Device (S00)
> > > +                {
> > > +                    Name (_SUN, Zero)  // _SUN: Slot User Number
> > > +                    Name (_ADR, Zero)  // _ADR: Address
> > > +                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > +                    {
> > > +                        PCEJ (BSEL, _SUN)
> > > +                    }
> > > +
> > > +                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
> > > +                    {
> > > +                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
> > > +                    }
> > > +                }
> > > +
> > > +                Method (DVNT, 2, NotSerialized)
> > > +                {
> > > +                    If ((Arg0 & One))
> > > +                    {
> > > +                        Notify (S00, Arg1)
> > > +                    }
> > > +                }
> > > +
> > > +                Method (PCNT, 0, NotSerialized)
> > > +                {
> > > +                    BNUM = Zero
> > > +                    DVNT (PCIU, One)
> > > +                    DVNT (PCID, 0x03)
> > > +                }
> > > +            }
> > > +
> > >              Method (PCNT, 0, NotSerialized)
> > >              {
> > > -                ^S09.PCNT (^S08.PCNT ())
> > > +                ^S09.PCNT ()
> > > +                ^S08.PCNT ()
> > >              }
> > >          }
> > >      }
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  tests/qtest/bios-tables-test.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > index 4f11d03055..d4cd77ea02 100644
> > > --- a/tests/qtest/bios-tables-test.c
> > > +++ b/tests/qtest/bios-tables-test.c
> > > @@ -859,6 +859,23 @@ static void test_acpi_q35_tcg_bridge(void)
> > >      free_test_data(&data);
> > >  }
> > >
> > > +static void test_acpi_q35_multif_bridge(void)
> > > +{
> > > +    test_data data = {
> > > +        .machine = MACHINE_Q35,
> > > +        .variant = ".multi-bridge",
> > > +    };
> > > +    test_acpi_one("-nodefaults -device pcie-root-port,id=pcie-root-port-0,"  
> >
> > what's the reason for using "-nodefaults" here?  
> 
> I have tried to use the same commandline that commit d7346e614f4ec
> mentions as the repro case for the issue.

if test can work without 'nodefaults', it would be better as it
introduces not related diff hunk in the following patch.

Other than that patch looks good to me.

> 
> 
> >  
> > > +                  "multifunction=on,"
> > > +                  "port=0x0,chassis=1,addr=0x1,bus=pcie.0 "
> > > +                  "-device pcie-root-port,id=pcie-root-port-1,"
> > > +                  "port=0x1,chassis=2,addr=0x1.0x1,bus=pcie.0 "
> > > +                  "-device virtio-balloon,id=balloon0,"
> > > +                  "bus=pcie.0,addr=0x1.0x2",
> > > +                  &data);
> > > +    free_test_data(&data);
> > > +}
> > > +
> > >  static void test_acpi_q35_tcg_mmio64(void)
> > >  {
> > >      test_data data = {
> > > @@ -1534,6 +1551,7 @@ int main(int argc, char *argv[])
> > >                         test_acpi_piix4_no_acpi_pci_hotplug);
> > >          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> > >          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> > > +        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> > >          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> > >          qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> > >          qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);  
> >
> >  
> 


