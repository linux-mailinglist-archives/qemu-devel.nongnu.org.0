Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB17669804
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:06:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJlB-0002se-8M; Fri, 13 Jan 2023 08:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGJkW-0002s4-I9
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:05:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGJkU-0004Jx-NJ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673615129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZcjga890rSHwaOCb81n/R7z9tSLg6qRx2P3tC1sdns=;
 b=Kep/LY9vlQwS4ti6RFKaXagFEWd/WJon+CEuMWPQcLF4Lup1ncnA8DlCCYbRiECPH4DT3B
 vt6Oz6rEoH4qlGPmw01PEgD+LoaBOK6lCvS8unkQTZMUAynIbejWhyfuea3FKlZpyD3M0s
 0L8zuUHtVOi85vcjDo3ic16RV78ZHl8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-S8_D94YAMNSS-TNmPChLVg-1; Fri, 13 Jan 2023 08:05:28 -0500
X-MC-Unique: S8_D94YAMNSS-TNmPChLVg-1
Received: by mail-wm1-f69.google.com with SMTP id
 t24-20020a1c7718000000b003d1fd0b866fso4880579wmi.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZcjga890rSHwaOCb81n/R7z9tSLg6qRx2P3tC1sdns=;
 b=vaVe8EMRsmO7u9SuFRgPRz59yo16seQ9hHe2ZTYo4ofnCh+gTee2QxDvPHuzDu4VPU
 CT2pHuuVig2IZwQOwvIr9XIRsoDj5zGGCKlJPlaB22rGzeICom2JJDhRe2PGTrzEnoLq
 N0EYh3L1C+a5AExYxsXvfLpgvRSQVvsRuGxu0To1S/3m14+3d04LZd65UglQT2i4eBdu
 KTQSpvfzTTQP7Mt5DwdLBvhEJKZEJb55w8zEW1C5tK3EZocY+PF/wleYTrN64Et2Ua/z
 BQRL1A7QV2M9tDzagNtqmWigo/fmjHJhL8tN2QMi3Gd/vVDWnD3C/BrgN1eY06AMlUCd
 VL6A==
X-Gm-Message-State: AFqh2kpvGehcrF4+oDZYLF8JfHYQ7UmWrBpSetirpEKSc/fKkq2kQWLF
 tfovQyBtdpYCZUg3lWsavGNfjBiVJIXKjySNu149lykykyNo/lJnPf/XU336yh/BjEuN3SyxAte
 qcuvGdTfAFBe92l0=
X-Received: by 2002:adf:dbcd:0:b0:27a:d81:1137 with SMTP id
 e13-20020adfdbcd000000b0027a0d811137mr43091975wrj.38.1673615127078; 
 Fri, 13 Jan 2023 05:05:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsOUhIOtMJE0fuTtbIeZqqALECREMUTQCn1l/w2JiyMDOfCz+6r1uj/XiOSTx4uGaShStmRSw==
X-Received: by 2002:adf:dbcd:0:b0:27a:d81:1137 with SMTP id
 e13-20020adfdbcd000000b0027a0d811137mr43091953wrj.38.1673615126720; 
 Fri, 13 Jan 2023 05:05:26 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:ec00:869d:7200:eb03:db01?
 (p200300cbc704ec00869d7200eb03db01.dip0.t-ipconnect.de.
 [2003:cb:c704:ec00:869d:7200:eb03:db01])
 by smtp.gmail.com with ESMTPSA id
 u5-20020adfdb85000000b002ba2646fd30sm22211407wri.36.2023.01.13.05.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 05:05:26 -0800 (PST)
Message-ID: <6edccb93-f591-def9-5a3c-3d89677602a0@redhat.com>
Date: Fri, 13 Jan 2023 14:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/8] migration/savevm: Prepare vmdesc json writer in
 qemu_savevm_state_setup()
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-3-david@redhat.com> <Y8BGzE/HtpXZJ8Lz@work-vm>
 <7d80a8d2-1426-2a71-6a7a-eeaac31c4df5@redhat.com> <Y8BUAIZ9nn7sXzou@work-vm>
 <Y8CEUcXek3FPEwCe@x1n> <c8bc09e7-d671-844c-4418-60a53668d355@redhat.com>
Organization: Red Hat
In-Reply-To: <c8bc09e7-d671-844c-4418-60a53668d355@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 13.01.23 14:01, David Hildenbrand wrote:
> On 12.01.23 23:06, Peter Xu wrote:
>> On Thu, Jan 12, 2023 at 06:40:00PM +0000, Dr. David Alan Gilbert wrote:
>>> * David Hildenbrand (david@redhat.com) wrote:
>>>> On 12.01.23 18:43, Dr. David Alan Gilbert wrote:
>>>>> * David Hildenbrand (david@redhat.com) wrote:
>>>>>> ... and store it in the migration state. This is a preparation for
>>>>>> storing selected vmds's already in qemu_savevm_state_setup().
>>>>>>
>>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>>> ---
>>>>>>     migration/migration.c |  4 ++++
>>>>>>     migration/migration.h |  4 ++++
>>>>>>     migration/savevm.c    | 18 ++++++++++++------
>>>>>>     3 files changed, 20 insertions(+), 6 deletions(-)
>>>>>>
>>>>
>>>> [1]
>>>>
>>>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>>>> index 52b5d39244..1d33a7efa0 100644
>>>>>> --- a/migration/migration.c
>>>>>> +++ b/migration/migration.c
>>>>>> @@ -2170,6 +2170,9 @@ void migrate_init(MigrationState *s)
>>>>>>         s->vm_was_running = false;
>>>>>>         s->iteration_initial_bytes = 0;
>>>>>>         s->threshold_size = 0;
>>>>>> +
>>>>>> +    json_writer_free(s->vmdesc);
>>>>>> +    s->vmdesc = NULL;
>>>>>>     }
>>>>
>>>> [...]
>>>>
>>>>>>         trace_savevm_state_setup();
>>>>>>         QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>>>>>>             if (!se->ops || !se->ops->save_setup) {
>>>>>> @@ -1390,15 +1395,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>>>>                                                         bool in_postcopy,
>>>>>>                                                         bool inactivate_disks)
>>>>>>     {
>>>>>> -    g_autoptr(JSONWriter) vmdesc = NULL;
>>>>>> +    MigrationState *ms = migrate_get_current();
>>>>>> +    JSONWriter *vmdesc = ms->vmdesc;
>>>>>>         int vmdesc_len;
>>>>>>         SaveStateEntry *se;
>>>>>>         int ret;
>>>>>> -    vmdesc = json_writer_new(false);
>>>>>> -    json_writer_start_object(vmdesc, NULL);
>>>>>> -    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
>>>>>> -    json_writer_start_array(vmdesc, "devices");
>>>>>>         QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>>>>>>             ret = vmstate_save(f, se, vmdesc);
>>>>>>             if (ret) {
>>>>>> @@ -1433,6 +1435,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>>>>             qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
>>>>>>         }
>>>>>> +    /* Free it now to detect any inconsistencies. */
>>>>>> +    json_writer_free(vmdesc);
>>>>>> +    ms->vmdesc = NULL;
>>>>>
>>>>> and this only happens when this succesfully exits;  so if this errors
>>>>> out, and then you retry an outwards migration, I think you've leaked a
>>>>> writer.
>>>>
>>>> Shouldn't the change [1] to migrate_init() cover that?
>>>
>>> Hmm OK, yes it does - I guess it does mean you keep the allocation
>>> around for a bit longer, but that's OK in practice since normally you'll
>>> be quitting soon.
>>
>> Instead of json_writer_free() here and there, how about free it in
>> migrate_fd_cleanup() once and for all?
>>
> 
> Sure, if that works. I assume I can get rid of the migrate_init() and
> migration_instance_finalize() change then, correct?
> 

Yeah, that should be much better and matches how we handle the other 
members:

diff --git a/migration/migration.c b/migration/migration.c
index 1d33a7efa0..fcd2f20d7c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1903,6 +1903,8 @@ static void migrate_fd_cleanup(MigrationState *s)

      g_free(s->hostname);
      s->hostname = NULL;
+    json_writer_free(s->vmdesc);
+    s->vmdesc = NULL;

      qemu_savevm_state_cleanup();

@@ -2170,9 +2172,6 @@ void migrate_init(MigrationState *s)
      s->vm_was_running = false;
      s->iteration_initial_bytes = 0;
      s->threshold_size = 0;
-
-    json_writer_free(s->vmdesc);
-    s->vmdesc = NULL;
  }

  int migrate_add_blocker_internal(Error *reason, Error **errp)
@@ -4448,7 +4447,6 @@ static void migration_instance_finalize(Object *obj)
      qemu_sem_destroy(&ms->rp_state.rp_sem);
      qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
      error_free(ms->error);
-    json_writer_free(ms->vmdesc);
  }

  static void migration_instance_init(Object *obj)


-- 
Thanks,

David / dhildenb


