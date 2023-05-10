Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903606FD905
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:14:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwexn-00032u-Q5; Wed, 10 May 2023 04:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pwexl-000325-Lg
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:14:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pwexj-0006Gl-Ad
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683706454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btQL0VgJaT+3oljVUmJQBpq37Vh43nrrcNXZqypw2hc=;
 b=hZRjDosYbic/101+qvYFdmHedI9CaK47TVYwZnlXhcOFqug8naSSUw4d3uZ/ATd7Xe6vVO
 hf28nN9Ocm/B+H2ecwsKrpGxk7Qgy7lqX/95YFgOw1cWO2OxoznrdD31tXROkGnhK8LxCd
 z0O+eRBsbgpjXeKAWY7tG7GmKezTvvI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-kh_g5TJBPhCctQskbjgiKQ-1; Wed, 10 May 2023 04:14:13 -0400
X-MC-Unique: kh_g5TJBPhCctQskbjgiKQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50b4bfb51b0so6395856a12.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683706451; x=1686298451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=btQL0VgJaT+3oljVUmJQBpq37Vh43nrrcNXZqypw2hc=;
 b=HYOdCv6XIOyL9I3SULtgbZamiRSTB5DwWedW9Zwbdx5S0Jqtq9WpU9EkGBwQr/bWVp
 jdzKQGZaTF+mG3SdSgo0wzU/xVOWJ3CfuOo6dleR8Gen7MBSmH0ArO05QOhdV+UGIVEk
 Ppn/VXE4IHWXZOx1iol6fCyox6Li67TFUFbUO7DRWj4C/nUyq/Ds7oDFQ/fq2avAQNnT
 ZsF9D0pZn2Ys1OXXZJG97Mi1uQ9v+ZcnszfyVIoX4f2dDtpFw2QVyqbpae/XxQp11wpc
 /iL/Us8EDrymvn+FulAFRHlxn+HNRsWJP2BNXLKg/79zHVOydx0BWNfcm3/9H8h9cn1E
 HY5g==
X-Gm-Message-State: AC+VfDzLJKUN/fZ5Fy79nh1qcr+YKesVkA/LcFCp06YkcqhFYgd9tjWd
 2bKYCGShYulYKyFpRl8uUJ2DvME8YJfnThucRg9v8nDvKGfaxEOoGW6e2v4BIc1IshC/imw6HPk
 HS11AXHxXYUP3V9A=
X-Received: by 2002:a50:e601:0:b0:509:c10d:b53d with SMTP id
 y1-20020a50e601000000b00509c10db53dmr14250389edm.23.1683706450804; 
 Wed, 10 May 2023 01:14:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7H7jnchrCb5uQMTKxNeooLcTAY2ppz4fQjN2WV83ZklXsaSs6vFba6LATX410BvHZmVDqFpA==
X-Received: by 2002:a50:e601:0:b0:509:c10d:b53d with SMTP id
 y1-20020a50e601000000b00509c10db53dmr14250376edm.23.1683706450353; 
 Wed, 10 May 2023 01:14:10 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 b12-20020aa7dc0c000000b0050be1c28a0fsm1665468edu.7.2023.05.10.01.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:14:09 -0700 (PDT)
Date: Wed, 10 May 2023 10:14:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, mst@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com, miguel.luis@oracle.com
Subject: Re: [PATCH v3 0/3] ACPI: i386: bump MADT to revision 5
Message-ID: <20230510101408.03e6684f@imammedo.users.ipa.redhat.com>
In-Reply-To: <67265b8f-10ff-d276-bdda-b6c66666e36a@oracle.com>
References: <20230421214901.2053-1-eric.devolder@oracle.com>
 <67265b8f-10ff-d276-bdda-b6c66666e36a@oracle.com>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 5 May 2023 16:53:22 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Thoughts?

I still don't think we need to bump x86 to rev 5 in QEMU. 

> eric
> 
> On 4/21/23 16:48, Eric DeVolder wrote:
> > The following Linux kernel change broke CPU hotplug for MADT revision
> > less than 5.
> > 
> >   e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> > 
> > Discussion on this topic can be located here:
> > 
> >   https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t

have your kernel fix landed up upstream?

> > 
> > which resulted in the following fixes Linux in 6.3-rc5:
> > 
> >   a74fabfbd1b7: ("x86/ACPI/boot: Use FADT version to check support for online capable")
> >   fed8d8773b8e: ("x86/acpi/boot: Correct acpi_is_processor_usable() check")
> > 
> > However, as part of the investigation into resolving this breakage, I
> > learned that i386 QEMU reports revision 1, while technically it
> > generates revision 3. Aarch64 generates and reports revision 4.
> > 
> > ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
> > flag that the above Linux patch utilizes to denote hot pluggable CPUs.
> > 
> > So in order to bump MADT to the current revision of 5, need to
> > validate that all MADT table changes between 1 and 5 are present
> > in QEMU.
> > 
> > Below is a table summarizing the changes to the MADT. This information
> > gleamed from the ACPI specs on uefi.org.
> > 
> > ACPI    MADT    What
> > Version Version
> > 1.0             MADT not present
> > 2.0     1       Section 5.2.10.4
> > 3.0     2       Section 5.2.11.4
> >                   5.2.11.13 Local SAPIC Structure added two new fields:
> >                    ACPI Processor UID Value
> >                    ACPI Processor UID String
> >                   5.2.10.14 Platform Interrupt Sources Structure:
> >                    Reserved changed to Platform Interrupt Sources Flags
> > 3.0b    2       Section 5.2.11.4
> >                   Added a section describing guidelines for the ordering of
> >                   processors in the MADT to support proper boot processor
> >                   and multi-threaded logical processor operation.
> > 4.0     3       Section 5.2.12
> >                   Adds Processor Local x2APIC structure type 9
> >                   Adds Local x2APIC NMI structure type 0xA
> > 5.0     3       Section 5.2.12
> > 6.0     3       Section 5.2.12
> > 6.0a    4       Section 5.2.12
> >                   Adds ARM GIC structure types 0xB-0xF
> > 6.2a    45      Section 5.2.12   <--- version 45, is indeed accurate!
> > 6.2b    5       Section 5.2.12
> >                   GIC ITS last Reserved offset changed to 16 from 20 (typo)
> > 6.3     5       Section 5.2.12
> >                   Adds Local APIC Flags Online Capable!
> >                   Adds GICC SPE Overflow Interrupt field
> > 6.4     5       Section 5.2.12
> >                   Adds Multiprocessor Wakeup Structure type 0x10
> >                   (change notes says structure previously misplaced?)
> > 6.5     5       Section 5.2.12
> > 
> > For the MADT revision change 1 -> 2, the spec has a change to the
> > SAPIC structure. In general, QEMU does not generate/support SAPIC.
> > So the QEMU i386 MADT revision can safely be moved to 2.
> > 
> > For the MADT revision change 2 -> 3, the spec adds Local x2APIC
> > structures. QEMU has long supported x2apic ACPI structures. A simple
> > search of x2apic within QEMU source and hw/i386/acpi-common.c
> > specifically reveals this. So the QEMU i386 MADT revision can safely
> > be moved to 3.
> > 
> > For the MADT revision change 3 -> 4, the spec adds support for the ARM
> > GIC structures. QEMU ARM does in fact generate and report revision 4.
> > As these will not be used by i386 QEMU, so then the QEMU i386 MADT
> > revision can safely be moved to 4 as well.
> > 
> > Now for the MADT revision change 4 -> 5, the spec adds the Online
> > Capable flag to the Local APIC structure, and the ARM GICC SPE
> > Overflow Interrupt field.

All ARM stuff is irrelevant in x86 patch

> > For i386, the ARM SPE is not applicable.
> > 
> > For the i386 Local APIC flag Online Capable, the spec has certain rules
> > about this value. And in particuar setting this value now explicitly
> > indicates a hotpluggable CPU.
> > 
> > So this patch makes the needed changes to move i386 MADT to
> > revision 5.
> > 
> > Without these changes, the information below shows "how" CPU hotplug
> > breaks with the current upstream Linux kernel 6.3.  For example, a Linux
> > guest started with:

what's the status wrt current upstream kernel?
 
> >   qemu-system-x86_64 -smp 30,maxcpus=32 ...
> > 
> > and then attempting to hotplug a CPU:
> > 
> >    (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0
> > 
> > fails with the following:
> > 
> >    APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
> >    ACPI: Unable to map lapic to logical cpu number
> >    acpi LNXCPU:1e: Enumeration failure
> > 
> >    # dmesg | grep smpboot
> >    smpboot: Allowing 30 CPUs, 0 hotplug CPUs
> >    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
> >    smpboot: Max logical packages: 1
> >    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> > 
> >    # iasl -d /sys/firmware/tables/acpi/APIC
> >    [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
> >    [004h 0004   4]                 Table Length : 00000170
> >    [008h 0008   1]                     Revision : 01          <=====
> >    [009h 0009   1]                     Checksum : 9C
> >    [00Ah 0010   6]                       Oem ID : "BOCHS "
> >    [010h 0016   8]                 Oem Table ID : "BXPC    "
> >    [018h 0024   4]                 Oem Revision : 00000001
> >    [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> >    [020h 0032   4]        Asl Compiler Revision : 00000001
> > 
> >    ...
> > 
> >    [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
> >    [115h 0277   1]                       Length : 08
> >    [116h 0278   1]                 Processor ID : 1D
> >    [117h 0279   1]                Local Apic ID : 1D
> >    [118h 0280   4]        Flags (decoded below) : 00000001
> >                               Processor Enabled : 1          <=====
> > 
> >    [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
> >    [11Dh 0285   1]                       Length : 08
> >    [11Eh 0286   1]                 Processor ID : 1E
> >    [11Fh 0287   1]                Local Apic ID : 1E
> >    [120h 0288   4]        Flags (decoded below) : 00000000
> >                               Processor Enabled : 0          <=====
> > 
> >    [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
> >    [125h 0293   1]                       Length : 08
> >    [126h 0294   1]                 Processor ID : 1F
> >    [127h 0295   1]                Local Apic ID : 1F
> >    [128h 0296   4]        Flags (decoded below) : 00000000
> >                               Processor Enabled : 0          <=====
> > 
> > The (latest upstream) Linux kernel sees 30 Enabled processors, and
> > does not consider processors 31 and 32 to be hotpluggable.
> > 
> > With this patch series applied, by bumping MADT to revision 5, the
> > latest upstream Linux kernel correctly identifies 30 CPUs plus 2
> > hotpluggable CPUS.
> > 
> >    CPU30 has been hot-added
> >    smpboot: Booting Node 0 Processor 30 APIC 0x1e
> >    Will online and init hotplugged CPU: 30
> > 
> >    # dmesg | grep smpboot
> >    smpboot: Allowing 32 CPUs, 2 hotplug CPUs
> >    smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
> >    smpboot: Max logical packages: 2
> >    smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> > 
> >    # iasl -d /sys/firmware/tables/acpi/APIC
> >    [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
> >    [004h 0004 004h]                Table Length : 00000170
> >    [008h 0008 001h]                    Revision : 05          <=====
> >    [009h 0009 001h]                    Checksum : 94
> >    [00Ah 0010 006h]                      Oem ID : "BOCHS "
> >    [010h 0016 008h]                Oem Table ID : "BXPC    "
> >    [018h 0024 004h]                Oem Revision : 00000001
> >    [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
> >    [020h 0032 004h]       Asl Compiler Revision : 00000001
> > 
> >    ...
> > 
> >    [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
> >    [115h 0277 001h]                      Length : 08
> >    [116h 0278 001h]                Processor ID : 1D
> >    [117h 0279 001h]               Local Apic ID : 1D
> >    [118h 0280 004h]       Flags (decoded below) : 00000001
> >                               Processor Enabled : 1          <=====
> >                          Runtime Online Capable : 0          <=====
> > 
> >    [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
> >    [11Dh 0285 001h]                      Length : 08
> >    [11Eh 0286 001h]                Processor ID : 1E
> >    [11Fh 0287 001h]               Local Apic ID : 1E
> >    [120h 0288 004h]       Flags (decoded below) : 00000002
> >                               Processor Enabled : 0          <=====
> >                          Runtime Online Capable : 1          <=====
> > 
> >    [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
> >    [125h 0293 001h]                      Length : 08
> >    [126h 0294 001h]                Processor ID : 1F
> >    [127h 0295 001h]               Local Apic ID : 1F
> >    [128h 0296 004h]       Flags (decoded below) : 00000002
> >                               Processor Enabled : 0          <=====
> >                          Runtime Online Capable : 1          <=====
> > 
> > In terms of testing older operating systems, I did:
> > 
> > - Windows Server 2008.
> >   By opening Device Manager -> Processors, and watching/counting
> >   the listed CPUs before and after hot un/plug operations.
> >   When hot plugging a CPU, the new processor shows in the list;
> >   one more processor is available after the hotplug.
> >   When hot unplugging a CPU, Windows refuses, with the message:
> > 
> >    The 'Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz' device is not
> >    removable and cannot be ejected or unplugged.
> > 
> >   This is expected as hot unplug did not work in Windows 2008.
> > 
> > - RHEL 6.9
> >   Kernel 2.6.32-696.el6.x86_64
> >   Build Feb 21 2017
> >   From dmesg:
> >   ACPI: APIC 000000007ffe32f0 000F0 (v05 BOCHS  BXPC    00000001 BXPC 00000001)
> >   SMP: Allowing 16 CPUs, 8 hotplug CPUs
> > 
> >   # cat /sys/devices/system/cpu/online
> >   0-7
> > 
> >   (QEMU) device_add id=cpu8 driver=host-x86_64-cpu socket-id=0 core-id=8 thread-id=0
> > 
> >   CPU 8 got hotplugged
> >   Booting Node 0 Processor 8 APIC 0x8
> >   kvm-clock: cpu 8, msr 2830ed00
> >   Will online and init hotplugged CPU: 8
> >   microcode: CPU8 sig=0x50663, pf=0x1, revision=0x700001c
> >   platform microcode: firmware: requesting intel-ucode/06-56-03
> > 
> >   # cat /sys/devices/system/cpu/online
> >   0-8
> > 
> >   (QEMU) device_del id=cpu8
> > 
> >   Broke affinity for irq 24
> >   CPU 8 is now offline
> > 
> >   # cat /sys/devices/system/cpu/online
> >   0-7
> > 
> >   RHEL 6.9
> >   kernel 2.6.32-696.el6.x86_64
> >   build Feb 21 2017
> > 
> > Both of the above 'legacy' operating systems behaved as expected.
> > 
> > Regards,
> > Eric
> > 
> > ---
> > v3: 21apr2023
> >   - Dropped ARM patch as there is no compelling need to move to
> >     MADT revision 5, per Michael Tsirkin.
> >   - Recoded the flags to be simpler, per Michael, Ani Sinha and
> >     Miguel Luis.
> >   - Regenerated the binary tables, as per bios-tables-test.c
> >     instructions.
> > 
> > v2: 18apr2023
> >   https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg02576.html
> >   - Code formatting changes per Igor Mammedov
> >   - Included the steps in bios-tables-test.
> > 
> > v1: 28mar2023
> >   https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06705.html
> >   - Initial series for ARM and i386 MADT revision bump to 5.
> > Eric DeVolder (3):
> >    ACPI: bios-tables-test.c step 2 (allowed-diff entries)
> >    hw/acpi: i386: bump MADT to revision 5
> >    ACPI: bios-tables-test.c step 5 (updated expected table binaries)
> > 
> >   hw/i386/acpi-common.c                         |   4 ++--
> >   tests/data/acpi/microvm/APIC                  | Bin 70 -> 70 bytes
> >   tests/data/acpi/microvm/APIC.ioapic2          | Bin 82 -> 82 bytes
> >   tests/data/acpi/microvm/APIC.pcie             | Bin 110 -> 110 bytes
> >   tests/data/acpi/pc/APIC                       | Bin 120 -> 120 bytes
> >   tests/data/acpi/pc/APIC.acpihmat              | Bin 128 -> 128 bytes
> >   tests/data/acpi/pc/APIC.cphp                  | Bin 160 -> 160 bytes
> >   tests/data/acpi/pc/APIC.dimmpxm               | Bin 144 -> 144 bytes
> >   tests/data/acpi/q35/APIC                      | Bin 120 -> 120 bytes
> >   tests/data/acpi/q35/APIC.acpihmat             | Bin 128 -> 128 bytes
> >   tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 144 -> 144 bytes
> >   tests/data/acpi/q35/APIC.core-count2          | Bin 2478 -> 2478 bytes
> >   tests/data/acpi/q35/APIC.cphp                 | Bin 160 -> 160 bytes
> >   tests/data/acpi/q35/APIC.dimmpxm              | Bin 144 -> 144 bytes
> >   tests/data/acpi/q35/APIC.xapic                | Bin 2686 -> 2686 bytes
> >   15 files changed, 2 insertions(+), 2 deletions(-)
> >   
> 


