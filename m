Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C36F52B522
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:47:24 +0200 (CEST)
Received: from localhost ([::1]:47720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFL1-0003vC-3Y
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nrFEb-0002TU-2i
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nrFEX-0000f2-QG
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652863240;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=31jGXktHeetc4PyhRIMNkPjv6SXWDUgcSZVz94xAhZI=;
 b=T4UAZl5V1gPIb7upgpFK5dRSkAw6SRll9PhBnL0CVoYX/OR9fB1WAB2rvzUiV3cHty8oHH
 UN0mUIxXW5idq5wRSW/6h/nW0ynuk7t93mQYFE5+JHVDeKRBQOpRWZseECD9JX1Jx79bNi
 Hc0iuoGIoJRQp/Zbk4EPcGotgFI4m54=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-8N6lVJ0tOXyweO0yPAHitQ-1; Wed, 18 May 2022 04:40:36 -0400
X-MC-Unique: 8N6lVJ0tOXyweO0yPAHitQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m26-20020a7bcb9a000000b0039455e871b6so485175wmi.8
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 01:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=31jGXktHeetc4PyhRIMNkPjv6SXWDUgcSZVz94xAhZI=;
 b=pPC5JD581C5vi9tyrmmNg2L1ljGeanl25G7QuMDA19oKXM9r63n9LH7rHBLa14ziqy
 BfauSDDGDG6JvjJwLFvlf44bb0KaQdtZfoEE+wUSXNJ3FmBeVALXLZhqYL5glFaSTFu1
 XmV1mgvJvXqbZyKgzWWICMn9bh3axqEebelXHPnkEgo/Mn7r8vyy0XCAoHCPyd68rAvw
 E1E01ZkjL/FwGkAZxsNXY7TLxz6N5tzcfsMh3VewPtTmASAN++50yCcQ7dnHJSL3vnQe
 +KqmoTHAatQdsKSEw1MR4MHXQDLW3gcoliiIqHQIMh4vp3SUDvbkplcCiPSnn+FKMBia
 GjzA==
X-Gm-Message-State: AOAM530NbHZAu9CpWc6gSHq3PKbqFRqBqQYf7rFqGXKGh/k7cJ/VoBkr
 wxXY01IiYzQvYFECUXAgTVlCQk55/RIdlfUhjyeVfd0HBmRegpJXZb32p99SVrulE/irI1ZKYqh
 fGxJErclRfcOLpSc=
X-Received: by 2002:a05:6000:1e0b:b0:20c:5157:c0d6 with SMTP id
 bj11-20020a0560001e0b00b0020c5157c0d6mr21916339wrb.125.1652863235685; 
 Wed, 18 May 2022 01:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNkn+qmRctQxGKg1bvL5kiFWTdCMk0qX2m3usQr4OJ0JvJSp1333OiONtHt+WQ0JvZK8BiMw==
X-Received: by 2002:a05:6000:1e0b:b0:20c:5157:c0d6 with SMTP id
 bj11-20020a0560001e0b00b0020c5157c0d6mr21916316wrb.125.1652863235406; 
 Wed, 18 May 2022 01:40:35 -0700 (PDT)
Received: from localhost (static-110-87-86-188.ipcom.comunitel.net.
 [188.86.87.110]) by smtp.gmail.com with ESMTPSA id
 f1-20020a5d64c1000000b0020c5253d927sm1353024wri.115.2022.05.18.01.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 01:40:34 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Peter Xu
 <peterx@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Yanan
 Wang <wangyanan55@huawei.com>,  Leonardo Bras <leobras@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v6 01/13] multifd: Document the locking of
 MultiFD{Send/Recv}Params
In-Reply-To: <YoJOPlRGJFIDcWoN@work-vm> (David Alan Gilbert's message of "Mon, 
 16 May 2022 14:14:38 +0100")
References: <20220510224220.5912-1-quintela@redhat.com>
 <20220510224220.5912-2-quintela@redhat.com> <YoJOPlRGJFIDcWoN@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 18 May 2022 10:40:34 +0200
Message-ID: <878rqzgrnh.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> Reorder the structures so we can know if the fields are:
>> - Read only
>> - Their own locking (i.e. sems)
>> - Protected by 'mutex'
>> - Only for the multifd channel
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/multifd.h | 86 +++++++++++++++++++++++++++------------------
>>  1 file changed, 51 insertions(+), 35 deletions(-)
>> 
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index 7d0effcb03..f1f88c6737 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -65,7 +65,9 @@ typedef struct {
>>  } MultiFDPages_t;
>>  
>>  typedef struct {
>> -    /* this fields are not changed once the thread is created */
>> +    /* Fiields are only written at creating/deletion time */
>> +    /* No lock required for them, they are read only */
>> +
>>      /* channel number */
>>      uint8_t id;
>>      /* channel thread name */
>> @@ -74,37 +76,45 @@ typedef struct {
>>      QemuThread thread;
>>      /* communication channel */
>>      QIOChannel *c;
>> -    /* sem where to wait for more work */
>> -    QemuSemaphore sem;
>> -    /* this mutex protects the following parameters */
>> -    QemuMutex mutex;
>> -    /* is this channel thread running */
>> -    bool running;
>> -    /* should this thread finish */
>> -    bool quit;
>>      /* is the yank function registered */
>>      bool registered_yank;
>> +    /* packet allocated len */
>> +    uint32_t packet_len;
>> +
>> +    /* sem where to wait for more work */
>> +    QemuSemaphore sem;
>> +    /* syncs main thread and channels */
>> +    QemuSemaphore sem_sync;
>> +
>> +    /* this mutex protects the following parameters */
>> +    QemuMutex mutex;
>> +    /* is this channel thread running */
>> +    bool running;
>> +    /* should this thread finish */
>> +    bool quit;
>> +    /* multifd flags for each packet */
>> +    uint32_t flags;
>> +    /* global number of generated multifd packets */
>> +    uint64_t packet_num;
>
> Is there a way to explain why packet_num, being global, is inside
> SendParams?  I understand why num_packets is - because
> that's per channel; so why is a global isnide the params
> (and having two things with almost the same name is very confusing!)

Ok, I will try to improve the documentation (it was already there).

Each packet that we sent (independently of what channel we sent it
through) has a packet number, that is unique for all channels (i.e. not
only for a single channel).  The number is assigned in

multifd_send_pages(), and the "global" value is stored in
multifd_send_state.

This field is _where_ we "transport" it to the real packet.

We have that field in:

- multifd_send_state, where we copy the current value to
- Multifd_send_params, where we copy that value to
- Multifd_packet.

Notice that the only place where we change the value is
multifd_send_state, once that we put a value on the multifd_send_params,
it is a constant until the next packet.

So how about:

/* assigned global packet number for this packet */

??

I am open to better names.

Later, Juan.





> Dave
>
>>      /* thread has work to do */
>>      int pending_job;
>> -    /* array of pages to sent */
>> +    /* array of pages to sent.
>> +     * The owner of 'pages' depends of 'pending_job' value:
>> +     * pending_job == 0 -> migration_thread can use it.
>> +     * pending_job != 0 -> multifd_channel can use it.
>> +     */
>>      MultiFDPages_t *pages;
>> -    /* packet allocated len */
>> -    uint32_t packet_len;
>> +
>> +    /* thread local variables. No locking required */
>> +
>>      /* pointer to the packet */
>>      MultiFDPacket_t *packet;
>> -    /* multifd flags for each packet */
>> -    uint32_t flags;
>>      /* size of the next packet that contains pages */
>>      uint32_t next_packet_size;
>> -    /* global number of generated multifd packets */
>> -    uint64_t packet_num;
>> -    /* thread local variables */
>>      /* packets sent through this channel */
>>      uint64_t num_packets;
>>      /* non zero pages sent through this channel */
>>      uint64_t total_normal_pages;
>> -    /* syncs main thread and channels */
>> -    QemuSemaphore sem_sync;
>>      /* buffers to send */
>>      struct iovec *iov;
>>      /* number of iovs used */
>> @@ -118,7 +128,9 @@ typedef struct {
>>  }  MultiFDSendParams;
>>  
>>  typedef struct {
>> -    /* this fields are not changed once the thread is created */
>> +    /* Fiields are only written at creating/deletion time */
>> +    /* No lock required for them, they are read only */
>> +
>>      /* channel number */
>>      uint8_t id;
>>      /* channel thread name */
>> @@ -127,31 +139,35 @@ typedef struct {
>>      QemuThread thread;
>>      /* communication channel */
>>      QIOChannel *c;
>> +    /* packet allocated len */
>> +    uint32_t packet_len;
>> +
>> +    /* syncs main thread and channels */
>> +    QemuSemaphore sem_sync;
>> +
>>      /* this mutex protects the following parameters */
>>      QemuMutex mutex;
>>      /* is this channel thread running */
>>      bool running;
>>      /* should this thread finish */
>>      bool quit;
>> +    /* multifd flags for each packet */
>> +    uint32_t flags;
>> +    /* global number of generated multifd packets */
>> +    uint64_t packet_num;
>> +
>> +    /* thread local variables. No locking required */
>> +
>> +    /* pointer to the packet */
>> +    MultiFDPacket_t *packet;
>> +    /* size of the next packet that contains pages */
>> +    uint32_t next_packet_size;
>> +    /* packets sent through this channel */
>> +    uint64_t num_packets;
>>      /* ramblock host address */
>>      uint8_t *host;
>> -    /* packet allocated len */
>> -    uint32_t packet_len;
>> -    /* pointer to the packet */
>> -    MultiFDPacket_t *packet;
>> -    /* multifd flags for each packet */
>> -    uint32_t flags;
>> -    /* global number of generated multifd packets */
>> -    uint64_t packet_num;
>> -    /* thread local variables */
>> -    /* size of the next packet that contains pages */
>> -    uint32_t next_packet_size;
>> -    /* packets sent through this channel */
>> -    uint64_t num_packets;
>>      /* non zero pages recv through this channel */
>>      uint64_t total_normal_pages;
>> -    /* syncs main thread and channels */
>> -    QemuSemaphore sem_sync;
>>      /* buffers to recv */
>>      struct iovec *iov;
>>      /* Pages that are not zero */
>> -- 
>> 2.35.1
>> 


