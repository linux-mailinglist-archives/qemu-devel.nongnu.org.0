Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED376CEFBB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:48:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYxC-0000YS-A3; Wed, 29 Mar 2023 12:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phYx9-0000Xo-LS
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:47:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phYx7-0006uR-A8
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680108432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hn6FMD2REGcI7oLVfN3s9GEcCBiTF3sBM/dFgBfrsSo=;
 b=eBpZeyCVztu5hH3T0ExpSUSj7pNoWCc8UTCzdFSkKnUBZ7mUcTI62AlTJKfYAJOW2ALRYi
 0+UBkv2BzzKzXlhDn0veDXXMc1efP6eBpRtTU83uAsCncS7D1JgN0wjFGAnBmiwL/BIecE
 hDQJYYCd3LWXisQt+72WyPcQ0Oz3tv0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-PMGsgJIJMTyLrwaPUjHrJQ-1; Wed, 29 Mar 2023 12:47:10 -0400
X-MC-Unique: PMGsgJIJMTyLrwaPUjHrJQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j27-20020a05600c1c1b00b003edd2023418so9077615wms.4
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680108429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hn6FMD2REGcI7oLVfN3s9GEcCBiTF3sBM/dFgBfrsSo=;
 b=LKYEEmFtebRCB7XiShgJ3lnWh3yfpHSr5SCsbuj4ieSNQBCNgN8WBqlDQCBlB59Leu
 ss+9zsD5+A+QLLiBye/AqCCj3RCBI3Eh/hQelZ5+Fb/fnwTtTp/CGN2KIqrfk5E3/Ge9
 R3CjY5bPL/GtqC2IAAXbOP7lxZeYWhSnMSIiXJNzXUFZoNWZc74mS6FxS7CQxUCfoeuX
 kysAPM9HBJrZqKg/xOfv9jdAi4RZUkfaqgemaQ/eX9bhYNwvs4LEp5iEKQZ2+HgV4fZE
 x7/g8mkF2Q+IojPSHsofiDPDuZV2BQobHzOag4o4p2cAjIIpMlHgPdZnpAPlbSysvIbz
 nK+A==
X-Gm-Message-State: AAQBX9d4V8kJ/PuP1ofz+offhENKX9gpyd9ilac4pGNBmjocRuVRi8Nw
 GyYU9DJwNM4fMuJeKk+o/frJvXxEcz6kietFxG+tchaUhgWHUWjMiFl2HTYRIjYHPWo2xeFnXbV
 mi/01cMc5mjcKlRs=
X-Received: by 2002:a05:600c:21d9:b0:3ed:5eed:5581 with SMTP id
 x25-20020a05600c21d900b003ed5eed5581mr2290814wmj.2.1680108429579; 
 Wed, 29 Mar 2023 09:47:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZZhH0Kgk5qBoscNnFSzoG1yfB51rwpBdUWAw+lOiSicSDcNe3aGjSfhGJhKa25+dmg5UeLww==
X-Received: by 2002:a05:600c:21d9:b0:3ed:5eed:5581 with SMTP id
 x25-20020a05600c21d900b003ed5eed5581mr2290790wmj.2.1680108429240; 
 Wed, 29 Mar 2023 09:47:09 -0700 (PDT)
Received: from redhat.com ([2.52.18.165]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c4f8200b003ef5e5f93f5sm3017273wmq.19.2023.03.29.09.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 09:47:08 -0700 (PDT)
Date: Wed, 29 Mar 2023 12:47:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
Message-ID: <20230329124442-mutt-send-email-mst@kernel.org>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
 <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Mar 29, 2023 at 08:14:37AM -0500, Eric DeVolder wrote:
> 
> 
> On 3/29/23 00:19, Michael S. Tsirkin wrote:
> > Hmm I don't think we can reasonably make such a change for 8.0.
> > Seems too risky.
> > Also, I feel we want to have an internal (with "x-" prefix") flag to
> > revert to old behaviour, in case of breakage on some guests.  and maybe
> > we want to keep old revision for old machine types.
> Ok, what option name, for keeping old behavior, would you like?

Don't much care. x-madt-rev?

> > 
> > 
> > On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
> > > The following Linux kernel change broke CPU hotplug for MADT revision
> > > less than 5.
> > > 
> > >   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> > 
> > Presumably it's being fixed? Link to discussion? Patch fixing that in
> > Linux?
> 
> https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t

Great! Maybe stick a Link: tag in the commit log.

> > 
> > 
> > > As part of the investigation into resolving this breakage, I learned
> > > that i386 QEMU reports revision 1, while technically it is at revision 3.
> > > (Arm QEMU reports revision 4, and that is valid/correct.)
> > > 
> > > ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
> > > flag that the above Linux patch utilizes to denote hot pluggable CPUs.
> > > 
> > > So in order to bump MADT to the current revision of 5, need to
> > > validate that all MADT table changes between 1 and 5 are present
> > > in QEMU.
> > > 
> > > Below is a table summarizing the changes to the MADT. This information
> > > gleamed from the ACPI specs on uefi.org.
> > > 
> > > ACPI    MADT    What
> > > Version Version
> > > 1.0             MADT not present
> > > 2.0     1       Section 5.2.10.4
> > > 3.0     2       Section 5.2.11.4
> > >                   5.2.11.13 Local SAPIC Structure added two new fields:
> > >                    ACPI Processor UID Value
> > >                    ACPI Processor UID String
> > >                   5.2.10.14 Platform Interrupt Sources Structure:
> > >                    Reserved changed to Platform Interrupt Sources Flags
> > > 3.0b    2       Section 5.2.11.4
> > >                   Added a section describing guidelines for the ordering of
> > >                   processors in the MADT to support proper boot processor
> > >                   and multi-threaded logical processor operation.
> > > 4.0     3       Section 5.2.12
> > >                   Adds Processor Local x2APIC structure type 9
> > >                   Adds Local x2APIC NMI structure type 0xA
> > > 5.0     3       Section 5.2.12
> > > 6.0     3       Section 5.2.12
> > > 6.0a    4       Section 5.2.12
> > >                   Adds ARM GIC structure types 0xB-0xF
> > > 6.2a    45      Section 5.2.12   <--- yep it says version 45!
> > > 6.2b    5       Section 5.2.12
> > >                   GIC ITS last Reserved offset changed to 16 from 20 (typo)
> > > 6.3     5       Section 5.2.12
> > >                   Adds Local APIC Flags Online Capable!
> > >                   Adds GICC SPE Overflow Interrupt field
> > > 6.4     5       Section 5.2.12
> > >                   Adds Multiprocessor Wakeup Structure type 0x10
> > >                   (change notes says structure previously misplaced?)
> > > 6.5     5       Section 5.2.12
> > > 
> > > For the MADT revision change 1 -> 2, the spec has a change to the
> > > SAPIC structure. In general, QEMU does not generate/support SAPIC.
> > > So the QEMU i386 MADT revision can safely be moved to 2.
> > > 
> > > For the MADT revision change 2 -> 3, the spec adds Local x2APIC
> > > structures. QEMU has long supported x2apic ACPI structures. A simple
> > > search of x2apic within QEMU source and hw/i386/acpi-common.c
> > > specifically reveals this.
> > 
> > But not unconditionally.
> 
> I don't think that reporting revision 3 requires that generation of x2apic;
> one could still see apic, x2apic, or sapic in theory. I realize qemu doesn't
> do sapic...
> 
> > 
> > > So the QEMU i386 MADT revision can safely
> > > be moved to 3.
> > > 
> > > For the MADT revision change 3 -> 4, the spec adds support for the ARM
> > > GIC structures. QEMU ARM does in fact generate and report revision 4.
> > > As these will not be used by i386 QEMU, so then the QEMU i386 MADT
> > > revision can safely be moved to 4 as well.
> > > 
> > > Now for the MADT revision change 4 -> 5, the spec adds the Online
> > > Capable flag to the Local APIC structure, and the ARM GICC SPE
> > > Overflow Interrupt field.
> > > 
> > > For the ARM SPE, an existing 3-byte Reserved field is broken into a 1-
> > > byte Reserved field and a 2-byte SPE field.  The spec says that is SPE
> > > Overflow is not supported, it should be zero.
> > > 
> > > For the i386 Local APIC flag Online Capable, the spec has certain rules
> > > about this value. And in particuar setting this value now explicitly
> > > indicates a hotpluggable CPU.
> > > 
> > > So this patch makes the needed changes to move both ARM and i386 MADT
> > > to revision 5. These are not complicated, thankfully.
> > > 
> > > Without these changes, the information below shows "how" CPU hotplug
> > > breaks with the current upstream Linux kernel 6.3.  For example, a Linux
> > > guest started with:
> > > 
> > >   qemu-system-x86_64 -smp 30,maxcpus=32 ...
> > > 
> > > and then attempting to hotplug a CPU:
> > > 
> > >    (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0
> > > 
> > > fails with the following:
> > > 
> > >    APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
> > >    ACPI: Unable to map lapic to logical cpu number
> > >    acpi LNXCPU:1e: Enumeration failure
> > > 
> > >    # dmesg | grep smpboot
> > >    smpboot: Allowing 30 CPUs, 0 hotplug CPUs
> > >    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
> > >    smpboot: Max logical packages: 1
> > >    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> > > 
> > >    # iasl -d /sys/firmware/tables/acpi/APIC
> > >    [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
> > >    [004h 0004   4]                 Table Length : 00000170
> > >    [008h 0008   1]                     Revision : 01          <=====
> > >    [009h 0009   1]                     Checksum : 9C
> > >    [00Ah 0010   6]                       Oem ID : "BOCHS "
> > >    [010h 0016   8]                 Oem Table ID : "BXPC    "
> > >    [018h 0024   4]                 Oem Revision : 00000001
> > >    [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> > >    [020h 0032   4]        Asl Compiler Revision : 00000001
> > > 
> > >    ...
> > > 
> > >    [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
> > >    [115h 0277   1]                       Length : 08
> > >    [116h 0278   1]                 Processor ID : 1D
> > >    [117h 0279   1]                Local Apic ID : 1D
> > >    [118h 0280   4]        Flags (decoded below) : 00000001
> > >                               Processor Enabled : 1          <=====
> > > 
> > >    [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
> > >    [11Dh 0285   1]                       Length : 08
> > >    [11Eh 0286   1]                 Processor ID : 1E
> > >    [11Fh 0287   1]                Local Apic ID : 1E
> > >    [120h 0288   4]        Flags (decoded below) : 00000000
> > >                               Processor Enabled : 0          <=====
> > > 
> > >    [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
> > >    [125h 0293   1]                       Length : 08
> > >    [126h 0294   1]                 Processor ID : 1F
> > >    [127h 0295   1]                Local Apic ID : 1F
> > >    [128h 0296   4]        Flags (decoded below) : 00000000
> > >                               Processor Enabled : 0          <=====
> > > 
> > > The (latest upstream) Linux kernel sees 30 Enabled processors, and
> > > does not consider processors 31 and 32 to be hotpluggable.
> > > 
> > > With this patch series applied, by bumping MADT to revision 5, the
> > > latest upstream Linux kernel correctly identifies 30 CPUs plus 2
> > > hotpluggable CPUS.
> > > 
> > >    CPU30 has been hot-added
> > >    smpboot: Booting Node 0 Processor 30 APIC 0x1e
> > >    Will online and init hotplugged CPU: 30
> > > 
> > >    # dmesg | grep smpboot
> > >    smpboot: Allowing 32 CPUs, 2 hotplug CPUs
> > >    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
> > >    smpboot: Max logical packages: 2
> > >    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> > > 
> > >    # iasl -d /sys/firmware/tables/acpi/APIC
> > >    [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
> > >    [004h 0004 004h]                Table Length : 00000170
> > >    [008h 0008 001h]                    Revision : 05          <=====
> > >    [009h 0009 001h]                    Checksum : 94
> > >    [00Ah 0010 006h]                      Oem ID : "BOCHS "
> > >    [010h 0016 008h]                Oem Table ID : "BXPC    "
> > >    [018h 0024 004h]                Oem Revision : 00000001
> > >    [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
> > >    [020h 0032 004h]       Asl Compiler Revision : 00000001
> > > 
> > >    ...
> > > 
> > >    [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
> > >    [115h 0277 001h]                      Length : 08
> > >    [116h 0278 001h]                Processor ID : 1D
> > >    [117h 0279 001h]               Local Apic ID : 1D
> > >    [118h 0280 004h]       Flags (decoded below) : 00000001
> > >                               Processor Enabled : 1          <=====
> > >                          Runtime Online Capable : 0          <=====
> > > 
> > >    [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
> > >    [11Dh 0285 001h]                      Length : 08
> > >    [11Eh 0286 001h]                Processor ID : 1E
> > >    [11Fh 0287 001h]               Local Apic ID : 1E
> > >    [120h 0288 004h]       Flags (decoded below) : 00000002
> > >                               Processor Enabled : 0          <=====
> > >                          Runtime Online Capable : 1          <=====
> > > 
> > >    [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
> > >    [125h 0293 001h]                      Length : 08
> > >    [126h 0294 001h]                Processor ID : 1F
> > >    [127h 0295 001h]               Local Apic ID : 1F
> > >    [128h 0296 004h]       Flags (decoded below) : 00000002
> > >                               Processor Enabled : 0          <=====
> > >                          Runtime Online Capable : 1          <=====
> > > 
> > > Regards,
> > > Eric
> > 
> > Can you please report which guests were tested?
> 
> I've been using primarily upstream Linux. Kernels at and before 6.2.0 didn't
> have the "broken" patch mentioned above, and worked (for the reasons cited
> in the patch discussion to "fix" that patch). Any kernel since has the
> "broken" patch and will exhibit the issue.
> 
> I've been using q35.
> 
> If there are other samples you'd like to see, let me know and I'll try.
> 
> Also, my responses will be delayed as I'm traveling the remainder of the week.
> 
> Thanks!
> eric

As a minimum some windows versions. The older the better.


> 
> > 
> > 
> > > 
> > > Eric DeVolder (2):
> > >    hw/acpi: arm: bump MADT to revision 5
> > >    hw/acpi: i386: bump MADT to revision 5
> > > 
> > >   hw/arm/virt-acpi-build.c |  6 ++++--
> > >   hw/i386/acpi-common.c    | 13 ++++++++++---
> > >   2 files changed, 14 insertions(+), 5 deletions(-)
> > > 
> > > -- 
> > > 2.31.1
> > > 
> > > 
> > > 
> > 


