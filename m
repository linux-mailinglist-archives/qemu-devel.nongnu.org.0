Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC665E800
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:39:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMN8-0004Lr-M4; Thu, 05 Jan 2023 04:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMN6-0004JO-HT
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMN4-0007iF-Ga
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9Zrv13isEEPPm2NdgxNIU2t+AnjncN+LEIS9+UfuxQ=;
 b=QTS9LOtyHOEHVqrpM6/yeVcwyBGvoyrfhumhDC7viGrLrIhAcpMavZ92fYy/On1sPR7OwF
 XpR3e+He6PN/b1rVaySB1VrwSxwilo5vAnroSIE6k7ieaeolDoqEK4FXKUX9KOn9W++ye3
 AQ3YUyzkDn9stuZ5DkgBQlCndPa13rc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371--K3nEbfQMJCShNkD2COJfA-1; Thu, 05 Jan 2023 04:17:08 -0500
X-MC-Unique: -K3nEbfQMJCShNkD2COJfA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k11-20020adfb34b000000b0027811695ca6so3588234wrd.16
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m9Zrv13isEEPPm2NdgxNIU2t+AnjncN+LEIS9+UfuxQ=;
 b=xMGw4dCOA+21DhTpEKX4qIKkBUmU5s6GSmtLkgE/GILXEvvOmXplt600qEoCwrFYSJ
 EmPoeg0Nb4xhgX+EjmDDa02K0z+N5zlbt8gdFQ49vRDpkmP/W/Foxe0e2phQ/r/hvbyo
 8lUuihFJBxoaBw939fD+tLoYtEzahtCiGz6JPxrPOcTWVvA65ksUN3RcRhkA7ig8WohC
 KO8IdC1EP8D7Va5QLF5BLofiSl2QipvjTza0iWZSOSa5sJJciO/OzPq3E34g6DtMpRSb
 9IFexonDl8djEV5NXTFmMstzpxGJDUpEirIF/nnQ1ErvvTrbg5JAsY2w5+AjZJp714Bf
 IIEQ==
X-Gm-Message-State: AFqh2krlBsqEK7zGeITymMNVe5FlIn7sXjBMzL+Ll3cJC/OsJo2+Z1X6
 lBXHUXCZV3BMqfWTlnIfWzzDkmg6frJq4tHS28OpYygjObydyJKGngV9OiwoZu4+MhlwLypTzIO
 9aJT9HWP5iFYOYe/ZMvbj3XX92z0XPYJIirOZe4IPcLg0A1nhHUuVXTnmY+Ro
X-Received: by 2002:a05:600c:4d25:b0:3d3:5b7a:1791 with SMTP id
 u37-20020a05600c4d2500b003d35b7a1791mr44344724wmp.41.1672910226790; 
 Thu, 05 Jan 2023 01:17:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvj3QDRD7BdqYe9ZRX4QP38RyIXNQI1wLNp4NwoN+3pTSgrsyAPVDwNA8AJwz3zE7oF0mFJnQ==
X-Received: by 2002:a05:600c:4d25:b0:3d3:5b7a:1791 with SMTP id
 u37-20020a05600c4d2500b003d35b7a1791mr44344701wmp.41.1672910226463; 
 Thu, 05 Jan 2023 01:17:06 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c445000b003c6c3fb3cf6sm1865192wmn.18.2023.01.05.01.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:17:05 -0800 (PST)
Date: Thu, 5 Jan 2023 04:17:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laszlo Ersek <lersek@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 50/51] acpi: cpuhp: fix guest-visible maximum access size to
 the legacy reg block
Message-ID: <20230105091310.263867-51-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Laszlo Ersek <lersek@redhat.com>

The modern ACPI CPU hotplug interface was introduced in the following
series (aa1dd39ca307..679dd1a957df), released in v2.7.0:

  1  abd49bc2ed2f docs: update ACPI CPU hotplug spec with new protocol
  2  16bcab97eb9f pc: piix4/ich9: add 'cpu-hotplug-legacy' property
  3  5e1b5d93887b acpi: cpuhp: add CPU devices AML with _STA method
  4  ac35f13ba8f8 pc: acpi: introduce AcpiDeviceIfClass.madt_cpu hook
  5  d2238cb6781d acpi: cpuhp: implement hot-add parts of CPU hotplug
                  interface
  6  8872c25a26cc acpi: cpuhp: implement hot-remove parts of CPU hotplug
                  interface
  7  76623d00ae57 acpi: cpuhp: add cpu._OST handling
  8  679dd1a957df pc: use new CPU hotplug interface since 2.7 machine type

Before patch#1, "docs/specs/acpi_cpu_hotplug.txt" only specified 1-byte
accesses for the hotplug register block.  Patch#1 preserved the same
restriction for the legacy register block, but:

- it specified DWORD accesses for some of the modern registers,

- in particular, the switch from the legacy block to the modern block
  would require a DWORD write to the *legacy* block.

The latter functionality was then implemented in cpu_status_write()
[hw/acpi/cpu_hotplug.c], in patch#8.

Unfortunately, all DWORD accesses depended on a dormant bug: the one
introced in earlier commit a014ed07bd5a ("memory: accept mismatching sizes
in memory_region_access_valid", 2013-05-29); first released in v1.6.0.
Due to commit a014ed07bd5a, the DWORD accesses to the *legacy* CPU hotplug
register block would work in spite of the above series *not* relaxing
"valid.max_access_size = 1" in "hw/acpi/cpu_hotplug.c":

> static const MemoryRegionOps AcpiCpuHotplug_ops = {
>     .read = cpu_status_read,
>     .write = cpu_status_write,
>     .endianness = DEVICE_LITTLE_ENDIAN,
>     .valid = {
>         .min_access_size = 1,
>         .max_access_size = 1,
>     },
> };

Later, in commits e6d0c3ce6895 ("acpi: cpuhp: introduce 'Command data 2'
field", 2020-01-22) and ae340aa3d256 ("acpi: cpuhp: spec: add typical
usecases", 2020-01-22), first released in v5.0.0, the modern CPU hotplug
interface (including the documentation) was extended with another DWORD
*read* access, namely to the "Command data 2" register, which would be
important for the guest to confirm whether it managed to switch the
register block from legacy to modern.

This functionality too silently depended on the bug from commit
a014ed07bd5a.

In commit 5d971f9e6725 ('memory: Revert "memory: accept mismatching sizes
in memory_region_access_valid"', 2020-06-26), first released in v5.1.0,
the bug from commit a014ed07bd5a was fixed (the commit was reverted).
That swiftly exposed the bug in "AcpiCpuHotplug_ops", still present from
the v2.7.0 series quoted at the top -- namely the fact that
"valid.max_access_size = 1" didn't match what the guest was supposed to
do, according to the spec ("docs/specs/acpi_cpu_hotplug.txt").

The symptom is that the "modern interface negotiation protocol"
described in commit ae340aa3d256:

> +      Use following steps to detect and enable modern CPU hotplug interface:
> +        1. Store 0x0 to the 'CPU selector' register,
> +           attempting to switch to modern mode
> +        2. Store 0x0 to the 'CPU selector' register,
> +           to ensure valid selector value
> +        3. Store 0x0 to the 'Command field' register,
> +        4. Read the 'Command data 2' register.
> +           If read value is 0x0, the modern interface is enabled.
> +           Otherwise legacy or no CPU hotplug interface available

falls apart for the guest: steps 1 and 2 are lost, because they are DWORD
writes; so no switching happens.  Step 3 (a single-byte write) is not
lost, but it has no effect; see the condition in cpu_status_write() in
patch#8.  And step 4 *misleads* the guest into thinking that the switch
worked: the DWORD read is lost again -- it returns zero to the guest
without ever reaching the device model, so the guest never learns the
switch didn't work.

This means that guest behavior centered on the "Command data 2" register
worked *only* in the v5.0.0 release; it got effectively regressed in
v5.1.0.

To make things *even more* complicated, the breakage was (and remains, as
of today) visible with TCG acceleration only.  Commit 5d971f9e6725 makes
no difference with KVM acceleration -- the DWORD accesses still work,
despite "valid.max_access_size = 1".

As commit 5d971f9e6725 suggests, fix the problem by raising
"valid.max_access_size" to 4 -- the spec now clearly instructs the guest
to perform DWORD accesses to the legacy register block too, for enabling
(and verifying!) the modern block.  In order to keep compatibility for the
device model implementation though, set "impl.max_access_size = 1", so
that wide accesses be split before they reach the legacy read/write
handlers, like they always have been on KVM, and like they were on TCG
before 5d971f9e6725 (v5.1.0).

Tested with:

- OVMF IA32 + qemu-system-i386, CPU hotplug/hot-unplug with SMM,
  intermixed with ACPI S3 suspend/resume, using KVM accel
  (regression-test);

- OVMF IA32X64 + qemu-system-x86_64, CPU hotplug/hot-unplug with SMM,
  intermixed with ACPI S3 suspend/resume, using KVM accel
  (regression-test);

- OVMF IA32 + qemu-system-i386, SMM enabled, using TCG accel; verified the
  register block switch and the present/possible CPU counting through the
  modern hotplug interface, during OVMF boot (bugfix test);

- I do not have any testcase (guest payload) for regression-testing CPU
  hotplug through the *legacy* CPU hotplug register block.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-stable@nongnu.org
Ref: "IO port write width clamping differs between TCG and KVM"
Link: http://mid.mail-archive.com/aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com
Link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00199.html
Reported-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20230104090138.214862-1-lersek@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Ard Biesheuvel <ardb@kernel.org>
Fixes: b8622725cf ("acpi_piix4: Add infrastructure to send CPU hot-plug GPE to guest")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/cpu_hotplug.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index 53654f8638..ff14c3f410 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -52,6 +52,9 @@ static const MemoryRegionOps AcpiCpuHotplug_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
+        .max_access_size = 4,
+    },
+    .impl = {
         .max_access_size = 1,
     },
 };
-- 
MST


