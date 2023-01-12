Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F363C667D18
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:57:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1gJ-00045P-Sf; Thu, 12 Jan 2023 12:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG1gG-00043n-P2
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:48:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG1gE-0003wh-Tn
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673545678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JeQPe9OL/y9wKilP3Z+hcbduyuxPQwyTYcmaZwyGodk=;
 b=cYxfMiRdILpELAM8Yyhfm5bFzk3Y2YXwUGHjo9VBLvbtTrQuH443Hs2L3hvKeG7yzmd69m
 Fdb45TagB6rKvU8wEqPqkrJMnZ4baHfpg07K0h812i/FsWlgtyv1w84tCfxU2kER2cpazI
 4uOf0b0CVzzEd1+aSwYIhcBf+mMY8WI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-136-RmLlfFGhMJaIA_QlmxAVtw-1; Thu, 12 Jan 2023 12:47:57 -0500
X-MC-Unique: RmLlfFGhMJaIA_QlmxAVtw-1
Received: by mail-wr1-f71.google.com with SMTP id
 k18-20020adfb352000000b002bdd0a7a2b5so716912wrd.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 09:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JeQPe9OL/y9wKilP3Z+hcbduyuxPQwyTYcmaZwyGodk=;
 b=MIX7SzTSAbdNh3Z+qfry9KPcS/CUV4qrb7FGodgRZlWzkdoxWWfym4s3tjqZA1aObD
 HSN2DmDUqMYtpVZ5ejsAowpn9K5UPJgvakbVMQ+jdmWZGsv1bFEdrerAD8VdoFYnfYgH
 sJpsSqKFeJtFREf7GKYlzuKvbP/p7rQisZ4+fHdzfEpHsKijQrDy3c+alOFp5+OMe9XH
 FzeoDL2eFFnVNDlMoIlNND3tXTOWlIys5NDBs1Ra7uZ99XKATSo9DZOt8HsfdJ6hf77Y
 LfBmZbEira1y8EENtdpJJ4adsQ2Vq0aXzWhSUC6spsCSrbAb6zdXcaJM5WlxMAmz/SIO
 xX6Q==
X-Gm-Message-State: AFqh2koAEu1pJBql9tYLBoihCG2lHCnyS7hVacIh5XLgXXc0oO82nXB+
 F9+ela/XnmhNNUdisGYmcPrDfmuDIjcXN3/yFW3kPRl+o/i0C5qJ4Qdifp00Xnqn8Q9unMAUmzn
 +KV5BiQWqwMHTPyQ=
X-Received: by 2002:a05:600c:4153:b0:3da:f0a:83d7 with SMTP id
 h19-20020a05600c415300b003da0f0a83d7mr4782038wmm.8.1673545676066; 
 Thu, 12 Jan 2023 09:47:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXscUzDkewQKUeqkAX2xZAcUqgM1SnUzhOwpzLL6ADI4lO9gjbCiACQ7q/U6ro6TAhzGg+7sBw==
X-Received: by 2002:a05:600c:4153:b0:3da:f0a:83d7 with SMTP id
 h19-20020a05600c415300b003da0f0a83d7mr4782029wmm.8.1673545675852; 
 Thu, 12 Jan 2023 09:47:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:4b00:f595:490f:692:a6f3?
 (p200300cbc7074b00f595490f0692a6f3.dip0.t-ipconnect.de.
 [2003:cb:c707:4b00:f595:490f:692:a6f3])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003c6bbe910fdsm32161201wmq.9.2023.01.12.09.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 09:47:55 -0800 (PST)
Message-ID: <7d80a8d2-1426-2a71-6a7a-eeaac31c4df5@redhat.com>
Date: Thu, 12 Jan 2023 18:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/8] migration/savevm: Prepare vmdesc json writer in
 qemu_savevm_state_setup()
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-3-david@redhat.com> <Y8BGzE/HtpXZJ8Lz@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y8BGzE/HtpXZJ8Lz@work-vm>
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

On 12.01.23 18:43, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> ... and store it in the migration state. This is a preparation for
>> storing selected vmds's already in qemu_savevm_state_setup().
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   migration/migration.c |  4 ++++
>>   migration/migration.h |  4 ++++
>>   migration/savevm.c    | 18 ++++++++++++------
>>   3 files changed, 20 insertions(+), 6 deletions(-)
>>

[1]

>> diff --git a/migration/migration.c b/migration/migration.c
>> index 52b5d39244..1d33a7efa0 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -2170,6 +2170,9 @@ void migrate_init(MigrationState *s)
>>       s->vm_was_running = false;
>>       s->iteration_initial_bytes = 0;
>>       s->threshold_size = 0;
>> +
>> +    json_writer_free(s->vmdesc);
>> +    s->vmdesc = NULL;
>>   }

[...]

>>       trace_savevm_state_setup();
>>       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>>           if (!se->ops || !se->ops->save_setup) {
>> @@ -1390,15 +1395,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>                                                       bool in_postcopy,
>>                                                       bool inactivate_disks)
>>   {
>> -    g_autoptr(JSONWriter) vmdesc = NULL;
>> +    MigrationState *ms = migrate_get_current();
>> +    JSONWriter *vmdesc = ms->vmdesc;
>>       int vmdesc_len;
>>       SaveStateEntry *se;
>>       int ret;
>>   
>> -    vmdesc = json_writer_new(false);
>> -    json_writer_start_object(vmdesc, NULL);
>> -    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
>> -    json_writer_start_array(vmdesc, "devices");
>>       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>>           ret = vmstate_save(f, se, vmdesc);
>>           if (ret) {
>> @@ -1433,6 +1435,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>>           qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
>>       }
>>   
>> +    /* Free it now to detect any inconsistencies. */
>> +    json_writer_free(vmdesc);
>> +    ms->vmdesc = NULL;
> 
> and this only happens when this succesfully exits;  so if this errors
> out, and then you retry an outwards migration, I think you've leaked a
> writer.

Shouldn't the change [1] to migrate_init() cover that?

-- 
Thanks,

David / dhildenb


