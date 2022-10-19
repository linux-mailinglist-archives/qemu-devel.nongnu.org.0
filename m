Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1A604C4B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:54:19 +0200 (CEST)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBOb-0003xH-M8
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1olBEY-0000We-Mx
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:43:54 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:57820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1olBEV-0006Zu-8P
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:43:54 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8734120574;
 Wed, 19 Oct 2022 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666194227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GX501D/OQ+92sFlhrEK/fh4cX7AUuu6p5hCNVo6YU5k=;
 b=cGkh7HhhaZMbFPK9Lk6X+u+Dzdje0tnRmnEnOfPRWheiBG0ozvzNyznbQ5T8/yOHFxD4t4
 KnY2xDa8DHxnT4ax2b1g+1a7y7bWg/aQcY9JkymPvcGEfSRBqoViPXWGYHdCoI5fu8sBU0
 cbncqDOfs/9booSs59GJdx/5khv9wes=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3605113345;
 Wed, 19 Oct 2022 15:43:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id seiwCjMbUGMBWAAAMHmgww
 (envelope-from <nborisov@suse.com>); Wed, 19 Oct 2022 15:43:47 +0000
Message-ID: <a6aaff1d-5b07-5e7a-61e7-bfe97582c98b@suse.com>
Date: Wed, 19 Oct 2022 18:43:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 03/11] migration: Make migration json writer part of
 MigrationState struct
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
References: <20221010133408.3214433-1-nborisov@suse.com>
 <20221010133408.3214433-4-nborisov@suse.com> <Y056tM+EUKMMC8PI@redhat.com>
From: Nikolay Borisov <nborisov@suse.com>
In-Reply-To: <Y056tM+EUKMMC8PI@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=nborisov@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18.10.22 г. 13:06 ч., Daniel P. Berrangé wrote:
> On Mon, Oct 10, 2022 at 04:34:00PM +0300, Nikolay Borisov wrote:
>> This is required so that migration stream configuration is written
>> to the migration stream. This would allow analyze-migration to
>> parse enabled capabilities for the migration and adjust its behavior
>> accordingly. This is in preparation for analyze-migration.py to support
>> 'fixed-ram' capability format changes.
>>
>> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
>> ---
>>   migration/migration.c |  5 +++++
>>   migration/migration.h |  3 +++
>>   migration/savevm.c    | 38 ++++++++++++++++++++++----------------
>>   3 files changed, 30 insertions(+), 16 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 140b0f1a54bd..d0779bbaf862 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1896,6 +1896,8 @@ static void migrate_fd_cleanup(MigrationState *s)
>>       g_free(s->hostname);
>>       s->hostname = NULL;
>>   
>> +    json_writer_free(s->vmdesc);
>> +
>>       qemu_savevm_state_cleanup();
>>   
>>       if (s->to_dst_file) {
>> @@ -2154,6 +2156,7 @@ void migrate_init(MigrationState *s)
>>       error_free(s->error);
>>       s->error = NULL;
>>       s->hostname = NULL;
>> +    s->vmdesc = NULL;
>>   
>>       migrate_set_state(&s->state, MIGRATION_STATUS_NONE, MIGRATION_STATUS_SETUP);
>>   
>> @@ -4269,6 +4272,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>>           return;
>>       }
>>   
>> +    s->vmdesc = json_writer_new(false);
>> +
>>       if (multifd_save_setup(&local_err) != 0) {
>>           error_report_err(local_err);
>>           migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>> diff --git a/migration/migration.h b/migration/migration.h
>> index cdad8aceaaab..96f27aba2210 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -17,6 +17,7 @@
>>   #include "exec/cpu-common.h"
>>   #include "hw/qdev-core.h"
>>   #include "qapi/qapi-types-migration.h"
>> +#include "qapi/qmp/json-writer.h"
>>   #include "qemu/thread.h"
>>   #include "qemu/coroutine_int.h"
>>   #include "io/channel.h"
>> @@ -261,6 +262,8 @@ struct MigrationState {
>>   
>>       int state;
>>   
>> +    JSONWriter *vmdesc;
>> +
>>       /* State related to return path */
>>       struct {
>>           /* Protected by qemu_file_lock */
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 48e85c052c2c..174cdbefc29d 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -1137,13 +1137,18 @@ void qemu_savevm_non_migratable_list(strList **reasons)
>>   
>>   void qemu_savevm_state_header(QEMUFile *f)
>>   {
>> +    MigrationState *s = migrate_get_current();
>>       trace_savevm_state_header();
>>       qemu_put_be32(f, QEMU_VM_FILE_MAGIC);
>>       qemu_put_be32(f, QEMU_VM_FILE_VERSION);
>>   
>> -    if (migrate_get_current()->send_configuration) {
>> +    if (s->send_configuration) {
>>           qemu_put_byte(f, QEMU_VM_CONFIGURATION);
>> -        vmstate_save_state(f, &vmstate_configuration, &savevm_state, 0);
>> +	json_writer_start_object(s->vmdesc, NULL);
>> +	json_writer_start_object(s->vmdesc, "configuration");
>> +        vmstate_save_state(f, &vmstate_configuration, &savevm_state, s->vmdesc);
>> +	json_writer_end_object(s->vmdesc);
>> +
> 
> IIUC, this is changing the info that is written in the VM
> configuration section, by adding an extra level of nesting
> to the object.
> 
> Isn't this going to cause backwards compatibility problems ?
> 
> Nothing in the patch seems to take account of the exctra
> 'configuiration' object that has been started

The resulting json looks like:

{
     "configuration": {
         "vmsd_name": "configuration",
         "version": 1,
         "fields": [
             {
                 "name": "len",
                 "type": "uint32",
                 "size": 4
             },
             {
                 "name": "name",
                 "type": "buffer",
                 "size": 13
             }
         ],
         "subsections": [
             {
                 "vmsd_name": "configuration/capabilities",
                 "version": 1,
                 "fields": [
                     {
                         "name": "caps_count",
                         "type": "uint32",
                         "size": 4
                     },
                     {
                         "name": "capabilities",
                         "type": "capability",
                         "size": 10
                     }
                 ]
             }
         ]
     },
     "page_size": 4096,
     "devices": [
         {
             "name": "timer",
             "instance_id": 0,
//ommitted

So the "configuration" object is indeed added, but older versions of 
qemu can ignore it without any problem.


> 
> Also, there's two  json_writer_start_object calls, but only
> one json_writer_end_object.

That's intentional, the first one begins the top-level object and it is 
actually paired with the final call to 
json_writer_end_object(s->vmdesc); in 
qemu_savevm_state_complete_precopy_non_iterable .

> 
> BTW, some <tab> crept into this patch.

Will fix this.

PS. I usually work on the linux kernel so vim used my linuxsty.vim 
settings. However, I eventually instsalled .editorconfig support so I 
guess those are leftovers.
> 
> 
>>       }
>>   }
>>   
>> @@ -1364,15 +1369,16 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>                                                       bool in_postcopy,
>>                                                       bool inactivate_disks)
>>   {
>> -    g_autoptr(JSONWriter) vmdesc = NULL;
>> +    MigrationState *s = migrate_get_current();
>>       int vmdesc_len;
>>       SaveStateEntry *se;
>>       int ret;
>>   
>> -    vmdesc = json_writer_new(false);
>> -    json_writer_start_object(vmdesc, NULL);
>> -    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
>> -    json_writer_start_array(vmdesc, "devices");
>> +    if (!s->send_configuration) {
>> +	    json_writer_start_object(s->vmdesc, NULL);
>> +    }
>> +    json_writer_int64(s->vmdesc, "page_size", qemu_target_page_size());
>> +    json_writer_start_array(s->vmdesc, "devices");
>>       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>>   
>>           if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
>> @@ -1385,12 +1391,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>   
>>           trace_savevm_section_start(se->idstr, se->section_id);
>>   
>> -        json_writer_start_object(vmdesc, NULL);
>> -        json_writer_str(vmdesc, "name", se->idstr);
>> -        json_writer_int64(vmdesc, "instance_id", se->instance_id);
>> +        json_writer_start_object(s->vmdesc, NULL);
>> +        json_writer_str(s->vmdesc, "name", se->idstr);
>> +        json_writer_int64(s->vmdesc, "instance_id", se->instance_id);
>>   
>>           save_section_header(f, se, QEMU_VM_SECTION_FULL);
>> -        ret = vmstate_save(f, se, vmdesc);
>> +        ret = vmstate_save(f, se, s->vmdesc);
>>           if (ret) {
>>               qemu_file_set_error(f, ret);
>>               return ret;
>> @@ -1398,7 +1404,7 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>           trace_savevm_section_end(se->idstr, se->section_id, 0);
>>           save_section_footer(f, se);
>>   
>> -        json_writer_end_object(vmdesc);
>> +        json_writer_end_object(s->vmdesc);
>>       }
>>   
>>       if (inactivate_disks) {
>> @@ -1417,14 +1423,14 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>           qemu_put_byte(f, QEMU_VM_EOF);
>>       }
>>   
>> -    json_writer_end_array(vmdesc);
>> -    json_writer_end_object(vmdesc);
>> -    vmdesc_len = strlen(json_writer_get(vmdesc));
>> +    json_writer_end_array(s->vmdesc);
>> +    json_writer_end_object(s->vmdesc);
>> +    vmdesc_len = strlen(json_writer_get(s->vmdesc));
>>   
>>       if (should_send_vmdesc()) {
>>           qemu_put_byte(f, QEMU_VM_VMDESCRIPTION);
>>           qemu_put_be32(f, vmdesc_len);
>> -        qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
>> +        qemu_put_buffer(f, (uint8_t *)json_writer_get(s->vmdesc), vmdesc_len);
>>       }
>>   
>>       return 0;
>> -- 
>> 2.34.1
>>
> 
> With regards,
> Daniel

