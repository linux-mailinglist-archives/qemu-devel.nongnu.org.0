Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8965F137
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:30:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDT8Y-0008I9-Vm; Thu, 05 Jan 2023 11:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDT8W-0008FM-WA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:30:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDT8U-0007Up-W3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672936233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgWM9O15A8/cm5m/GANwmeVmLHC3puCV01rJJY8Exg8=;
 b=dQTTAWGxbSWw9sLqETf97FlqnXBid1wI184i6MlEo01v+4vxO8SmDeK/oWlKxqlmMgbXVh
 erRwY6PK32LogdWOaxKdlKyVMFrpkYQ72+TpqeLeAVcxJetpbPoxfkb3Qdx7M1Mp5Y6Ux6
 KctRajNcyGs1OlBV4ZQHX9C9AfcxgWo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-542-NXWbASn0N_C0Kt4-IPqaoQ-1; Thu, 05 Jan 2023 11:30:32 -0500
X-MC-Unique: NXWbASn0N_C0Kt4-IPqaoQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 g18-20020adfa492000000b0027174820fdbso4874734wrb.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MgWM9O15A8/cm5m/GANwmeVmLHC3puCV01rJJY8Exg8=;
 b=Zk1QNZ+fXv5WtwuGl8iL8ad0hFB6FcLUDGdhQJTW8LJa4UzsuR2PvnhfKbZE3g2+Uq
 m6PzthjeSh3RbeaC8FCKiOlrg0ArET3V/KWZhR87UztPKN8oTnYAx5P5dk7wrQsW4m8O
 0zXfrgzz9VgN7iJBd0S+H6gAIlxDjuWwji9X1ddjwo+UI1xRRRpFf67naTp3afrNDn5S
 dX3KKlfqLeIuqKk5jN3YUeWW0g5Z2PwGKp2ZRoGJDJx5cLYPQhPs87Y7M5x2gTYzuBuT
 Crd7/6eL8oJ2jQsVjU/mzGRhDJceZ5B5PGP96A6eFE2CfE0ljpIxO4qJmcYI7cHhL1WM
 yfdg==
X-Gm-Message-State: AFqh2kok1rjTwu9q1zZuMjlllzxMNP/i+2zJNl4INBhf4rvlog0qFWGW
 TKa6fTkB0UUFcep28sz6gc4G0xqTEC8H1/qo0NKjKUrRtUTwSXWwwukf5XmktvwtoY4vCG6sPR/
 o7M/WGNjjCCiZ830jEjzjyR4/iPGr+hBGNefCHynUP07L3234DR9g9dGypgvX
X-Received: by 2002:a05:600c:3c88:b0:3d9:69fd:7707 with SMTP id
 bg8-20020a05600c3c8800b003d969fd7707mr34648666wmb.2.1672936230866; 
 Thu, 05 Jan 2023 08:30:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvq0f7/3xLjo6NBlkhmcYhBV4e3BvbEYrXSch60TU9IYqVJnQFRzZryHhMqfFmzWs1Ui20l4w==
X-Received: by 2002:a05:600c:3c88:b0:3d9:69fd:7707 with SMTP id
 bg8-20020a05600c3c8800b003d969fd7707mr34648638wmb.2.1672936230556; 
 Thu, 05 Jan 2023 08:30:30 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003d1f3e9df3csm3271472wmo.7.2023.01.05.08.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:30:30 -0800 (PST)
Date: Thu, 5 Jan 2023 11:30:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laszlo Ersek <lersek@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
Subject: [PULL v2 50/51] acpi: cpuhp: fix guest-visible maximum access size
 to the legacy reg block
Message-ID: <20230105162836.275244-1-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
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
introduced in earlier commit a014ed07bd5a ("memory: accept mismatching
sizes in memory_region_access_valid", 2013-05-29); first released in
v1.6.0.  Due to commit a014ed07bd5a, the DWORD accesses to the *legacy*
CPU hotplug register block would work in spite of the above series *not*
relaxing "valid.max_access_size = 1" in "hw/acpi/cpu_hotplug.c":

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
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: qemu-stable@nongnu.org
Ref: "IO port write width clamping differs between TCG and KVM"
Link: http://mid.mail-archive.com/aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com
Link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00199.html
Reported-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Tested-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230105161804.82486-1-lersek@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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


