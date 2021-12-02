Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F5466350
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 13:13:26 +0100 (CET)
Received: from localhost ([::1]:36914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mskxo-0005Wc-UF
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 07:13:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1msksu-0003rs-FG
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 07:08:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1msksp-0001yd-7F
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 07:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638446893;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HZTB3UpEXp1maWExiTrOhMayYNqevyKCbq/a/m83eVs=;
 b=SRQxp1UBxP22SCcB+2oxjC23CbaihOW+kmeaqxeFeN1sU9BTUA64OyccvOjxP8D7daNfuL
 Egjea6xi5dNqJ9JHCX1PXr4GNChOyz7Q1bfN2egM8GmDRbcDKmijv8AnYqaGgpQ/fNECaU
 U8+afljIbfYKEOz/f6FXbqDjee/209s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-0eHBGQpAOziixwQuc4WuqQ-1; Thu, 02 Dec 2021 07:08:10 -0500
X-MC-Unique: 0eHBGQpAOziixwQuc4WuqQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so2404984wms.6
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 04:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=HZTB3UpEXp1maWExiTrOhMayYNqevyKCbq/a/m83eVs=;
 b=V9VJQUaaabnqDg+Rooc8UlIMuLIwbIjvTCiUDMTPJQkZqt4eL7nQG+2ShR/ClDpkOB
 TgjIV9S/fP2iNOdw0Urm8r0tBmjMY0tn1MUHPTo43VMtbLM34GQhZk9Zj0VOgDk/Kk3a
 5iREo1VW0g/+s5JuoldbrAZVToH84Y1OQtfMq1qLBWUBKES9X4jpgxYTYW24FWMdBjaD
 00yydzIzuc1VR6ZovGO0tMP5oNw9vbFgUoMR+oCyPDknoJEwv+xvwIjXoPKC1Jwa7bwk
 L0MlNq7myTrjUHsb6H/8oJcIJ4iikncswkB3Ho/x7RM8Td5uugWsHL4n2zWSgeN5a7BU
 c/Zw==
X-Gm-Message-State: AOAM5310AK50UdM3NOYgOktDEWAOaSkP9Kuu81VWV+/MdHGib/1vl+0H
 Th45KuQRc8DRBTfzy2grll9QJsK1uj+E5runXUj+MTIS4Czfr81YHWKEO6itwjxCU7LfjQl/RR4
 CgTsaIsEJZbQJq8I=
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr13787971wrs.581.1638446889229; 
 Thu, 02 Dec 2021 04:08:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5WuuTK3HszR2ecvwER623NX9cqx7S9RNRtyDKbfv0bvQZkK36pz1LtFbcGUZ7Dj1GMLRgFw==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr13787942wrs.581.1638446888991; 
 Thu, 02 Dec 2021 04:08:08 -0800 (PST)
Received: from localhost (static-58-87-86-188.ipcom.comunitel.net.
 [188.86.87.58])
 by smtp.gmail.com with ESMTPSA id h15sm2110794wmq.32.2021.12.02.04.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 04:08:07 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 21/23] multifd: Support for zero pages transmission
In-Reply-To: <Yaiv0PazlhLdsf0O@work-vm> (David Alan Gilbert's message of "Thu, 
 2 Dec 2021 11:36:48 +0000")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-22-quintela@redhat.com>
 <Yaiv0PazlhLdsf0O@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 02 Dec 2021 13:08:05 +0100
Message-ID: <871r2vgqfu.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> This patch adds counters and similar.  Logic will be added on the
>> following patch.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/multifd.h    | 13 ++++++++++++-
>>  migration/multifd.c    | 22 +++++++++++++++++++---
>>  migration/trace-events |  2 +-
>>  3 files changed, 32 insertions(+), 5 deletions(-)
>> 
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index 39e55d7f05..973315b545 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -49,7 +49,10 @@ typedef struct {
>>      /* size of the next packet that contains pages */
>>      uint32_t next_packet_size;
>>      uint64_t packet_num;
>> -    uint64_t unused[4];    /* Reserved for future use */
>> +    /* zero pages */
>> +    uint32_t zero_pages;
>
> Had you considered just adding a flag, MULTIFD_FLAG_ZERO to the packet?

I *have* to also add the flag.

I was waiting for 7.0 to get out, because I still have to do the
compatibility bits.  Otherwise you can't migrate to an old multifd version.

>
>> +    uint32_t unused32[1];    /* Reserved for future use */
>> +    uint64_t unused64[3];    /* Reserved for future use */
>>      char ramblock[256];
>>      uint64_t offset[];
>>  } __attribute__((packed)) MultiFDPacket_t;
>> @@ -117,6 +120,10 @@ typedef struct {
>>      ram_addr_t *normal;
>>      /* num of non zero pages */
>>      uint32_t normal_num;
>> +    /* Pages that are  zero */
>> +    ram_addr_t *zero;
>> +    /* num of zero pages */
>> +    uint32_t zero_num;
>>      /* used for compression methods */
>>      void *data;
>>  }  MultiFDSendParams;
>> @@ -162,6 +169,10 @@ typedef struct {
>>      ram_addr_t *normal;
>>      /* num of non zero pages */
>>      uint32_t normal_num;
>> +    /* Pages that are  zero */
>> +    ram_addr_t *zero;
>> +    /* num of zero pages */
>> +    uint32_t zero_num;
>>      /* used for de-compression methods */
>>      void *data;
>>  } MultiFDRecvParams;
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index d1ab823f98..2e4dffd6c6 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -265,6 +265,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>>      packet->normal_pages = cpu_to_be32(p->normal_num);
>>      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
>>      packet->packet_num = cpu_to_be64(p->packet_num);
>> +    packet->zero_pages = cpu_to_be32(p->zero_num);
>>  
>>      if (p->pages->block) {
>>          strncpy(packet->ramblock, p->pages->block->idstr, 256);
>> @@ -327,7 +328,15 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>>      p->next_packet_size = be32_to_cpu(packet->next_packet_size);
>>      p->packet_num = be64_to_cpu(packet->packet_num);
>>  
>> -    if (p->normal_num == 0) {
>> +    p->zero_num = be32_to_cpu(packet->zero_pages);
>> +    if (p->zero_num > packet->pages_alloc - p->normal_num) {
>> +        error_setg(errp, "multifd: received packet "
>> +                   "with %d zero pages and expected maximum pages are %d",
>> +                   p->normal_num, packet->pages_alloc - p->zero_num) ;
>
> should that be p->zero_num, packet->pages_alloc - p->normal_num ?
> (and be %u)

Copy and paste error.  You are right on both cases.

Thanks.


