Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EE746FEDD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 11:43:21 +0100 (CET)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvdN0-0005Oq-P1
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 05:43:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mvdLa-0004it-8j
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:41:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mvdLW-0008Ds-Ds
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639132904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=szQqK7SomEY3Q9X1DLFITrS/yQr21gWp1zUXPq7iw0w=;
 b=J3uPbZ2Z7b3TyopEv2SUe18w8j1C+Ji51RXbNqjPyyvzkMvS7t1v2fxNl/7GUtYU66erc8
 nhsNyGt/KgpzslWunrmEX8t4BEutpEQv3g+8rxffrVYw2FaQJUY1ydboSJi6Vgjs7W312n
 AWbtjjjJmBFlpnxMlmCnqRgh7MHTMo4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-X0DF8fsyOtejZYQF9m9JJw-1; Fri, 10 Dec 2021 05:41:43 -0500
X-MC-Unique: X0DF8fsyOtejZYQF9m9JJw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso2111979wrw.10
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 02:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=szQqK7SomEY3Q9X1DLFITrS/yQr21gWp1zUXPq7iw0w=;
 b=ZyZ1e5mPc5JCwijZBUPYXikv570pN3YntwlcaAvrKVCHnLhNcvHW69VrHg8bXh4UGy
 MNpa7CcdDKji6pwNcHy8ySBwa+8KTp/tM0azebjQrUKjLaW+NtVCeP9GPko3TVimaPxl
 ak8or4PUtb7Vthi5tROqLCYzGeB9pEOMOyuzmWfsMJCn++2J3zu+P7VWE6wbUHA2dn5i
 8yBU1EmRuo4Jaa+pmm2Txp3vEAVoysg8NrGjyCdTK5InbxMQc062DgsZ7IkVy/bXCkVa
 VhMmi3akZKRAVs9dwvpofnrzGSWB2Oq9ZmvEsn6V21GySltniZwEYMGFWNA1JmZHGHEN
 MyMw==
X-Gm-Message-State: AOAM532UOEDg82NQWyh4cUI0+7ilBhKnWp089lNUI+3WPiC8rpNmCbCn
 u//0kHmOo0EHl/u4gUkk/V7aNW97Ows+eZ7Qnw6Dz1UqvV2jdtLwUd48Pq2OkLbtIaPmFQHmrPt
 NjtGYEGc8B0dBxcs=
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr15921472wmc.62.1639132902561; 
 Fri, 10 Dec 2021 02:41:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJrVM9ONhTiKJ637ekqCaKN5y9moY/PqdFtM6j59FmBg8Js0ZB9xpjBZ36K6mCBsZke2H9SA==
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr15921447wmc.62.1639132902342; 
 Fri, 10 Dec 2021 02:41:42 -0800 (PST)
Received: from localhost (static-174-144-85-188.ipcom.comunitel.net.
 [188.85.144.174])
 by smtp.gmail.com with ESMTPSA id p5sm2392799wrd.13.2021.12.10.02.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 02:41:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 18/23] multifd: Use normal pages array on the recv side
In-Reply-To: <Ya8JCq/cRmcL9Kp7@xz-m1.local> (Peter Xu's message of "Tue, 7 Dec
 2021 15:11:06 +0800")
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-19-quintela@redhat.com>
 <Ya8JCq/cRmcL9Kp7@xz-m1.local>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 10 Dec 2021 11:41:41 +0100
Message-ID: <878rwskahm.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> On Wed, Nov 24, 2021 at 11:06:12AM +0100, Juan Quintela wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/multifd.h      |  8 +++++--
>>  migration/multifd-zlib.c |  8 +++----
>>  migration/multifd-zstd.c |  6 +++---
>>  migration/multifd.c      | 45 ++++++++++++++++++----------------------
>>  4 files changed, 33 insertions(+), 34 deletions(-)
>> 
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index 78e73df3ec..9fbcb7bb9a 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -151,12 +151,16 @@ typedef struct {
>>      uint32_t next_packet_size;
>>      /* packets sent through this channel */
>>      uint64_t num_packets;
>> -    /* pages sent through this channel */
>> -    uint64_t num_pages;
>> +    /* non zero pages sent through this channel */
>
> s/send/recv/

Thanks.

>> +    uint64_t num_normal_pages;
>
> How about renaming it to "total_normal_pages"?  It's merely impossible to
> identify this from normal_num below from their names..

I can change it.  It just makes some lines a bit longer, but that is
what you have with better names.

> I'd have the same comment to previous patch.

Ok.

Thanks, Juan.

>
> Thanks,
>
>>      /* syncs main thread and channels */
>>      QemuSemaphore sem_sync;
>>      /* buffers to recv */
>>      struct iovec *iov;
>> +    /* Pages that are not zero */
>> +    ram_addr_t *normal;
>> +    /* num of non zero pages */
>> +    uint32_t normal_num;
>>      /* used for de-compression methods */
>>      void *data;
>>  } MultiFDRecvParams;


