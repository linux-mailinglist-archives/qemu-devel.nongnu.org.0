Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDBF6FC8B7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:19:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOA8-0003qj-N2; Tue, 09 May 2023 10:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwOA4-0003pM-Ur
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwOA1-0003Vu-E8
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683641868;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=P6grJ/pbuzwtemCEZk77K/gtctGCcW6+xGVdaKac0V4=;
 b=EybYyEDHw65VeIGLdox1ziMc1IKy0yCVkPdIWFqHHZIapJ85bonEEmIAcwadxrj60Ahrjx
 P+5Edh8nkuQzSaYT94VXvytMXdy+yxCNkJzEflU5QbXsCpjpN+dTjc+mNjIXfVruOESh76
 a4Pjc10pml7zPzE2xufNgCFJdXkFVnM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-oR7iB--FOyGzF93Y-D0shw-1; Tue, 09 May 2023 10:17:46 -0400
X-MC-Unique: oR7iB--FOyGzF93Y-D0shw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30633999815so2203561f8f.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683641865; x=1686233865;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P6grJ/pbuzwtemCEZk77K/gtctGCcW6+xGVdaKac0V4=;
 b=BgL6HNTmLUNqWnQwEVMrojfKUI7NAQkrjhOL0WmrLw4p8YZ77OCyskAvhC7bSTVE6R
 VaR+LE8D3vuxIcSoH8++KcNYta5NVDCL+4MKPxkKib5/6ECBbTEGcA0pfHjr55GGsOPu
 9QwyQNFbnv61TgFT+wQCyAKaM2p5TeJ81tDcYYsnvdR4tcYqB9y1RNmWZ5Mlbk4U0DKs
 Uc+WTIFZMqi4Qz1wf8zWy2skb4EKJn3rlWCAj57xI0yeJNuxoVrvsF0C7d53w5KaZTKn
 W16edWPop8NL2QAggWAKBfPKfyKm/FjAgpUosPWo//wb924d4EZ6O6SSeeH6Wz0pIx5b
 a2PQ==
X-Gm-Message-State: AC+VfDyq6NLP10GgLzrO9ceFRh/a2htNYB7rtVkYlsPdqKph7x4ROICL
 OfFJydqayO6xwokcpIes6bZE4U06Jp5ck2zZTYMquRsKpgAm4fnQJnzhrM/fxBrGO0ocoPmCyrG
 ykrMjhkNkE9unH9s=
X-Received: by 2002:adf:fc46:0:b0:2f4:9f46:6865 with SMTP id
 e6-20020adffc46000000b002f49f466865mr9958218wrs.30.1683641865523; 
 Tue, 09 May 2023 07:17:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4SdFjr7008COkY8hgcA02Qvq0YyNxJcnUE7/iA4b9cw0s3vcHRI2lVskETww66PicH1oHJkg==
X-Received: by 2002:adf:fc46:0:b0:2f4:9f46:6865 with SMTP id
 e6-20020adffc46000000b002f49f466865mr9958189wrs.30.1683641865128; 
 Tue, 09 May 2023 07:17:45 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b003f4283f5c1bsm3532141wms.2.2023.05.09.07.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 07:17:44 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  David Hildenbrand
 <david@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  Eric Blake <eblake@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  John Snow
 <jsnow@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,  Peter Xu
 <peterx@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,  Eric Farman
 <farman@linux.ibm.com>,  Greg Kurz <groug@kaod.org>,  qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,  Fam Zheng <fam@euphon.net>,  Thomas Huth
 <thuth@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Leonardo Bras <leobras@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 07/21] migration: Correct transferred bytes value
In-Reply-To: <d9331bd1-5713-b1a5-72af-74f777a5b0b1@linux.ibm.com> (Harsh
 Prateek Bora's message of "Tue, 9 May 2023 17:38:49 +0530")
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-8-quintela@redhat.com>
 <d9331bd1-5713-b1a5-72af-74f777a5b0b1@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 16:17:43 +0200
Message-ID: <874joleghk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Harsh Prateek Bora <harshpb@linux.ibm.com> wrote:
> On 5/8/23 18:38, Juan Quintela wrote:
>> We forget several places to add to trasferred amount of data.  With
>> this fixes I get:
>>     qemu_file_transferred() + multifd_bytes == transferred
>> The only place whrer this is not true is during devices sending.
>> But
>
> s/whrer/where
>
>> going all through the full tree searching for devices that use
>> QEMUFile directly is a bit too much.
>> Multifd, precopy and xbzrle work as expected. Postocpy still misses
>> 35
>> bytes, but searching for them is getting complicated, so I stop here.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/meson.build |  2 +-
>>   migration/ram.c       | 14 ++++++++++++++
>>   migration/savevm.c    | 19 +++++++++++++++++--
>>   migration/vmstate.c   |  3 +++
>>   4 files changed, 35 insertions(+), 3 deletions(-)
>> diff --git a/migration/meson.build b/migration/meson.build
>> index da1897fadf..b27fc9eeb6 100644
>> --- a/migration/meson.build
>> +++ b/migration/meson.build
>> @@ -1,5 +1,6 @@
>>   # Files needed by unit tests
>>   migration_files = files(
>> +  'migration-stats.c',
>>     'page_cache.c',
>>     'xbzrle.c',
>>     'vmstate-types.c',
>> @@ -19,7 +20,6 @@ softmmu_ss.add(files(
>>     'fd.c',
>>     'global_state.c',
>>     'migration-hmp-cmds.c',
>> -  'migration-stats.c',
>>     'migration.c',
>>     'multifd.c',
>>     'multifd-zlib.c',
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 5e7bf20ca5..5ae1fdba45 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -337,6 +337,7 @@ int64_t ramblock_recv_bitmap_send(QEMUFile *file,
>>         g_free(le_bitmap);
>>   +    stat64_add(&mig_stats.transferred, 8 + size + 8);
>
> I see lot of hard-coded math like above in below code as well.
> Although compiler will do its optimization, but we may choose to write
> it like either of below:
>  - sizeof(??) + size + sizeof(??)
>  - <macro1> + size + <macro2>
>  - size + 16 /* explaining what 8 + 8 means here */
> I guess first method or usage of macros instead of hard-coded numbers
> is better. Applies to all instances below.

It is removed later (on my tree).

The reason this patch is here is that I get the same value with
transferred and with the qemu_file_size and multifd_bytes together.
That makes much easier to verify that I was not doing something wrong.

Later, Juan.

> regards,
> Harsh
>
>>       if (qemu_file_get_error(file)) {
>>           return qemu_file_get_error(file);
>>       }
>> @@ -1617,6 +1618,7 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
>>                       return ret;
>>                   }
>>                   qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
>> +                stat64_add(&mig_stats.transferred, 8);
>>                   qemu_fflush(f);
>>               }
>>               /*
>> @@ -3245,6 +3247,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>>       RAMState **rsp = opaque;
>>       RAMBlock *block;
>>       int ret;
>> +    size_t size = 0;
>>         if (compress_threads_save_setup()) {
>>           return -1;
>> @@ -3263,16 +3266,20 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>>           qemu_put_be64(f, ram_bytes_total_with_ignored()
>>                            | RAM_SAVE_FLAG_MEM_SIZE);
>>   +        size += 8;
>>           RAMBLOCK_FOREACH_MIGRATABLE(block) {
>>               qemu_put_byte(f, strlen(block->idstr));
>>               qemu_put_buffer(f, (uint8_t *)block->idstr, strlen(block->idstr));
>>               qemu_put_be64(f, block->used_length);
>> +            size += 1 + strlen(block->idstr) + 8;
>>               if (migrate_postcopy_ram() && block->page_size !=
>>                                             qemu_host_page_size) {
>>                   qemu_put_be64(f, block->page_size);
>> +                size += 8;
>>               }
>>               if (migrate_ignore_shared()) {
>>                   qemu_put_be64(f, block->mr->addr);
>> +                size += 8;
>>               }
>>           }
>>       }
>> @@ -3289,11 +3296,14 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>>         if (!migrate_multifd_flush_after_each_section()) {
>>           qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
>> +        size += 8;
>>       }
>>         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>> +    size += 8;
>>       qemu_fflush(f);
>>   +    stat64_add(&mig_stats.transferred, size);
>>       return 0;
>>   }
>>   @@ -3434,6 +3444,7 @@ static int ram_save_complete(QEMUFile *f,
>> void *opaque)
>>       RAMState **temp = opaque;
>>       RAMState *rs = *temp;
>>       int ret = 0;
>> +    size_t size = 0;
>>         rs->last_stage = !migration_in_colo_state();
>>   @@ -3478,8 +3489,11 @@ static int ram_save_complete(QEMUFile *f,
>> void *opaque)
>>         if (!migrate_multifd_flush_after_each_section()) {
>>           qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
>> +        size += 8;
>>       }
>>       qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>> +    size += 8;
>> +    stat64_add(&mig_stats.transferred, size);
>>       qemu_fflush(f);
>>         return 0;
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index e33788343a..c7af9050c2 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -952,6 +952,7 @@ static void save_section_header(QEMUFile *f, SaveStateEntry *se,
>>       qemu_put_byte(f, section_type);
>>       qemu_put_be32(f, se->section_id);
>>   +    size_t size = 1 + 4;
>>       if (section_type == QEMU_VM_SECTION_FULL ||
>>           section_type == QEMU_VM_SECTION_START) {
>>           /* ID string */
>> @@ -961,7 +962,9 @@ static void save_section_header(QEMUFile *f, SaveStateEntry *se,
>>             qemu_put_be32(f, se->instance_id);
>>           qemu_put_be32(f, se->version_id);
>> +        size += 1 + len + 4 + 4;
>>       }
>> +    stat64_add(&mig_stats.transferred, size);
>>   }
>>     /*
>> @@ -973,6 +976,7 @@ static void save_section_footer(QEMUFile *f, SaveStateEntry *se)
>>       if (migrate_get_current()->send_section_footer) {
>>           qemu_put_byte(f, QEMU_VM_SECTION_FOOTER);
>>           qemu_put_be32(f, se->section_id);
>> +        stat64_add(&mig_stats.transferred, 1 + 4);
>>       }
>>   }
>>   @@ -1032,6 +1036,7 @@ static void
>> qemu_savevm_command_send(QEMUFile *f,
>>       qemu_put_be16(f, (uint16_t)command);
>>       qemu_put_be16(f, len);
>>       qemu_put_buffer(f, data, len);
>> +    stat64_add(&mig_stats.transferred, 1 + 2 + 2 + len);
>>       qemu_fflush(f);
>>   }
>>   @@ -1212,11 +1217,13 @@ void qemu_savevm_state_header(QEMUFile *f)
>>       trace_savevm_state_header();
>>       qemu_put_be32(f, QEMU_VM_FILE_MAGIC);
>>       qemu_put_be32(f, QEMU_VM_FILE_VERSION);
>> -
>> +    size_t size = 4 + 4;
>>       if (migrate_get_current()->send_configuration) {
>>           qemu_put_byte(f, QEMU_VM_CONFIGURATION);
>> +        size += 1;
>>           vmstate_save_state(f, &vmstate_configuration, &savevm_state, 0);
>>       }
>> +    stat64_add(&mig_stats.transferred, size);
>>   }
>>     bool qemu_savevm_state_guest_unplug_pending(void)
>> @@ -1384,6 +1391,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
>>   {
>>       SaveStateEntry *se;
>>       int ret;
>> +    size_t size = 0;
>>         QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>>           if (!se->ops || !se->ops->save_live_complete_postcopy) {
>> @@ -1398,7 +1406,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
>>           /* Section type */
>>           qemu_put_byte(f, QEMU_VM_SECTION_END);
>>           qemu_put_be32(f, se->section_id);
>> -
>> +        size += 1 + 4;
>>           ret = se->ops->save_live_complete_postcopy(f, se->opaque);
>>           trace_savevm_section_end(se->idstr, se->section_id, ret);
>>           save_section_footer(f, se);
>> @@ -1409,6 +1417,8 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
>>       }
>>         qemu_put_byte(f, QEMU_VM_EOF);
>> +    size += 1;
>> +    stat64_add(&mig_stats.transferred, size);
>>       qemu_fflush(f);
>>   }
>>   @@ -1484,6 +1494,7 @@ int
>> qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>       if (!in_postcopy) {
>>           /* Postcopy stream will still be going */
>>           qemu_put_byte(f, QEMU_VM_EOF);
>> +        stat64_add(&mig_stats.transferred, 1);
>>       }
>>         json_writer_end_array(vmdesc);
>> @@ -1664,15 +1675,18 @@ void qemu_savevm_live_state(QEMUFile *f)
>>       /* save QEMU_VM_SECTION_END section */
>>       qemu_savevm_state_complete_precopy(f, true, false);
>>       qemu_put_byte(f, QEMU_VM_EOF);
>> +    stat64_add(&mig_stats.transferred, 1);
>>   }
>>     int qemu_save_device_state(QEMUFile *f)
>>   {
>>       SaveStateEntry *se;
>> +    size_t size = 0;
>>         if (!migration_in_colo_state()) {
>>           qemu_put_be32(f, QEMU_VM_FILE_MAGIC);
>>           qemu_put_be32(f, QEMU_VM_FILE_VERSION);
>> +        size = 4 + 4;
>>       }
>>       cpu_synchronize_all_states();
>>   @@ -1690,6 +1704,7 @@ int qemu_save_device_state(QEMUFile *f)
>>         qemu_put_byte(f, QEMU_VM_EOF);
>>   +    stat64_add(&mig_stats.transferred, size + 1);
>>       return qemu_file_get_error(f);
>>   }
>>   diff --git a/migration/vmstate.c b/migration/vmstate.c
>> index af01d54b6f..ee3b70a6a8 100644
>> --- a/migration/vmstate.c
>> +++ b/migration/vmstate.c
>> @@ -12,6 +12,7 @@
>>     #include "qemu/osdep.h"
>>   #include "migration.h"
>> +#include "migration-stats.h"
>>   #include "migration/vmstate.h"
>>   #include "savevm.h"
>>   #include "qapi/qmp/json-writer.h"
>> @@ -394,6 +395,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
>>                   written_bytes = qemu_file_transferred_fast(f) - old_offset;
>>                   vmsd_desc_field_end(vmsd, vmdesc_loop, field, written_bytes, i);
>>   +                stat64_add(&mig_stats.transferred,
>> written_bytes);
>>                   /* Compressed arrays only care about the first element */
>>                   if (vmdesc_loop && vmsd_can_compress(field)) {
>>                       vmdesc_loop = NULL;
>> @@ -517,6 +519,7 @@ static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
>>               qemu_put_byte(f, len);
>>               qemu_put_buffer(f, (uint8_t *)vmsdsub->name, len);
>>               qemu_put_be32(f, vmsdsub->version_id);
>> +            stat64_add(&mig_stats.transferred, 1 + 1 + len + 4);
>>               ret = vmstate_save_state(f, vmsdsub, opaque, vmdesc);
>>               if (ret) {
>>                   return ret;


