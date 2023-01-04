Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B6565D0C9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 11:36:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD17m-0008EF-Cc; Wed, 04 Jan 2023 05:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pD17j-0008Cy-Cc
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:35:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pD17h-0005Lm-Bh
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672828552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L8ePZOqcQu1lq9BgS4CN7pNqHv2YS12kv2kPGSGVyLA=;
 b=S9Vz7/GOqwkyItR7zoc+yXXoFVbW9TtvG3D8bNVjivCgCVk0nr7XPhLHxiI4YtZPIWHval
 forNLRVi0X9D3BUsv5BYTwjBHCCYT6ugiOhzRZYjxxmgkCdKMpqjQwmGV+cFIKmxAhDCgX
 xHMQX8BQcj8guaw3pc6WmrUUBw8J7IE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-Op0F6HVYPSyPFAO_kPZwFQ-1; Wed, 04 Jan 2023 05:35:49 -0500
X-MC-Unique: Op0F6HVYPSyPFAO_kPZwFQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 gb10-20020a170907960a00b007c192c5482eso20690816ejc.7
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 02:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L8ePZOqcQu1lq9BgS4CN7pNqHv2YS12kv2kPGSGVyLA=;
 b=oFcFkCZinnOxVd+Xo5j5PtG6q0OMfmyYRMs0orHh1NAEhCpvMMgmTtEhpL2OcN03y1
 4c5dBJBJWuz3cq3BRPgRO9+qvgVOcPWkY/4OOOyJNH6WHqJvlOuSmTCwWoxC4Wzc4iHO
 Keub2ow5sfzJIh3lQFe9n31brfkufgP4Y5ZCBLj1gpSBjAZ2pY59XWH513r6IYi8P5/I
 wSVHrMWKxVWvwRvXW9o2BGumPQ6Wpm5RkSx/VdzhIzgsnE7jLlwdUfYWOy6cuW1yddHu
 I3qPbI/XMP5ttIa7sY0OfeKi8PvrDwhrSiSGqhh8dKnKchtF2hAp71m3FnvWvadjf7kC
 mI3A==
X-Gm-Message-State: AFqh2kogFh5bBd+AhiIwZchNldDa7IOdDguGQr3ZuB+KvjDRo01HKYDL
 JcyKGPykiC9B7GkrT5CfSSXh720e284Ni0uIo2LpDo7jXGegjYiG4fBErr0p++DnN+SVDR/6OM1
 Ewpyyn3UBWbsWwio=
X-Received: by 2002:a17:906:910:b0:7c1:9519:5cfa with SMTP id
 i16-20020a170906091000b007c195195cfamr39104752ejd.77.1672828548412; 
 Wed, 04 Jan 2023 02:35:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvN/uIhI1sYfbb051DvUw7yWf+WpHk+yuqm91kgxJB/ZCYzJeg2vsykTrz3AudC0iGwUIaCRw==
X-Received: by 2002:a17:906:910:b0:7c1:9519:5cfa with SMTP id
 i16-20020a170906091000b007c195195cfamr39104727ejd.77.1672828547699; 
 Wed, 04 Jan 2023 02:35:47 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 s26-20020a170906a19a00b007c4fae88aecsm14992517ejy.131.2023.01.04.02.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 02:35:47 -0800 (PST)
Date: Wed, 4 Jan 2023 11:35:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: qemu devel list <qemu-devel@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Ard Biesheuvel
 <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-stable@nongnu.org
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to
 the legacy reg block
Message-ID: <20230104113546.0f483ec4@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230104090138.214862-1-lersek@redhat.com>
References: <20230104090138.214862-1-lersek@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed,  4 Jan 2023 10:01:38 +0100
Laszlo Ersek <lersek@redhat.com> wrote:

> The modern ACPI CPU hotplug interface was introduced in the following
> series (aa1dd39ca307..679dd1a957df), released in v2.7.0:
> 
>   1  abd49bc2ed2f docs: update ACPI CPU hotplug spec with new protocol
>   2  16bcab97eb9f pc: piix4/ich9: add 'cpu-hotplug-legacy' property
>   3  5e1b5d93887b acpi: cpuhp: add CPU devices AML with _STA method
>   4  ac35f13ba8f8 pc: acpi: introduce AcpiDeviceIfClass.madt_cpu hook
>   5  d2238cb6781d acpi: cpuhp: implement hot-add parts of CPU hotplug
>                   interface
>   6  8872c25a26cc acpi: cpuhp: implement hot-remove parts of CPU hotplug
>                   interface
>   7  76623d00ae57 acpi: cpuhp: add cpu._OST handling
>   8  679dd1a957df pc: use new CPU hotplug interface since 2.7 machine type
> 
> Before patch#1, "docs/specs/acpi_cpu_hotplug.txt" only specified 1-byte
> accesses for the hotplug register block.  Patch#1 preserved the same
> restriction for the legacy register block, but:
> 
> - it specified DWORD accesses for some of the modern registers,
> 
> - in particular, the switch from the legacy block to the modern block
>   would require a DWORD write to the *legacy* block.
> 
> The latter functionality was then implemented in cpu_status_write()
> [hw/acpi/cpu_hotplug.c], in patch#8.
> 
> Unfortunately, all DWORD accesses depended on a dormant bug: the one
> introced in earlier commit a014ed07bd5a ("memory: accept mismatching sizes
> in memory_region_access_valid", 2013-05-29); first released in v1.6.0.
> Due to commit a014ed07bd5a, the DWORD accesses to the *legacy* CPU hotplug
> register block would work in spite of the above series *not* relaxing
> "valid.max_access_size = 1" in "hw/acpi/cpu_hotplug.c":
> 
> > static const MemoryRegionOps AcpiCpuHotplug_ops = {
> >     .read = cpu_status_read,
> >     .write = cpu_status_write,
> >     .endianness = DEVICE_LITTLE_ENDIAN,
> >     .valid = {
> >         .min_access_size = 1,
> >         .max_access_size = 1,
> >     },
> > };  
> 
> Later, in commits e6d0c3ce6895 ("acpi: cpuhp: introduce 'Command data 2'
> field", 2020-01-22) and ae340aa3d256 ("acpi: cpuhp: spec: add typical
> usecases", 2020-01-22), first released in v5.0.0, the modern CPU hotplug
> interface (including the documentation) was extended with another DWORD
> *read* access, namely to the "Command data 2" register, which would be
> important for the guest to confirm whether it managed to switch the
> register block from legacy to modern.
> 
> This functionality too silently depended on the bug from commit
> a014ed07bd5a.
> 
> In commit 5d971f9e6725 ('memory: Revert "memory: accept mismatching sizes
> in memory_region_access_valid"', 2020-06-26), first released in v5.1.0,
> the bug from commit a014ed07bd5a was fixed (the commit was reverted).
> That swiftly exposed the bug in "AcpiCpuHotplug_ops", still present from
> the v2.7.0 series quoted at the top -- namely the fact that
> "valid.max_access_size = 1" didn't match what the guest was supposed to
> do, according to the spec ("docs/specs/acpi_cpu_hotplug.txt").
> 
> The symptom is that the "modern interface negotiation protocol"
> described in commit ae340aa3d256:
> 
> > +      Use following steps to detect and enable modern CPU hotplug interface:
> > +        1. Store 0x0 to the 'CPU selector' register,
> > +           attempting to switch to modern mode
> > +        2. Store 0x0 to the 'CPU selector' register,
> > +           to ensure valid selector value
> > +        3. Store 0x0 to the 'Command field' register,
> > +        4. Read the 'Command data 2' register.
> > +           If read value is 0x0, the modern interface is enabled.
> > +           Otherwise legacy or no CPU hotplug interface available  
> 
> falls apart for the guest: steps 1 and 2 are lost, because they are DWORD
> writes; so no switching happens.  Step 3 (a single-byte write) is not
> lost, but it has no effect; see the condition in cpu_status_write() in
> patch#8.  And step 4 *misleads* the guest into thinking that the switch
> worked: the DWORD read is lost again -- it returns zero to the guest
> without ever reaching the device model, so the guest never learns the
> switch didn't work.
> 
> This means that guest behavior centered on the "Command data 2" register
> worked *only* in the v5.0.0 release; it got effectively regressed in
> v5.1.0.
> 
> To make things *even more* complicated, the breakage was (and remains, as
> of today) visible with TCG acceleration only.  Commit 5d971f9e6725 makes
> no difference with KVM acceleration -- the DWORD accesses still work,
> despite "valid.max_access_size = 1".
> 
> As commit 5d971f9e6725 suggests, fix the problem by raising
> "valid.max_access_size" to 4 -- the spec now clearly instructs the guest
> to perform DWORD accesses to the legacy register block too, for enabling
> (and verifying!) the modern block.  In order to keep compatibility for the
> device model implementation though, set "impl.max_access_size = 1", so
> that wide accesses be split before they reach the legacy read/write
> handlers, like they always have been on KVM, and like they were on TCG
> before 5d971f9e6725 (v5.1.0).
> 
> Tested with:
> 
> - OVMF IA32 + qemu-system-i386, CPU hotplug/hot-unplug with SMM,
>   intermixed with ACPI S3 suspend/resume, using KVM accel
>   (regression-test);
> 
> - OVMF IA32X64 + qemu-system-x86_64, CPU hotplug/hot-unplug with SMM,
>   intermixed with ACPI S3 suspend/resume, using KVM accel
>   (regression-test);
> 
> - OVMF IA32 + qemu-system-i386, SMM enabled, using TCG accel; verified the
>   register block switch and the present/possible CPU counting through the
>   modern hotplug interface, during OVMF boot (bugfix test);


> - I do not have any testcase (guest payload) for regression-testing CPU
>   hotplug through the *legacy* CPU hotplug register block.
I've checked it with old Seabios (that had it's own ACPI tables) (taken from 1.6 QEMU branch),  
it works fine in TCG and KVM mode.

Tested-by: Igor Mammedov <imammedo@redhat.com>

> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-stable@nongnu.org
> Ref: "IO port write width clamping differs between TCG and KVM"
> Link: http://mid.mail-archive.com/aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com
> Link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00199.html
> Reported-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
> 
> Notes:
>     This should be applied to:
>     
>     - stable-5.2 (new branch)
>     
>     - stable-6.2 (new branch)
>     
>     - stable-7.2 (new branch)
>     
>     whichever is still considered maintained, as there is currently *no*
>     public QEMU release in which the modern CPU hotplug register block
>     works, when using TCG acceleration.  v5.0.0 works, but that minor
>     release has been obsoleted by v5.2.0, which does not work.
> 
>  hw/acpi/cpu_hotplug.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index 53654f863830..ff14c3f4106f 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -52,6 +52,9 @@ static const MemoryRegionOps AcpiCpuHotplug_ops = {
>      .endianness = DEVICE_LITTLE_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> +        .max_access_size = 4,
> +    },
> +    .impl = {
>          .max_access_size = 1,
>      },
>  };


