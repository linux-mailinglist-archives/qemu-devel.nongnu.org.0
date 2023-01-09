Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53636628A9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:37:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtFx-0007qY-0k; Mon, 09 Jan 2023 09:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pEtFr-0007pf-Rg
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:36:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pEtFp-0002qz-Ei
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673274960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJtLAtf0aZQ6tu/5hZFG4ygETnrhZA+V3OKmhnlb9TA=;
 b=HqybRPniGz31HE/pN7HNj1isl+yoW5tlGHV9Ypv7E82l2WFawDtiTBRO4ApnM2mgXBsAjZ
 USfUP3NMiPLeCgTQo9Q6KZ5QY6CeJNMw1fUGWtnKODwIgd2vb6cXkUGXojZNjrAVMYSZys
 rF0CiVmFAG0wn5BnJq6LuZRz1zHxcb0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-4R_1p8yXOpSXvRiHfkDk0A-1; Mon, 09 Jan 2023 09:34:52 -0500
X-MC-Unique: 4R_1p8yXOpSXvRiHfkDk0A-1
Received: by mail-wm1-f70.google.com with SMTP id
 l9-20020a7bc349000000b003d35aa4ed8eso1705382wmj.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:34:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VJtLAtf0aZQ6tu/5hZFG4ygETnrhZA+V3OKmhnlb9TA=;
 b=r5wk/30f/PyHTgMAsEKpRpy7pRepmWpOJBoxMkY83HQ+3Qp18CppCoB0h8FQrR41G7
 7+ayJa1u6xCcW/9ZvhJstEE6jL7k/LRhzjoKpx09jSbUzx98fsBHvgHM5H1Oz83Sia7P
 CF+sriZ1ljnZU/edjckRPeUEZ5D/iuF2pJGcQakL965GOwAusyAeoOOZQD/RSMlFC3Xh
 XrHqd1ulh1IBLY+KvZM2t+F5XYmNmQaUTBgHktt2o8ln91tBngf92c5V4XrXe0vp+pi9
 K5/Knh3gkSbam/yfbV0W75Kf6Is5145G+mahsEC7TYubj/yLcNF5uoMpteXCAYlu8Nwq
 skGg==
X-Gm-Message-State: AFqh2kpoZspxfa/eDDIHMv3Sqx5AOJGewkAXndfPrI9I+1IBC1U0Uv9g
 hK2ic2BI5L90FrmJZIDQWCWNR97sToE+JJ8aOA4MbwtlXZc+zrWvd75HkuFXlNvAXgKV0neLXCM
 rl1Bvkh8PGEZu+xk=
X-Received: by 2002:a05:600c:b4d:b0:3d3:5d69:7aa5 with SMTP id
 k13-20020a05600c0b4d00b003d35d697aa5mr44891887wmr.25.1673274890863; 
 Mon, 09 Jan 2023 06:34:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtmXQcuA0EpP16vqjWYbsDefUdzL1Xd+AnI10pQwdf7hvy1LSnY4yiiae/zisi8eV4b6GfewA==
X-Received: by 2002:a05:600c:b4d:b0:3d3:5d69:7aa5 with SMTP id
 k13-20020a05600c0b4d00b003d35d697aa5mr44891871wmr.25.1673274890549; 
 Mon, 09 Jan 2023 06:34:50 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:8f00:ba3:7d27:204f:8e29?
 (p200300cbc7038f000ba37d27204f8e29.dip0.t-ipconnect.de.
 [2003:cb:c703:8f00:ba3:7d27:204f:8e29])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b003d9780466b0sm12939820wmq.31.2023.01.09.06.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 06:34:50 -0800 (PST)
Message-ID: <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com>
Date: Mon, 9 Jan 2023 15:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com> <Y7W2LtO5/m1r3VaL@x1n>
 <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com> <Y7cFplyGc4hIrYZW@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
In-Reply-To: <Y7cFplyGc4hIrYZW@x1n>
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

On 05.01.23 18:15, Peter Xu wrote:
> On Thu, Jan 05, 2023 at 09:35:54AM +0100, David Hildenbrand wrote:
>> On 04.01.23 18:23, Peter Xu wrote:
>>> On Thu, Dec 22, 2022 at 12:02:10PM +0100, David Hildenbrand wrote:
>>>> Migrating device state before we start iterating is currently impossible.
>>>> Introduce and use qemu_savevm_state_start_precopy(), and use
>>>> a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
>>>> state will be saved in qemu_savevm_state_start_precopy() or in
>>>> qemu_savevm_state_complete_precopy_*().
>>>
>>> Can something like this be done in qemu_savevm_state_setup()?
>>
>> Hi Peter,
> 
> Hi, David,
> 
>>
>> Do you mean
>>
>> (a) Moving qemu_savevm_state_start_precopy() effectively into
>>      qemu_savevm_state_setup()
>>
>> (b) Using se->ops->save_setup()
> 
> I meant (b).
> 
>>
>> I first tried going via (b), but decided to go the current way of using a
>> proper vmstate with properties (instead of e.g., filling the stream
>> manually), which also made vmdesc handling possible (and significantly
>> cleaner).
>>
>> Regarding (a), I decided to not move logic of
>> qemu_savevm_state_start_precopy() into qemu_savevm_state_setup(), because it
>> looked cleaner to save device state with the BQL held and for background
>> snapshots, the VM has been stopped. To decouple device state saving from the
>> setup path, just like we do it right now for all vmstates.
> 
> Is BQL required or optional?  IIUC it's at least still not taken in the
> migration thread path, only in savevm path.
> 
>>
>> Having that said, for virtio-mem, it would still work because that state is
>> immutable once migration starts, but it felt cleaner to separate the setup()
>> phase from actual device state saving.
> 
> I get the point.  My major concerns are:
> 
>    (1) The new migration priority is changing the semantic of original,
>        making it over-complicated
> 
>    (2) The new precopy-start routine added one more step to the migration
>        framework, while it's somehow overlapping (if not to say, mostly the
>        same as..) save_setup().
> 
> For (1): the old priority was only deciding the order of save entries in
> the global list, nothing more than that.  Even if we want to have a
> precopy-start phase, I'd suggest we use something else and keep the
> migration priority simple.  Otherwise we really need serious documentation
> for MigrationPriority and if so I'd rather don't bother and not reuse the
> priority field.
> 
> For (2), if you see there're a bunch of save_setup() that already does
> things like transferring static data besides the device states.  Besides
> the notorious ram_save_setup() there's also dirty_bitmap_save_setup() which
> also sends a bitmap during save_setup() and some others.  It looks clean to
> me to do it in the same way as we used to.
> 
> Reusing vmstate_save() and vmsd structures are useful too which I totally
> agree.  So.. can we just call vmstate_save_state() in the save_setup() of
> the other new vmsd of virtio-mem?


I went halfway that way, by moving stuff into qemu_savevm_state_setup()
and avoiding using a new migration priority. Seems to work:

I think we could go one step further and perform it from a save_setup() callback,
however, I'm not convinced that this gets particularly cleaner (vmdesc handling
eventually).

However, if there are hard feelings, I can look into that. Thanks.


 From e501f80dbbca1260445a6dac03053f426fbb572d Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Tue, 20 Dec 2022 18:14:33 +0100
Subject: [PATCH] migration: Allow immutable device state to be migrated early
  (i.e., before RAM)

For virtio-mem, we want to have the plugged/unplugged state of memory
blocks available before migrating any actual RAM content. This
information is immutable on the migration source while migration is active,

For example, we want to use this information for proper preallocation
support with migration: currently, we don't preallocate memory on the
migration target, and especially with hugetlb, we can easily run out of
hugetlb pages during RAM migration and will crash (SIGBUS) instead of
catching this gracefully via preallocation.

Migrating device state before we start iterating is currently impossible.
Let's allow for migrating such state during the setup state, indicating
applicable vmstate descriptors using a "immutable" flag.

We have to take care of properly including the early device state in the
vmdesc. Relying on migrate_get_current() to temporarily store the vmdesc is
a bit sub-optimal, but we use that explicitly or implicitly all over the
place already, so this barely matters in practice.

Note that only very selected devices (i.e., ones seriously messing with
RAM setup) are supposed to make use of that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  include/migration/vmstate.h |  5 +++
  migration/migration.c       |  4 ++
  migration/migration.h       |  4 ++
  migration/savevm.c          | 85 +++++++++++++++++++++++++++----------
  4 files changed, 75 insertions(+), 23 deletions(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index ad24aa1934..610e4c1e38 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -179,6 +179,11 @@ struct VMStateField {
  struct VMStateDescription {
      const char *name;
      int unmigratable;
+    /*
+     * The state is immutable while migration is active and the state can
+     * be migrated early, during the setup phase.
+     */
+    int immutable;
      int version_id;
      int minimum_version_id;
      MigrationPriority priority;
diff --git a/migration/migration.c b/migration/migration.c
index 52b5d39244..1d33a7efa0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2170,6 +2170,9 @@ void migrate_init(MigrationState *s)
      s->vm_was_running = false;
      s->iteration_initial_bytes = 0;
      s->threshold_size = 0;
+
+    json_writer_free(s->vmdesc);
+    s->vmdesc = NULL;
  }
  
  int migrate_add_blocker_internal(Error *reason, Error **errp)
@@ -4445,6 +4448,7 @@ static void migration_instance_finalize(Object *obj)
      qemu_sem_destroy(&ms->rp_state.rp_sem);
      qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
      error_free(ms->error);
+    json_writer_free(ms->vmdesc);
  }
  
  static void migration_instance_init(Object *obj)
diff --git a/migration/migration.h b/migration/migration.h
index ae4ffd3454..66511ce532 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -17,6 +17,7 @@
  #include "exec/cpu-common.h"
  #include "hw/qdev-core.h"
  #include "qapi/qapi-types-migration.h"
+#include "qapi/qmp/json-writer.h"
  #include "qemu/thread.h"
  #include "qemu/coroutine_int.h"
  #include "io/channel.h"
@@ -366,6 +367,9 @@ struct MigrationState {
       * This save hostname when out-going migration starts
       */
      char *hostname;
+
+    /* QEMU_VM_VMDESCRIPTION content filled for all non-iterable devices. */
+    JSONWriter *vmdesc;
  };
  
  void migrate_set_state(int *state, int old_state, int new_state);
diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..e77f643f52 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -42,7 +42,6 @@
  #include "postcopy-ram.h"
  #include "qapi/error.h"
  #include "qapi/qapi-commands-migration.h"
-#include "qapi/qmp/json-writer.h"
  #include "qapi/clone-visitor.h"
  #include "qapi/qapi-builtin-visit.h"
  #include "qapi/qmp/qerror.h"
@@ -1161,14 +1160,63 @@ bool qemu_savevm_state_guest_unplug_pending(void)
      return false;
  }
  
+static int qemu_savevm_state_precopy_one_non_iterable(SaveStateEntry *se,
+                                                      QEMUFile *f,
+                                                      JSONWriter *vmdesc)
+{
+    int ret;
+
+    if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
+        trace_savevm_section_skip(se->idstr, se->section_id);
+        return 0;
+    }
+
+    trace_savevm_section_start(se->idstr, se->section_id);
+
+    json_writer_start_object(vmdesc, NULL);
+    json_writer_str(vmdesc, "name", se->idstr);
+    json_writer_int64(vmdesc, "instance_id", se->instance_id);
+
+    save_section_header(f, se, QEMU_VM_SECTION_FULL);
+    ret = vmstate_save(f, se, vmdesc);
+    if (ret) {
+        qemu_file_set_error(f, ret);
+        return ret;
+    }
+    trace_savevm_section_end(se->idstr, se->section_id, 0);
+    save_section_footer(f, se);
+
+    json_writer_end_object(vmdesc);
+    return 0;
+}
+
  void qemu_savevm_state_setup(QEMUFile *f)
  {
-    SaveStateEntry *se;
+    MigrationState *ms = migrate_get_current();
      Error *local_err = NULL;
+    SaveStateEntry *se;
+    JSONWriter *vmdesc;
      int ret;
  
+    assert(!ms->vmdesc);
+    ms->vmdesc = vmdesc = json_writer_new(false);
+    json_writer_start_object(vmdesc, NULL);
+    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
+    json_writer_start_array(vmdesc, "devices");
+
      trace_savevm_state_setup();
      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (se->vmsd) {
+            if (!se->vmsd->immutable) {
+                continue;
+            }
+            ret = qemu_savevm_state_precopy_one_non_iterable(se, f, vmdesc);
+            if (ret) {
+                break;
+            }
+            continue;
+        }
+
          if (!se->ops || !se->ops->save_setup) {
              continue;
          }
@@ -1364,41 +1412,28 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
                                                      bool in_postcopy,
                                                      bool inactivate_disks)
  {
-    g_autoptr(JSONWriter) vmdesc = NULL;
+    MigrationState *ms = migrate_get_current();
+    JSONWriter *vmdesc = ms->vmdesc;
      int vmdesc_len;
      SaveStateEntry *se;
      int ret;
  
-    vmdesc = json_writer_new(false);
-    json_writer_start_object(vmdesc, NULL);
-    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
-    json_writer_start_array(vmdesc, "devices");
-    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+    /* qemu_savevm_state_start_precopy() is expected to be called first. */
+    assert(vmdesc);
  
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
          if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
              continue;
          }
-        if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
-            trace_savevm_section_skip(se->idstr, se->section_id);
+        if (se->vmsd && se->vmsd->immutable) {
+            /* Already saved during qemu_savevm_state_setup(). */
              continue;
          }
  
-        trace_savevm_section_start(se->idstr, se->section_id);
-
-        json_writer_start_object(vmdesc, NULL);
-        json_writer_str(vmdesc, "name", se->idstr);
-        json_writer_int64(vmdesc, "instance_id", se->instance_id);
-
-        save_section_header(f, se, QEMU_VM_SECTION_FULL);
-        ret = vmstate_save(f, se, vmdesc);
+        ret = qemu_savevm_state_precopy_one_non_iterable(se, f, vmdesc);
          if (ret) {
-            qemu_file_set_error(f, ret);
              return ret;
          }
-        trace_savevm_section_end(se->idstr, se->section_id, 0);
-        save_section_footer(f, se);
-
-        json_writer_end_object(vmdesc);
      }
  
      if (inactivate_disks) {
@@ -1427,6 +1462,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
          qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
      }
  
+    /* Free it now to detect any inconsistencies. */
+    json_writer_free(vmdesc);
+    ms->vmdesc = NULL;
+
      return 0;
  }
  
-- 
2.39.0



-- 
Thanks,

David / dhildenb


