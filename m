Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628016B0FCA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:06:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZxE2-00047Y-Kv; Wed, 08 Mar 2023 12:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZxDZ-00037I-Hm; Wed, 08 Mar 2023 12:04:45 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZxDU-0005XV-DY; Wed, 08 Mar 2023 12:04:45 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id DDC87400C1;
 Wed,  8 Mar 2023 19:58:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 70EA692;
 Wed,  8 Mar 2023 19:58:17 +0300 (MSK)
Received: (nullmailer pid 2098268 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 08/47] acpi: cpuhp: fix guest-visible maximum access size to
 the legacy reg block
Date: Wed,  8 Mar 2023 19:57:11 +0300
Message-Id: <20230308165815.2098148-8-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
(cherry picked from commit dab30fbef3896bb652a09d46c37d3f55657cbcbb)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.30.2


