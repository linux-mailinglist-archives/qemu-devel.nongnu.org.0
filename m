Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823F65D0A3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 11:27:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD0zF-0005Uj-3l; Wed, 04 Jan 2023 05:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pD0zC-0005UF-JT
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:27:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pD0zA-0000Zh-0K
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672828023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ec8zcPLCeYFA9rYv53Jj/sqMc7MsXVbSSv4ctOzAJ4U=;
 b=SbbCfBwwfRFkPeiXXpCPggGAUGOuIhy5R0XyqaHwemUkcDxMpaNpKfajlkh80ZgvNKoikS
 3D9bpAXAMst/Z6XBckzRybfja+JnXh15Or35XA33qsA1GCOe23J2HXkEgEuaBWYcBHRUsa
 JLf8E0Iw0AI4uyS2qvokhM0D1x7TciE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-MErnEyxhNeG6SW5Ih3Ks0w-1; Wed, 04 Jan 2023 05:26:59 -0500
X-MC-Unique: MErnEyxhNeG6SW5Ih3Ks0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8212B101A521;
 Wed,  4 Jan 2023 10:26:59 +0000 (UTC)
Received: from [10.39.192.86] (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E94E82166B31;
 Wed,  4 Jan 2023 10:26:57 +0000 (UTC)
Message-ID: <f15171d2-e086-e41e-4a69-0769c3565c42@redhat.com>
Date: Wed, 4 Jan 2023 11:26:56 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to the
 legacy reg block
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu devel list <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org
References: <20230104090138.214862-1-lersek@redhat.com>
 <CAMj1kXEBHez9sENdQ__A7wS-ji-gqbyzE3ehLCrE_Rj3tN4e_A@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <CAMj1kXEBHez9sENdQ__A7wS-ji-gqbyzE3ehLCrE_Rj3tN4e_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
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

On 1/4/23 10:33, Ard Biesheuvel wrote:
> On Wed, 4 Jan 2023 at 10:01, Laszlo Ersek <lersek@redhat.com> wrote:
>>
>> The modern ACPI CPU hotplug interface was introduced in the following
>> series (aa1dd39ca307..679dd1a957df), released in v2.7.0:
>>
>>   1  abd49bc2ed2f docs: update ACPI CPU hotplug spec with new protocol
>>   2  16bcab97eb9f pc: piix4/ich9: add 'cpu-hotplug-legacy' property
>>   3  5e1b5d93887b acpi: cpuhp: add CPU devices AML with _STA method
>>   4  ac35f13ba8f8 pc: acpi: introduce AcpiDeviceIfClass.madt_cpu hook
>>   5  d2238cb6781d acpi: cpuhp: implement hot-add parts of CPU hotplug
>>                   interface
>>   6  8872c25a26cc acpi: cpuhp: implement hot-remove parts of CPU hotplug
>>                   interface
>>   7  76623d00ae57 acpi: cpuhp: add cpu._OST handling
>>   8  679dd1a957df pc: use new CPU hotplug interface since 2.7 machine type
>>
>> Before patch#1, "docs/specs/acpi_cpu_hotplug.txt" only specified 1-byte
>> accesses for the hotplug register block.  Patch#1 preserved the same
>> restriction for the legacy register block, but:
>>
>> - it specified DWORD accesses for some of the modern registers,
>>
>> - in particular, the switch from the legacy block to the modern block
>>   would require a DWORD write to the *legacy* block.
>>
>> The latter functionality was then implemented in cpu_status_write()
>> [hw/acpi/cpu_hotplug.c], in patch#8.
>>
>> Unfortunately, all DWORD accesses depended on a dormant bug: the one
>> introced in earlier commit a014ed07bd5a ("memory: accept mismatching sizes
>> in memory_region_access_valid", 2013-05-29); first released in v1.6.0.
>> Due to commit a014ed07bd5a, the DWORD accesses to the *legacy* CPU hotplug
>> register block would work in spite of the above series *not* relaxing
>> "valid.max_access_size = 1" in "hw/acpi/cpu_hotplug.c":
>>
>>> static const MemoryRegionOps AcpiCpuHotplug_ops = {
>>>     .read = cpu_status_read,
>>>     .write = cpu_status_write,
>>>     .endianness = DEVICE_LITTLE_ENDIAN,
>>>     .valid = {
>>>         .min_access_size = 1,
>>>         .max_access_size = 1,
>>>     },
>>> };
>>
>> Later, in commits e6d0c3ce6895 ("acpi: cpuhp: introduce 'Command data 2'
>> field", 2020-01-22) and ae340aa3d256 ("acpi: cpuhp: spec: add typical
>> usecases", 2020-01-22), first released in v5.0.0, the modern CPU hotplug
>> interface (including the documentation) was extended with another DWORD
>> *read* access, namely to the "Command data 2" register, which would be
>> important for the guest to confirm whether it managed to switch the
>> register block from legacy to modern.
>>
>> This functionality too silently depended on the bug from commit
>> a014ed07bd5a.
>>
>> In commit 5d971f9e6725 ('memory: Revert "memory: accept mismatching sizes
>> in memory_region_access_valid"', 2020-06-26), first released in v5.1.0,
>> the bug from commit a014ed07bd5a was fixed (the commit was reverted).
>> That swiftly exposed the bug in "AcpiCpuHotplug_ops", still present from
>> the v2.7.0 series quoted at the top -- namely the fact that
>> "valid.max_access_size = 1" didn't match what the guest was supposed to
>> do, according to the spec ("docs/specs/acpi_cpu_hotplug.txt").
>>
>> The symptom is that the "modern interface negotiation protocol"
>> described in commit ae340aa3d256:
>>
>>> +      Use following steps to detect and enable modern CPU hotplug interface:
>>> +        1. Store 0x0 to the 'CPU selector' register,
>>> +           attempting to switch to modern mode
>>> +        2. Store 0x0 to the 'CPU selector' register,
>>> +           to ensure valid selector value
>>> +        3. Store 0x0 to the 'Command field' register,
>>> +        4. Read the 'Command data 2' register.
>>> +           If read value is 0x0, the modern interface is enabled.
>>> +           Otherwise legacy or no CPU hotplug interface available
>>
>> falls apart for the guest: steps 1 and 2 are lost, because they are DWORD
>> writes; so no switching happens.  Step 3 (a single-byte write) is not
>> lost, but it has no effect; see the condition in cpu_status_write() in
>> patch#8.  And step 4 *misleads* the guest into thinking that the switch
>> worked: the DWORD read is lost again -- it returns zero to the guest
>> without ever reaching the device model, so the guest never learns the
>> switch didn't work.
>>
>> This means that guest behavior centered on the "Command data 2" register
>> worked *only* in the v5.0.0 release; it got effectively regressed in
>> v5.1.0.
>>
>> To make things *even more* complicated, the breakage was (and remains, as
>> of today) visible with TCG acceleration only.  Commit 5d971f9e6725 makes
>> no difference with KVM acceleration -- the DWORD accesses still work,
>> despite "valid.max_access_size = 1".
>>
>> As commit 5d971f9e6725 suggests, fix the problem by raising
>> "valid.max_access_size" to 4 -- the spec now clearly instructs the guest
>> to perform DWORD accesses to the legacy register block too, for enabling
>> (and verifying!) the modern block.  In order to keep compatibility for the
>> device model implementation though, set "impl.max_access_size = 1", so
>> that wide accesses be split before they reach the legacy read/write
>> handlers, like they always have been on KVM, and like they were on TCG
>> before 5d971f9e6725 (v5.1.0).
>>
>> Tested with:
>>
>> - OVMF IA32 + qemu-system-i386, CPU hotplug/hot-unplug with SMM,
>>   intermixed with ACPI S3 suspend/resume, using KVM accel
>>   (regression-test);
>>
>> - OVMF IA32X64 + qemu-system-x86_64, CPU hotplug/hot-unplug with SMM,
>>   intermixed with ACPI S3 suspend/resume, using KVM accel
>>   (regression-test);
>>
>> - OVMF IA32 + qemu-system-i386, SMM enabled, using TCG accel; verified the
>>   register block switch and the present/possible CPU counting through the
>>   modern hotplug interface, during OVMF boot (bugfix test);
>>
>> - I do not have any testcase (guest payload) for regression-testing CPU
>>   hotplug through the *legacy* CPU hotplug register block.
>>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Ani Sinha <ani@anisinha.ca>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-stable@nongnu.org
>> Ref: "IO port write width clamping differs between TCG and KVM"
>> Link: http://mid.mail-archive.com/aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com
>> Link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00199.html
>> Reported-by: Ard Biesheuvel <ardb@kernel.org>
>> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> 
> Thanks for going down this rabbit hole.
> 
> With this patch applied, the QEMU IA32 regression that would only
> manifest when using KVM now also happens in TCG mode.
> 
> Yay

Yes -- now that OVMF sees the proper CPU counts on TCG, the UefiCpuPkg
regression in <https://bugzilla.tianocore.org/show_bug.cgi?id=4234> is
supposed to hit OVMF on TCG as well. IOW, with the device model fixed,
TCG's effective "hiding" of the CPUs no longer happens, and thus no
longer masks TianoCore#4234.

(Expanded your comment a little bit because at first I didn't get it,
and then thought that qemu-devel might benefit from an explanation.)

> 
> Tested-by: Ard Biesheuvel <ardb@kernel.org>

Thank you!
Laszlo

> 
>> ---
>>
>> Notes:
>>     This should be applied to:
>>
>>     - stable-5.2 (new branch)
>>
>>     - stable-6.2 (new branch)
>>
>>     - stable-7.2 (new branch)
>>
>>     whichever is still considered maintained, as there is currently *no*
>>     public QEMU release in which the modern CPU hotplug register block
>>     works, when using TCG acceleration.  v5.0.0 works, but that minor
>>     release has been obsoleted by v5.2.0, which does not work.
>>
>>  hw/acpi/cpu_hotplug.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
>> index 53654f863830..ff14c3f4106f 100644
>> --- a/hw/acpi/cpu_hotplug.c
>> +++ b/hw/acpi/cpu_hotplug.c
>> @@ -52,6 +52,9 @@ static const MemoryRegionOps AcpiCpuHotplug_ops = {
>>      .endianness = DEVICE_LITTLE_ENDIAN,
>>      .valid = {
>>          .min_access_size = 1,
>> +        .max_access_size = 4,
>> +    },
>> +    .impl = {
>>          .max_access_size = 1,
>>      },
>>  };
> 


