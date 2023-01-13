Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D23D6697EE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:02:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJh1-0001Vg-Ja; Fri, 13 Jan 2023 08:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGJgy-0001QB-3k
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:01:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGJgt-0003La-1d
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673614906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=greftqf9/S9rIlKVrKfVNuQD0N6pxAdKgjPO8YQplA8=;
 b=VdxTHFTVJoWSCHN/jKnJjh/qgx/PW6V5QjUNt2bT1Er9CnxDyn6PPITf/5K3+BhWj8Hjr7
 /hzUwQPnHrRWBvrVLag0D3ahVUfePmD4+fjhj31xmraBdPVsQHE126h/phrIxQDgoJT9W/
 2DU3zmMCTnaX1tEvUXtxvn9vQaBU0Ck=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-AzQ0fPqePJea1gbJaOumOw-1; Fri, 13 Jan 2023 08:01:44 -0500
X-MC-Unique: AzQ0fPqePJea1gbJaOumOw-1
Received: by mail-wm1-f70.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso14169727wmb.6
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=greftqf9/S9rIlKVrKfVNuQD0N6pxAdKgjPO8YQplA8=;
 b=5GMxvDGs3n1cLF80DeAComz9RRaPl7x0ifpdtkTb0hKaA5FeI0H9OG6dsaj7eYOQqH
 DHQa5u4Na+0s6SPICcO1YU3oiYNYmBhUHSyHcAZvyiMeiMWEc+ayuVSymhK3mFUHSCj8
 93KQodeNO++n5TMjutkBvaCgLvoEEI5ZqKZFkCWu2W/n9V16Aic6bSmRXI9rK+JWxHFk
 8FLzV9xa+zMeySX0m+/q/tK4jR8NPwN0Idn4d8rms/nr1MQvIJl7kLG2t7quDMU84JvK
 aAjCBPRSsZDVzGKaOehTUub9hB2oio07oJLEreT6yDzYGiVinZ7P+FMV2LDhGCpc9UUm
 6Njw==
X-Gm-Message-State: AFqh2kq1jTgLRrr+jKdC6thn57qtnl/2Smz3F6TUzFs9B1uo0Mdd6YF9
 y0WqTgkWLUA/pUx6qraSSiQ0wBXNXyezZWVJzPU/rE68p8Pka9bfzHY8XRTb4PNNFBKX1IT0+40
 cv1tXaH1IFwq+09o=
X-Received: by 2002:adf:ff8a:0:b0:2bd:db1c:8e15 with SMTP id
 j10-20020adfff8a000000b002bddb1c8e15mr3167407wrr.51.1673614903218; 
 Fri, 13 Jan 2023 05:01:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtdaYMfbuFCEFQDuDQRjcFhaOBU6WV1WrpVWvPbhRsnu5/JXpbdBaVIopOTxpQQPgzrpd9Igg==
X-Received: by 2002:adf:ff8a:0:b0:2bd:db1c:8e15 with SMTP id
 j10-20020adfff8a000000b002bddb1c8e15mr3167382wrr.51.1673614902892; 
 Fri, 13 Jan 2023 05:01:42 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:ec00:869d:7200:eb03:db01?
 (p200300cbc704ec00869d7200eb03db01.dip0.t-ipconnect.de.
 [2003:cb:c704:ec00:869d:7200:eb03:db01])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfe486000000b002423dc3b1a9sm18523727wrm.52.2023.01.13.05.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 05:01:42 -0800 (PST)
Message-ID: <c8bc09e7-d671-844c-4418-60a53668d355@redhat.com>
Date: Fri, 13 Jan 2023 14:01:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/8] migration/savevm: Prepare vmdesc json writer in
 qemu_savevm_state_setup()
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-3-david@redhat.com> <Y8BGzE/HtpXZJ8Lz@work-vm>
 <7d80a8d2-1426-2a71-6a7a-eeaac31c4df5@redhat.com> <Y8BUAIZ9nn7sXzou@work-vm>
 <Y8CEUcXek3FPEwCe@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y8CEUcXek3FPEwCe@x1n>
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

On 12.01.23 23:06, Peter Xu wrote:
> On Thu, Jan 12, 2023 at 06:40:00PM +0000, Dr. David Alan Gilbert wrote:
>> * David Hildenbrand (david@redhat.com) wrote:
>>> On 12.01.23 18:43, Dr. David Alan Gilbert wrote:
>>>> * David Hildenbrand (david@redhat.com) wrote:
>>>>> ... and store it in the migration state. This is a preparation for
>>>>> storing selected vmds's already in qemu_savevm_state_setup().
>>>>>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>>    migration/migration.c |  4 ++++
>>>>>    migration/migration.h |  4 ++++
>>>>>    migration/savevm.c    | 18 ++++++++++++------
>>>>>    3 files changed, 20 insertions(+), 6 deletions(-)
>>>>>
>>>
>>> [1]
>>>
>>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>>> index 52b5d39244..1d33a7efa0 100644
>>>>> --- a/migration/migration.c
>>>>> +++ b/migration/migration.c
>>>>> @@ -2170,6 +2170,9 @@ void migrate_init(MigrationState *s)
>>>>>        s->vm_was_running = false;
>>>>>        s->iteration_initial_bytes = 0;
>>>>>        s->threshold_size = 0;
>>>>> +
>>>>> +    json_writer_free(s->vmdesc);
>>>>> +    s->vmdesc = NULL;
>>>>>    }
>>>
>>> [...]
>>>
>>>>>        trace_savevm_state_setup();
>>>>>        QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>>>>>            if (!se->ops || !se->ops->save_setup) {
>>>>> @@ -1390,15 +1395,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>>>                                                        bool in_postcopy,
>>>>>                                                        bool inactivate_disks)
>>>>>    {
>>>>> -    g_autoptr(JSONWriter) vmdesc = NULL;
>>>>> +    MigrationState *ms = migrate_get_current();
>>>>> +    JSONWriter *vmdesc = ms->vmdesc;
>>>>>        int vmdesc_len;
>>>>>        SaveStateEntry *se;
>>>>>        int ret;
>>>>> -    vmdesc = json_writer_new(false);
>>>>> -    json_writer_start_object(vmdesc, NULL);
>>>>> -    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
>>>>> -    json_writer_start_array(vmdesc, "devices");
>>>>>        QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>>>>>            ret = vmstate_save(f, se, vmdesc);
>>>>>            if (ret) {
>>>>> @@ -1433,6 +1435,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>>>>            qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
>>>>>        }
>>>>> +    /* Free it now to detect any inconsistencies. */
>>>>> +    json_writer_free(vmdesc);
>>>>> +    ms->vmdesc = NULL;
>>>>
>>>> and this only happens when this succesfully exits;  so if this errors
>>>> out, and then you retry an outwards migration, I think you've leaked a
>>>> writer.
>>>
>>> Shouldn't the change [1] to migrate_init() cover that?
>>
>> Hmm OK, yes it does - I guess it does mean you keep the allocation
>> around for a bit longer, but that's OK in practice since normally you'll
>> be quitting soon.
> 
> Instead of json_writer_free() here and there, how about free it in
> migrate_fd_cleanup() once and for all?
> 

Sure, if that works. I assume I can get rid of the migrate_init() and 
migration_instance_finalize() change then, correct?

-- 
Thanks,

David / dhildenb


