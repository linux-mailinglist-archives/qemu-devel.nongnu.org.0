Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E5B663F88
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 12:53:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDBP-0006y9-0h; Tue, 10 Jan 2023 06:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFDBM-0006xf-NH
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 06:52:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFDBJ-0007At-W3
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 06:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673351556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ooVlt9gSEjX8AtpqYGOFB5eW0b83ngZWNptsmB6hUjM=;
 b=WJy+CD5oHRpJkFc633/nua7vaVz9ycQwi1CDUetZcpFmMHwbkNbyfBzNkuTtOtY3dpqkfU
 eeVR9ZOLqSJFXg32Joc7D0eyLTs4MElqg+FUvx2YysqWuWQOSGnxRjS/jxy9UXpjNfm2Gg
 OfxY6XHZ/OIkR8dlv1Jn4VJ0773G4Mw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-UkuCdUq_PTKpFFwhQCgxPg-1; Tue, 10 Jan 2023 06:52:34 -0500
X-MC-Unique: UkuCdUq_PTKpFFwhQCgxPg-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso8901052wmb.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 03:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ooVlt9gSEjX8AtpqYGOFB5eW0b83ngZWNptsmB6hUjM=;
 b=7QtXxKSIZ4XaN9CWcBf75O9Z80DsKkstyDXOGXmiOJuSIzlw56VwIwfebOVmRLKX07
 akIEf+Ma8UOqT7WyQYXcadeQXO1PBUHpFN29PlQ3H9e9/ZxGUbb4hVB1xVuMIDe6DjUY
 7tU4a+96qDdwFFeSvDqW2ZSYEP6Zqme+mBHke+d8a6rpnvQjE6q7cQ+OYGJnrQAo/8rx
 nE4KjggImqi9U0VkRIpcMsheeKyXF5X0SoGuiif54p+VROLr6MRDbtsiPOeBpJudWIxO
 MZBOa+CSkeO6bI30xp8P3XBGPyUtmBj4EHl3iP6k61dvNOgzDd36F7v5FK7bfcQVNefy
 J2Ow==
X-Gm-Message-State: AFqh2koo0EWS6HMKYwBkzVHSomXyN85Te/nl28EC8Pjpp6dnH0Q2arGr
 Kpaj97N9cVPjRwciIKSz3N2RziIO0MJtqwDUXZNaUOGLONOp/JNpoPyhp3rZtb2aw7GtOfFEQeF
 rCeZN4SskWrAu9j4=
X-Received: by 2002:a05:600c:4e90:b0:3cf:894f:964b with SMTP id
 f16-20020a05600c4e9000b003cf894f964bmr50627350wmq.16.1673351553634; 
 Tue, 10 Jan 2023 03:52:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvFaset5KeULeBk7aMvoTwbpOdxbxi0+fMhE5WJLWJ1UccNe8m5gdlMFsLsmc72ghUHCRgBuA==
X-Received: by 2002:a05:600c:4e90:b0:3cf:894f:964b with SMTP id
 f16-20020a05600c4e9000b003cf894f964bmr50627335wmq.16.1673351553219; 
 Tue, 10 Jan 2023 03:52:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:4200:65d9:4d0d:bb61:14c8?
 (p200300cbc708420065d94d0dbb6114c8.dip0.t-ipconnect.de.
 [2003:cb:c708:4200:65d9:4d0d:bb61:14c8])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b00296730b5c3esm11053324wrm.102.2023.01.10.03.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 03:52:32 -0800 (PST)
Message-ID: <c6a66296-94a7-e1ef-e0c1-098071f961d2@redhat.com>
Date: Tue, 10 Jan 2023 12:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com> <Y7W2LtO5/m1r3VaL@x1n>
 <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com> <Y7cFplyGc4hIrYZW@x1n>
 <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com> <Y7xw4RqLQUFWZyfI@x1n>
 <460b6ea0-67a6-891f-f8fb-a5f23e9985c4@redhat.com>
Organization: Red Hat
In-Reply-To: <460b6ea0-67a6-891f-f8fb-a5f23e9985c4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 10.01.23 11:18, David Hildenbrand wrote:
> On 09.01.23 20:54, Peter Xu wrote:
>> On Mon, Jan 09, 2023 at 03:34:48PM +0100, David Hildenbrand wrote:
>>> On 05.01.23 18:15, Peter Xu wrote:
>>>> On Thu, Jan 05, 2023 at 09:35:54AM +0100, David Hildenbrand wrote:
>>>>> On 04.01.23 18:23, Peter Xu wrote:
>>>>>> On Thu, Dec 22, 2022 at 12:02:10PM +0100, David Hildenbrand wrote:
>>>>>>> Migrating device state before we start iterating is currently impossible.
>>>>>>> Introduce and use qemu_savevm_state_start_precopy(), and use
>>>>>>> a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
>>>>>>> state will be saved in qemu_savevm_state_start_precopy() or in
>>>>>>> qemu_savevm_state_complete_precopy_*().
>>>>>>
>>>>>> Can something like this be done in qemu_savevm_state_setup()?
>>>>>
>>>>> Hi Peter,
>>>>
>>>> Hi, David,
>>>>
>>>>>
>>>>> Do you mean
>>>>>
>>>>> (a) Moving qemu_savevm_state_start_precopy() effectively into
>>>>>        qemu_savevm_state_setup()
>>>>>
>>>>> (b) Using se->ops->save_setup()
>>>>
>>>> I meant (b).
>>>>
>>>>>
>>>>> I first tried going via (b), but decided to go the current way of using a
>>>>> proper vmstate with properties (instead of e.g., filling the stream
>>>>> manually), which also made vmdesc handling possible (and significantly
>>>>> cleaner).
>>>>>
>>>>> Regarding (a), I decided to not move logic of
>>>>> qemu_savevm_state_start_precopy() into qemu_savevm_state_setup(), because it
>>>>> looked cleaner to save device state with the BQL held and for background
>>>>> snapshots, the VM has been stopped. To decouple device state saving from the
>>>>> setup path, just like we do it right now for all vmstates.
>>>>
>>>> Is BQL required or optional?  IIUC it's at least still not taken in the
>>>> migration thread path, only in savevm path.
>>>>
>>>>>
>>>>> Having that said, for virtio-mem, it would still work because that state is
>>>>> immutable once migration starts, but it felt cleaner to separate the setup()
>>>>> phase from actual device state saving.
>>>>
>>>> I get the point.  My major concerns are:
>>>>
>>>>      (1) The new migration priority is changing the semantic of original,
>>>>          making it over-complicated
>>>>
>>>>      (2) The new precopy-start routine added one more step to the migration
>>>>          framework, while it's somehow overlapping (if not to say, mostly the
>>>>          same as..) save_setup().
>>>>
>>>> For (1): the old priority was only deciding the order of save entries in
>>>> the global list, nothing more than that.  Even if we want to have a
>>>> precopy-start phase, I'd suggest we use something else and keep the
>>>> migration priority simple.  Otherwise we really need serious documentation
>>>> for MigrationPriority and if so I'd rather don't bother and not reuse the
>>>> priority field.
>>>>
>>>> For (2), if you see there're a bunch of save_setup() that already does
>>>> things like transferring static data besides the device states.  Besides
>>>> the notorious ram_save_setup() there's also dirty_bitmap_save_setup() which
>>>> also sends a bitmap during save_setup() and some others.  It looks clean to
>>>> me to do it in the same way as we used to.
>>>>
>>>> Reusing vmstate_save() and vmsd structures are useful too which I totally
>>>> agree.  So.. can we just call vmstate_save_state() in the save_setup() of
>>>> the other new vmsd of virtio-mem?
>>>
>>>
>>> I went halfway that way, by moving stuff into qemu_savevm_state_setup()
>>> and avoiding using a new migration priority. Seems to work:
>>
>> The whole point of my suggestion is not moving things into
>> qemu_savevm_state_setup(), but avoid introducing more complexity to the
>> migration framework if unnecessary, so keep the generic framework as simple
>> as possible.
> 
> IMHO, the current approach is actually quite simple and clean. But ...
>>
>>>
>>> I think we could go one step further and perform it from a save_setup() callback,
>>> however, I'm not convinced that this gets particularly cleaner (vmdesc handling
>>> eventually).
>>
>> What I wanted to suggest is exactly trying to avoid vmsd handling.  To be
>> more explicit, I mean: besides vmstate_virtio_mem_device_early, virtio-mem
>> can register with another new SaveVMHandlers with both save_setup and
>> load_setup registered, then e.g. in its save_setup(), one simply calls:
> 
> ... I can see if it can be made working that way and how the result looks. I know
> that we use vmstate_save_state() from virtio code, but I don't remember using
> it in save_setup() from QEMU_VM_SECTION_START and not QEMU_VM_SECTION_FULL.
> 
> 
> There is this interesting bit in register_savevm_live(), which sets "se->is_ram = 1".
> qemu_save_device_state() will not include the state. As it's used by XEN, I don't
> particularly care.
> 
> 
>>
>>     vmstate_save_state(f, &vmstate_virtio_mem_device_early, virtio_mem_dev,
>>                        NULL);
>>
>> I'm not sure whether the JSONWriter* is required in this case, maybe not
>> yet to at least make it work.
> 
> It was required when handling vmstates the current way to make
> analyze-migration.py not bail out (which is a good thing because one can
> actually inspect the migration content):
> 
> $ ./scripts/analyze-migration.py -f STATEFILE
> {
>       "ram (2)": {
>           "section sizes": {
>               "0000:00:03.0/mem0": "0x0000000f00000000",
>               "pc.ram": "0x0000000100000000",
>               "/rom@etc/acpi/tables": "0x0000000000020000",
>               "pc.bios": "0x0000000000040000",
>               "0000:00:02.0/e1000.rom": "0x0000000000040000",
>               "pc.rom": "0x0000000000020000",
>               "/rom@etc/table-loader": "0x0000000000001000",
>               "/rom@etc/acpi/rsdp": "0x0000000000001000"
>           }
>       },
>       "0000:00:03.0/virtio-mem-device-early (51)": {
>           "tmp": "00 00 00 01 40 00 00 00 00 00 00 0f 00 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00",
>           "size": "0x0000000000000000",
>           "bitmap": "00 00 00 00 00 00 00 00 00 00
> 	...
>       },
>       "timer (0)": {
> ...
> 
>>
>> We'll need to impl the load part, but then IIUC we don't need to touch the
>> migration framework at all, and we keep all similar things (like other
>> devices I mentioned) to be inside save_setup().
>>
>> Would that work?
> 
> Let me play with it.
> 

The following seems to work, but makes analyze-migration.py angry:

$ ./scripts/analyze-migration.py -f STATEFILE
Traceback (most recent call last):
   File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 605, in <module>
     dump.read(dump_memory = args.memory)
   File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 539, in read
     classdesc = self.section_classes[section_key]
                 ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^
KeyError: ('0000:00:03.0/virtio-mem-early', 0)


We need the vmdesc to create info for the device.


 From 052d8deaa5341d7abe9c8428b50b50613bfef408 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Wed, 21 Dec 2022 10:04:06 +0100
Subject: [PATCH] virtio-mem: Migrate bitmap, size and sanity checks early

The bitmap and the size are immutable while migration is active: see
virtio_mem_is_busy(). We can migrate this information early, before
migrating any actual RAM content.

Having this information in place early will, for example, allow for
properly preallocating memory before touching these memory locations
during RAM migration: this way, we can make sure that all memory was
actually preallocated and that any user errors (e.g., insufficient
hugetlb pages) can be handled gracefully.

In contrast, usable_region_size and requested_size can theoretically
still be modified on the source while the VM is running. Keep migrating
these properties the usual, late, way.

Use a new device property to keep behavior of compat machines
unmodified.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  hw/core/machine.c              |  4 +-
  hw/virtio/virtio-mem.c         | 81 +++++++++++++++++++++++++++++++++-
  include/hw/virtio/virtio-mem.h |  8 ++++
  3 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 616f3a207c..29b57f6448 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -41,7 +41,9 @@
  #include "hw/virtio/virtio-pci.h"
  #include "qom/object_interfaces.h"
  
-GlobalProperty hw_compat_7_2[] = {};
+GlobalProperty hw_compat_7_2[] = {
+    { "virtio-mem", "x-early-migration", "false" },
+};
  const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
  
  GlobalProperty hw_compat_7_1[] = {
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 02f7b5469a..54e4f956c8 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -26,11 +26,14 @@
  #include "qapi/visitor.h"
  #include "exec/ram_addr.h"
  #include "migration/misc.h"
+#include "migration/register.h"
  #include "hw/boards.h"
  #include "hw/qdev-properties.h"
  #include CONFIG_DEVICES
  #include "trace.h"
  
+static const SaveVMHandlers vmstate_virtio_mem_device_early_ops;
+
  /*
   * We only had legacy x86 guests that did not support
   * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE. Other targets don't have legacy guests.
@@ -878,6 +881,23 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
  
      host_memory_backend_set_mapped(vmem->memdev, true);
      vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
+    if (vmem->early_migration) {
+        char idstr[256] = "";
+        char *oid;
+
+        /* See unregister_savevm() */
+        oid = vmstate_if_get_id(VMSTATE_IF(vmem));
+        if (oid) {
+            pstrcpy(idstr, sizeof(idstr), oid);
+            pstrcat(idstr, sizeof(idstr), "/");
+            g_free(oid);
+        }
+        pstrcat(idstr, sizeof(idstr), "virtio-mem-early");
+
+        register_savevm_live(idstr, VMSTATE_INSTANCE_ID_ANY, 1,
+                             &vmstate_virtio_mem_device_early_ops,
+                             vmem);
+    }
      qemu_register_reset(virtio_mem_system_reset, vmem);
  
      /*
@@ -899,6 +919,9 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
       */
      memory_region_set_ram_discard_manager(&vmem->memdev->mr, NULL);
      qemu_unregister_reset(virtio_mem_system_reset, vmem);
+    if (vmem->early_migration) {
+        unregister_savevm(VMSTATE_IF(vmem), "virtio-mem-early", vmem);
+    }
      vmstate_unregister_ram(&vmem->memdev->mr, DEVICE(vmem));
      host_memory_backend_set_mapped(vmem->memdev, false);
      virtio_del_queue(vdev, 0);
@@ -1015,23 +1038,75 @@ static const VMStateDescription vmstate_virtio_mem_sanity_checks = {
      },
  };
  
+static bool virtio_mem_vmstate_field_exists(void *opaque, int version_id)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(opaque);
+
+    /* With early migration, these fields were already migrated. */
+    return !vmem->early_migration;
+}
+
  static const VMStateDescription vmstate_virtio_mem_device = {
      .name = "virtio-mem-device",
      .minimum_version_id = 1,
      .version_id = 1,
      .priority = MIG_PRI_VIRTIO_MEM,
      .post_load = virtio_mem_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_WITH_TMP_TEST(VirtIOMEM, virtio_mem_vmstate_field_exists,
+                              VirtIOMEMMigSanityChecks,
+                              vmstate_virtio_mem_sanity_checks),
+        VMSTATE_UINT64(usable_region_size, VirtIOMEM),
+        VMSTATE_UINT64_TEST(size, VirtIOMEM, virtio_mem_vmstate_field_exists),
+        VMSTATE_UINT64(requested_size, VirtIOMEM),
+        VMSTATE_BITMAP_TEST(bitmap, VirtIOMEM, virtio_mem_vmstate_field_exists,
+                            0, bitmap_size),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+/*
+ * Transfer properties that are immutable while migration is active early,
+ * such that we have have this information around before migrating any RAM
+ * content.
+ *
+ * Note that virtio_mem_is_busy() makes sure these properties can no longer
+ * change on the migration source until migration completed.
+ *
+ * With QEMU compat machines, we transmit these properties later, via
+ * vmstate_virtio_mem_device instead -- see virtio_mem_vmstate_field_exists().
+ */
+static const VMStateDescription vmstate_virtio_mem_device_early = {
+    .name = "virtio-mem-device-early",
+    .minimum_version_id = 1,
+    .version_id = 1,
      .fields = (VMStateField[]) {
          VMSTATE_WITH_TMP(VirtIOMEM, VirtIOMEMMigSanityChecks,
                           vmstate_virtio_mem_sanity_checks),
-        VMSTATE_UINT64(usable_region_size, VirtIOMEM),
          VMSTATE_UINT64(size, VirtIOMEM),
-        VMSTATE_UINT64(requested_size, VirtIOMEM),
          VMSTATE_BITMAP(bitmap, VirtIOMEM, 0, bitmap_size),
          VMSTATE_END_OF_LIST()
      },
  };
  
+static int virtio_mem_save_setup_early(QEMUFile *f, void *opaque)
+{
+    return vmstate_save_state(f, &vmstate_virtio_mem_device_early, opaque,
+                              NULL);
+}
+
+static int virtio_mem_load_state_early(QEMUFile *f, void *opaque,
+                                       int version_id)
+{
+    return vmstate_load_state(f, &vmstate_virtio_mem_device_early, opaque,
+                              vmstate_virtio_mem_device_early.version_id);
+}
+
+static const SaveVMHandlers vmstate_virtio_mem_device_early_ops = {
+    .save_setup = virtio_mem_save_setup_early,
+    .load_state = virtio_mem_load_state_early,
+};
+
  static const VMStateDescription vmstate_virtio_mem = {
      .name = "virtio-mem",
      .minimum_version_id = 1,
@@ -1211,6 +1286,8 @@ static Property virtio_mem_properties[] = {
      DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
                              unplugged_inaccessible, ON_OFF_AUTO_AUTO),
  #endif
+    DEFINE_PROP_BOOL(VIRTIO_MEM_EARLY_MIGRATION_PROP, VirtIOMEM,
+                     early_migration, true),
      DEFINE_PROP_END_OF_LIST(),
  };
  
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 7745cfc1a3..f15e561785 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(VirtIOMEM, VirtIOMEMClass,
  #define VIRTIO_MEM_BLOCK_SIZE_PROP "block-size"
  #define VIRTIO_MEM_ADDR_PROP "memaddr"
  #define VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP "unplugged-inaccessible"
+#define VIRTIO_MEM_EARLY_MIGRATION_PROP "x-early-migration"
  #define VIRTIO_MEM_PREALLOC_PROP "prealloc"
  
  struct VirtIOMEM {
@@ -74,6 +75,13 @@ struct VirtIOMEM {
      /* whether to prealloc memory when plugging new blocks */
      bool prealloc;
  
+    /*
+     * Whether we migrate properties that are immutable while migration is
+     * active early, before state of other devices and especially, before
+     * migrating any RAM content.
+     */
+    bool early_migration;
+
      /* notifiers to notify when "size" changes */
      NotifierList size_change_notifiers;
  
-- 
2.39.0



-- 
Thanks,

David / dhildenb


