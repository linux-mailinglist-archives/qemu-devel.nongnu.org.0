Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690E06D2571
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 18:26:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piHZU-0006ZI-Kg; Fri, 31 Mar 2023 12:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1piHZS-0006Yx-D0
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1piHZQ-0004wh-47
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680279943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1z/xKDEepmtzoVL5Vw/+Vhr34qLFw8UK3I2Lqi6kE7s=;
 b=Hs3Czi9wTct9bjdJmIj2+EsJDURvc/V1LqaTmJELk6zAeT+hhCIhye9fd8RNsW/3a5n3bx
 1cWLt4aodd7qR355AQNLDef1VRJJtkGZQjXM6lYy/MbiYzQMZWD303e2/ZF+geB/+3qvIR
 ZJi5EDZLO2M8CkKIlCCyQjS9G3HoT1c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-mgjURDv_Oliqq7rwTz7XOQ-1; Fri, 31 Mar 2023 12:25:41 -0400
X-MC-Unique: mgjURDv_Oliqq7rwTz7XOQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 k14-20020a508ace000000b005024a8cef5cso21616957edk.22
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 09:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680279940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1z/xKDEepmtzoVL5Vw/+Vhr34qLFw8UK3I2Lqi6kE7s=;
 b=teBYW57CsYwxZzWSQU0M4ApcBX7rdqpwYRqRbkK2Qqo+4i5LpVkudpPCi0zQCi2Iv2
 oq4cqIRBmuoUBXjIgyGQxqqOm7fEcalYa72akiIbekiIRUGxliCWZA1UznIjMEsYPILe
 xaSP7sVVTPicKvZkjCG7oDSRQcNGK4yFlFCqBGWMR49Q/+WLtvl2xEEJ3709JxlN01OH
 odg7cAj5HxwWQcVWPWerbQdUVWRKKNP3nLARKQeOiZ6F6DfNYDPyytuj+36GHogVhh9v
 0IzXqXtpyV8JXxwaQvNaK1NKSoR1MjYjf6ql/pfBwS3bvyI9lJd2coe5tfwDNNTB7ufn
 lt8Q==
X-Gm-Message-State: AAQBX9dhec23rdjFtVp9mvcxn9+pkfhw5E9OdhVFtKk9oJrxpVrZ0OoY
 AwYnmMeaqZgqEod/RkMDvJCf11x5WKZuPkbDPdRmlRmfR2x6HvoSS4+w9ZH0r566sXYCtrX27Fk
 MKMkmXiIWh7hwT7M=
X-Received: by 2002:aa7:d815:0:b0:4fd:2533:f56 with SMTP id
 v21-20020aa7d815000000b004fd25330f56mr25270544edq.39.1680279940531; 
 Fri, 31 Mar 2023 09:25:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350a+0fdUG3KiKuOV+SF96WPvmrE1WcqnBUa1Pu1/3DTuLgPi7s8rKQlGcL1sJZog7PGvilW32w==
X-Received: by 2002:aa7:d815:0:b0:4fd:2533:f56 with SMTP id
 v21-20020aa7d815000000b004fd25330f56mr25270530edq.39.1680279940190; 
 Fri, 31 Mar 2023 09:25:40 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 m9-20020a50c189000000b004fd2aab4953sm1227587edf.45.2023.03.31.09.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 09:25:39 -0700 (PDT)
Date: Fri, 31 Mar 2023 18:25:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eric DeVolder <eric.devolder@oracle.com>, shannon.zhaosl@gmail.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
Message-ID: <20230331182538.15980cc9@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230329124442-mutt-send-email-mst@kernel.org>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
 <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
 <20230329124442-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Wed, 29 Mar 2023 12:47:05 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Mar 29, 2023 at 08:14:37AM -0500, Eric DeVolder wrote:
> > 
> > 
> > On 3/29/23 00:19, Michael S. Tsirkin wrote:  
> > > Hmm I don't think we can reasonably make such a change for 8.0.
> > > Seems too risky.
> > > Also, I feel we want to have an internal (with "x-" prefix") flag to
> > > revert to old behaviour, in case of breakage on some guests.  and maybe
> > > we want to keep old revision for old machine types.  
> > Ok, what option name, for keeping old behavior, would you like?  
> 
> Don't much care. x-madt-rev?

if it works fine (cold & hot-plug) with older linux/windows guests
I'd rather avoid adding compat knob (we typically do that in ACPI tables
only when change breaks something).

(as old guest I'd define WinXP sp3 (/me wonders if we  still care about
dead EOLed OS) perhaps WS2008 would be a better minimum target these days
and RHEL6 (or some older ACPI enabled kernel with hotplug support))

> 
> > > 
> > > 
> > > On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:  
> > > > The following Linux kernel change broke CPU hotplug for MADT revision
> > > > less than 5.
> > > > 
> > > >   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")  
> > > 
> > > Presumably it's being fixed? Link to discussion? Patch fixing that in
> > > Linux?  
> > 
> > https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t  
> 
> Great! Maybe stick a Link: tag in the commit log.

So it's guest bug which is in process of being fixed.
(i.e. QEMU technically correct as long as MADT revision < 5)

In this case I'd not touch x86 MADT at all (It should be upto
downstream distros to fix guest kernel).

Probably the same applies to ARM variant
i.e. we should bump rev only when current one gets in the way
(aka we are pulling in new fields/definitions from new version)

   
> > > > As part of the investigation into resolving this breakage, I learned
> > > > that i386 QEMU reports revision 1, while technically it is at revision 3.
> > > > (Arm QEMU reports revision 4, and that is valid/correct.)
> > > > 
> > > > ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
> > > > flag that the above Linux patch utilizes to denote hot pluggable CPUs.
> > > > 
> > > > So in order to bump MADT to the current revision of 5, need to
> > > > validate that all MADT table changes between 1 and 5 are present
> > > > in QEMU.
> > > > 
> > > > Below is a table summarizing the changes to the MADT. This information
> > > > gleamed from the ACPI specs on uefi.org.
> > > > 
> > > > ACPI    MADT    What
> > > > Version Version
> > > > 1.0             MADT not present
> > > > 2.0     1       Section 5.2.10.4
> > > > 3.0     2       Section 5.2.11.4
> > > >                   5.2.11.13 Local SAPIC Structure added two new fields:
> > > >                    ACPI Processor UID Value
> > > >                    ACPI Processor UID String
> > > >                   5.2.10.14 Platform Interrupt Sources Structure:
> > > >                    Reserved changed to Platform Interrupt Sources Flags
> > > > 3.0b    2       Section 5.2.11.4
> > > >                   Added a section describing guidelines for the ordering of
> > > >                   processors in the MADT to support proper boot processor
> > > >                   and multi-threaded logical processor operation.
> > > > 4.0     3       Section 5.2.12
> > > >                   Adds Processor Local x2APIC structure type 9
> > > >                   Adds Local x2APIC NMI structure type 0xA
> > > > 5.0     3       Section 5.2.12
> > > > 6.0     3       Section 5.2.12
> > > > 6.0a    4       Section 5.2.12
> > > >                   Adds ARM GIC structure types 0xB-0xF
> > > > 6.2a    45      Section 5.2.12   <--- yep it says version 45!
> > > > 6.2b    5       Section 5.2.12
> > > >                   GIC ITS last Reserved offset changed to 16 from 20 (typo)
> > > > 6.3     5       Section 5.2.12
> > > >                   Adds Local APIC Flags Online Capable!
> > > >                   Adds GICC SPE Overflow Interrupt field
> > > > 6.4     5       Section 5.2.12
> > > >                   Adds Multiprocessor Wakeup Structure type 0x10
> > > >                   (change notes says structure previously misplaced?)
> > > > 6.5     5       Section 5.2.12
> > > > 
> > > > For the MADT revision change 1 -> 2, the spec has a change to the
> > > > SAPIC structure. In general, QEMU does not generate/support SAPIC.
> > > > So the QEMU i386 MADT revision can safely be moved to 2.
> > > > 
> > > > For the MADT revision change 2 -> 3, the spec adds Local x2APIC
> > > > structures. QEMU has long supported x2apic ACPI structures. A simple
> > > > search of x2apic within QEMU source and hw/i386/acpi-common.c
> > > > specifically reveals this.  
> > > 
> > > But not unconditionally.  
> > 
> > I don't think that reporting revision 3 requires that generation of x2apic;
> > one could still see apic, x2apic, or sapic in theory. I realize qemu doesn't
> > do sapic...
> >   
> > >   
> > > > So the QEMU i386 MADT revision can safely
> > > > be moved to 3.
> > > > 
> > > > For the MADT revision change 3 -> 4, the spec adds support for the ARM
> > > > GIC structures. QEMU ARM does in fact generate and report revision 4.
> > > > As these will not be used by i386 QEMU, so then the QEMU i386 MADT
> > > > revision can safely be moved to 4 as well.
> > > > 
> > > > Now for the MADT revision change 4 -> 5, the spec adds the Online
> > > > Capable flag to the Local APIC structure, and the ARM GICC SPE
> > > > Overflow Interrupt field.
> > > > 
> > > > For the ARM SPE, an existing 3-byte Reserved field is broken into a 1-
> > > > byte Reserved field and a 2-byte SPE field.  The spec says that is SPE
> > > > Overflow is not supported, it should be zero.
> > > > 
> > > > For the i386 Local APIC flag Online Capable, the spec has certain rules
> > > > about this value. And in particuar setting this value now explicitly
> > > > indicates a hotpluggable CPU.
> > > > 
> > > > So this patch makes the needed changes to move both ARM and i386 MADT
> > > > to revision 5. These are not complicated, thankfully.
> > > > 
> > > > Without these changes, the information below shows "how" CPU hotplug
> > > > breaks with the current upstream Linux kernel 6.3.  For example, a Linux
> > > > guest started with:
> > > > 
> > > >   qemu-system-x86_64 -smp 30,maxcpus=32 ...
> > > > 
> > > > and then attempting to hotplug a CPU:
> > > > 
> > > >    (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0
> > > > 
> > > > fails with the following:
> > > > 
> > > >    APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
> > > >    ACPI: Unable to map lapic to logical cpu number
> > > >    acpi LNXCPU:1e: Enumeration failure
> > > > 
> > > >    # dmesg | grep smpboot
> > > >    smpboot: Allowing 30 CPUs, 0 hotplug CPUs
> > > >    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
> > > >    smpboot: Max logical packages: 1
> > > >    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> > > > 
> > > >    # iasl -d /sys/firmware/tables/acpi/APIC
> > > >    [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
> > > >    [004h 0004   4]                 Table Length : 00000170
> > > >    [008h 0008   1]                     Revision : 01          <=====
> > > >    [009h 0009   1]                     Checksum : 9C
> > > >    [00Ah 0010   6]                       Oem ID : "BOCHS "
> > > >    [010h 0016   8]                 Oem Table ID : "BXPC    "
> > > >    [018h 0024   4]                 Oem Revision : 00000001
> > > >    [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> > > >    [020h 0032   4]        Asl Compiler Revision : 00000001
> > > > 
> > > >    ...
> > > > 
> > > >    [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
> > > >    [115h 0277   1]                       Length : 08
> > > >    [116h 0278   1]                 Processor ID : 1D
> > > >    [117h 0279   1]                Local Apic ID : 1D
> > > >    [118h 0280   4]        Flags (decoded below) : 00000001
> > > >                               Processor Enabled : 1          <=====
> > > > 
> > > >    [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
> > > >    [11Dh 0285   1]                       Length : 08
> > > >    [11Eh 0286   1]                 Processor ID : 1E
> > > >    [11Fh 0287   1]                Local Apic ID : 1E
> > > >    [120h 0288   4]        Flags (decoded below) : 00000000
> > > >                               Processor Enabled : 0          <=====
> > > > 
> > > >    [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
> > > >    [125h 0293   1]                       Length : 08
> > > >    [126h 0294   1]                 Processor ID : 1F
> > > >    [127h 0295   1]                Local Apic ID : 1F
> > > >    [128h 0296   4]        Flags (decoded below) : 00000000
> > > >                               Processor Enabled : 0          <=====
> > > > 
> > > > The (latest upstream) Linux kernel sees 30 Enabled processors, and
> > > > does not consider processors 31 and 32 to be hotpluggable.
> > > > 
> > > > With this patch series applied, by bumping MADT to revision 5, the
> > > > latest upstream Linux kernel correctly identifies 30 CPUs plus 2
> > > > hotpluggable CPUS.
> > > > 
> > > >    CPU30 has been hot-added
> > > >    smpboot: Booting Node 0 Processor 30 APIC 0x1e
> > > >    Will online and init hotplugged CPU: 30
> > > > 
> > > >    # dmesg | grep smpboot
> > > >    smpboot: Allowing 32 CPUs, 2 hotplug CPUs
> > > >    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
> > > >    smpboot: Max logical packages: 2
> > > >    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> > > > 
> > > >    # iasl -d /sys/firmware/tables/acpi/APIC
> > > >    [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
> > > >    [004h 0004 004h]                Table Length : 00000170
> > > >    [008h 0008 001h]                    Revision : 05          <=====
> > > >    [009h 0009 001h]                    Checksum : 94
> > > >    [00Ah 0010 006h]                      Oem ID : "BOCHS "
> > > >    [010h 0016 008h]                Oem Table ID : "BXPC    "
> > > >    [018h 0024 004h]                Oem Revision : 00000001
> > > >    [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
> > > >    [020h 0032 004h]       Asl Compiler Revision : 00000001
> > > > 
> > > >    ...
> > > > 
> > > >    [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
> > > >    [115h 0277 001h]                      Length : 08
> > > >    [116h 0278 001h]                Processor ID : 1D
> > > >    [117h 0279 001h]               Local Apic ID : 1D
> > > >    [118h 0280 004h]       Flags (decoded below) : 00000001
> > > >                               Processor Enabled : 1          <=====
> > > >                          Runtime Online Capable : 0          <=====
> > > > 
> > > >    [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
> > > >    [11Dh 0285 001h]                      Length : 08
> > > >    [11Eh 0286 001h]                Processor ID : 1E
> > > >    [11Fh 0287 001h]               Local Apic ID : 1E
> > > >    [120h 0288 004h]       Flags (decoded below) : 00000002
> > > >                               Processor Enabled : 0          <=====
> > > >                          Runtime Online Capable : 1          <=====
> > > > 
> > > >    [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
> > > >    [125h 0293 001h]                      Length : 08
> > > >    [126h 0294 001h]                Processor ID : 1F
> > > >    [127h 0295 001h]               Local Apic ID : 1F
> > > >    [128h 0296 004h]       Flags (decoded below) : 00000002
> > > >                               Processor Enabled : 0          <=====
> > > >                          Runtime Online Capable : 1          <=====
> > > > 
> > > > Regards,
> > > > Eric  
> > > 
> > > Can you please report which guests were tested?  
> > 
> > I've been using primarily upstream Linux. Kernels at and before 6.2.0 didn't
> > have the "broken" patch mentioned above, and worked (for the reasons cited
> > in the patch discussion to "fix" that patch). Any kernel since has the
> > "broken" patch and will exhibit the issue.
> > 
> > I've been using q35.
> > 
> > If there are other samples you'd like to see, let me know and I'll try.
> > 
> > Also, my responses will be delayed as I'm traveling the remainder of the week.
> > 
> > Thanks!
> > eric  
> 
> As a minimum some windows versions. The older the better.
> 
> 
> >   
> > > 
> > >   
> > > > 
> > > > Eric DeVolder (2):
> > > >    hw/acpi: arm: bump MADT to revision 5
> > > >    hw/acpi: i386: bump MADT to revision 5
> > > > 
> > > >   hw/arm/virt-acpi-build.c |  6 ++++--
> > > >   hw/i386/acpi-common.c    | 13 ++++++++++---
> > > >   2 files changed, 14 insertions(+), 5 deletions(-)
> > > > 
> > > > -- 
> > > > 2.31.1
> > > > 
> > > > 
> > > >   
> > >   
> 


