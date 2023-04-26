Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838C6EF311
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:06:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcxo-00056V-Rb; Wed, 26 Apr 2023 07:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prcxd-00055s-SC
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prcxa-0008It-TI
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682507117;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oYVjKBsMW2/OZIDyd/lIknWhI95fwYMRmBqPl47L0+I=;
 b=fRtW1HWLBdmJT0qoG3dlLhn7/tSxWT2TYuj0/ExOd2OmU3/0A51B/FoXnHjcOsbc+LC6Np
 F+wyaCdLnkFR3eBWrwQ7fhhnucWjxUPvffqWSzXKpt7TUylFyuMGpQX9+JnCdMyw90Kre2
 bzUMpKIF2RHbnuswnhfZy7hpl+5PW+I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-ixZxVQ4bOpGaIzxVXoRPfA-1; Wed, 26 Apr 2023 07:05:16 -0400
X-MC-Unique: ixZxVQ4bOpGaIzxVXoRPfA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1763fac8bso43440605e9.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 04:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682507114; x=1685099114;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oYVjKBsMW2/OZIDyd/lIknWhI95fwYMRmBqPl47L0+I=;
 b=PGuuIRgD2hAMLxrdLKOvGlqGQYTVYVI6j1CnFHY5/y4LaK2hA1jd5fV31/pk0fT7Ho
 TEPuDsI+WnJr60sf1Yu4OHtMM80QEYAfq0OqKZXEdrk0Dbb8B/gS8jJVkoL5Uk4FNwke
 rTxG5a+ZxXd8DdvSVvGzxO4bifys/hhpIXdCtJtzgj1kOGg52RLT1Z4hXCFIsusTwCl0
 Asn2AMmBuP6wP/6KzhSylrBUWhtMLXW4HCKEh7V1el032NZcb2/WiWPbW+PfqCYSuNvi
 i+zFflmDgewbozL9hpDBmJje8lEq8Fz701sTSyiINkV2z1G2IIva4jEDhRBv5IcfotjB
 CNOg==
X-Gm-Message-State: AAQBX9drzl+8Ruh1yOEMoQ7LhzFupjBGzu8D6FOY8EdFS1CDtYaQ4QDN
 OeqUHJa8plzdgWMyD8kb0cYv1wjC1S3vxxvkGsfZ7zLaIppW4p9iCIOpaKcf2GErUKfTjiJ/yLp
 y5tV6vGpzdyibbts9JqVMMad3G1zP
X-Received: by 2002:a1c:4c04:0:b0:3f1:806a:83d5 with SMTP id
 z4-20020a1c4c04000000b003f1806a83d5mr12192704wmf.20.1682507114639; 
 Wed, 26 Apr 2023 04:05:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350al1tBYzBvEkp/z7blm1tSJggoHMiYRwOrquhn8XYvFJIJGuG3s+y4LGRtcZ6XL0rtXTBsSwA==
X-Received: by 2002:a1c:4c04:0:b0:3f1:806a:83d5 with SMTP id
 z4-20020a1c4c04000000b003f1806a83d5mr12192683wmf.20.1682507114274; 
 Wed, 26 Apr 2023 04:05:14 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 i11-20020adfe48b000000b002c3f81c51b6sm15521318wrm.90.2023.04.26.04.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 04:05:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org,  berrange@redhat.com,  peterx@redhat.com,
 dgilbert@redhat.com,  lsoaresp@redhat.com
Subject: Re: [PATCH] multifd: Avoid busy-wait in multifd_send_pages()
In-Reply-To: <b87ce3c6-6426-eab1-95ef-d02eb83ab9ff@nutanix.com> (manish
 mishra's message of "Wed, 26 Apr 2023 16:09:07 +0530")
References: <20230425160555.67373-1-manish.mishra@nutanix.com>
 <87v8hjey3b.fsf@secure.mitica>
 <b87ce3c6-6426-eab1-95ef-d02eb83ab9ff@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 13:05:12 +0200
Message-ID: <87pm7qgazb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

"manish.mishra" <manish.mishra@nutanix.com> wrote:
> On 26/04/23 3:58 pm, Juan Quintela wrote:
>> "manish.mishra" <manish.mishra@nutanix.com> wrote:
>>> multifd_send_sync_main() posts request on the multifd channel
>>> but does not call sem_wait() on channels_ready semaphore, making
>>> the channels_ready semaphore count keep increasing.
>>> As a result, sem_wait() on channels_ready in multifd_send_pages()
>>> is always non-blocking hence multifd_send_pages() keeps searching
>>> for a free channel in a busy loop until a channel is freed.
>>>
>>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>>> ---
>>>   migration/multifd.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/migration/multifd.c b/migration/multifd.c
>>> index cce3ad6988..43d26e7012 100644
>>> --- a/migration/multifd.c
>>> +++ b/migration/multifd.c
>>> @@ -615,6 +615,7 @@ int multifd_send_sync_main(QEMUFile *f)
>>>             trace_multifd_send_sync_main_signal(p->id);
>>>   +        qemu_sem_wait(&multifd_send_state->channels_ready);
>>>           qemu_mutex_lock(&p->mutex);
>>>             if (p->quit) {
>> We need this, but I think it is better to put it on the second loop.
>>
>>> @@ -919,7 +920,7 @@ int multifd_save_setup(Error **errp)
>>>       multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
>>>       multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
>>>       multifd_send_state->pages = multifd_pages_init(page_count);
>>> -    qemu_sem_init(&multifd_send_state->channels_ready, 0);
>>> +    qemu_sem_init(&multifd_send_state->channels_ready, thread_count);
>>>       qatomic_set(&multifd_send_state->exiting, 0);
>>>       multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];
>> I think this bit is wrong.
>> We should not set the channels ready until the thread is ready and
>> channel is created.
>>
>> What do you think about this patch:
>>
>>  From bcb0ef9b97b858458c403d2e4dc9e0dbd96721b3 Mon Sep 17 00:00:00 2001
>> From: Juan Quintela <quintela@redhat.com>
>> Date: Wed, 26 Apr 2023 12:20:36 +0200
>> Subject: [PATCH] multifd: Fix the number of channels ready
>>
>> We don't wait in the sem when we are doing a sync_main.  Make it wait
>> there.  To make things clearer, we mark the channel ready at the
>> begining of the thread loop.
>>
>> This causes a busy loop in multifd_send_page().
>> Found-by: manish.mishra <manish.mishra@nutanix.com>
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/multifd.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 903df2117b..e625e8725e 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -635,6 +635,7 @@ int multifd_send_sync_main(QEMUFile *f)
>>       for (i = 0; i < migrate_multifd_channels(); i++) {
>>           MultiFDSendParams *p = &multifd_send_state->params[i];
>>   +        qemu_sem_wait(&multifd_send_state->channels_ready);
>>           trace_multifd_send_sync_main_wait(p->id);
>>           qemu_sem_wait(&p->sem_sync);
>>   @@ -668,6 +669,7 @@ static void *multifd_send_thread(void *opaque)
>>       p->num_packets = 1;
>>         while (true) {
>> +        qemu_sem_post(&multifd_send_state->channels_ready);
>
>
> This has one issue though, if we mark channel_ready here itself, channel is actually not ready so we can still busy loop?

Before:

while (true) {
    ....
    sem_post(channels_ready)
}

And you want to add to the initialization a counter equal to the number
of channels.

Now:

while (true) {
    sem_post(channels_ready)
    ....
}

It is semantically the same, but when we setup it ready it means that
when we set it to 1, we now that the channel and thread are ready for
action.

> May be we can do one thing let the sem_post in while loop at same
> position itself. But we can do another post just before start

I can see how this can make any difference.


> of this while loop, as that will be called only once it should do work
> of initialising count equal to multiFD channels?

Yeap.  But I can see what difference do we have here.

Later, Juan.


